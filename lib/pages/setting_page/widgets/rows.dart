import 'package:flutter/material.dart';

class RowsSetting extends StatefulWidget {
  RowsSetting({super.key, required this.nameSetting});
  final String nameSetting;

  @override
  State<RowsSetting> createState() => _RowsSettingState();
}

class _RowsSettingState extends State<RowsSetting> {
  bool isSwitcher = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 5, right: 5),
          child: Text(widget.nameSetting),
        ),
        Spacer(
          flex: 1,
        ),
        Switch(
          value: isSwitcher,
          onChanged: (value) {
            setState(() {
              isSwitcher = !isSwitcher;
            });
          },
        ),
      ],
    );
  }
}
