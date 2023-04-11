import 'package:flutter/material.dart';

class DarkThemeMode {
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: Colors.grey[850],
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 16),
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true),
      textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white, fontSize: 40),
          bodyMedium: TextStyle(color: Colors.white, fontSize: 20),
          bodySmall: TextStyle(color: Colors.white)));
}
