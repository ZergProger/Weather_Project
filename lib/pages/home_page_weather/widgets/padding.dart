import 'package:flutter/material.dart';
import 'package:weather_project/pages/setting_page/settings.dart';

class IconButtonCustom extends StatelessWidget {
  const IconButtonCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Settings(),
            )),
        icon: Icon(
          Icons.settings,
          color: Colors.blueGrey,
        ));
  }
}
