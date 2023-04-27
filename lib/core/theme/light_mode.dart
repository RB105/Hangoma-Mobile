import 'package:flutter/material.dart';

class LightThemeMode {
  static ThemeData theme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true),
      textTheme: const TextTheme(
         displayLarge: TextStyle(color: Colors.black, fontSize: 40),
          displayMedium: TextStyle(color: Colors.black, fontSize: 20),
          displaySmall: TextStyle(color: Colors.black),
          bodyLarge: TextStyle(color: Colors.black, fontSize: 40),
          bodyMedium: TextStyle(color: Colors.black, fontSize: 20),
          bodySmall: TextStyle(color: Colors.black)
          )
          
          );
}
