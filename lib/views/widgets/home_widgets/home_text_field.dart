import 'package:flutter/material.dart';

class HomeTextField extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final void Function() onFieldSubmitted;
  final Function(String)? onChanged;
  final FocusNode currentFocus;

  const HomeTextField(
      {super.key,
      required this.formKey,
      required this.onFieldSubmitted,
      required this.onChanged,
      required this.currentFocus});

  @override
  State<HomeTextField> createState() => _HomeTextFieldState();
}

class _HomeTextFieldState extends State<HomeTextField> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      onChanged: widget.onChanged,
      onFieldSubmitted: (_) => {
        if (widget.formKey.currentState!.validate())
          {widget.onFieldSubmitted(), _controller.clear()}
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Por favor digite um texto.';
        }
        return null;
      },
      autofocus: true,
      focusNode: widget.currentFocus,
      textInputAction: TextInputAction.done,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.onPrimary,
        hintText: 'Digite seu texto',
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
