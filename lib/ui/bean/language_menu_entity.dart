import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/language_menu_entity.g.dart';
import 'dart:convert';
export 'package:leisure_games/generated/json/language_menu_entity.g.dart';

@JsonSerializable()
class LanguageMenuEntity {
	String? language = '';
	String? icon = '';

	LanguageMenuEntity({this.language,this.icon});

	factory LanguageMenuEntity.fromJson(Map<String, dynamic> json) => $LanguageMenuEntityFromJson(json);

	Map<String, dynamic> toJson() => $LanguageMenuEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}