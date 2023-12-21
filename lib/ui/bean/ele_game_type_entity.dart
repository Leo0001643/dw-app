import 'dart:convert';

import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/ele_game_type_entity.g.dart';

export 'package:leisure_games/generated/json/ele_game_type_entity.g.dart';

@JsonSerializable()
class EleGameTypeEntity {
	String? currency;
	String? gametype;
	int? orderby;

	EleGameTypeEntity({this.gametype});

	factory EleGameTypeEntity.fromJson(Map<String, dynamic> json) => $EleGameTypeEntityFromJson(json);

	Map<String, dynamic> toJson() => $EleGameTypeEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}