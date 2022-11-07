///
//  Generated code. Do not modify.
//  source: reflection.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use serverReflectionRequestDescriptor instead')
const ServerReflectionRequest$json = const {
  '1': 'ServerReflectionRequest',
  '2': const [
    const {'1': 'host', '3': 1, '4': 1, '5': 9, '10': 'host'},
    const {'1': 'file_by_filename', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'fileByFilename'},
    const {'1': 'file_containing_symbol', '3': 4, '4': 1, '5': 9, '9': 0, '10': 'fileContainingSymbol'},
    const {'1': 'file_containing_extension', '3': 5, '4': 1, '5': 11, '6': '.grpc.reflection.v1alpha.ExtensionRequest', '9': 0, '10': 'fileContainingExtension'},
    const {'1': 'all_extension_numbers_of_type', '3': 6, '4': 1, '5': 9, '9': 0, '10': 'allExtensionNumbersOfType'},
    const {'1': 'list_services', '3': 7, '4': 1, '5': 9, '9': 0, '10': 'listServices'},
  ],
  '8': const [
    const {'1': 'message_request'},
  ],
};

/// Descriptor for `ServerReflectionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serverReflectionRequestDescriptor = $convert.base64Decode('ChdTZXJ2ZXJSZWZsZWN0aW9uUmVxdWVzdBISCgRob3N0GAEgASgJUgRob3N0EioKEGZpbGVfYnlfZmlsZW5hbWUYAyABKAlIAFIOZmlsZUJ5RmlsZW5hbWUSNgoWZmlsZV9jb250YWluaW5nX3N5bWJvbBgEIAEoCUgAUhRmaWxlQ29udGFpbmluZ1N5bWJvbBJnChlmaWxlX2NvbnRhaW5pbmdfZXh0ZW5zaW9uGAUgASgLMikuZ3JwYy5yZWZsZWN0aW9uLnYxYWxwaGEuRXh0ZW5zaW9uUmVxdWVzdEgAUhdmaWxlQ29udGFpbmluZ0V4dGVuc2lvbhJCCh1hbGxfZXh0ZW5zaW9uX251bWJlcnNfb2ZfdHlwZRgGIAEoCUgAUhlhbGxFeHRlbnNpb25OdW1iZXJzT2ZUeXBlEiUKDWxpc3Rfc2VydmljZXMYByABKAlIAFIMbGlzdFNlcnZpY2VzQhEKD21lc3NhZ2VfcmVxdWVzdA==');
@$core.Deprecated('Use extensionRequestDescriptor instead')
const ExtensionRequest$json = const {
  '1': 'ExtensionRequest',
  '2': const [
    const {'1': 'containing_type', '3': 1, '4': 1, '5': 9, '10': 'containingType'},
    const {'1': 'extension_number', '3': 2, '4': 1, '5': 5, '10': 'extensionNumber'},
  ],
};

/// Descriptor for `ExtensionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List extensionRequestDescriptor = $convert.base64Decode('ChBFeHRlbnNpb25SZXF1ZXN0EicKD2NvbnRhaW5pbmdfdHlwZRgBIAEoCVIOY29udGFpbmluZ1R5cGUSKQoQZXh0ZW5zaW9uX251bWJlchgCIAEoBVIPZXh0ZW5zaW9uTnVtYmVy');
@$core.Deprecated('Use serverReflectionResponseDescriptor instead')
const ServerReflectionResponse$json = const {
  '1': 'ServerReflectionResponse',
  '2': const [
    const {'1': 'valid_host', '3': 1, '4': 1, '5': 9, '10': 'validHost'},
    const {'1': 'original_request', '3': 2, '4': 1, '5': 11, '6': '.grpc.reflection.v1alpha.ServerReflectionRequest', '10': 'originalRequest'},
    const {'1': 'file_descriptor_response', '3': 4, '4': 1, '5': 11, '6': '.grpc.reflection.v1alpha.FileDescriptorResponse', '9': 0, '10': 'fileDescriptorResponse'},
    const {'1': 'all_extension_numbers_response', '3': 5, '4': 1, '5': 11, '6': '.grpc.reflection.v1alpha.ExtensionNumberResponse', '9': 0, '10': 'allExtensionNumbersResponse'},
    const {'1': 'list_services_response', '3': 6, '4': 1, '5': 11, '6': '.grpc.reflection.v1alpha.ListServiceResponse', '9': 0, '10': 'listServicesResponse'},
    const {'1': 'error_response', '3': 7, '4': 1, '5': 11, '6': '.grpc.reflection.v1alpha.ErrorResponse', '9': 0, '10': 'errorResponse'},
  ],
  '8': const [
    const {'1': 'message_response'},
  ],
};

/// Descriptor for `ServerReflectionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serverReflectionResponseDescriptor = $convert.base64Decode('ChhTZXJ2ZXJSZWZsZWN0aW9uUmVzcG9uc2USHQoKdmFsaWRfaG9zdBgBIAEoCVIJdmFsaWRIb3N0ElsKEG9yaWdpbmFsX3JlcXVlc3QYAiABKAsyMC5ncnBjLnJlZmxlY3Rpb24udjFhbHBoYS5TZXJ2ZXJSZWZsZWN0aW9uUmVxdWVzdFIPb3JpZ2luYWxSZXF1ZXN0EmsKGGZpbGVfZGVzY3JpcHRvcl9yZXNwb25zZRgEIAEoCzIvLmdycGMucmVmbGVjdGlvbi52MWFscGhhLkZpbGVEZXNjcmlwdG9yUmVzcG9uc2VIAFIWZmlsZURlc2NyaXB0b3JSZXNwb25zZRJ3Ch5hbGxfZXh0ZW5zaW9uX251bWJlcnNfcmVzcG9uc2UYBSABKAsyMC5ncnBjLnJlZmxlY3Rpb24udjFhbHBoYS5FeHRlbnNpb25OdW1iZXJSZXNwb25zZUgAUhthbGxFeHRlbnNpb25OdW1iZXJzUmVzcG9uc2USZAoWbGlzdF9zZXJ2aWNlc19yZXNwb25zZRgGIAEoCzIsLmdycGMucmVmbGVjdGlvbi52MWFscGhhLkxpc3RTZXJ2aWNlUmVzcG9uc2VIAFIUbGlzdFNlcnZpY2VzUmVzcG9uc2USTwoOZXJyb3JfcmVzcG9uc2UYByABKAsyJi5ncnBjLnJlZmxlY3Rpb24udjFhbHBoYS5FcnJvclJlc3BvbnNlSABSDWVycm9yUmVzcG9uc2VCEgoQbWVzc2FnZV9yZXNwb25zZQ==');
@$core.Deprecated('Use fileDescriptorResponseDescriptor instead')
const FileDescriptorResponse$json = const {
  '1': 'FileDescriptorResponse',
  '2': const [
    const {'1': 'file_descriptor_proto', '3': 1, '4': 3, '5': 12, '10': 'fileDescriptorProto'},
  ],
};

/// Descriptor for `FileDescriptorResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileDescriptorResponseDescriptor = $convert.base64Decode('ChZGaWxlRGVzY3JpcHRvclJlc3BvbnNlEjIKFWZpbGVfZGVzY3JpcHRvcl9wcm90bxgBIAMoDFITZmlsZURlc2NyaXB0b3JQcm90bw==');
@$core.Deprecated('Use extensionNumberResponseDescriptor instead')
const ExtensionNumberResponse$json = const {
  '1': 'ExtensionNumberResponse',
  '2': const [
    const {'1': 'base_type_name', '3': 1, '4': 1, '5': 9, '10': 'baseTypeName'},
    const {'1': 'extension_number', '3': 2, '4': 3, '5': 5, '10': 'extensionNumber'},
  ],
};

/// Descriptor for `ExtensionNumberResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List extensionNumberResponseDescriptor = $convert.base64Decode('ChdFeHRlbnNpb25OdW1iZXJSZXNwb25zZRIkCg5iYXNlX3R5cGVfbmFtZRgBIAEoCVIMYmFzZVR5cGVOYW1lEikKEGV4dGVuc2lvbl9udW1iZXIYAiADKAVSD2V4dGVuc2lvbk51bWJlcg==');
@$core.Deprecated('Use listServiceResponseDescriptor instead')
const ListServiceResponse$json = const {
  '1': 'ListServiceResponse',
  '2': const [
    const {'1': 'service', '3': 1, '4': 3, '5': 11, '6': '.grpc.reflection.v1alpha.ServiceResponse', '10': 'service'},
  ],
};

/// Descriptor for `ListServiceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listServiceResponseDescriptor = $convert.base64Decode('ChNMaXN0U2VydmljZVJlc3BvbnNlEkIKB3NlcnZpY2UYASADKAsyKC5ncnBjLnJlZmxlY3Rpb24udjFhbHBoYS5TZXJ2aWNlUmVzcG9uc2VSB3NlcnZpY2U=');
@$core.Deprecated('Use serviceResponseDescriptor instead')
const ServiceResponse$json = const {
  '1': 'ServiceResponse',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `ServiceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serviceResponseDescriptor = $convert.base64Decode('Cg9TZXJ2aWNlUmVzcG9uc2USEgoEbmFtZRgBIAEoCVIEbmFtZQ==');
@$core.Deprecated('Use errorResponseDescriptor instead')
const ErrorResponse$json = const {
  '1': 'ErrorResponse',
  '2': const [
    const {'1': 'error_code', '3': 1, '4': 1, '5': 5, '10': 'errorCode'},
    const {'1': 'error_message', '3': 2, '4': 1, '5': 9, '10': 'errorMessage'},
  ],
};

/// Descriptor for `ErrorResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List errorResponseDescriptor = $convert.base64Decode('Cg1FcnJvclJlc3BvbnNlEh0KCmVycm9yX2NvZGUYASABKAVSCWVycm9yQ29kZRIjCg1lcnJvcl9tZXNzYWdlGAIgASgJUgxlcnJvck1lc3NhZ2U=');
