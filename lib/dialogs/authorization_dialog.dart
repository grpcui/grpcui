import 'package:flutter/material.dart';

class AuthorizationDialog extends StatefulWidget {
  const AuthorizationDialog({
    super.key,
    required this.initialValue,
  });

  final String? initialValue;

  @override
  State<StatefulWidget> createState() => _AuthorizationDialogState();
}

class _AuthorizationDialogState extends State<AuthorizationDialog> {
  final _v = TextEditingController();

  @override
  void initState() {
    _v.text = widget.initialValue ?? '';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Material(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Form(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextFormField(
                      maxLines: 100,
                      controller: _v,
                      decoration: const InputDecoration(
                        labelText: 'Authorization Header',
                        hintText: 'Bearer eyJhb...',
                      ),
                    ),
                  ),
                ),
              ),
              ButtonBar(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(' Cancel '),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(_v.text);
                    },
                    child: const Text('   OK   '),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
