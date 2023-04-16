import 'package:flutter/material.dart';

class ShadowWhiteContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? circular;

  const ShadowWhiteContainer(
      {super.key,
      required this.child,
      this.width,
      this.height,
      this.color,
      this.circular,
      this.padding,
      this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: color ?? Colors.white70,
        borderRadius: BorderRadius.circular(circular ?? 30),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 0),
            blurRadius: 1,
          ),
        ],
      ),
      child: child,
    );
  }
}
