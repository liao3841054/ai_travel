// 写一个icon text 组建

import 'package:flutter/material.dart';

class IconTextWidget extends StatelessWidget {
  final String text;
  final double? iconSize;
  final double? fontSize;
  final Color? textColor;
  final IconData? icon;

  const IconTextWidget(
      {super.key,
      required this.text,
      this.iconSize,
      this.fontSize,
      this.textColor,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(
        icon,
        size: iconSize,
      ),
      const SizedBox(
        width: 3,
      ),
      Text(
        text,
        style: TextStyle(color: textColor, fontSize: fontSize),
      )
    ]);
  }
}
