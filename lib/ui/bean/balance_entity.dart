import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/balance_entity.g.dart';
import 'dart:convert';
export 'package:leisure_games/generated/json/balance_entity.g.dart';

@JsonSerializable()
class BalanceEntity {
	double? money;

	BalanceEntity();

	factory BalanceEntity.fromJson(Map<String, dynamic> json) => $BalanceEntityFromJson(json);

	Map<String, dynamic> toJson() => $BalanceEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}