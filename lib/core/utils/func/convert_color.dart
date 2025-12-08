import 'package:flutter/material.dart';

extension HexColorExtension on String {
  Color toColor() {
    final hex = replaceFirst('#', '');
    return Color(int.parse('FF$hex', radix: 16));
  }
}
