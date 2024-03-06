import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/app/socket/ws_to_bet_entity.dart';
import 'package:common_utils/common_utils.dart';

import 'package:leisure_games/app/app_data.dart';

import 'package:leisure_games/app/global.dart';

import 'package:leisure_games/app/socket/socket_utils.dart';

import 'package:leisure_games/app/socket/ws_bet_entity.dart';


WsToBetEntity $WsToBetEntityFromJson(Map<String, dynamic> json) {
  final WsToBetEntity wsToBetEntity = WsToBetEntity();
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    wsToBetEntity.type = type;
  }
  final String? clientName = jsonConvert.convert<String>(json['client_name']);
  if (clientName != null) {
    wsToBetEntity.clientName = clientName;
  }
  final String? roomId = jsonConvert.convert<String>(json['room_id']);
  if (roomId != null) {
    wsToBetEntity.roomId = roomId;
  }
  final String? oid = jsonConvert.convert<String>(json['oid']);
  if (oid != null) {
    wsToBetEntity.oid = oid;
  }
  final String? tableId = jsonConvert.convert<String>(json['table_id']);
  if (tableId != null) {
    wsToBetEntity.tableId = tableId;
  }
  final String? siteId = jsonConvert.convert<String>(json['site_id']);
  if (siteId != null) {
    wsToBetEntity.siteId = siteId;
  }
  final String? gameType = jsonConvert.convert<String>(json['game_type']);
  if (gameType != null) {
    wsToBetEntity.gameType = gameType;
  }
  final String? nowTerm = jsonConvert.convert<String>(json['now_term']);
  if (nowTerm != null) {
    wsToBetEntity.nowTerm = nowTerm;
  }
  final String? moneyType = jsonConvert.convert<String>(json['moneyType']);
  if (moneyType != null) {
    wsToBetEntity.moneyType = moneyType;
  }
  final List<WsToBetContent>? content = (json['content'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<WsToBetContent>(e) as WsToBetContent)
      .toList();
  if (content != null) {
    wsToBetEntity.content = content;
  }
  return wsToBetEntity;
}

Map<String, dynamic> $WsToBetEntityToJson(WsToBetEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['type'] = entity.type;
  data['client_name'] = entity.clientName;
  data['room_id'] = entity.roomId;
  data['oid'] = entity.oid;
  data['table_id'] = entity.tableId;
  data['site_id'] = entity.siteId;
  data['game_type'] = entity.gameType;
  data['now_term'] = entity.nowTerm;
  data['moneyType'] = entity.moneyType;
  data['content'] = entity.content?.map((v) => v.toJson()).toList();
  return data;
}

extension WsToBetEntityExtension on WsToBetEntity {
  WsToBetEntity copyWith({
    String? type,
    String? clientName,
    String? roomId,
    String? oid,
    String? tableId,
    String? siteId,
    String? gameType,
    String? nowTerm,
    String? moneyType,
    List<WsToBetContent>? content,
  }) {
    return WsToBetEntity()
      ..type = type ?? this.type
      ..clientName = clientName ?? this.clientName
      ..roomId = roomId ?? this.roomId
      ..oid = oid ?? this.oid
      ..tableId = tableId ?? this.tableId
      ..siteId = siteId ?? this.siteId
      ..gameType = gameType ?? this.gameType
      ..nowTerm = nowTerm ?? this.nowTerm
      ..moneyType = moneyType ?? this.moneyType
      ..content = content ?? this.content;
  }
}

WsToBetContent $WsToBetContentFromJson(Map<String, dynamic> json) {
  final WsToBetContent wsToBetContent = WsToBetContent();
  final String? money = jsonConvert.convert<String>(json['money']);
  if (money != null) {
    wsToBetContent.money = money;
  }
  final String? num = jsonConvert.convert<String>(json['num']);
  if (num != null) {
    wsToBetContent.num = num;
  }
  final String? odds = jsonConvert.convert<String>(json['odds']);
  if (odds != null) {
    wsToBetContent.odds = odds;
  }
  final String? odds1314 = jsonConvert.convert<String>(json['odds_1314']);
  if (odds1314 != null) {
    wsToBetContent.odds1314 = odds1314;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    wsToBetContent.type = type;
  }
  return wsToBetContent;
}

Map<String, dynamic> $WsToBetContentToJson(WsToBetContent entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['money'] = entity.money;
  data['num'] = entity.num;
  data['odds'] = entity.odds;
  data['odds_1314'] = entity.odds1314;
  data['type'] = entity.type;
  return data;
}

extension WsToBetContentExtension on WsToBetContent {
  WsToBetContent copyWith({
    String? money,
    String? num,
    String? odds,
    String? odds1314,
    String? type,
  }) {
    return WsToBetContent()
      ..money = money ?? this.money
      ..num = num ?? this.num
      ..odds = odds ?? this.odds
      ..odds1314 = odds1314 ?? this.odds1314
      ..type = type ?? this.type;
  }
}