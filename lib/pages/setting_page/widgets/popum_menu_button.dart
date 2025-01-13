import 'package:flutter/material.dart';

class SettingPopupMenu extends StatefulWidget {
  const SettingPopupMenu({super.key});

  @override
  State<SettingPopupMenu> createState() => _SettingPopumMenuState();
}

class _SettingPopumMenuState extends State<SettingPopupMenu> {
  bool isRussian = false;
  bool isEnglish = false;
  bool isUkrainian = false;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      onChanged: (String? value) {
        setState(() {
          if (value == 'Russian') {
            isRussian = true;
            isEnglish = false;
            isUkrainian = false;
          } else if (value == 'English') {
            isRussian = false;
            isEnglish = true;
            isUkrainian = false;
          } else if (value == 'Ukrainian') {
            isRussian = false;
            isEnglish = false;
            isUkrainian = true;
          }
        });
      },
      items: [
        DropdownMenuItem(child: Text('Russian'), value: 'Russian'),
        DropdownMenuItem(child: Text('English'), value: 'English'),
        DropdownMenuItem(child: Text('Ukrainian'), value: 'Ukrainian'),
      ],
    );
  }
}
