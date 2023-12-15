import 'dart:convert';

import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/draw_lottery_entity.g.dart';

export 'package:leisure_games/generated/json/draw_lottery_entity.g.dart';

@JsonSerializable()
class DrawLotteryEntity {
	int? billCount;
	int? closeTime;
	String? luckyNum;
	int? openTime;
	String? originalNum;
	int? state;
	int? term;

	DrawLotteryEntity();

	factory DrawLotteryEntity.fromJson(Map<String, dynamic> json) => $DrawLotteryEntityFromJson(json);

	Map<String, dynamic> toJson() => $DrawLotteryEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}