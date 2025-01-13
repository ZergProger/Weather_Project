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
}