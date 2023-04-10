import 'package:flutter/material.dart';
import 'package:hangomamobile/view/pages/home_page.dart';

class RouteGenerator {

  static final RouteGenerator _generator = RouteGenerator._init();

  static RouteGenerator get route => _generator;

  RouteGenerator._init();

  Route? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _navigate(const HomePage());
    }
    return null;
  }

  MaterialPageRoute<dynamic> _navigate(Widget page) {
    return MaterialPageRoute(
      builder: (context) => page,
    );
  }
}
