import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/constitute_ratio_entity.g.dart';
import 'dart:convert';
export 'package:leisure_games/generated/json/constitute_ratio_entity.g.dart';

@JsonSerializable()
class ConstituteRatioEntity {
	double? lossMoney;
	double? lossMoneyBonus;
	double? combinBetMoney;
	double? combinBetRatio;//组合占比
	double? activityMode;
	double? basicBetMoney;
	int? betTermCount;

	ConstituteRatioEntity();

	factory ConstituteRatioEntity.fromJson(Map<String, dynamic> json) => $ConstituteRatioEntityFromJson(json);

	Map<String, dynamic> toJson() => $ConstituteRatioEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}