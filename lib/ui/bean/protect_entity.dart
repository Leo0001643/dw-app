import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/protect_entity.g.dart';
import 'dart:convert';
export 'package:leisure_games/generated/json/protect_entity.g.dart';

@JsonSerializable()
class ProtectEntity {
	ProtectProtect? protect;
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
class ProtectProtect {
	@JSONField(name: "kkwds_live")
	ProtectProtectKkwdsLive? kkwdsLive;
	@JSONField(name: "bb_sport")
	ProtectProtectBbSport? bbSport;

	ProtectProtect();

	factory ProtectProtect.fromJson(Map<String, dynamic> json) => $ProtectProtectFromJson(json);

	Map<String, dynamic> toJson() => $ProtectProtectToJson(this);

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

@JsonSerializable()
class ProtectProtectBbSport {
	String? tags;
	String? title;
	String? status;
	String? notice;

	ProtectProtectBbSport();

	factory ProtectProtectBbSport.fromJson(Map<String, dynamic> json) => $ProtectProtectBbSportFromJson(json);

	Map<String, dynamic> toJson() => $ProtectProtectBbSportToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}