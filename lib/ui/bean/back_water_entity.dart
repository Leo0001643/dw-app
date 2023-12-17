import 'dart:convert';

import 'package:leisure_games/generated/json/back_water_entity.g.dart';
import 'package:leisure_games/generated/json/base/json_field.dart';

export 'package:leisure_games/generated/json/back_water_entity.g.dart';

@JsonSerializable()
class BackWaterEntity {
	String? gameName;
	String? gameType;
	String? lossMoney;
	double? lossMoneyBonus;
	String? validBetMoney;

	BackWaterEntity();

	factory BackWaterEntity.fromJson(Map<String, dynamic> json) => $BackWaterEntityFromJson(json);

	Map<String, dynamic> toJson() => $BackWaterEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}




}