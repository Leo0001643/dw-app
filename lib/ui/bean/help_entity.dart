import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/help_entity.g.dart';
import 'dart:convert';
export 'package:leisure_games/generated/json/help_entity.g.dart';

@JsonSerializable()
class HelpEntity {
	String? name;
	String? confirmid;
	String? tag;

	@JSONField(name: "lang_type")
	String? langType;

	HelpEntity();

	factory HelpEntity.fromJson(Map<String, dynamic> json) => $HelpEntityFromJson(json);

	Map<String, dynamic> toJson() => $HelpEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}