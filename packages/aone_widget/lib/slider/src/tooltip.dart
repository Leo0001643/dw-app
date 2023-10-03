import 'package:flutter/material.dart';

import 'enums.dart';

class FlutterSliderTooltip {
  Widget Function(dynamic value)? custom;
  String Function(String value)? format;
  TextStyle? textStyle;
  FlutterSliderTooltipBox? boxStyle;
  Widget? leftPrefix;
  Widget? leftSuffix;
  Widget? rightPrefix;
  Widget? rightSuffix;
  bool? alwaysShowTooltip;
  bool? disabled;
  bool? disableAnimation;
  FlutterSliderTooltipDirection? direction;
  FlutterSliderTooltipPositionOffset? positionOffset;

  FlutterSliderTooltip({
    this.custom,
    this.format,
    this.textStyle,
    this.boxStyle,
    this.leftPrefix,
    this.leftSuffix,
    this.rightPrefix,
    this.rightSuffix,
    this.alwaysShowTooltip,
    this.disableAnimation,
    this.disabled,
    this.direction,
    this.positionOffset,
  });

  @override
  String toString() {
    return textStyle.toString() +
        '-' +
        boxStyle.toString() +
        '-' +
        leftPrefix.toString() +
        '-' +
        leftSuffix.toString() +
        '-' +
        rightPrefix.toString() +
        '-' +
        rightSuffix.toString() +
        '-' +
        alwaysShowTooltip.toString() +
        '-' +
        disabled.toString() +
        '-' +
        disableAnimation.toString() +
        '-' +
        direction.toString() +
        '-' +
        positionOffset.toString();
  }
}

class FlutterSliderTooltipPositionOffset {
  double? top;
  double? left;
  double? right;
  double? bottom;

  FlutterSliderTooltipPositionOffset(
      {this.top, this.left, this.right, this.bottom});

  @override
  String toString() {
    return top.toString() +
        '-' +
        left.toString() +
        '-' +
        bottom.toString() +
        '-' +
        right.toString();
  }
}

class FlutterSliderTooltipBox {
  final BoxDecoration? decoration;
  final BoxDecoration? foregroundDecoration;
  final Matrix4? transform;

  const FlutterSliderTooltipBox(
      {this.decoration, this.foregroundDecoration, this.transform});

  @override
  String toString() {
    return decoration.toString() +
        '-' +
        foregroundDecoration.toString() +
        '-' +
        transform.toString();
  }
}