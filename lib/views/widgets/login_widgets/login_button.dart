import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final Map<String, String> loginInfo;

  const LoginButton({
    super.key,
    required this.formKey,
    required this.loginInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: ElevatedButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            SharedPreferences.getInstance().then((prefs) => {
                  prefs.setString('user', loginInfo['user']!),
                  Navigator.pushReplacementNamed(context, '/home_view')
                });
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
          minimumSize: Size(MediaQuery.of(context).size.width * .35, 40.0),
        ),
        child: Text(
          "Entrar",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
    );
  }
}
