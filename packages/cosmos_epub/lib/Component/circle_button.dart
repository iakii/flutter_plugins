import 'package:flutter/material.dart';

import '../show_epub.dart';

// ignore: must_be_immutable
class CircleButton extends StatelessWidget {
  Color backColor, fontColor, accentColor;
  int id;

  CircleButton({super.key, required this.accentColor, required this.backColor, required this.fontColor, required this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(width: 2, color: staticThemeId == id ? accentColor : Colors.grey)),
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          color: backColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            "T",
            style: TextStyle(color: fontColor),
          ),
        ),
      ),
    );
  }
}
