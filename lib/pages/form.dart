import 'package:app/grpc/generated/google/protobuf/descriptor.pb.dart';
import 'package:fixnum/fixnum.dart' as fixnum;
import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

import 'form_fields.dart';

class DynamicForm extends StatefulWidget {
  const DynamicForm({
    super.key,
    required this.required,
    this.label,
    required this.value,
    required this.schema,
    required this.resolveMessageType,
    required this.resolveEnumType,
    required this.onChanged,
  });

  final void Function(Map<String, Object?> value) onChanged;
  final bool required;
  final String? label;
  final Map<String, Object?> value;
  final DescriptorProto schema;
  final DescriptorProto Function(String typeName) resolveMessageType;
  final EnumDescriptorProto Function(String typeName) resolveEnumType;

  @override
  State<StatefulWidget> createState() => _DynamicFormState();
}

class _DynamicFormState extends State<DynamicForm> {
  @override
  Widget build(BuildContext context) {
    final schema = widget.schema;
    final value = widget.value;
    final label = widget.label;

    final children = <Widget>[];

    if (label != null) {
      children.add(Text(label));
    }

    for (final field in schema.field) {
      final fieldKey = field.name;

      final required = !field.proto3Optional ||
          field.label == FieldDescriptorProto_Label.LABEL_REQUIRED;

      if (field.type == FieldDescriptorProto_Type.TYPE_MESSAGE) {
        if (value[fieldKey] is! Map<String, Object?>?) {
          value[fieldKey] = null;
        }

        value.putIfAbsent(fieldKey, () => <String, Object?>{});

        children.add(Padding(
          padding: const EdgeInsetsDirectional.only(start: 8.0),
          child: DynamicForm(
            required: required,
            onChanged: (v) {
              value[fieldKey] = v;
              widget.onChanged.call(value);
            },
            resolveMessageType: widget.resolveMessageType,
            resolveEnumType: widget.resolveEnumType,
            schema: widget.resolveMessageType.call(field.typeName),
            label: _recase(field.name),
            value: value[fieldKey] as Map<String, Object?>,
          ),
        ));
      } else if (field.type == FieldDescriptorProto_Type.TYPE_STRING) {
        if (value[fieldKey] is! String?) {
          value[fieldKey] = null;
        }

        children.add(StringTextFormField(
          required: required,
          onChanged: (v) {
            value[fieldKey] = v;
            widget.onChanged.call(value);
          },
          label: _recase(field.name),
          value: value[fieldKey] as String?,
        ));
      } else if (field.type == FieldDescriptorProto_Type.TYPE_UINT32 ||
          field.type == FieldDescriptorProto_Type.TYPE_UINT64) {
        if (value[fieldKey] is! int?) {
          value[fieldKey] = null;
        }

        children.add(IntTextFormField(
          required: required,
          unsigned: true,
          onChanged: (v) {
            value[fieldKey] = v;
            widget.onChanged.call(value);
          },
          label: _recase(field.name),
          value: value[fieldKey] as int?,
        ));
      } else if (field.type == FieldDescriptorProto_Type.TYPE_INT32 ||
          field.type == FieldDescriptorProto_Type.TYPE_SINT32 ||
          field.type == FieldDescriptorProto_Type.TYPE_FIXED32 ||
          field.type == FieldDescriptorProto_Type.TYPE_SFIXED32) {
        if (value[fieldKey] is! int?) {
          value[fieldKey] = null;
        }

        children.add(Int32TextFormField(
          required: required,
          unsigned: false,
          onChanged: (v) {
            value[fieldKey] = v;
            widget.onChanged.call(value);
          },
          label: _recase(field.name),
          value: value[fieldKey] as int?,
        ));
      } else if (field.type == FieldDescriptorProto_Type.TYPE_INT64 ||
          field.type == FieldDescriptorProto_Type.TYPE_SINT64 ||
          field.type == FieldDescriptorProto_Type.TYPE_FIXED64 ||
          field.type == FieldDescriptorProto_Type.TYPE_SFIXED64) {
        if (value[fieldKey] is! fixnum.Int64?) {
          value[fieldKey] = null;
        }

        children.add(Int64TextFormField(
          required: required,
          unsigned: false,
          onChanged: (v) {
            value[fieldKey] = v;
            widget.onChanged.call(value);
          },
          label: _recase(field.name),
          value: value[fieldKey] as fixnum.Int64?,
        ));
      } else if (field.type == FieldDescriptorProto_Type.TYPE_DOUBLE ||
          field.type == FieldDescriptorProto_Type.TYPE_FLOAT) {
        if (value[fieldKey] is! double?) {
          value[fieldKey] = null;
        }

        children.add(DoubleTextFormField(
          required: required,
          unsigned: false,
          onChanged: (v) {
            value[fieldKey] = v;
            widget.onChanged.call(value);
          },
          label: _recase(field.name),
          value: value[fieldKey] as double?,
        ));
      } else if (field.type == FieldDescriptorProto_Type.TYPE_BOOL) {
        if (value[fieldKey] is! bool?) {
          value[fieldKey] = null;
        }

        children.add(BoFormField(
          required: required,
          onChanged: (v) {
            value[fieldKey] = v;
            widget.onChanged.call(value);
          },
          label: _recase(field.name),
          value: value[fieldKey] as bool?,
        ));
      } else if (field.type == FieldDescriptorProto_Type.TYPE_ENUM) {
        if (value[fieldKey] is! int?) {
          value[fieldKey] = null;
        }

        final enumType = widget.resolveEnumType.call(field.typeName);
        const nullItem = DropdownMenuItem<int>(
          value: null,
          child: Text(
            '<Null>',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        );

        final items = enumType.value
            .map(
              (e) => DropdownMenuItem<int>(
                value: e.number,
                child: Text(_recase(e.name)),
              ),
            )
            .toList();

        if (!required) {
          items.insert(0, nullItem);
        }

        children.add(DropdownButtonFormField<int>(
          items: items,
          onChanged: (v) {
            value[fieldKey] = v;
            widget.onChanged.call(value);
          },
          onSaved: (v) {
            value[fieldKey] = v;
            widget.onChanged.call(value);
          },
          decoration: InputDecoration(labelText: _recase(field.name)),
          value: value[fieldKey] as int?,
        ));

        //
      } else {
        children.add(StringTextFormField(
          required: required,
          onChanged: (v) {
            value[fieldKey] = v;
            widget.onChanged.call(value);
          },
          label: _recase(field.name),
          value: value[fieldKey] as String?,
        ));
      }
    }

    final padded = children
        .map(
          (e) => Padding(
            padding: const EdgeInsets.all(4.0),
            child: e,
          ),
        )
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: padded,
    );
  }
}

class StringTextFormField extends StatefulWidget {
  const StringTextFormField({
    super.key,
    required this.onChanged,
    required this.required,
    required this.label,
    required this.value,
  });

  final void Function(String? value) onChanged;
  final bool required;
  final String label;
  final String? value;

  @override
  State<StatefulWidget> createState() => _StringTextFormFieldState();
}

class _StringTextFormFieldState extends State<StringTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: _recase(widget.label),
      ),
      onChanged: widget.onChanged,
      onSaved: widget.onChanged,
      onFieldSubmitted: widget.onChanged,
      validator: (value) {
        if (widget.required && (value == null || value.isEmpty)) {
          return 'Required.';
        }

        return null;
      },
    );
  }
}

class IntTextFormField extends StatefulWidget {
  const IntTextFormField({
    super.key,
    required this.onChanged,
    required this.required,
    required this.unsigned,
    required this.label,
    required this.value,
  });

  final void Function(int? value) onChanged;
  final bool required;
  final bool unsigned;
  final String label;
  final int? value;

  @override
  State<StatefulWidget> createState() => _IntTextFormFieldState();
}

class _IntTextFormFieldState extends State<IntTextFormField> {
  void _onChanged(String? v) {
    final n = int.tryParse(v ?? '');
    widget.onChanged.call(n);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: _recase(widget.label),
      ),
      onChanged: _onChanged,
      onSaved: _onChanged,
      onFieldSubmitted: _onChanged,
      validator: (value) {
        if ((value == null || value.isEmpty)) {
          if (widget.required) {
            return 'Required.';
          }

          return null;
        }

        final i = int.tryParse(value);

        if (i == null) {
          return 'Invalid numeric value.';
        }

        if (widget.unsigned && i < 0) {
          return 'Must be a positive number.';
        }

        return null;
      },
    );
  }
}

class Int32TextFormField extends StatefulWidget {
  const Int32TextFormField({
    super.key,
    required this.onChanged,
    required this.required,
    required this.unsigned,
    required this.label,
    required this.value,
  });

  final void Function(int? value) onChanged;
  final bool required;
  final bool unsigned;
  final String label;
  final int? value;

  @override
  State<StatefulWidget> createState() => _Int32TextFormFieldState();
}

class _Int32TextFormFieldState extends State<Int32TextFormField> {
  void _onChanged(String? v) {
    final n = int.tryParse(v ?? '');
    widget.onChanged.call(n);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: _recase(widget.label),
      ),
      onChanged: _onChanged,
      onSaved: _onChanged,
      onFieldSubmitted: _onChanged,
      validator: (value) {
        if ((value == null || value.isEmpty)) {
          if (widget.required) {
            return 'Required.';
          }

          return null;
        }

        final i = int.tryParse(value);

        if (i == null) {
          return 'Invalid numeric value.';
        }

        if (widget.unsigned && i < 0) {
          return 'Must be a positive number.';
        }

        return null;
      },
    );
  }
}

class Int64TextFormField extends StatefulWidget {
  const Int64TextFormField({
    super.key,
    required this.onChanged,
    required this.required,
    required this.unsigned,
    required this.label,
    required this.value,
  });

  final void Function(fixnum.Int64? value) onChanged;
  final bool required;
  final bool unsigned;
  final String label;
  final fixnum.Int64? value;

  @override
  State<StatefulWidget> createState() => _Int64TextFormFieldState();
}

class _Int64TextFormFieldState extends State<Int64TextFormField> {
  void _onChanged(String? v) {
    final n = int.tryParse(v ?? '');
    widget.onChanged.call(n != null ? fixnum.Int64(n) : null);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: _recase(widget.label),
      ),
      onChanged: _onChanged,
      onSaved: _onChanged,
      onFieldSubmitted: _onChanged,
      validator: (value) {
        if ((value == null || value.isEmpty)) {
          if (widget.required) {
            return 'Required.';
          }

          return null;
        }

        final i = int.tryParse(value);

        if (i == null) {
          return 'Invalid numeric value.';
        }

        if (widget.unsigned && i < 0) {
          return 'Must be a positive number.';
        }

        return null;
      },
    );
  }
}

class DoubleTextFormField extends StatefulWidget {
  const DoubleTextFormField({
    super.key,
    required this.onChanged,
    required this.required,
    required this.unsigned,
    required this.label,
    required this.value,
  });

  final void Function(double? value) onChanged;
  final bool required;
  final bool unsigned;
  final String label;
  final double? value;

  @override
  State<StatefulWidget> createState() => _DoubleTextFormFieldState();
}

class _DoubleTextFormFieldState extends State<DoubleTextFormField> {
  void _onChanged(String? v) {
    widget.onChanged.call(double.tryParse(v ?? ''));
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: _recase(widget.label),
      ),
      onChanged: _onChanged,
      onSaved: _onChanged,
      onFieldSubmitted: _onChanged,
      validator: (value) {
        if ((value == null || value.isEmpty)) {
          if (widget.required) {
            return 'Required.';
          }

          return null;
        }

        final i = double.tryParse(value);

        if (i == null) {
          return 'Invalid double value.';
        }

        if (widget.unsigned && i < 0) {
          return 'Must be a positive number.';
        }

        return null;
      },
    );
  }
}

class BoFormField extends StatefulWidget {
  const BoFormField({
    super.key,
    required this.onChanged,
    required this.required,
    required this.label,
    required this.value,
  });

  final void Function(bool? value) onChanged;
  final bool required;
  final String label;
  final bool? value;

  @override
  State<StatefulWidget> createState() => _BoFormFieldState();
}

class _BoFormFieldState extends State<BoFormField> {
  void _onChanged(bool? v) {
    if (widget.required) {
      widget.onChanged.call(v ?? false);
    } else {
      widget.onChanged.call(v);
    }
  }

  void _onSaved(bool? v) {
    if (widget.required) {
      widget.onChanged.call(v ?? false);
    } else {
      widget.onChanged.call(v);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.required) {
      return SwitchFormField(
        label: Text(_recase(widget.label)),
        onSaved: _onSaved,
        onChanged: _onChanged,
        initialValue: widget.value ?? false,
        controlAffinity: ListTileControlAffinity.leading,
        dense: true,
      );
    } else {
      return CheckBoxFormField(
        label: Text(_recase(widget.label)),
        onSaved: _onSaved,
        onChanged: _onChanged,
        initialValue: widget.value,
        controlAffinity: ListTileControlAffinity.leading,
        dense: true,
        tristate: true,
      );
    }
  }
}

String _recase(String name) {
  return ReCase(name).titleCase;
}
