import 'package:flutter/material.dart';
import 'package:target_test/views/widgets/app_progress_indicator.dart';
import 'package:target_test/views/widgets/app_title.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2))
        .then((_) => Navigator.pushReplacementNamed(context, '/login_view'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppTitle(),
            SizedBox(width: 16.0),
            AppProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
