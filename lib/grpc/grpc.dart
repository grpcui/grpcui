import 'dart:async';

import 'package:app/grpc/generated/google/protobuf/descriptor.pb.dart';
import 'package:app/grpc/generated/reflection.pbgrpc.dart';
import 'package:flutter/foundation.dart';
import 'package:grpc/grpc.dart';
import 'package:grpc/grpc_or_grpcweb.dart';

// import 'generated/google/protobuf/timestamp.pb.dart';
// import 'generated/google/protobuf/empty.pb.dart';

export 'generated/google/protobuf/timestamp.pb.dart';
export 'generated/google/protobuf/empty.pb.dart';
export 'generated/google/protobuf/wrappers.pb.dart';

export 'package:grpc/grpc.dart';

final _channels = <String, ChannelApi>{};
ChannelApi channel(Uri address) {
  _channels.putIfAbsent(address.toString(),
      () => ChannelApi._(address.host, address.hasPort ? address.port : 443));

  return _channels[address.toString()]!;
}

CallOptions? _getCallOptions() {
  // return CallOptions(metadata: {'Authorization': 'Bearer ${appState.token}'});
  return CallOptions();
}

class ChannelApi {
  ChannelApi._(String address, int port)
      : _channel = GrpcOrGrpcWebClientChannel.toSingleEndpoint(
          host: address,
          port: port,
          transportSecure: true,
        ) {
    _client = ServerReflectionClient(
      _channel,
    );
  }

  final GrpcOrGrpcWebClientChannel _channel;
  late final ServerReflectionClient _client;

  Future<List<String>> listServices() async {
    final stream = _client.serverReflectionInfo(
      Stream.value(ServerReflectionRequest(listServices: "")),
      options: _getCallOptions(),
    );

    var single = await stream.single;

    return single.listServicesResponse.service
        .where((e) => !e.name.startsWith('grpc.reflection'))
        .map((e) => e.name)
        .toList();
  }

  Future<List<FileDescriptorProto>> fileContainingSymbol(String symbol) async {
    final stream = _client.serverReflectionInfo(
      Stream.value(ServerReflectionRequest(fileContainingSymbol: symbol)),
      options: _getCallOptions(),
    );

    var single = await stream.single;

    return single.fileDescriptorResponse.fileDescriptorProto
        .map((e) => FileDescriptorProto.fromBuffer(e))
        .toList();
  }

  ClientCall<Uint8List, Uint8List> unary(
    String path,
    Uint8List data, {
    Map<String, String>? metadata,
  }) {
    final method = ClientMethod<Uint8List, Uint8List>(
        path,
        (Uint8List value) => Uint8List.fromList(value),
        (List<int> value) => Uint8List.fromList(value));

    final call = _channel.createCall(
        method, Stream.value(data), CallOptions(metadata: metadata));

    return call;
  }

  ClientCall<Uint8List, Uint8List> stream(
      String path, Stream<Uint8List> stream) {
    final method = ClientMethod<Uint8List, Uint8List>(
        path,
        (Uint8List value) => Uint8List.fromList(value),
        (List<int> value) => Uint8List.fromList(value));

    final call =
        _channel.createCall(method, stream, _getCallOptions() ?? CallOptions());

    return call;
  }
}
