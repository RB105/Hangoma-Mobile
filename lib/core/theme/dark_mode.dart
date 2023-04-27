import 'package:flutter/material.dart';

class DarkThemeMode {
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: Colors.grey[850],
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(color: Colors.white, fontSize:20),
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true),
      textTheme: const TextTheme(
        displayLarge: TextStyle(color: Colors.black, fontSize: 40),
        displayMedium: TextStyle(color: Colors.black, fontSize: 20),
        displaySmall: TextStyle(color: Colors.black,),
          bodyLarge: TextStyle(color: Colors.white, fontSize: 40),
          bodyMedium: TextStyle(color: Colors.white, fontSize: 20),
          bodySmall: TextStyle(color: Colors.white)),
      drawerTheme: DrawerThemeData(
        backgroundColor: Colors.grey.shade700,
      )
          );
}
