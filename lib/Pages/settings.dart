import 'package:flutter/material.dart';
import 'package:weather_project/rec/theme.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Setting'),
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
