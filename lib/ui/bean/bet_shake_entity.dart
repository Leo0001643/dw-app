import 'dart:convert';

import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/bet_shake_entity.g.dart';

export 'package:leisure_games/generated/json/bet_shake_entity.g.dart';

@JsonSerializable()
class BetShakeEntity {
	int? drawPrizeCount;
	int? bonusId;
	double? point;
	double? bonus;
	String? currency;
	String? remark;

	BetShakeEntity();

	factory BetShakeEntity.fromJson(Map<String, dynamic> json) => $BetShakeEntityFromJson(json);

	Map<String, dynamic> toJson() => $BetShakeEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}