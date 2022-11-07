///
//  Generated code. Do not modify.
//  source: reflection.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

enum ServerReflectionRequest_MessageRequest {
  fileByFilename, 
  fileContainingSymbol, 
  fileContainingExtension, 
  allExtensionNumbersOfType, 
  listServices, 
  notSet
}

class ServerReflectionRequest extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, ServerReflectionRequest_MessageRequest> _ServerReflectionRequest_MessageRequestByTag = {
    3 : ServerReflectionRequest_MessageRequest.fileByFilename,
    4 : ServerReflectionRequest_MessageRequest.fileContainingSymbol,
    5 : ServerReflectionRequest_MessageRequest.fileContainingExtension,
    6 : ServerReflectionRequest_MessageRequest.allExtensionNumbersOfType,
    7 : ServerReflectionRequest_MessageRequest.listServices,
    0 : ServerReflectionRequest_MessageRequest.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ServerReflectionRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'grpc.reflection.v1alpha'), createEmptyInstance: create)
    ..oo(0, [3, 4, 5, 6, 7])
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'host')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fileByFilename')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fileContainingSymbol')
    ..aOM<ExtensionRequest>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fileContainingExtension', subBuilder: ExtensionRequest.create)
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'allExtensionNumbersOfType')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'listServices')
    ..hasRequiredFields = false
  ;

  ServerReflectionRequest._() : super();
  factory ServerReflectionRequest({
    $core.String? host,
    $core.String? fileByFilename,
    $core.String? fileContainingSymbol,
    ExtensionRequest? fileContainingExtension,
    $core.String? allExtensionNumbersOfType,
    $core.String? listServices,
  }) {
    final _result = create();
    if (host != null) {
      _result.host = host;
    }
    if (fileByFilename != null) {
      _result.fileByFilename = fileByFilename;
    }
    if (fileContainingSymbol != null) {
      _result.fileContainingSymbol = fileContainingSymbol;
    }
    if (fileContainingExtension != null) {
      _result.fileContainingExtension = fileContainingExtension;
    }
    if (allExtensionNumbersOfType != null) {
      _result.allExtensionNumbersOfType = allExtensionNumbersOfType;
    }
    if (listServices != null) {
      _result.listServices = listServices;
    }
    return _result;
  }
  factory ServerReflectionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ServerReflectionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ServerReflectionRequest clone() => ServerReflectionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ServerReflectionRequest copyWith(void Function(ServerReflectionRequest) updates) => super.copyWith((message) => updates(message as ServerReflectionRequest)) as ServerReflectionRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ServerReflectionRequest create() => ServerReflectionRequest._();
  ServerReflectionRequest createEmptyInstance() => create();
  static $pb.PbList<ServerReflectionRequest> createRepeated() => $pb.PbList<ServerReflectionRequest>();
  @$core.pragma('dart2js:noInline')
  static ServerReflectionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ServerReflectionRequest>(create);
  static ServerReflectionRequest? _defaultInstance;

  ServerReflectionRequest_MessageRequest whichMessageRequest() => _ServerReflectionRequest_MessageRequestByTag[$_whichOneof(0)]!;
  void clearMessageRequest() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get host => $_getSZ(0);
  @$pb.TagNumber(1)
  set host($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHost() => $_has(0);
  @$pb.TagNumber(1)
  void clearHost() => clearField(1);

  @$pb.TagNumber(3)
  $core.String get fileByFilename => $_getSZ(1);
  @$pb.TagNumber(3)
  set fileByFilename($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasFileByFilename() => $_has(1);
  @$pb.TagNumber(3)
  void clearFileByFilename() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get fileContainingSymbol => $_getSZ(2);
  @$pb.TagNumber(4)
  set fileContainingSymbol($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasFileContainingSymbol() => $_has(2);
  @$pb.TagNumber(4)
  void clearFileContainingSymbol() => clearField(4);

  @$pb.TagNumber(5)
  ExtensionRequest get fileContainingExtension => $_getN(3);
  @$pb.TagNumber(5)
  set fileContainingExtension(ExtensionRequest v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasFileContainingExtension() => $_has(3);
  @$pb.TagNumber(5)
  void clearFileContainingExtension() => clearField(5);
  @$pb.TagNumber(5)
  ExtensionRequest ensureFileContainingExtension() => $_ensure(3);

  @$pb.TagNumber(6)
  $core.String get allExtensionNumbersOfType => $_getSZ(4);
  @$pb.TagNumber(6)
  set allExtensionNumbersOfType($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasAllExtensionNumbersOfType() => $_has(4);
  @$pb.TagNumber(6)
  void clearAllExtensionNumbersOfType() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get listServices => $_getSZ(5);
  @$pb.TagNumber(7)
  set listServices($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(7)
  $core.bool hasListServices() => $_has(5);
  @$pb.TagNumber(7)
  void clearListServices() => clearField(7);
}

class ExtensionRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ExtensionRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'grpc.reflection.v1alpha'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'containingType')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'extensionNumber', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  ExtensionRequest._() : super();
  factory ExtensionRequest({
    $core.String? containingType,
    $core.int? extensionNumber,
  }) {
    final _result = create();
    if (containingType != null) {
      _result.containingType = containingType;
    }
    if (extensionNumber != null) {
      _result.extensionNumber = extensionNumber;
    }
    return _result;
  }
  factory ExtensionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ExtensionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ExtensionRequest clone() => ExtensionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ExtensionRequest copyWith(void Function(ExtensionRequest) updates) => super.copyWith((message) => updates(message as ExtensionRequest)) as ExtensionRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ExtensionRequest create() => ExtensionRequest._();
  ExtensionRequest createEmptyInstance() => create();
  static $pb.PbList<ExtensionRequest> createRepeated() => $pb.PbList<ExtensionRequest>();
  @$core.pragma('dart2js:noInline')
  static ExtensionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ExtensionRequest>(create);
  static ExtensionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get containingType => $_getSZ(0);
  @$pb.TagNumber(1)
  set containingType($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasContainingType() => $_has(0);
  @$pb.TagNumber(1)
  void clearContainingType() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get extensionNumber => $_getIZ(1);
  @$pb.TagNumber(2)
  set extensionNumber($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasExtensionNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearExtensionNumber() => clearField(2);
}

enum ServerReflectionResponse_MessageResponse {
  fileDescriptorResponse, 
  allExtensionNumbersResponse, 
  listServicesResponse, 
  errorResponse, 
  notSet
}

class ServerReflectionResponse extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, ServerReflectionResponse_MessageResponse> _ServerReflectionResponse_MessageResponseByTag = {
    4 : ServerReflectionResponse_MessageResponse.fileDescriptorResponse,
    5 : ServerReflectionResponse_MessageResponse.allExtensionNumbersResponse,
    6 : ServerReflectionResponse_MessageResponse.listServicesResponse,
    7 : ServerReflectionResponse_MessageResponse.errorResponse,
    0 : ServerReflectionResponse_MessageResponse.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ServerReflectionResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'grpc.reflection.v1alpha'), createEmptyInstance: create)
    ..oo(0, [4, 5, 6, 7])
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'validHost')
    ..aOM<ServerReflectionRequest>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'originalRequest', subBuilder: ServerReflectionRequest.create)
    ..aOM<FileDescriptorResponse>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fileDescriptorResponse', subBuilder: FileDescriptorResponse.create)
    ..aOM<ExtensionNumberResponse>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'allExtensionNumbersResponse', subBuilder: ExtensionNumberResponse.create)
    ..aOM<ListServiceResponse>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'listServicesResponse', subBuilder: ListServiceResponse.create)
    ..aOM<ErrorResponse>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'errorResponse', subBuilder: ErrorResponse.create)
    ..hasRequiredFields = false
  ;

  ServerReflectionResponse._() : super();
  factory ServerReflectionResponse({
    $core.String? validHost,
    ServerReflectionRequest? originalRequest,
    FileDescriptorResponse? fileDescriptorResponse,
    ExtensionNumberResponse? allExtensionNumbersResponse,
    ListServiceResponse? listServicesResponse,
    ErrorResponse? errorResponse,
  }) {
    final _result = create();
    if (validHost != null) {
      _result.validHost = validHost;
    }
    if (originalRequest != null) {
      _result.originalRequest = originalRequest;
    }
    if (fileDescriptorResponse != null) {
      _result.fileDescriptorResponse = fileDescriptorResponse;
    }
    if (allExtensionNumbersResponse != null) {
      _result.allExtensionNumbersResponse = allExtensionNumbersResponse;
    }
    if (listServicesResponse != null) {
      _result.listServicesResponse = listServicesResponse;
    }
    if (errorResponse != null) {
      _result.errorResponse = errorResponse;
    }
    return _result;
  }
  factory ServerReflectionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ServerReflectionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ServerReflectionResponse clone() => ServerReflectionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ServerReflectionResponse copyWith(void Function(ServerReflectionResponse) updates) => super.copyWith((message) => updates(message as ServerReflectionResponse)) as ServerReflectionResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ServerReflectionResponse create() => ServerReflectionResponse._();
  ServerReflectionResponse createEmptyInstance() => create();
  static $pb.PbList<ServerReflectionResponse> createRepeated() => $pb.PbList<ServerReflectionResponse>();
  @$core.pragma('dart2js:noInline')
  static ServerReflectionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ServerReflectionResponse>(create);
  static ServerReflectionResponse? _defaultInstance;

  ServerReflectionResponse_MessageResponse whichMessageResponse() => _ServerReflectionResponse_MessageResponseByTag[$_whichOneof(0)]!;
  void clearMessageResponse() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get validHost => $_getSZ(0);
  @$pb.TagNumber(1)
  set validHost($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValidHost() => $_has(0);
  @$pb.TagNumber(1)
  void clearValidHost() => clearField(1);

  @$pb.TagNumber(2)
  ServerReflectionRequest get originalRequest => $_getN(1);
  @$pb.TagNumber(2)
  set originalRequest(ServerReflectionRequest v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasOriginalRequest() => $_has(1);
  @$pb.TagNumber(2)
  void clearOriginalRequest() => clearField(2);
  @$pb.TagNumber(2)
  ServerReflectionRequest ensureOriginalRequest() => $_ensure(1);

  @$pb.TagNumber(4)
  FileDescriptorResponse get fileDescriptorResponse => $_getN(2);
  @$pb.TagNumber(4)
  set fileDescriptorResponse(FileDescriptorResponse v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasFileDescriptorResponse() => $_has(2);
  @$pb.TagNumber(4)
  void clearFileDescriptorResponse() => clearField(4);
  @$pb.TagNumber(4)
  FileDescriptorResponse ensureFileDescriptorResponse() => $_ensure(2);

  @$pb.TagNumber(5)
  ExtensionNumberResponse get allExtensionNumbersResponse => $_getN(3);
  @$pb.TagNumber(5)
  set allExtensionNumbersResponse(ExtensionNumberResponse v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasAllExtensionNumbersResponse() => $_has(3);
  @$pb.TagNumber(5)
  void clearAllExtensionNumbersResponse() => clearField(5);
  @$pb.TagNumber(5)
  ExtensionNumberResponse ensureAllExtensionNumbersResponse() => $_ensure(3);

  @$pb.TagNumber(6)
  ListServiceResponse get listServicesResponse => $_getN(4);
  @$pb.TagNumber(6)
  set listServicesResponse(ListServiceResponse v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasListServicesResponse() => $_has(4);
  @$pb.TagNumber(6)
  void clearListServicesResponse() => clearField(6);
  @$pb.TagNumber(6)
  ListServiceResponse ensureListServicesResponse() => $_ensure(4);

  @$pb.TagNumber(7)
  ErrorResponse get errorResponse => $_getN(5);
  @$pb.TagNumber(7)
  set errorResponse(ErrorResponse v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasErrorResponse() => $_has(5);
  @$pb.TagNumber(7)
  void clearErrorResponse() => clearField(7);
  @$pb.TagNumber(7)
  ErrorResponse ensureErrorResponse() => $_ensure(5);
}

class FileDescriptorResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FileDescriptorResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'grpc.reflection.v1alpha'), createEmptyInstance: create)
    ..p<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fileDescriptorProto', $pb.PbFieldType.PY)
    ..hasRequiredFields = false
  ;

  FileDescriptorResponse._() : super();
  factory FileDescriptorResponse({
    $core.Iterable<$core.List<$core.int>>? fileDescriptorProto,
  }) {
    final _result = create();
    if (fileDescriptorProto != null) {
      _result.fileDescriptorProto.addAll(fileDescriptorProto);
    }
    return _result;
  }
  factory FileDescriptorResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FileDescriptorResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FileDescriptorResponse clone() => FileDescriptorResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FileDescriptorResponse copyWith(void Function(FileDescriptorResponse) updates) => super.copyWith((message) => updates(message as FileDescriptorResponse)) as FileDescriptorResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FileDescriptorResponse create() => FileDescriptorResponse._();
  FileDescriptorResponse createEmptyInstance() => create();
  static $pb.PbList<FileDescriptorResponse> createRepeated() => $pb.PbList<FileDescriptorResponse>();
  @$core.pragma('dart2js:noInline')
  static FileDescriptorResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FileDescriptorResponse>(create);
  static FileDescriptorResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.List<$core.int>> get fileDescriptorProto => $_getList(0);
}

class ExtensionNumberResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ExtensionNumberResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'grpc.reflection.v1alpha'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'baseTypeName')
    ..p<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'extensionNumber', $pb.PbFieldType.K3)
    ..hasRequiredFields = false
  ;

  ExtensionNumberResponse._() : super();
  factory ExtensionNumberResponse({
    $core.String? baseTypeName,
    $core.Iterable<$core.int>? extensionNumber,
  }) {
    final _result = create();
    if (baseTypeName != null) {
      _result.baseTypeName = baseTypeName;
    }
    if (extensionNumber != null) {
      _result.extensionNumber.addAll(extensionNumber);
    }
    return _result;
  }
  factory ExtensionNumberResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ExtensionNumberResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ExtensionNumberResponse clone() => ExtensionNumberResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ExtensionNumberResponse copyWith(void Function(ExtensionNumberResponse) updates) => super.copyWith((message) => updates(message as ExtensionNumberResponse)) as ExtensionNumberResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ExtensionNumberResponse create() => ExtensionNumberResponse._();
  ExtensionNumberResponse createEmptyInstance() => create();
  static $pb.PbList<ExtensionNumberResponse> createRepeated() => $pb.PbList<ExtensionNumberResponse>();
  @$core.pragma('dart2js:noInline')
  static ExtensionNumberResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ExtensionNumberResponse>(create);
  static ExtensionNumberResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get baseTypeName => $_getSZ(0);
  @$pb.TagNumber(1)
  set baseTypeName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBaseTypeName() => $_has(0);
  @$pb.TagNumber(1)
  void clearBaseTypeName() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get extensionNumber => $_getList(1);
}

class ListServiceResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListServiceResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'grpc.reflection.v1alpha'), createEmptyInstance: create)
    ..pc<ServiceResponse>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'service', $pb.PbFieldType.PM, subBuilder: ServiceResponse.create)
    ..hasRequiredFields = false
  ;

  ListServiceResponse._() : super();
  factory ListServiceResponse({
    $core.Iterable<ServiceResponse>? service,
  }) {
    final _result = create();
    if (service != null) {
      _result.service.addAll(service);
    }
    return _result;
  }
  factory ListServiceResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListServiceResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListServiceResponse clone() => ListServiceResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListServiceResponse copyWith(void Function(ListServiceResponse) updates) => super.copyWith((message) => updates(message as ListServiceResponse)) as ListServiceResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListServiceResponse create() => ListServiceResponse._();
  ListServiceResponse createEmptyInstance() => create();
  static $pb.PbList<ListServiceResponse> createRepeated() => $pb.PbList<ListServiceResponse>();
  @$core.pragma('dart2js:noInline')
  static ListServiceResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListServiceResponse>(create);
  static ListServiceResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ServiceResponse> get service => $_getList(0);
}

class ServiceResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ServiceResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'grpc.reflection.v1alpha'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..hasRequiredFields = false
  ;

  ServiceResponse._() : super();
  factory ServiceResponse({
    $core.String? name,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory ServiceResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ServiceResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ServiceResponse clone() => ServiceResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ServiceResponse copyWith(void Function(ServiceResponse) updates) => super.copyWith((message) => updates(message as ServiceResponse)) as ServiceResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ServiceResponse create() => ServiceResponse._();
  ServiceResponse createEmptyInstance() => create();
  static $pb.PbList<ServiceResponse> createRepeated() => $pb.PbList<ServiceResponse>();
  @$core.pragma('dart2js:noInline')
  static ServiceResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ServiceResponse>(create);
  static ServiceResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);
}

class ErrorResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ErrorResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'grpc.reflection.v1alpha'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'errorCode', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'errorMessage')
    ..hasRequiredFields = false
  ;

  ErrorResponse._() : super();
  factory ErrorResponse({
    $core.int? errorCode,
    $core.String? errorMessage,
  }) {
    final _result = create();
    if (errorCode != null) {
      _result.errorCode = errorCode;
    }
    if (errorMessage != null) {
      _result.errorMessage = errorMessage;
    }
    return _result;
  }
  factory ErrorResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ErrorResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ErrorResponse clone() => ErrorResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ErrorResponse copyWith(void Function(ErrorResponse) updates) => super.copyWith((message) => updates(message as ErrorResponse)) as ErrorResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ErrorResponse create() => ErrorResponse._();
  ErrorResponse createEmptyInstance() => create();
  static $pb.PbList<ErrorResponse> createRepeated() => $pb.PbList<ErrorResponse>();
  @$core.pragma('dart2js:noInline')
  static ErrorResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ErrorResponse>(create);
  static ErrorResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get errorCode => $_getIZ(0);
  @$pb.TagNumber(1)
  set errorCode($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasErrorCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearErrorCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get errorMessage => $_getSZ(1);
  @$pb.TagNumber(2)
  set errorMessage($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasErrorMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearErrorMessage() => clearField(2);
}

