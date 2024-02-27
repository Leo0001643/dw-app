import 'package:leisure_games/app/socket/ws_logout_entity.dart';
import 'package:leisure_games/generated/json/base/json_convert_content.dart';

WsLogoutEntity $WsLogoutEntityFromJson(Map<String, dynamic> json) {
  final WsLogoutEntity wsLogoutEntity = WsLogoutEntity();
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    wsLogoutEntity.type = type;
  }
  final String? fromClientId = jsonConvert.convert<String>(
      json['from_client_id']);
  if (fromClientId != null) {
    wsLogoutEntity.fromClientId = fromClientId;
  }
  final String? clientName = jsonConvert.convert<String>(json['client_name']);
  if (clientName != null) {
    wsLogoutEntity.clientName = clientName;
  }
  final String? time = jsonConvert.convert<String>(json['time']);
  if (time != null) {
    wsLogoutEntity.time = time;
  }
  final String? reason = jsonConvert.convert<String>(json['reason']);
  if (reason != null) {
    wsLogoutEntity.reason = reason;
  }
  return wsLogoutEntity;
}

Map<String, dynamic> $WsLogoutEntityToJson(WsLogoutEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['type'] = entity.type;
  data['from_client_id'] = entity.fromClientId;
  data['client_name'] = entity.clientName;
  data['time'] = entity.time;
  data['reason'] = entity.reason;
  return data;
}

extension WsLogoutEntityExtension on WsLogoutEntity {
  WsLogoutEntity copyWith({
    String? type,
    String? fromClientId,
    String? clientName,
    String? time,
    String? reason,
  }) {
    return WsLogoutEntity()
      ..type = type ?? this.type
      ..fromClientId = fromClientId ?? this.fromClientId
      ..clientName = clientName ?? this.clientName
      ..time = time ?? this.time
      ..reason = reason ?? this.reason;
  }
}