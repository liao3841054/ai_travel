import 'package:flutter/material.dart';

var pinkGradient =
    LinearGradient(colors: [Colors.pink, Colors.purple.shade700]);
var yellowGradient =
    LinearGradient(colors: [Colors.orangeAccent.shade700, Colors.yellow]);
var charmGradient =
    LinearGradient(colors: [Colors.purple.shade400, Colors.purple.shade900]);
var profileGradient = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [
      Colors.purple.shade700,
      Colors.pink,
    ]);

class LinearGradientMask extends StatelessWidget {
  LinearGradientMask({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        // center: Alignment.center,
        // radius: 0.5,
        colors: [Colors.pink, Colors.purple],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}
