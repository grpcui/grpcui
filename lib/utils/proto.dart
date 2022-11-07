import 'dart:typed_data';

import 'package:app/grpc/generated/google/protobuf/descriptor.pb.dart';
import 'package:protobuf/protobuf.dart';
import 'package:fixnum/fixnum.dart' as fixnum;

Uint8List writeProto(
  Map<String, Object?> data,
  DescriptorProto descriptor,
  DescriptorProto Function(String name) resolver,
) {
  final writer = CodedBufferWriter();

  for (final field in descriptor.field) {
    final label = field.label.value;
    final type = _getType(field.type);
    //final isArray = field.label == FieldDescriptorProto_Label.LABEL_REPEATED;
    final fieldType = type | label;

    if (field.type == FieldDescriptorProto_Type.TYPE_MESSAGE) {
      final d = data[field.name] as Map<String, Object?>;
      final s = resolver(field.typeName);
      final binary = writeProto(d, s, resolver);
      final fake = _FakeMessage(binary);

      writer.writeField(field.number, fieldType, fake);
    } else {
      final d = data[field.name];
      writer.writeField(field.number, fieldType, d);
    }
  }

  return writer.toBuffer();
}

Map<String, Object> readProto(
  Uint8List buffer,
  DescriptorProto descriptor,
  DescriptorProto Function(String name) resolver,
) {
  final reader = CodedBufferReader(buffer);
  final obj = <String, Object>{};
  int tag = 0;

  while ((tag = reader.readTag()) != 0) {
    final fieldNumber = getTagFieldNumber(tag);
    //final wire = getTagWireType(tag);

    final field = descriptor.field.firstWhere((e) => e.number == fieldNumber);
    final isArray = field.label == FieldDescriptorProto_Label.LABEL_REPEATED;
    final type = field.type;
    final name = field.name;

    // final length =
    //     wire == WIRETYPE_LENGTH_DELIMITED ? reader.readInt32() : null;

    if (isArray) {
      obj[name] ??= <Object>[];
      final array = obj[name] as List<Object>;

      if (type == FieldDescriptorProto_Type.TYPE_MESSAGE) {
        final msg = reader.readField(type, field.typeName, resolver);
        array.add(msg);
      } else {
        //
      }
    } else {
      obj[name] = reader.readField(type, field.typeName, resolver);
    }
  }

  return obj;
}

class _FakeMessage {
  const _FakeMessage(this.binary);
  final Uint8List binary;

  void writeToCodedBufferWriter(CodedBufferWriter writer) {
    writer.writeRawBytes(binary);
  }
}

//const int _MAP_BIT = 0x400000;

int _getType(FieldDescriptorProto_Type type) {
  switch (type) {
    case FieldDescriptorProto_Type.TYPE_BOOL:
      return 0x10;
    case FieldDescriptorProto_Type.TYPE_BYTES:
      return 0x20;
    case FieldDescriptorProto_Type.TYPE_STRING:
      return 0x40;
    case FieldDescriptorProto_Type.TYPE_DOUBLE:
      return 0x80;
    case FieldDescriptorProto_Type.TYPE_FLOAT:
      return 0x100;
    case FieldDescriptorProto_Type.TYPE_ENUM:
      return 0x200;
    case FieldDescriptorProto_Type.TYPE_GROUP:
      return 0x400;
    case FieldDescriptorProto_Type.TYPE_INT32:
      return 0x800;
    case FieldDescriptorProto_Type.TYPE_INT64:
      return 0x1000;
    case FieldDescriptorProto_Type.TYPE_SINT32:
      return 0x2000;
    case FieldDescriptorProto_Type.TYPE_SINT64:
      return 0x4000;
    case FieldDescriptorProto_Type.TYPE_UINT32:
      return 0x8000;
    case FieldDescriptorProto_Type.TYPE_UINT64:
      return 0x10000;
    case FieldDescriptorProto_Type.TYPE_FIXED32:
      return 0x20000;
    case FieldDescriptorProto_Type.TYPE_FIXED64:
      return 0x40000;
    case FieldDescriptorProto_Type.TYPE_SFIXED32:
      return 0x80000;
    case FieldDescriptorProto_Type.TYPE_SFIXED64:
      return 0x100000;
    case FieldDescriptorProto_Type.TYPE_MESSAGE:
      return 0x200000;
  }
  throw Exception();
}

extension on CodedBufferReader {
  Object readField(
    FieldDescriptorProto_Type type,
    String typeName,
    DescriptorProto Function(String name) resolver,
  ) {
    final reader = this;

    if (type == FieldDescriptorProto_Type.TYPE_BOOL) {
      return reader.readBool();
    } else if (type == FieldDescriptorProto_Type.TYPE_BYTES) {
      return reader.readBytes();
    } else if (type == FieldDescriptorProto_Type.TYPE_DOUBLE) {
      return reader.readDouble();
    } else if (type == FieldDescriptorProto_Type.TYPE_ENUM) {
      return reader.readEnum();
    } else if (type == FieldDescriptorProto_Type.TYPE_FIXED32) {
      return reader.readFixed32();
    } else if (type == FieldDescriptorProto_Type.TYPE_FIXED64) {
      return reader.readFixed64();
    } else if (type == FieldDescriptorProto_Type.TYPE_FLOAT) {
      return reader.readFloat();
    } else if (type == FieldDescriptorProto_Type.TYPE_INT32) {
      return reader.readInt32();
    } else if (type == FieldDescriptorProto_Type.TYPE_INT64) {
      return reader.readInt64();
    } else if (type == FieldDescriptorProto_Type.TYPE_MESSAGE) {
      final buff = reader.readBytes();

      return readProto(
          Uint8List.fromList(buff), resolver.call(typeName), resolver);
    } else if (type == FieldDescriptorProto_Type.TYPE_SFIXED32) {
      return reader.readSfixed32();
    } else if (type == FieldDescriptorProto_Type.TYPE_SFIXED64) {
      return reader.readSfixed64();
    } else if (type == FieldDescriptorProto_Type.TYPE_SINT32) {
      return reader.readSint32();
    } else if (type == FieldDescriptorProto_Type.TYPE_SINT64) {
      return reader.readSint64();
    } else if (type == FieldDescriptorProto_Type.TYPE_STRING) {
      return reader.readString();
    } else if (type == FieldDescriptorProto_Type.TYPE_UINT32) {
      return reader.readUint32();
    } else if (type == FieldDescriptorProto_Type.TYPE_UINT64) {
      return reader.readUint64();
    }

    throw Exception();
  }
}

Map<String, Object> proto2Json(Map<String, Object> o) {
  final r = <String, Object>{};

  for (final kv in o.entries) {
    final k = kv.key;
    final v = kv.value;

    if (v is Map<String, Object>) {
      r[k] = proto2Json(v);
    } else if (v is List) {
      r[k] = _protoList(v);
    } else if (v is fixnum.Int64) {
      r[k] = v.toInt();
    } else if (v is fixnum.Int32) {
      r[k] = v.toInt();
    } else {
      r[k] = v;
    }
  }

  return r;
}

List<Object> _protoList(List<dynamic> o) {
  final r = <Object>[];

  for (final v in o) {
    if (v is Map<String, Object>) {
      r.add(proto2Json(v));
    } else if (v is List) {
      r.add(_protoList(v));
    } else if (v is fixnum.Int64) {
      r.add(v.toInt());
    } else if (v is fixnum.Int32) {
      r.add(v.toInt());
    } else {
      r.add(v);
    }
  }

  return r;
}
