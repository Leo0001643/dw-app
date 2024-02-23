import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/ws_msg_error_entity.dart';

WsMsgErrorEntity $WsMsgErrorEntityFromJson(Map<String, dynamic> json) {
  final WsMsgErrorEntity wsMsgErrorEntity = WsMsgErrorEntity();
  final String? showMessage = jsonConvert.convert<String>(json['showMessage']);
  if (showMessage != null) {
    wsMsgErrorEntity.showMessage = showMessage;
  }
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    wsMsgErrorEntity.nickname = nickname;
  }
  final String? avatar = jsonConvert.convert<String>(json['avatar']);
  if (avatar != null) {
    wsMsgErrorEntity.avatar = avatar;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    wsMsgErrorEntity.type = type;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    wsMsgErrorEntity.username = username;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    wsMsgErrorEntity.status = status;
  }
  return wsMsgErrorEntity;
}

Map<String, dynamic> $WsMsgErrorEntityToJson(WsMsgErrorEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['showMessage'] = entity.showMessage;
  data['nickname'] = entity.nickname;
  data['avatar'] = entity.avatar;
  data['type'] = entity.type;
  data['username'] = entity.username;
  data['status'] = entity.status;
  return data;
}

extension WsMsgErrorEntityExtension on WsMsgErrorEntity {
  WsMsgErrorEntity copyWith({
    String? showMessage,
    String? nickname,
    String? avatar,
    String? type,
    String? username,
    int? status,
  }) {
    return WsMsgErrorEntity()
      ..showMessage = showMessage ?? this.showMessage
      ..nickname = nickname ?? this.nickname
      ..avatar = avatar ?? this.avatar
      ..type = type ?? this.type
      ..username = username ?? this.username
      ..status = status ?? this.status;
  }
}