import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/odds_content.dart';
import 'package:json_annotation/json_annotation.dart';


OddsContent $OddsContentFromJson(Map<String, dynamic> json) {
  final OddsContent oddsContent = OddsContent();
  final int? level = jsonConvert.convert<int>(json['level']);
  if (level != null) {
    oddsContent.level = level;
  }
  final String? createTime = jsonConvert.convert<String>(json['createTime']);
  if (createTime != null) {
    oddsContent.createTime = createTime;
  }
  final String? enabled = jsonConvert.convert<String>(json['enabled']);
  if (enabled != null) {
    oddsContent.enabled = enabled;
  }
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    oddsContent.id = id;
  }
  final String? jsonKey = jsonConvert.convert<String>(json['jsonKey']);
  if (jsonKey != null) {
    oddsContent.jsonKey = jsonKey;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    oddsContent.name = name;
  }
  final String? parentId = jsonConvert.convert<String>(json['parentId']);
  if (parentId != null) {
    oddsContent.parentId = parentId;
  }
  final String? play = jsonConvert.convert<String>(json['play']);
  if (play != null) {
    oddsContent.play = play;
  }
  final String? tableId = jsonConvert.convert<String>(json['tableId']);
  if (tableId != null) {
    oddsContent.tableId = tableId;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    oddsContent.type = type;
  }
  final String? updateTime = jsonConvert.convert<String>(json['updateTime']);
  if (updateTime != null) {
    oddsContent.updateTime = updateTime;
  }
  final bool? check = jsonConvert.convert<bool>(json['check']);
  if (check != null) {
    oddsContent.check = check;
  }
  final double? money = jsonConvert.convert<double>(json['money']);
  if (money != null) {
    oddsContent.money = money;
  }
  final String? play2 = jsonConvert.convert<String>(json['play2']);
  if (play2 != null) {
    oddsContent.play2 = play2;
  }
  final int? color = jsonConvert.convert<int>(json['color']);
  if (color != null) {
    oddsContent.color = color;
  }
  final int? titleColor = jsonConvert.convert<int>(json['titleColor']);
  if (titleColor != null) {
    oddsContent.titleColor = titleColor;
  }
  return oddsContent;
}

Map<String, dynamic> $OddsContentToJson(OddsContent entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['level'] = entity.level;
  data['createTime'] = entity.createTime;
  data['enabled'] = entity.enabled;
  data['id'] = entity.id;
  data['jsonKey'] = entity.jsonKey;
  data['name'] = entity.name;
  data['parentId'] = entity.parentId;
  data['play'] = entity.play;
  data['tableId'] = entity.tableId;
  data['type'] = entity.type;
  data['updateTime'] = entity.updateTime;
  data['check'] = entity.check;
  data['money'] = entity.money;
  data['play2'] = entity.play2;
  data['color'] = entity.color;
  data['titleColor'] = entity.titleColor;
  return data;
}

extension OddsContentExtension on OddsContent {
  OddsContent copyWith({
    int? level,
    String? createTime,
    String? enabled,
    String? id,
    String? jsonKey,
    String? name,
    String? parentId,
    String? play,
    String? tableId,
    String? type,
    String? updateTime,
    bool? check,
    double? money,
    String? play2,
    int? color,
    int? titleColor,
  }) {
    return OddsContent()
      ..level = level ?? this.level
      ..createTime = createTime ?? this.createTime
      ..enabled = enabled ?? this.enabled
      ..id = id ?? this.id
      ..jsonKey = jsonKey ?? this.jsonKey
      ..name = name ?? this.name
      ..parentId = parentId ?? this.parentId
      ..play = play ?? this.play
      ..tableId = tableId ?? this.tableId
      ..type = type ?? this.type
      ..updateTime = updateTime ?? this.updateTime
      ..check = check ?? this.check
      ..money = money ?? this.money
      ..play2 = play2 ?? this.play2
      ..color = color ?? this.color
      ..titleColor = titleColor ?? this.titleColor;
  }
}