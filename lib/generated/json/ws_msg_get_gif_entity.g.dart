import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/ws_msg_get_gif_entity.dart';
import 'package:json_annotation/json_annotation.dart';


WsMsgGetGifEntity $WsMsgGetGifEntityFromJson(Map<String, dynamic> json) {
  final WsMsgGetGifEntity wsMsgGetGifEntity = WsMsgGetGifEntity();
  final List<String>? msg = (json['msg'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (msg != null) {
    wsMsgGetGifEntity.msg = msg;
  }
  final String? uniqueId = jsonConvert.convert<String>(json['uniqueId']);
  if (uniqueId != null) {
    wsMsgGetGifEntity.uniqueId = uniqueId;
  }
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    wsMsgGetGifEntity.nickname = nickname;
  }
  final String? siteId = jsonConvert.convert<String>(json['siteId']);
  if (siteId != null) {
    wsMsgGetGifEntity.siteId = siteId;
  }
  final String? avatar = jsonConvert.convert<String>(json['avatar']);
  if (avatar != null) {
    wsMsgGetGifEntity.avatar = avatar;
  }
  final int? time = jsonConvert.convert<int>(json['time']);
  if (time != null) {
    wsMsgGetGifEntity.time = time;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    wsMsgGetGifEntity.type = type;
  }
  final String? tableId = jsonConvert.convert<String>(json['tableId']);
  if (tableId != null) {
    wsMsgGetGifEntity.tableId = tableId;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    wsMsgGetGifEntity.username = username;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    wsMsgGetGifEntity.status = status;
  }
  return wsMsgGetGifEntity;
}

Map<String, dynamic> $WsMsgGetGifEntityToJson(WsMsgGetGifEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['msg'] = entity.msg;
  data['uniqueId'] = entity.uniqueId;
  data['nickname'] = entity.nickname;
  data['siteId'] = entity.siteId;
  data['avatar'] = entity.avatar;
  data['time'] = entity.time;
  data['type'] = entity.type;
  data['tableId'] = entity.tableId;
  data['username'] = entity.username;
  data['status'] = entity.status;
  return data;
}

extension WsMsgGetGifEntityExtension on WsMsgGetGifEntity {
  WsMsgGetGifEntity copyWith({
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
    return WsMsgGetGifEntity()
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