import 'dart:convert';

import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/is_permit_entity.g.dart';

export 'package:leisure_games/generated/json/is_permit_entity.g.dart';

@JsonSerializable()
class IsPermitEntity {
	int? status;///平台状态【1:开启，2:关闭】
	int? id;
	String? name;

	IsPermitEntity();

	factory IsPermitEntity.fromJson(Map<String, dynamic> json) => $IsPermitEntityFromJson(json);

	Map<String, dynamic> toJson() => $IsPermitEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}