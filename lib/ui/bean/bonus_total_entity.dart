import 'dart:convert';

import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/bonus_total_entity.g.dart';

export 'package:leisure_games/generated/json/bonus_total_entity.g.dart';

@JsonSerializable()
class BonusTotalEntity {
	double? bonusTotal;

	BonusTotalEntity();

	factory BonusTotalEntity.fromJson(Map<String, dynamic> json) => $BonusTotalEntityFromJson(json);

	Map<String, dynamic> toJson() => $BonusTotalEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}