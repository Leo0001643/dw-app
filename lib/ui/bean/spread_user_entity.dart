import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/spread_user_entity.g.dart';
import 'dart:convert';
export 'package:leisure_games/generated/json/spread_user_entity.g.dart';

@JsonSerializable()
class SpreadUserEntity {
	int? addtime;
	String? avatar;
	String? username;

	SpreadUserEntity();

	factory SpreadUserEntity.fromJson(Map<String, dynamic> json) => $SpreadUserEntityFromJson(json);

	Map<String, dynamic> toJson() => $SpreadUserEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}