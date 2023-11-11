import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/dew_info_entity.g.dart';
import 'dart:convert';
export 'package:leisure_games/generated/json/dew_info_entity.g.dart';

@JsonSerializable()
class DewInfoEntity {
	List<String>? longTop;
	List<List<int>>? threeNumCount;
	List<List<int>>? count;
	List<List<String>>? list;
	List<List<int>>? luckyNumCount;
	List<List<int>>? oneNumCount;
	List<List<int>>? twoNumCount;

	DewInfoEntity();

	factory DewInfoEntity.fromJson(Map<String, dynamic> json) => $DewInfoEntityFromJson(json);

	Map<String, dynamic> toJson() => $DewInfoEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}