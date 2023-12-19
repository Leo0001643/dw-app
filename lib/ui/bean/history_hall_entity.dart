import 'dart:convert';

import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/history_hall_entity.g.dart';

@JsonSerializable()
class HistoryHall {
	List<String>? draw;
	int? drawTime;
	int? lid;
	String? name;
	String? sort;
	String? imgUrl;

	HistoryHall();

	factory HistoryHall.fromJson(Map<String, dynamic> json) => $HistoryHallFromJson(json);

	Map<String, dynamic> toJson() => $HistoryHallToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}

	String qihao(){
		return draw?.first ?? "";
	}

	List<String> nums(){
		var list = List<String>.empty(growable: true);
		draw?[2].split(",").forEach((element) { list.add(element); });
		return list;
	}


}
