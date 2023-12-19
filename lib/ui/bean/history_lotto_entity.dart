import 'dart:convert';

import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/history_lotto_entity.g.dart';

export 'package:leisure_games/generated/json/history_lotto_entity.g.dart';

@JsonSerializable()
class HistoryLottoEntity {
	int? qiShu;
	String? time;
	String? balls;

	HistoryLottoEntity();

	factory HistoryLottoEntity.fromJson(Map<String, dynamic> json) => $HistoryLottoEntityFromJson(json);

	Map<String, dynamic> toJson() => $HistoryLottoEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}

	List<String> nums(){
		var list = List<String>.empty(growable: true);
		balls?.split(",").forEach((element) { list.add(element); });
		return list;
	}


}