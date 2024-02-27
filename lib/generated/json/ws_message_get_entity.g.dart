import 'package:leisure_games/app/socket/ws_message_get_entity.dart';
import 'package:leisure_games/generated/json/base/json_convert_content.dart';

WsMessageGetEntity $WsMessageGetEntityFromJson(Map<String, dynamic> json) {
  final WsMessageGetEntity wsMessageGetEntity = WsMessageGetEntity();
  final List<String>? msg = (json['msg'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (msg != null) {
    wsMessageGetEntity.msg = msg;
  }
  final String? uniqueId = jsonConvert.convert<String>(json['unique_id']);
  if (uniqueId != null) {
    wsMessageGetEntity.uniqueId = uniqueId;
  }
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    wsMessageGetEntity.nickname = nickname;
  }
  final String? siteId = jsonConvert.convert<String>(json['site_id']);
  if (siteId != null) {
    wsMessageGetEntity.siteId = siteId;
  }
  final String? avatar = jsonConvert.convert<String>(json['avatar']);
  if (avatar != null) {
    wsMessageGetEntity.avatar = avatar;
  }
  final int? time = jsonConvert.convert<int>(json['time']);
  if (time != null) {
    wsMessageGetEntity.time = time;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    wsMessageGetEntity.type = type;
  }
  final String? tableId = jsonConvert.convert<String>(json['table_id']);
  if (tableId != null) {
    wsMessageGetEntity.tableId = tableId;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    wsMessageGetEntity.username = username;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    wsMessageGetEntity.status = status;
  }
  return wsMessageGetEntity;
}

Map<String, dynamic> $WsMessageGetEntityToJson(WsMessageGetEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['msg'] = entity.msg;
  data['unique_id'] = entity.uniqueId;
  data['nickname'] = entity.nickname;
  data['site_id'] = entity.siteId;
  data['avatar'] = entity.avatar;
  data['time'] = entity.time;
  data['type'] = entity.type;
  data['table_id'] = entity.tableId;
  data['username'] = entity.username;
  data['status'] = entity.status;
  return data;
}

extension WsMessageGetEntityExtension on WsMessageGetEntity {
  WsMessageGetEntity copyWith({
    List<String>? msg,
    String? uniqueId,
    String? nickname,
    String? siteId,
    String? avatar,
    int? time,
    String? type,
    String? tableId,
    String? username,
    int? status,
  }) {
    return WsMessageGetEntity()
      ..msg = msg ?? this.msg
      ..uniqueId = uniqueId ?? this.uniqueId
      ..nickname = nickname ?? this.nickname
      ..siteId = siteId ?? this.siteId
      ..avatar = avatar ?? this.avatar
      ..time = time ?? this.time
      ..type = type ?? this.type
      ..tableId = tableId ?? this.tableId
      ..username = username ?? this.username
      ..status = status ?? this.status;
  }
}