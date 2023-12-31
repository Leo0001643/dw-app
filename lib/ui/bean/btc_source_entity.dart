import 'dart:convert';

import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/btc_source_entity.g.dart';

export 'package:leisure_games/generated/json/btc_source_entity.g.dart';

@JsonSerializable()
class BtcSourceEntity {

	int? billCount;
	int? closeTime;
	int? term;
	int? realOpenTime;
	int? state;
	int? openTime;
	String? luckyNum;
	String? originalNum;
	String? gameType;
	String? btcHash;


	BtcSourceEntity();

	factory BtcSourceEntity.fromJson(Map<String, dynamic> json) => $BtcSourceEntityFromJson(json);

	Map<String, dynamic> toJson() => $BtcSourceEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}


	String originalNumStr(){
		return DataUtils.addSpacesToNumber(originalNum.em());
	}




}