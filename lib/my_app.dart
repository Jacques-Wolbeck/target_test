import 'package:flutter/material.dart';
import 'package:target_test/routes.dart';
import 'package:target_test/views/splash_view.dart';
import 'package:target_test/views/widgets/customs/custom_color_sheme.dart';
import 'package:target_test/views/widgets/customs/custom_text_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Target Test',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme,
        textTheme: CustomTextTheme(),
      ),
      onGenerateRoute: (route) => onGenerateRoute(route),
      home: const SplashView(),
    );
  }
}
