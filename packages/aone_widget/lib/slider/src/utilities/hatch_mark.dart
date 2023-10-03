import 'package:flutter/material.dart';
import '../utilities/sized_box.dart';

import '../enums.dart';

class FlutterSliderHatchMark {
  bool disabled;
  double density;
  double? linesDistanceFromTrackBar;
  double? labelsDistanceFromTrackBar;
  List<FlutterSliderHatchMarkLabel>? labels;
  FlutterSliderSizedBox? smallLine;
  FlutterSliderSizedBox? bigLine;
  FlutterSliderSizedBox? labelBox;
  FlutterSliderHatchMarkAlignment linesAlignment;
  bool? displayLines;

  FlutterSliderHatchMark(
      {this.disabled = false,
        this.density = 1,
        this.linesDistanceFromTrackBar,
        this.labelsDistanceFromTrackBar,
        this.labels,
        this.smallLine,
        this.bigLine,
        this.linesAlignment = FlutterSliderHatchMarkAlignment.right,
        this.labelBox,
        this.displayLines})
      : assert(density > 0 && density <= 2);

  @override
  String toString() {
    return disabled.toString() +
        '-' +
        density.toString() +
        '-' +
        linesDistanceFromTrackBar.toString() +
        '-' +
        labelsDistanceFromTrackBar.toString() +
        '-' +
        labels.toString() +
        '-' +
        smallLine.toString() +
        '-' +
        bigLine.toString() +
        '-' +
        labelBox.toString() +
        '-' +
        linesAlignment.toString() +
        '-' +
        displayLines.toString();
  }
}

class FlutterSliderHatchMarkLabel {
  final double? percent;
  final Widget? label;

  FlutterSliderHatchMarkLabel({
    this.percent,
    this.label,
  }) : assert((label == null && percent == null) ||
      (label != null && percent != null && percent >= 0));

  @override
  String toString() {
    return percent.toString() + '-' + label.toString();
  }
}