import 'package:flutter/material.dart';
import 'package:target_test/views/home_view.dart';
import 'package:target_test/views/login_view.dart';
import 'package:target_test/views/widgets/customs/custom_page_route.dart';

//Aqui são definidas todas a rotas de navegação do App
Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/login_view':
      return CustomPageRoute(child: const LoginView());
    case '/home_view':
    default:
      return CustomPageRoute(child: const HomeView());
  }
}
