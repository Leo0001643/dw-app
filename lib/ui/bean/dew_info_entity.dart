import 'dart:convert';

import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/dew_info_entity.g.dart';

export 'package:leisure_games/generated/json/dew_info_entity.g.dart';

@JsonSerializable()
class DewInfoEntity {
	List<String>? longTop;
	List<List<int>>? count;
	List<List<String>>? list;
	List<List<int>>? oneNumCount;
	List<List<int>>? twoNumCount;
	List<List<int>>? threeNumCount;
	List<List<int>>? luckyNumCount;

	DewInfoEntity();

	factory DewInfoEntity.fromJson(Map<String, dynamic> json) => $DewInfoEntityFromJson(json);

	Map<String, dynamic> toJson() => $DewInfoEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}

	int listNum(int i,int j){
		if((list?[i].em() ?? 0) > 2){
			var ns = list?[i][2].split(",");
			return int.parse(ns?[j] ?? "0");
		}
		return 0;
	}



}