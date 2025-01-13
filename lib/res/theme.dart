import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.lightBlue,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.lightBlueAccent,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.w600,
      ),
      centerTitle: true,
      elevation: 10,
    ),
  );

  static final ThemeData whiteTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.lightBlueAccent,
      centerTitle: true,
      elevation: 10,
    ),
  );
}
