import 'package:flutter/material.dart';

class BoolFormField extends FormField<bool> {
  BoolFormField({
    super.key,
    Widget? label,
    void Function(bool? value)? onChanged,
    void Function(bool? value)? onSaved,
    FormFieldValidator<bool>? validator,
    bool? initialValue,
    bool? dense,
    ListTileControlAffinity controlAffinity = ListTileControlAffinity.platform,
    String? restorationId,
    bool enabled = true,
    AutovalidateMode? autovalidateMode,
  }) : super(
            initialValue: initialValue,
            restorationId: restorationId,
            enabled: enabled,
            autovalidateMode: autovalidateMode,
            onSaved: onSaved,
            validator: validator,
            builder: (field) {
              void onChangedHnadler(bool? value) {
                field.didChange(value);
                onChanged?.call(value ?? false);
              }

              return UnmanagedRestorationScope(
                bucket: field.bucket,
                child: SwitchListTile(
                  title: label,
                  value: field.value ?? false,
                  onChanged: onChangedHnadler,
                  dense: dense,
                  controlAffinity: controlAffinity,
                  contentPadding: EdgeInsets.zero,
                ),
              );
            });
}
