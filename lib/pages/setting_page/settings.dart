import 'package:flutter/material.dart';
import 'package:weather_project/pages/setting_page/widgets/rows.dart';
import 'package:weather_project/res/styles.dart';
import 'package:weather_project/res/texts.dart';
import 'package:weather_project/res/theme.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.whiteTheme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(AppTexts.textSettings, style: AppStyles.appBar),
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
          children: [
            RowsSetting(
              nameSetting: 'Notification',
            ),
          ],
        ),
      ),
    );
  }
}
