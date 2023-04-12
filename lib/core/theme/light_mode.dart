import 'package:flutter/material.dart';

class LightThemeMode {
  static ThemeData theme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          titleTextStyle: TextStyle(color: Colors.blue.shade600, fontSize: 20),
          iconTheme: IconThemeData(color: Colors.blue.shade600),
          centerTitle: true),
      textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black, fontSize: 40),
          bodyMedium: TextStyle(color: Colors.black, fontSize: 20),
          bodySmall: TextStyle(color: Colors.black)));
}
