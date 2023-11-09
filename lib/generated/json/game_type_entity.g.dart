import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/game_type_entity.dart';

GameTypeEntity $GameTypeEntityFromJson(Map<String, dynamic> json) {
  final GameTypeEntity gameTypeEntity = GameTypeEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    gameTypeEntity.id = id;
  }
  final String? gameName = jsonConvert.convert<String>(json['gameName']);
  if (gameName != null) {
    gameTypeEntity.gameName = gameName;
  }
  final String? outGameCode = jsonConvert.convert<String>(json['outGameCode']);
  if (outGameCode != null) {
    gameTypeEntity.outGameCode = outGameCode;
  }
  final String? parentId = jsonConvert.convert<String>(json['parentId']);
  if (parentId != null) {
    gameTypeEntity.parentId = parentId;
  }
  final int? fkLiveId = jsonConvert.convert<int>(json['fkLiveId']);
  if (fkLiveId != null) {
    gameTypeEntity.fkLiveId = fkLiveId;
  }
  return gameTypeEntity;
}

Map<String, dynamic> $GameTypeEntityToJson(GameTypeEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['gameName'] = entity.gameName;
  data['outGameCode'] = entity.outGameCode;
  data['parentId'] = entity.parentId;
  data['fkLiveId'] = entity.fkLiveId;
  return data;
}

extension GameTypeEntityExtension on GameTypeEntity {
  GameTypeEntity copyWith({
    int? id,
    String? gameName,
    String? outGameCode,
    String? parentId,
    int? fkLiveId,
  }) {
    return GameTypeEntity()
      ..id = id ?? this.id
      ..gameName = gameName ?? this.gameName
      ..outGameCode = outGameCode ?? this.outGameCode
      ..parentId = parentId ?? this.parentId
      ..fkLiveId = fkLiveId ?? this.fkLiveId;
  }
}