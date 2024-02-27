import 'package:leisure_games/app/socket/ws_message_send_entity.dart';
import 'package:leisure_games/generated/json/base/json_convert_content.dart';


WsMessageSendEntity $WsMessageSendEntityFromJson(Map<String, dynamic> json) {
  final WsMessageSendEntity wsMessageSendEntity = WsMessageSendEntity();
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    wsMessageSendEntity.type = type;
  }
  final String? clientName = jsonConvert.convert<String>(json['client_name']);
  if (clientName != null) {
    wsMessageSendEntity.clientName = clientName;
  }
  final String? roomId = jsonConvert.convert<String>(json['room_id']);
  if (roomId != null) {
    wsMessageSendEntity.roomId = roomId;
  }
  final String? oid = jsonConvert.convert<String>(json['oid']);
  if (oid != null) {
    wsMessageSendEntity.oid = oid;
  }
  final String? tableId = jsonConvert.convert<String>(json['table_id']);
  if (tableId != null) {
    wsMessageSendEntity.tableId = tableId;
  }
  final String? siteId = jsonConvert.convert<String>(json['site_id']);
  if (siteId != null) {
    wsMessageSendEntity.siteId = siteId;
  }
  final String? gameType = jsonConvert.convert<String>(json['game_type']);
  if (gameType != null) {
    wsMessageSendEntity.gameType = gameType;
  }
  final List<String>? msg = (json['msg'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (msg != null) {
    wsMessageSendEntity.msg = msg;
  }
  return wsMessageSendEntity;
}

Map<String, dynamic> $WsMessageSendEntityToJson(WsMessageSendEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['type'] = entity.type;
  data['client_name'] = entity.clientName;
  data['room_id'] = entity.roomId;
  data['oid'] = entity.oid;
  data['table_id'] = entity.tableId;
  data['site_id'] = entity.siteId;
  data['game_type'] = entity.gameType;
  data['msg'] = entity.msg;
  return data;
}

extension WsMessageSendEntityExtension on WsMessageSendEntity {
  WsMessageSendEntity copyWith({
    String? type,
    String? clientName,
    String? roomId,
    String? oid,
    String? tableId,
    String? siteId,
    String? gameType,
    List<String>? msg,
  }) {
    return WsMessageSendEntity()
      ..type = type ?? this.type
      ..clientName = clientName ?? this.clientName
      ..roomId = roomId ?? this.roomId
      ..oid = oid ?? this.oid
      ..tableId = tableId ?? this.tableId
      ..siteId = siteId ?? this.siteId
      ..gameType = gameType ?? this.gameType
      ..msg = msg ?? this.msg;
  }
}