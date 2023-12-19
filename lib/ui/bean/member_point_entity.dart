import 'dart:convert';

import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/member_point_entity.g.dart';

export 'package:leisure_games/generated/json/member_point_entity.g.dart';

@JsonSerializable()
class MemberPointEntity {
	double? point;

	MemberPointEntity();

	factory MemberPointEntity.fromJson(Map<String, dynamic> json) => $MemberPointEntityFromJson(json);

	Map<String, dynamic> toJson() => $MemberPointEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}