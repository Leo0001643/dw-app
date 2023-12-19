import 'dart:convert';

import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/home_game_menu_entity.g.dart';

export 'package:leisure_games/generated/json/home_game_menu_entity.g.dart';

@JsonSerializable()
class HomeGameMenuEntity {
	String? name = '';
	String? group = '';

	HomeGameMenuEntity({this.name, this.group});

  factory HomeGameMenuEntity.fromJson(Map<String, dynamic> json) => $HomeGameMenuEntityFromJson(json);

	Map<String, dynamic> toJson() => $HomeGameMenuEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}