import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/act_status_entity.g.dart';
import 'dart:convert';
export 'package:leisure_games/generated/json/act_status_entity.g.dart';

@JsonSerializable()
class ActStatusEntity {
	int? ctime;
	Map<String?,ActStatusList?>? list;

	ActStatusEntity();

	factory ActStatusEntity.fromJson(Map<String, dynamic> json) => $ActStatusEntityFromJson(json);

	Map<String, dynamic> toJson() => $ActStatusEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ActStatusList {
	int? code;
	int? endTime;
	int? expireDay;
	String? name;
	int? picEndTime;
	int? picStartTime;
	int? startTime;
	int? status;
	String? tag;
	String? ulevel;

	ActStatusList();

	factory ActStatusList.fromJson(Map<String, dynamic> json) => $ActStatusListFromJson(json);

	Map<String, dynamic> toJson() => $ActStatusListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}