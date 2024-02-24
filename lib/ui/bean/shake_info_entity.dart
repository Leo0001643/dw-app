import 'dart:convert';

import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/shake_info_entity.g.dart';

export 'package:leisure_games/generated/json/shake_info_entity.g.dart';

@JsonSerializable()
class ShakeInfoEntity {
	double? point;
	List<ShakeInfoShakes>? shakes;

	ShakeInfoEntity();

	factory ShakeInfoEntity.fromJson(Map<String, dynamic> json) => $ShakeInfoEntityFromJson(json);

	Map<String, dynamic> toJson() => $ShakeInfoEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ShakeInfoShakes {
	int? id;
	double? money;
	String? currency;

	ShakeInfoShakes();

	factory ShakeInfoShakes.fromJson(Map<String, dynamic> json) => $ShakeInfoShakesFromJson(json);

	Map<String, dynamic> toJson() => $ShakeInfoShakesToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}