import 'package:flutter/material.dart';
import 'package:target_test/shared/utilis/url_lauchers.dart';
import 'package:target_test/views/widgets/login_widgets/user_field.dart';
import 'package:target_test/views/widgets/login_widgets/login_button.dart';
import 'package:target_test/views/widgets/login_widgets/password_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formkey = GlobalKey<FormState>();
  final _loginInfo = <String, String>{};
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();

  @override
  void dispose() {
    emailFocus.dispose();
    passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, .6),
          colors: <Color>[
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _body(),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextButton(
            onPressed: () async => openUrl(),
            child: Text(
              'Politíca de Privacidade',
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
        ),
      ),
    );
  }

  Widget _body() {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Usuário',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                    const SizedBox(height: 8.0),
                    UserField(
                      onSavedCallback: (value) => _loginInfo['user'] = value!,
                      currentFocus: emailFocus,
                      nextFocus: passwordFocus,
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      'Senha',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                    const SizedBox(height: 8.0),
                    PasswordField(
                      onSavedCallback: (value) =>
                          _loginInfo['password'] = value!,
                      currentFocus: passwordFocus,
                    ),
                  ],
                ),
              ),
              LoginButton(formKey: _formkey, loginInfo: _loginInfo),
            ],
          ),
        ),
      ),
    );
  }
}
