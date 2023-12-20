import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/socket_base_entity.dart';

SocketBaseEntity $SocketBaseEntityFromJson(Map<String, dynamic> json) {
  final SocketBaseEntity socketBaseEntity = SocketBaseEntity();
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    socketBaseEntity.type = type;
  }
  return socketBaseEntity;
}

Map<String, dynamic> $SocketBaseEntityToJson(SocketBaseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['type'] = entity.type;
  return data;
}

extension SocketBaseEntityExtension on SocketBaseEntity {
  SocketBaseEntity copyWith({
    String? type,
  }) {
    return SocketBaseEntity()
      ..type = type ?? this.type;
  }
}