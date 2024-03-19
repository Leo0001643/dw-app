import 'dart:convert';

import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/var_code_entity.g.dart';

export 'package:leisure_games/generated/json/var_code_entity.g.dart';

@JsonSerializable()
class VarCodeEntity {
	int? status;///验证码状态【1:开启,2:关闭】
	int? type;///验证码类型【0:无验证码,1:图形验证码,2:滑块验证码】
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