import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grpc/grpc_or_grpcweb.dart';
import 'package:grpcui/generated/reflection.pbgrpc.dart';
import 'package:protobuf_google/protobuf_google.dart';

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
  final _services = <ServiceDescriptorProto>[];
  ServiceDescriptorProto? _service;
  MethodDescriptorProto? _method;

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
        _services.clear();
        _service = null;
        _method = null;

        for (var service in response.service) {
          controller
              .add(ServerReflectionRequest(fileContainingSymbol: service.name));
        }
      } else if (value.hasFileDescriptorResponse()) {
        final f = value.fileDescriptorResponse.fileDescriptorProto;
        final fds = f.map((e) => FileDescriptorProto.fromBuffer(e)).toList();

        for (final fd in fds) {
          _services.addAll(fd.service);
        }
      }

      if (mounted) {
        setState(() {});
      }
    });

    controller.add(ServerReflectionRequest(listServices: 'list'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('gRPC UI'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          DropdownButton<ServiceDescriptorProto>(
            hint: const Text('Select'),
            value: _service,
            items: _services
                .map(
                  (e) => DropdownMenuItem<ServiceDescriptorProto>(
                    value: e,
                    child: Text(e.name),
                  ),
                )
                .toList(),
            onChanged: (v) {
              setState(() {
                _method = null;
                _service = v;
              });
            },
          ),
          const SizedBox(height: 8),
          DropdownButton<MethodDescriptorProto>(
            hint: const Text('Select'),
            value: _method,
            items: (_service?.method ?? [])
                .map(
                  (e) => DropdownMenuItem<MethodDescriptorProto>(
                    value: e,
                    child: Text(e.name),
                  ),
                )
                .toList(),
            onChanged: (v) {
              setState(() {
                _method = v;
              });
            },
          ),
          const SizedBox(height: 8),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final controller = TextEditingController();
          final result = await showDialog<String>(
              context: context,
              builder: (context) {
                return Dialog(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller,
                        decoration: const InputDecoration(
                          labelText: 'Host',
                          hintText: 'grpc.mydomain.com:443',
                        ),
                      ),
                      const Divider(),
                      ButtonBar(
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(controller.text);
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              });

          if (result != null) {
            _listServices(result, 443);
          }
        },
      ),
    );
  }
}
