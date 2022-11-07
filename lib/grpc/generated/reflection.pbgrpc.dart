///
//  Generated code. Do not modify.
//  source: reflection.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'reflection.pb.dart' as $0;
export 'reflection.pb.dart';

class ServerReflectionClient extends $grpc.Client {
  static final _$serverReflectionInfo = $grpc.ClientMethod<
          $0.ServerReflectionRequest, $0.ServerReflectionResponse>(
      '/grpc.reflection.v1alpha.ServerReflection/ServerReflectionInfo',
      ($0.ServerReflectionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.ServerReflectionResponse.fromBuffer(value));

  ServerReflectionClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$0.ServerReflectionResponse> serverReflectionInfo(
      $async.Stream<$0.ServerReflectionRequest> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$serverReflectionInfo, request,
        options: options);
  }
}

abstract class ServerReflectionServiceBase extends $grpc.Service {
  $core.String get $name => 'grpc.reflection.v1alpha.ServerReflection';

  ServerReflectionServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ServerReflectionRequest,
            $0.ServerReflectionResponse>(
        'ServerReflectionInfo',
        serverReflectionInfo,
        true,
        true,
        ($core.List<$core.int> value) =>
            $0.ServerReflectionRequest.fromBuffer(value),
        ($0.ServerReflectionResponse value) => value.writeToBuffer()));
  }

  $async.Stream<$0.ServerReflectionResponse> serverReflectionInfo(
      $grpc.ServiceCall call,
      $async.Stream<$0.ServerReflectionRequest> request);
}
