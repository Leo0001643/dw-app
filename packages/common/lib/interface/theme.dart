

import 'package:flutter/material.dart';

/// Please implements this for build site theme class
abstract class ColorSchemaInterface {

  final Color primaryColor;
  final Color backgroundColor;
  final Color fontColor;
  final Color secondary;
  final Color tertiary;
  final Color neutral;
  ColorSchemaInterface({
    required this.primaryColor,
    required this.backgroundColor,
    required this.fontColor,
    required this.secondary,
    required this.tertiary,
    required this.neutral,
  });

}