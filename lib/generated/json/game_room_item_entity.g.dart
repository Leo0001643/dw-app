import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/game_room_item_entity.dart';


GameRoomItemEntity $GameRoomItemEntityFromJson(Map<String, dynamic> json) {
  final GameRoomItemEntity gameRoomItemEntity = GameRoomItemEntity();
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    gameRoomItemEntity.type = type;
  }
  final dynamic data = json['data'];
  if (data != null) {
    gameRoomItemEntity.data = data;
  }
  return gameRoomItemEntity;
}

Map<String, dynamic> $GameRoomItemEntityToJson(GameRoomItemEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['type'] = entity.type;
  data['data'] = entity.data;
  return data;
}

extension GameRoomItemEntityExtension on GameRoomItemEntity {
  GameRoomItemEntity copyWith({
    String? type,
    dynamic data,
  }) {
    return GameRoomItemEntity()
      ..type = type ?? this.type
      ..data = data ?? this.data;
  }
}