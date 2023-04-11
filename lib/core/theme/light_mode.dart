import 'package:flutter/material.dart';

class LightThemeMode {
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 16),
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true),
      textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black, fontSize: 40),
          bodyMedium: TextStyle(color: Colors.black, fontSize: 20),
          bodySmall: TextStyle(color: Colors.black)));
}
