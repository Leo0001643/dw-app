import 'package:json_annotation/json_annotation.dart';
import 'package:leisure_games/generated/json/game_room_item_entity.g.dart';

@JsonSerializable()
class GameRoomItemEntity {
  String? type;
  dynamic data;
  GameRoomItemEntity({this.type, this.data});


  factory GameRoomItemEntity.fromJson(Map<String, dynamic> json) => $GameRoomItemEntityFromJson(json);

  Map<String, dynamic> toJson() => $GameRoomItemEntityToJson(this);

}
