import 'dart:convert';

import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/game_kind_entity.g.dart';

export 'package:leisure_games/generated/json/game_kind_entity.g.dart';

@JsonSerializable()
class GameKindEntity {
	dynamic liveId;
	dynamic liveName;
	dynamic currency;
	String? gameKind;
	String? gameKindName;
	String? gameName;
	String? gameCode;
	String? imageUrl;
	dynamic tags;
	String? host;
	int? orderby;
	int? hot;
	String? advertImage;
	List<GameKindGameKindList>? gameKindList;

	GameKindEntity();

	factory GameKindEntity.fromJson(Map<String, dynamic> json) => $GameKindEntityFromJson(json);

	Map<String, dynamic> toJson() => $GameKindEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class GameKindGameKindList {
	int? liveId;
	String? liveName;
	String? currency;
	String? gameKind;
	String? gameKindName;
	String? gameName;
	String? gameCode;
	String? imageUrl;
	String? tags;
	String? host;
	int? orderby;
	int? hot;
	String? advertImage;
	List<dynamic>? gameKindList;

	GameKindGameKindList({this.gameCode});

	factory GameKindGameKindList.fromJson(Map<String, dynamic> json) => $GameKindGameKindListFromJson(json);

	Map<String, dynamic> toJson() => $GameKindGameKindListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}

	String image(){
		return "$host$imageUrl";
	}



}