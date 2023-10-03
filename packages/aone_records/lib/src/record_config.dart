import 'package:flutter/material.dart';

RecordImageConfig? get recordImageConfig =>
    RecordConfig.recordBaseConfig?.imageConfig;
RecordColorConfig? get recordColorConfig =>
    RecordConfig.recordBaseConfig?.colorConfig;
RecordWidgetConfig? get recordWidgetConfig =>
    RecordConfig.recordBaseConfig?.widgetConfig;
RecordSizeConfig? get recordSizeConfig =>
    RecordConfig.recordBaseConfig?.sizeConfig;

class RecordConfig {
  static RecordBaseConfig? recordBaseConfig;
}

abstract class RecordBaseConfig {
  final RecordImageConfig? imageConfig;
  final RecordColorConfig? colorConfig;
  final RecordWidgetConfig? widgetConfig;
  final RecordSizeConfig? sizeConfig;

  RecordBaseConfig(
      {required this.imageConfig,
      this.colorConfig,
      this.widgetConfig,
      this.sizeConfig});

  setRecordColorConfig() {}

  setRecordImageConfig() {}

  setRecordWidgetConfig() {}

  setRecordSizeConfig() {}
}

class RecordColorConfig {
  final Color? pageBg;
  RecordColorConfig({this.pageBg});
}

class RecordImageConfig {
  final String? arrowImage;
  RecordImageConfig({this.arrowImage});
}

class RecordWidgetConfig {
  final Widget? appbar;
  final Widget? noDataView;
  RecordWidgetConfig({this.appbar, this.noDataView});
}

class RecordSizeConfig {
  final double? padding;
  RecordSizeConfig({this.padding});
}
