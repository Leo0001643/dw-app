import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/pc28_plan_entity.g.dart';
import 'dart:convert';
export 'package:leisure_games/generated/json/pc28_plan_entity.g.dart';

@JsonSerializable()
class Pc28PlanEntity {
	Pc28PlanAll? all;
	int? refreshTime;
	int? timestamp;

	Pc28PlanEntity();

	factory Pc28PlanEntity.fromJson(Map<String, dynamic> json) => $Pc28PlanEntityFromJson(json);

	Map<String, dynamic> toJson() => $Pc28PlanEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class Pc28PlanAll {
	Pc28PlanAllJndx28? jndx28;
	Pc28PlanAllJndx28? keno28;
	Pc28PlanAllJndx28? fastbtb28;
	Pc28PlanAllJndx28? tw28;

	Pc28PlanAll();

	factory Pc28PlanAll.fromJson(Map<String, dynamic> json) => $Pc28PlanAllFromJson(json);

	Map<String, dynamic> toJson() => $Pc28PlanAllToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class Pc28PlanAllJndx28 {
	List<Pc28PlanAllJndx28Data>? data;
	int? refreshTime;

	Pc28PlanAllJndx28();

	factory Pc28PlanAllJndx28.fromJson(Map<String, dynamic> json) => $Pc28PlanAllJndx28FromJson(json);

	Map<String, dynamic> toJson() => $Pc28PlanAllJndx28ToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class Pc28PlanAllJndx28Data {
	int? closeTime;
	int? term;
	int? openTime;

	Pc28PlanAllJndx28Data();

	factory Pc28PlanAllJndx28Data.fromJson(Map<String, dynamic> json) => $Pc28PlanAllJndx28DataFromJson(json);

	Map<String, dynamic> toJson() => $Pc28PlanAllJndx28DataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

