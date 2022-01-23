import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grpc/grpc_or_grpcweb.dart';
import 'package:grpcui/generated/reflection.pbgrpc.dart';
import 'package:protobuf_google/protobuf_google.dart';
import 'package:recase/recase.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      useMaterial3: true,
      primarySwatch: Colors.blue,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(
            const Size(0, 48),
          ),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
        alignLabelWithHint: true,
        isDense: true,
      ),
    );

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<FileDescriptor> _files = [];

  ServiceDescriptor? _service;
  MethodDescriptor? _method;

  void _listServices(
    String host,
    int port, [
    bool transportSecure = true,
  ]) async {
    final channel = GrpcOrGrpcWebClientChannel.toSingleEndpoint(
      host: host,
      port: port,
      transportSecure: transportSecure,
    );

    final client = ServerReflectionClient(channel);
    final controller = StreamController<ServerReflectionRequest>();

    client.serverReflectionInfo(controller.stream).listen((value) {
      if (value.hasListServicesResponse()) {
        final response = value.listServicesResponse;

        _files.clear();
        _service = null;
        _method = null;

        for (var service in response.service) {
          controller
              .add(ServerReflectionRequest(fileContainingSymbol: service.name));
        }
      } else if (value.hasFileDescriptorResponse()) {
        final f = value.fileDescriptorResponse.fileDescriptorProto;
        final fds = f.map((e) => FileDescriptorProto.fromBuffer(e)).toList();

        final files = fds.map(
          (file) {
            final filedesc = FileDescriptor(
              file,
              file.service.map((svc) {
                final ms =
                    svc.method.map((meth) => MethodDescriptor(meth)).toList();

                return ServiceDescriptor(svc, ms);
              }).toList(),
            );

            for (final svc in filedesc.services) {
              svc.file = filedesc;

              for (final m in svc.methods) {
                m.service = svc;
              }
            }

            return filedesc;
          },
        );

        _files.addAll(files);
      }

      if (mounted) {
        setState(() {});
      }
    });

    controller.add(ServerReflectionRequest(listServices: 'list'));
  }

  @override
  Widget build(BuildContext context) {
    final services = <ServiceDescriptor>[];

    for (final file in _files) {
      services.addAll(file.services);
    }

    final inputType = _service?.findMessage(_method?.method.inputType);
    final outputType = _service?.findMessage(_method?.method.outputType);

    return Scaffold(
      appBar: AppBar(
        title: const Text('gRPC UI'),
        actions: [
          IconButton(
            icon: const Icon(Icons.webhook),
            onPressed: _connect,
          ),
        ],
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        final small = constraints.biggest.width <= 480;

        final service = DropdownButtonFormField<ServiceDescriptor>(
          hint: const Text('Select'),
          value: _service,
          decoration: const InputDecoration(labelText: 'Service'),
          items: services
              .map(
                (e) => DropdownMenuItem<ServiceDescriptor>(
                  value: e,
                  child: Text(e.service.name.titleCase),
                ),
              )
              .toList(),
          onChanged: (v) {
            setState(() {
              _method = null;
              _service = v;
            });
          },
        );

        final method = DropdownButtonFormField<MethodDescriptor>(
          hint: const Text('Select'),
          decoration: const InputDecoration(labelText: 'Method'),
          value: _method,
          items: _service?.methods
              .map(
                (e) => DropdownMenuItem<MethodDescriptor>(
                  value: e,
                  child: Row(
                    children: [
                      _getMethodIcon(e.method),
                      const SizedBox(width: 12),
                      Text(e.method.name.titleCase),
                    ],
                  ),
                ),
              )
              .toList(),
          onChanged: (v) {
            setState(() {
              _method = v;
            });
          },
        );

        return Column(
          children: [
            const SizedBox(height: 4),
            if (small)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: service,
              ),
            if (small)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: method,
              ),
            if (!small)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(child: service),
                    const SizedBox(width: 8),
                    Expanded(child: method),
                  ],
                ),
              ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(8),
                children: <Widget>[
                  if (inputType != null) const ListTile(title: Text('INPUTS:')),
                  if (inputType != null) GrpcMessage(inputType, _service!),
                  if (outputType != null)
                    const ListTile(title: Text('OUTPUTS:')),
                  if (outputType != null) GrpcMessage(outputType, _service!),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  void _connect() async {
    final controller = TextEditingController();
    final result = await showDialog<String>(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: controller,
                  decoration: const InputDecoration(
                    labelText: 'Host',
                    hintText: 'grpc.mydomain.com:443',
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(controller.text);
                },
                child: const Text('OK'),
              ),
            ],
          );
        });

    if (result != null) {
      _listServices(result, 443);
    }
  }

  Widget _getMethodIcon(MethodDescriptorProto method) {
    if (method.serverStreaming && method.clientStreaming) {
      return const Icon(Icons.swap_vert);
    }

    if (method.serverStreaming && !method.clientStreaming) {
      return const Icon(Icons.arrow_downward);
    }

    if (!method.serverStreaming && method.clientStreaming) {
      return const Icon(Icons.arrow_upward);
    }

    return const Icon(Icons.circle);
  }
}

class FileDescriptor {
  const FileDescriptor(this.file, this.services);

  final FileDescriptorProto file;
  final List<ServiceDescriptor> services;
}

class ServiceDescriptor {
  ServiceDescriptor(this.service, this.methods);

  late final FileDescriptor file;
  final ServiceDescriptorProto service;
  final List<MethodDescriptor> methods;

  DescriptorProto? findMessage(String? name) {
    if (name == null) {
      return null;
    }

    name = name.startsWith('.') ? name.substring(1) : name;

    final c =
        file.file.messageType.where((element) => element.name == name).toList();

    if (c.isNotEmpty) {
      return c.first;
    }

    return null;
  }

  EnumDescriptorProto? findEnum(String? name) {
    if (name == null) {
      return null;
    }

    name = name.startsWith('.') ? name.substring(1) : name;

    final c =
        file.file.enumType.where((element) => element.name == name).toList();

    if (c.isNotEmpty) {
      return c.first;
    }

    return null;
  }
}

class MethodDescriptor {
  MethodDescriptor(this.method);

  late final ServiceDescriptor service;
  final MethodDescriptorProto method;
}

class GrpcMessageField extends StatefulWidget {
  const GrpcMessageField({
    Key? key,
    required this.field,
    required this.service,
  }) : super(key: key);

  final FieldDescriptorProto field;
  final ServiceDescriptor service;

  @override
  State<StatefulWidget> createState() => _GrpcMessageFieldState();
}

class _GrpcMessageFieldState extends State<GrpcMessageField> {
  @override
  Widget build(BuildContext context) {
    final field = widget.field;

    if (field.type == FieldDescriptorProto_Type.TYPE_BOOL) {
      return CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        value: false,
        onChanged: (v) {},
        title: Text(field.name.titleCase),
      );
    }

    if (field.type == FieldDescriptorProto_Type.TYPE_STRING) {
      return TextFormField(
        decoration: InputDecoration(labelText: field.name.titleCase),
      );
    }
    if (field.type == FieldDescriptorProto_Type.TYPE_INT32 ||
        field.type == FieldDescriptorProto_Type.TYPE_INT64 ||
        field.type == FieldDescriptorProto_Type.TYPE_FIXED32 ||
        field.type == FieldDescriptorProto_Type.TYPE_FIXED64 ||
        field.type == FieldDescriptorProto_Type.TYPE_SFIXED32 ||
        field.type == FieldDescriptorProto_Type.TYPE_SFIXED64 ||
        field.type == FieldDescriptorProto_Type.TYPE_DOUBLE ||
        field.type == FieldDescriptorProto_Type.TYPE_FLOAT ||
        field.type == FieldDescriptorProto_Type.TYPE_INT32 ||
        field.type == FieldDescriptorProto_Type.TYPE_INT64 ||
        field.type == FieldDescriptorProto_Type.TYPE_UINT32 ||
        field.type == FieldDescriptorProto_Type.TYPE_UINT64 ||
        field.type == FieldDescriptorProto_Type.TYPE_SINT32 ||
        field.type == FieldDescriptorProto_Type.TYPE_SINT64) {
      return TextFormField(
        decoration: InputDecoration(labelText: field.name.titleCase),
      );
    }

    if (field.type == FieldDescriptorProto_Type.TYPE_ENUM) {
      final ef = widget.service.findEnum(field.typeName);

      if (ef == null) {
        return Column(
          children: [
            ListTile(
              title: Text(field.name.titleCase),
            ),
            TextFormField(
              initialValue: 'Enum: ${field.typeName}',
              decoration: InputDecoration(labelText: field.name.titleCase),
            ),
          ],
        );
      }

      final choices = ef.value
          .map(
            (e) => DropdownMenuItem<EnumValueDescriptorProto>(
              value: e,
              child: Text(e.name.titleCase),
            ),
          )
          .toList();

      if (field.proto3Optional) {
        choices.insert(
            0,
            const DropdownMenuItem<EnumValueDescriptorProto>(
              value: null,
              child: Text(
                '<null>',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ));
      }

      return DropdownButtonFormField(
        onChanged: (v) {},
        items: choices,
        decoration: InputDecoration(labelText: field.name.titleCase),
      );
    }

    if (field.type == FieldDescriptorProto_Type.TYPE_MESSAGE) {
      final msg = widget.service.findMessage(field.typeName);

      if (msg == null) {
        return TextFormField(
          initialValue: 'Message: ${field.typeName}',
          decoration: InputDecoration(labelText: field.name.titleCase),
        );
      }

      return Padding(
        padding: const EdgeInsetsDirectional.only(start: 0.0),
        child: Column(
          children: [
            ListTile(
              title: Text(field.name.titleCase),
            ),
            GrpcMessage(msg, widget.service),
          ],
        ),
      );
    }

    return ListTile(
      title: Text(field.name.titleCase),
    );
  }
}

class GrpcMessage extends StatelessWidget {
  const GrpcMessage(this.descriptor, this.service, {Key? key})
      : super(key: key);

  final DescriptorProto descriptor;
  final ServiceDescriptor service;

  @override
  Widget build(BuildContext context) {
    List<Widget> fields = [];

    for (final field in descriptor.field) {
      fields.add(GrpcMessageField(
        field: field,
        service: service,
      ));

      fields.add(const SizedBox(height: 8));
    }

    if (fields.isNotEmpty) {
      fields.removeLast();
    }

    return Column(
      children: fields,
    );
  }
}
