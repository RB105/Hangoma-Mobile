import 'package:flutter/material.dart';
import 'package:hangomamobile/view/auth/login_page.dart';
import 'package:hangomamobile/view/auth/register_page.dart';
import 'package:hangomamobile/view/pages/home_page.dart';
import 'package:hangomamobile/view/pages/settings_page.dart';
import 'package:hangomamobile/view/screens/splash_screen.dart';

class RouteGenerator {

  static final RouteGenerator _generator = RouteGenerator._init();

  static RouteGenerator get route => _generator;

  RouteGenerator._init();

  Route? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _navigate(const HomePage());
      case 'splash':
        return _navigate(const SplashScreen());
      case 'register':
        return _navigate(const RegisterPage());
      case 'settings':
        return _navigate(const SettingPage());
      case 'login':
        return _navigate(const LoginPage());
    }
    return null;
  }

  MaterialPageRoute<dynamic> _navigate(Widget page) {
    return MaterialPageRoute(
      builder: (context) => page,
    );
  }
}
