import 'package:flutter/material.dart';

class SwitchFormField extends FormField<bool> {
  SwitchFormField({
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
            void onChangedHandler(bool? value) {
              field.didChange(value);
              onChanged?.call(value ?? false);
            }

            return UnmanagedRestorationScope(
              bucket: field.bucket,
              child: SwitchListTile(
                title: label,
                value: field.value ?? false,
                onChanged: onChangedHandler,
                dense: dense,
                controlAffinity: controlAffinity,
                contentPadding: EdgeInsets.zero,
              ),
            );
          },
        );
}

class CheckBoxFormField extends FormField<bool> {
  CheckBoxFormField({
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
    bool tristate = false,
  }) : super(
          initialValue: initialValue,
          restorationId: restorationId,
          enabled: enabled,
          autovalidateMode: autovalidateMode,
          onSaved: onSaved,
          validator: validator,
          builder: (field) {
            void onChangedHandler(bool? value) {
              field.didChange(value);
              onChanged?.call(value ?? false);
            }

            return UnmanagedRestorationScope(
              bucket: field.bucket,
              child: CheckboxListTile(
                tristate: tristate,
                title: label,
                value: field.value,
                onChanged: onChangedHandler,
                dense: dense,
                controlAffinity: controlAffinity,
                contentPadding: EdgeInsets.zero,
              ),
            );
          },
        );
}
