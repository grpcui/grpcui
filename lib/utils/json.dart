import 'dart:convert';

const _jsonPretty = JsonEncoder.withIndent(' ');

String pretty(Object? object) {
  return _jsonPretty.convert(object);
}
