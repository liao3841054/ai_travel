import 'package:flutter/material.dart';

class SQText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextStyle? style;
  final double? lineHeight;
  final bool? selectable;

  const SQText(this.text,
      {super.key,
      this.fontSize = 12,
      this.color = Colors.black,
      this.fontWeight,
      this.maxLines,
      this.lineHeight,
      this.textAlign = TextAlign.left,
      this.selectable,
      this.style});

  @override
  Widget build(BuildContext context) {
    if (selectable == true) {
      return SelectableText(
        text,
        textAlign: textAlign,
        maxLines: maxLines,
        style: style ??
            TextStyle(
                decoration: TextDecoration.none,
                fontWeight: fontWeight ?? FontWeight.normal,
                fontSize: fontSize,
                height: lineHeight,
                overflow: TextOverflow.ellipsis,
                color: color ?? Theme.of(context).primaryColor),
      );
    }
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      style: style ??
          TextStyle(
              decoration: TextDecoration.none,
              fontWeight: fontWeight ?? FontWeight.normal,
              fontSize: fontSize,
              height: lineHeight,
              overflow: TextOverflow.ellipsis,
              color: color),
    );
  }
}
