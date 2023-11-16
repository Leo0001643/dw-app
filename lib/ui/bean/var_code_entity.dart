import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/var_code_entity.g.dart';
import 'dart:convert';
export 'package:leisure_games/generated/json/var_code_entity.g.dart';

@JsonSerializable()
class VarCodeEntity {
	int? status;
	int? type;
	String? varCode;
	String? varCodeId;

	VarCodeEntity();

	factory VarCodeEntity.fromJson(Map<String, dynamic> json) => $VarCodeEntityFromJson(json);

	Map<String, dynamic> toJson() => $VarCodeEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}