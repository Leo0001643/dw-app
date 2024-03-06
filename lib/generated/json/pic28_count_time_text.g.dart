import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/pic28_count_time_text.dart';
import 'package:json_annotation/json_annotation.dart';


TimeDataContent $TimeDataContentFromJson(Map<String, dynamic> json) {
  final TimeDataContent timeDataContent = TimeDataContent();
  final Map<String, TimeDataItem?>? all =
  (json['all'] as Map<String, dynamic>?)?.map(
          (k, e) =>
          MapEntry(k, e == null ? null : jsonConvert.convert<TimeDataItem>(e)));
  if (all != null) {
    timeDataContent.all = all;
  }
  final int? refreshTime = jsonConvert.convert<int>(json['refreshTime']);
  if (refreshTime != null) {
    timeDataContent.refreshTime = refreshTime;
  }
  final int? timestamp = jsonConvert.convert<int>(json['timestamp']);
  if (timestamp != null) {
    timeDataContent.timestamp = timestamp;
  }
  return timeDataContent;
}

Map<String, dynamic> $TimeDataContentToJson(TimeDataContent entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['all'] = entity.all;
  data['refreshTime'] = entity.refreshTime;
  data['timestamp'] = entity.timestamp;
  return data;
}

extension TimeDataContentExtension on TimeDataContent {
  TimeDataContent copyWith({
    Map<String, TimeDataItem?>? all,
    int? refreshTime,
    int? timestamp,
  }) {
    return TimeDataContent()
      ..all = all ?? this.all
      ..refreshTime = refreshTime ?? this.refreshTime
      ..timestamp = timestamp ?? this.timestamp;
  }
}

TimeDataItem $TimeDataItemFromJson(Map<String, dynamic> json) {
  final TimeDataItem timeDataItem = TimeDataItem();
  final List<TimeDataItemData>? data = (json['data'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<TimeDataItemData>(e) as TimeDataItemData)
      .toList();
  if (data != null) {
    timeDataItem.data = data;
  }
  final int? refreshTime = jsonConvert.convert<int>(json['refreshTime']);
  if (refreshTime != null) {
    timeDataItem.refreshTime = refreshTime;
  }
  return timeDataItem;
}

Map<String, dynamic> $TimeDataItemToJson(TimeDataItem entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  data['refreshTime'] = entity.refreshTime;
  return data;
}

extension TimeDataItemExtension on TimeDataItem {
  TimeDataItem copyWith({
    List<TimeDataItemData>? data,
    int? refreshTime,
  }) {
    return TimeDataItem()
      ..data = data ?? this.data
      ..refreshTime = refreshTime ?? this.refreshTime;
  }
}

TimeDataItemData $TimeDataItemDataFromJson(Map<String, dynamic> json) {
  final TimeDataItemData timeDataItemData = TimeDataItemData();
  final int? closeTime = jsonConvert.convert<int>(json['closeTime']);
  if (closeTime != null) {
    timeDataItemData.closeTime = closeTime;
  }
  final int? term = jsonConvert.convert<int>(json['term']);
  if (term != null) {
    timeDataItemData.term = term;
  }
  final int? openTime = jsonConvert.convert<int>(json['openTime']);
  if (openTime != null) {
    timeDataItemData.openTime = openTime;
  }
  return timeDataItemData;
}

Map<String, dynamic> $TimeDataItemDataToJson(TimeDataItemData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['closeTime'] = entity.closeTime;
  data['term'] = entity.term;
  data['openTime'] = entity.openTime;
  return data;
}

extension TimeDataItemDataExtension on TimeDataItemData {
  TimeDataItemData copyWith({
    int? closeTime,
    int? term,
    int? openTime,
  }) {
    return TimeDataItemData()
      ..closeTime = closeTime ?? this.closeTime
      ..term = term ?? this.term
      ..openTime = openTime ?? this.openTime;
  }
}