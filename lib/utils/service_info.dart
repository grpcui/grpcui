import 'package:app/grpc/generated/google/protobuf/descriptor.pb.dart';

class ServiceInfo {
  const ServiceInfo(this.name, this.files, this.service);

  final String name;
  final List<FileDescriptorProto> files;
  final ServiceDescriptorProto service;

  DescriptorProto findMessageType(String name) {
    name = _trimDot(name);
    //
    for (final file in files) {
      for (final messageType in file.messageType) {
        if (_trimDot('${file.package}.${messageType.name}') == name) {
          return messageType;
        }
      }
    }

    throw Exception();
  }
}


String _trimDot(String v) {
  while (v.startsWith('.')) {
    v = v.substring(1);
  }

  return v;
}
