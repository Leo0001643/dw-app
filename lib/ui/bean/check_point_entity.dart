import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/check_point_entity.g.dart';
import 'dart:convert';
export 'package:leisure_games/generated/json/check_point_entity.g.dart';

@JsonSerializable()
class CheckPointEntity {
	int? chekNum;
	int? nextCheckNum;
	double? point;
	int? pointTotal;
	int? nextPoint;
	int? timestamp;

	CheckPointEntity();

	factory CheckPointEntity.fromJson(Map<String, dynamic> json) => $CheckPointEntityFromJson(json);

	Map<String, dynamic> toJson() => $CheckPointEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}