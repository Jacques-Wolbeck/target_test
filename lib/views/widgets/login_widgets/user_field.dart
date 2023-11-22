import 'package:flutter/material.dart';

class UserField extends StatelessWidget {
  final Function(String?)? onSavedCallback;
  final FocusNode currentFocus;
  final FocusNode? nextFocus;

  const UserField(
      {super.key,
      required this.onSavedCallback,
      required this.currentFocus,
      this.nextFocus});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSavedCallback,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Por favor digite um usuário.';
        } else if (value.length > 20) {
          return 'O usuário precisa ser inferior a 20 caracteres';
        } else if (value.endsWith(' ')) {
          return 'Por favor remova o espaço no final.';
        }
        return null;
      },
      focusNode: currentFocus,
      textInputAction:
          nextFocus == null ? TextInputAction.done : TextInputAction.next,
      onFieldSubmitted: (term) {
        if (nextFocus != null) {
          currentFocus.unfocus();
          FocusScope.of(context).requestFocus(nextFocus);
        }
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.onPrimary,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
              width: .8, color: Theme.of(context).colorScheme.onPrimary),
        ),
        contentPadding: const EdgeInsets.all(16.0),
        prefixIcon: const Icon(Icons.person),
      ),
    );
  }
}
