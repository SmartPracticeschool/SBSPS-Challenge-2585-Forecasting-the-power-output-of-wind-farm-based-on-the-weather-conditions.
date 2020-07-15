import 'package:flutter/material.dart';

// Gradient color shade code
final Shader linearGradient = LinearGradient(
  colors: <Color>[Colors.cyan, Colors.cyan[100]],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
