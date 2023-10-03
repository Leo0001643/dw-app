import 'package:flutter/material.dart';


/// 字符串转 Color 类型
/// Color color = stringToColor("40c254");
Color stringToColor(String source, [double opacity=1.0]) {
  return Color(int.parse(source, radix: 16) | 0xFF000000).withOpacity(opacity);
}

/// 字符串转 MaterialColor
/// MaterialColor materialColor = stringToMaterialColor("40c254");
MaterialColor stringToMaterialColor(String source) {
  Color color = stringToColor(source);

  List<double> strengths = <double>[.05];
  Map<int, Color> swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}