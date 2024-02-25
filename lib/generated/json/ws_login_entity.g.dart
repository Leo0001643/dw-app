import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/app/socket/ws_login_entity.dart';
import 'package:leisure_games/app/app_data.dart';

import 'package:leisure_games/app/utils/data_utils.dart';


WsLoginEntity $WsLoginEntityFromJson(Map<String, dynamic> json) {
  final WsLoginEntity wsLoginEntity = WsLoginEntity();
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    wsLoginEntity.type = type;
  }
  final String? siteId = jsonConvert.convert<String>(json['site_id']);
  if (siteId != null) {
    wsLoginEntity.siteId = siteId;
  }
  final String? clientName = jsonConvert.convert<String>(json['client_name']);
  if (clientName != null) {
    wsLoginEntity.clientName = clientName;
  }
  final String? oid = jsonConvert.convert<String>(json['oid']);
  if (oid != null) {
    wsLoginEntity.oid = oid;
  }
  final String? gameType = jsonConvert.convert<String>(json['game_type']);
  if (gameType != null) {
    wsLoginEntity.gameType = gameType;
  }
  final String? roomId = jsonConvert.convert<String>(json['room_id']);
  if (roomId != null) {
    wsLoginEntity.roomId = roomId;
  }
  final String? tableId = jsonConvert.convert<String>(json['table_id']);
  if (tableId != null) {
    wsLoginEntity.tableId = tableId;
  }
  return wsLoginEntity;
}

Map<String, dynamic> $WsLoginEntityToJson(WsLoginEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['type'] = entity.type;
  data['site_id'] = entity.siteId;
  data['client_name'] = entity.clientName;
  data['oid'] = entity.oid;
  data['game_type'] = entity.gameType;
  data['room_id'] = entity.roomId;
  data['table_id'] = entity.tableId;
  return data;
}

extension WsLoginEntityExtension on WsLoginEntity {
  WsLoginEntity copyWith({
    String? type,
    String? siteId,
    String? clientName,
    String? oid,
    String? gameType,
    String? roomId,
    String? tableId,
  }) {
    return WsLoginEntity()
      ..type = type ?? this.type
      ..siteId = siteId ?? this.siteId
      ..clientName = clientName ?? this.clientName
      ..oid = oid ?? this.oid
      ..gameType = gameType ?? this.gameType
      ..roomId = roomId ?? this.roomId
      ..tableId = tableId ?? this.tableId;
  }
}