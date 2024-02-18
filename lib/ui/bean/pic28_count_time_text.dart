
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:leisure_games/generated/json/pic28_count_time_text.g.dart';

@JsonSerializable()
class TimeDataContent {
  Map<String, TimeDataItem?>? all; // 初始化为一个空映射
  int? refreshTime;
  int? timestamp;

  TimeDataContent();

  factory TimeDataContent.fromJson(Map<String, dynamic> json) => $TimeDataContentFromJson(json);

  Map<String, dynamic> toJson() => $TimeDataContentToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
  //
  // TimeDataContent.fromJson(Map<String, dynamic> json) {
  //   json['all']?.forEach((key, value) {
  //     all[key] = TimeDataItem.fromJson(value);
  //   });
  //
  //   refreshTime = json['refreshTime'];
  //   timestamp = json['timestamp'];
  // }
}

@JsonSerializable()
class TimeDataItem {
  List<TimeDataItemData>? data;
  int? refreshTime;

  TimeDataItem();

  factory TimeDataItem.fromJson(Map<String, dynamic> json) => $TimeDataItemFromJson(json);

  Map<String, dynamic> toJson() => $TimeDataItemToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
  // TimeDataItem.fromJson(Map<String, dynamic> json) {
  //   data = [];
  //   json['data']?.forEach((item) {
  //     data?.add(TimeDataItemData.fromJson(item));
  //   });
  //
  //   refreshTime = json['refreshTime'];
  // }
}

@JsonSerializable()
class TimeDataItemData {
  int? closeTime;
  int? term;
  int? openTime;

  TimeDataItemData();

  factory TimeDataItemData.fromJson(Map<String, dynamic> json) => $TimeDataItemDataFromJson(json);

  Map<String, dynamic> toJson() => $TimeDataItemDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
  // TimeDataItemData.fromJson(Map<String, dynamic> json) {
  //   closeTime = json['closeTime'];
  //   term = json['term'];
  //   openTime = json['openTime'];
  // }
}
