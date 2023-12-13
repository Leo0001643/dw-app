import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/current_bet_entity.g.dart';
import 'dart:convert';
export 'package:leisure_games/generated/json/current_bet_entity.g.dart';

@JsonSerializable()
class CurrentBetEntity {
	int? number;
	bool? last;
	int? numberOfElements;
	int? size;
	int? totalPages;
	dynamic sort;
	bool? first;
	int? totalElements;
	List<CurrentBetContent>? content;

	CurrentBetEntity();

	factory CurrentBetEntity.fromJson(Map<String, dynamic> json) => $CurrentBetEntityFromJson(json);

	Map<String, dynamic> toJson() => $CurrentBetEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class CurrentBetContent {
	double? betOddsExpected;
	String? gameType;
	double? betMoney;
	double? winMoneyExpected;
	String? moneyType;
	dynamic payOff;
	String? encryption;
	double? rate;
	int? term;
	int? id;
	int? state;
	dynamic afterBalance;
	String? billNo;
	double? betOdds1314;
	dynamic winMoneyValid;
	double? cnyMoney;
	double? winMoney1314;
	dynamic updateTime;
	String? betType;
	String? betMsg;
	dynamic betNum;
	int? createTime;
	int? billId;
	int? siteId;
	int? tableId;
	String? originalUsername;
	String? username;

	CurrentBetContent();

	factory CurrentBetContent.fromJson(Map<String, dynamic> json) => $CurrentBetContentFromJson(json);

	Map<String, dynamic> toJson() => $CurrentBetContentToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}