import 'package:flutter/material.dart';
import 'package:target_test/shared/utilis/validators.dart';

class PasswordField extends StatefulWidget {
  final Function(String?)? onSavedCallback;
  final FocusNode currentFocus;
  final FocusNode? nextFocus;

  const PasswordField(
      {super.key,
      required this.onSavedCallback,
      required this.currentFocus,
      this.nextFocus});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool visibility = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: widget.onSavedCallback,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Por favor digite uma senha.';
        } else if (value.length < 2) {
          return 'A senha precisa conter pelo menoes 2 caracteres.';
        } else if (value.length > 20) {
          return 'A senha precisa ser inferior a 20 caracteres';
        } else if (!passwordValidator(value)) {
          return 'A senha deve conter apenas letras e números.';
        }
        return null;
      },
      focusNode: widget.currentFocus,
      textInputAction: widget.nextFocus == null
          ? TextInputAction.done
          : TextInputAction.next,
      onFieldSubmitted: (term) {
        if (widget.nextFocus != null) {
          widget.currentFocus.unfocus();
          FocusScope.of(context).requestFocus(widget.nextFocus);
        }
      },
      keyboardType: TextInputType.visiblePassword,
      obscureText: !visibility,
      decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).colorScheme.onPrimary,
          errorMaxLines: 2,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
                width: .8, color: Theme.of(context).colorScheme.onPrimary),
          ),
          suffixIcon: IconButton(
            icon: visibility
                ? const Icon(
                    Icons.visibility,
                  )
                : const Icon(
                    Icons.visibility_off,
                  ),
            onPressed: () {
              setState(
                () {
                  visibility = !visibility;
                },
              );
            },
          ),
          prefixIcon: const Icon(Icons.lock),
          contentPadding: const EdgeInsets.all(16.0)),
    );
  }
}
