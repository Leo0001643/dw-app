import 'dart:convert';

import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/check_in_info_entity.g.dart';

export 'package:leisure_games/generated/json/check_in_info_entity.g.dart';

@JsonSerializable()
class CheckInInfoEntity {
	List<String>? log;
	String? signInNum;
	String? point;
	int? timestamp;

	CheckInInfoEntity();

	factory CheckInInfoEntity.fromJson(Map<String, dynamic> json) => $CheckInInfoEntityFromJson(json);

	Map<String, dynamic> toJson() => $CheckInInfoEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}