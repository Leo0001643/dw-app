import 'dart:convert';
import 'dart:ffi';

import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/prize_list_entity.g.dart';

export 'package:leisure_games/generated/json/prize_list_entity.g.dart';

@JsonSerializable()
class PrizeListEntity {
	List<PrizeListPrizes>? prizes;
	List<PrizeListPrizes>? redPackets;

	PrizeListEntity();

	factory PrizeListEntity.fromJson(Map<String, dynamic> json) => $PrizeListEntityFromJson(json);

	Map<String, dynamic> toJson() => $PrizeListEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PrizeListPrizes {
	int? addTime;
	double? bonusMoney;
	double? bonusMoneyCode;
	int? endTime;
	int? id;
	String? marks;
	int? siteId;
	int? status;
	String? username;

	PrizeListPrizes();

	factory PrizeListPrizes.fromJson(Map<String, dynamic> json) => $PrizeListPrizesFromJson(json);

	Map<String, dynamic> toJson() => $PrizeListPrizesToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}

	///状态【1未激活，2已激活，3已提取，4已失效】
	String statusString(){
		switch(status){
			case 1:
				return Intr().hongbao_weijihuo;
			case 2:
				return Intr().hongbao_tiqu;
			case 3:
				return Intr().yitiqu;
			case 4:
				return Intr().hongbao_yishixiao;
			default:
				return "";
		}
	}

}
