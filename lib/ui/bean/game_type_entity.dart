import 'dart:convert';

import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/game_type_entity.g.dart';

export 'package:leisure_games/generated/json/game_type_entity.g.dart';

@JsonSerializable()
class GameTypeEntity {
	int? id;
	String? gameName;
	String? outGameCode;
	String? parentId;
	int? fkLiveId;

	GameTypeEntity();

	factory GameTypeEntity.fromJson(Map<String, dynamic> json) => $GameTypeEntityFromJson(json);

	Map<String, dynamic> toJson() => $GameTypeEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}