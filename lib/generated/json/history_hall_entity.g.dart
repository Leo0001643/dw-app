import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/history_hall_entity.dart';

HistoryHall $HistoryHallFromJson(Map<String, dynamic> json) {
  final HistoryHall historyHall = HistoryHall();
  final List<String>? draw = (json['draw'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (draw != null) {
    historyHall.draw = draw;
  }
  final int? drawTime = jsonConvert.convert<int>(json['drawTime']);
  if (drawTime != null) {
    historyHall.drawTime = drawTime;
  }
  final int? lid = jsonConvert.convert<int>(json['lid']);
  if (lid != null) {
    historyHall.lid = lid;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    historyHall.name = name;
  }
  final String? sort = jsonConvert.convert<String>(json['sort']);
  if (sort != null) {
    historyHall.sort = sort;
  }
  final String? imgUrl = jsonConvert.convert<String>(json['imgUrl']);
  if (imgUrl != null) {
    historyHall.imgUrl = imgUrl;
  }
  return historyHall;
}

Map<String, dynamic> $HistoryHallToJson(HistoryHall entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['draw'] = entity.draw;
  data['drawTime'] = entity.drawTime;
  data['lid'] = entity.lid;
  data['name'] = entity.name;
  data['sort'] = entity.sort;
  data['imgUrl'] = entity.imgUrl;
  return data;
}

extension HistoryHallExtension on HistoryHall {
  HistoryHall copyWith({
    List<String>? draw,
    int? drawTime,
    int? lid,
    String? name,
    String? sort,
    String? imgUrl,
  }) {
    return HistoryHall()
      ..draw = draw ?? this.draw
      ..drawTime = drawTime ?? this.drawTime
      ..lid = lid ?? this.lid
      ..name = name ?? this.name
      ..sort = sort ?? this.sort
      ..imgUrl = imgUrl ?? this.imgUrl;
  }
}