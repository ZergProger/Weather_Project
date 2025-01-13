import 'package:flutter/material.dart';
import 'package:weather_project/res/texts.dart';
import 'package:weather_project/res/theme.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(AppTexts.textSettings),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
            ),
            color: Colors.white,
            iconSize: 30,
          ),
        ),
        body: Column(
          children: [],
        ),
      ),
    );
  }
}
