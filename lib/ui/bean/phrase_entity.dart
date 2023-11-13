import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/phrase_entity.g.dart';
import 'dart:convert';
export 'package:leisure_games/generated/json/phrase_entity.g.dart';

@JsonSerializable()
class PhraseEntity {
	String? type;
	List<String>? phrases;

	PhraseEntity();

	factory PhraseEntity.fromJson(Map<String, dynamic> json) => $PhraseEntityFromJson(json);

	Map<String, dynamic> toJson() => $PhraseEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}