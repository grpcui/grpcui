import 'dart:async';

import 'dart:typed_data';

import 'package:app/dialogs/authorization_dialog.dart';
import 'package:app/grpc/generated/google/protobuf/descriptor.pb.dart';
import 'package:app/grpc/grpc.dart';
import 'package:app/utils/json.dart';
import 'package:app/utils/proto.dart';
import 'package:app/utils/service_info.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:recase/recase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'form.dart';

ClientCall<Uint8List, Uint8List>? _lastCall;

class ServiceSelectionPage extends StatefulWidget {
  const ServiceSelectionPage({super.key, required this.address});
  final Uri address;

  @override
  State<ServiceSelectionPage> createState() => _ServiceSelectionPageState();
}

class _ServiceSelectionPageState extends State<ServiceSelectionPage> {
  final List<ServiceInfo> _serviceInfos = [];
  ServiceInfo? _selectedService;
  MethodDescriptorProto? _selectedMethod;
  final _value = <String, Object?>{};

  final List<Map<String, Object>> _data = [];
  final Map<String, String> _headers = {};
  final Map<String, String> _trailers = {};

  String? _authToken;

  @override
  void initState() {
    _refresh();

    _loadPrefs();

    super.initState();
  }

  void _loadPrefs() async {
    final prefs = await SharedPreferences.getInstance();

    _authToken = prefs.getString(widget.address.origin);
  }

  Future<void> _refresh() async {
    final symbols = await channel(widget.address).listServices();

    Map<String, ServiceInfo> map = {};

    for (final symbol in symbols) {
      final files = await channel(widget.address).fileContainingSymbol(symbol);

      for (final file in files) {
        for (final service in file.service) {
          map[service.name] = ServiceInfo(service.name, files, service);
        }
      }
    }

    _serviceInfos.clear();
    _serviceInfos.addAll(map.values);

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('gRPC UI'),
        actions: [
          IconButton(
            onPressed: () async {
              final token = await showDialog<String>(
                context: context,
                builder: (context) => AuthorizationDialog(
                  initialValue: _authToken,
                ),
              );

              final prefs = await SharedPreferences.getInstance();
              if (token != null && token.isNotEmpty) {
                _authToken = token;
                prefs.setString(widget.address.origin, token);
              }
            },
            icon: const Icon(Icons.person),
            tooltip: 'Authorization',
          ),
          IconButton(
            onPressed: _refresh,
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh',
          ),
          IconButton(
            icon: const Icon(MdiIcons.github),
            onPressed: () {
              launchUrl(
                Uri.parse('https://github.com/grpcui/grpcui/'),
                mode: LaunchMode.externalApplication,
              );
            },
          ),
        ],
      ),
      body: Form(
        child: Builder(builder: _build),
      ),
    );
  }

  Widget _build(BuildContext context) {
    final services = _serviceInfos;
    final selectedService = _selectedService;
    final selectedMethod = _selectedMethod;

    if (services.isEmpty) {
      return const Center(
        child: Text('Loading...'),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(4.0),
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: DropdownButtonFormField<ServiceInfo>(
                  isDense: true,
                  items: services
                      .map(
                        (e) => DropdownMenuItem<ServiceInfo>(
                          value: e,
                          child: Text(_recase(e.name)),
                          // child: ListTile(
                          //   dense: true,
                          //   title: Text(_recase(e.name)),
                          //   subtitle: Text(e.name),
                          // ),
                        ),
                      )
                      .toList(),
                  value: _selectedService,
                  onChanged: (value) {
                    _selectedService = value;
                    _selectedMethod = null;

                    setState(() {});
                  },
                ),
              ),
              if (selectedService != null)
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: DropdownButtonFormField<MethodDescriptorProto>(
                    isDense: true,
                    items: selectedService.service.method
                        .map(
                          (e) => DropdownMenuItem<MethodDescriptorProto>(
                            value: e,
                            child: Text(_recase(e.name)),
                          ),
                        )
                        .toList(),
                    value: _selectedMethod,
                    onChanged: (value) {
                      _selectedMethod = value;
                      setState(() {});
                    },
                  ),
                ),
              if (selectedService != null && selectedMethod != null)
                DynamicForm(
                  required: true,
                  onChanged: (v) {
                    setState(() {});
                  },
                  value: _value,
                  schema:
                      selectedService.findMessageType(selectedMethod.inputType),
                  resolveMessageType: selectedService.findMessageType,
                ),
              ..._headers.entries.map((e) => Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SelectableText('${e.key}: ${e.value}'),
                  )),
              ..._data.map(
                (e) => Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Material(
                    type: MaterialType.card,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SelectableText(pretty(e)),
                    ),
                  ),
                ),
              ),
              ..._trailers.entries.map((e) => Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SelectableText('${e.key}: ${e.value}'),
                  )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: ButtonBar(
            children: [
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed:
                      selectedMethod == null ? null : () => _submit(context),
                  child: const Text('Run'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _submit(BuildContext context) async {
    final selectedService = _selectedService;
    final selectedMethod = _selectedMethod;

    final form = Form.of(context);
    if (!form.validate()) {
      return;
    }

    if (selectedService == null || selectedMethod == null) {
      return;
    }

    final requestSchema =
        selectedService.findMessageType(selectedMethod.inputType);

    final responseSchema =
        selectedService.findMessageType(selectedMethod.outputType);

    _value.clear();
    form.save();

    final requestBody =
        writeProto(_value, requestSchema, selectedService.findMessageType);

    _lastCall?.cancel();
    _lastCall = null;
    _data.clear();
    _headers.clear();
    _trailers.clear();

    setState(() {});

    final authToken = _authToken;

    final metadata = <String, String>{};

    if (authToken != null && authToken.isNotEmpty) {
      metadata['Authorization'] = authToken;
    }

    final path = '/${selectedService.name}/${selectedMethod.name}';
    final call = channel(widget.address).unary(
      path,
      Uint8List.fromList(requestBody),
      metadata: metadata,
    );

    _lastCall = call;

    call.response.listen((event) {
      final rr =
          readProto(event, responseSchema, selectedService.findMessageType);

      final r = proto2Json(rr);

      _data.add(r);
      if (mounted) {
        setState(() {});
      }
    });

    call.headers.then((value) {
      _headers.addAll(value);
      if (mounted) {
        setState(() {});
      }
    });

    call.trailers.then((value) {
      _trailers.addAll(value);
      if (mounted) {
        setState(() {});
      }
    });
  }
}

String _recase(String name) {
  return ReCase(name).titleCase;
}
