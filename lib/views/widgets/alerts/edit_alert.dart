import 'package:flutter/material.dart';

class EditAlert extends StatefulWidget {
  final String intialValue;
  final Function(String)? onChanged;
  final Function() onSaved;
  const EditAlert(
      {super.key,
      required this.intialValue,
      required this.onChanged,
      required this.onSaved});

  @override
  State<EditAlert> createState() => _EditAlertState();
}

class _EditAlertState extends State<EditAlert> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      iconPadding: EdgeInsets.zero,
      icon: Container(
        padding: const EdgeInsets.all(16.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(8.0), topLeft: Radius.circular(8.0)),
        ),
        child: Text(
          'Editar Texto',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineSmall!.merge(
                TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
        ),
      ),
      content: SingleChildScrollView(
        child: Form(key: _formKey, child: _editForm()),
      ),
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              widget.onSaved();
              Navigator.pop(context);
            }
          },
          style: ElevatedButton.styleFrom(
            elevation: 3.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.edit),
              SizedBox(width: 4.0),
              Text('Editar', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            elevation: 3.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: const Icon(Icons.keyboard_return),
        ),
      ],
    );
  }

  Widget _editForm() {
    return TextFormField(
      onChanged: widget.onChanged,
      initialValue: widget.intialValue,
      textInputAction: TextInputAction.done,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.onPrimary,
        hintText: 'Edite seu texto',
        hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.scrim),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
              width: .8, color: Theme.of(context).colorScheme.onPrimary),
        ),
        contentPadding: const EdgeInsets.all(16.0),
      ),
    );
  }
}
