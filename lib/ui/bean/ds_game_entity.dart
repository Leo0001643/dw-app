import 'dart:convert';

import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/ds_game_entity.g.dart';

export 'package:leisure_games/generated/json/ds_game_entity.g.dart';

@JsonSerializable()
class DsGameEntity {
	String? imageHost;
	int? total;
	int? current;
	int? pages;
	Map<String,List<DsGameGamesZm>?>? games;

	DsGameEntity();

	factory DsGameEntity.fromJson(Map<String, dynamic> json) => $DsGameEntityFromJson(json);

	Map<String, dynamic> toJson() => $DsGameEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}


@JsonSerializable()
class DsGameGamesZm {
	int? id;
	int? platformId;
	String? platformName;
	String? tag;
	String? currency;
	String? gametype;
	String? gamename;
	String? gamepic;
	String? gameidstr;
	int? gamestatus;
	int? orderby;
	int? favStatus;

	DsGameGamesZm();

	factory DsGameGamesZm.fromJson(Map<String, dynamic> json) => $DsGameGamesZmFromJson(json);

	Map<String, dynamic> toJson() => $DsGameGamesZmToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}