import 'dart:convert';

import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/protect_entity.g.dart';

export 'package:leisure_games/generated/json/protect_entity.g.dart';

@JsonSerializable()
class ProtectEntity {
	Map<String,ProtectProtectKkwdsLive?>? protect;
	int? userRegister;
	int? agentRegister;
	String? vcode;
	String? registerCode;

	ProtectEntity();

	factory ProtectEntity.fromJson(Map<String, dynamic> json) => $ProtectEntityFromJson(json);

	Map<String, dynamic> toJson() => $ProtectEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}


@JsonSerializable()
class ProtectProtectKkwdsLive {
	String? tags;
	String? title;
	String? status;
	String? notice;

	ProtectProtectKkwdsLive();

	factory ProtectProtectKkwdsLive.fromJson(Map<String, dynamic> json) => $ProtectProtectKkwdsLiveFromJson(json);

	Map<String, dynamic> toJson() => $ProtectProtectKkwdsLiveToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}
