import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/day_return_water_details_entity.g.dart';
import 'dart:convert';
export 'package:leisure_games/generated/json/day_return_water_details_entity.g.dart';

@JsonSerializable()
class DayReturnWaterDetailsEntity {
	String? total;
	String? betTermCount;
	double? betMoney;
	String? lossMoney;
	String? lossMoneyBonus;
	String? combinBetMoney;
	String? basicBetMoney;
	String? combinBetRatio;
	String? basicBetRatio;
	List<DayReturnWaterDetailsRecord>? record;

	DayReturnWaterDetailsEntity();

	factory DayReturnWaterDetailsEntity.fromJson(Map<String, dynamic> json) => $DayReturnWaterDetailsEntityFromJson(json);

	Map<String, dynamic> toJson() => $DayReturnWaterDetailsEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class DayReturnWaterDetailsRecord {
	int? id;
	String? date;
	String? validBetMoney;
	double? lossMoney;
	String? lossMoneyBonus;
	String? state;
	double? combinBetRatio;

	DayReturnWaterDetailsRecord();

	factory DayReturnWaterDetailsRecord.fromJson(Map<String, dynamic> json) => $DayReturnWaterDetailsRecordFromJson(json);

	Map<String, dynamic> toJson() => $DayReturnWaterDetailsRecordToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}



}