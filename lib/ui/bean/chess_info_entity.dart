import 'dart:convert';

import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/chess_info_entity.g.dart';

export 'package:leisure_games/generated/json/chess_info_entity.g.dart';

@JsonSerializable()
class ChessInfoEntity {
	int? platformId;
	String? platformName;
	String? tag;
	String? gametype;
	String? gamename;
	String? gamepic;
	String? gameidstr;
	int? gamestatus;
	dynamic orderby;
	String? imageHost;

	ChessInfoEntity();

	factory ChessInfoEntity.fromJson(Map<String, dynamic> json) => $ChessInfoEntityFromJson(json);

	Map<String, dynamic> toJson() => $ChessInfoEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}