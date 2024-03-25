import 'dart:convert';

import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/spread_promos_data_entity.g.dart';

export 'package:leisure_games/generated/json/spread_promos_data_entity.g.dart';

@JsonSerializable()
class SpreadPromosDataEntity {
	List<SpreadPromosDataList>? list;
	int? page;
	int? total;

	SpreadPromosDataEntity();

	factory SpreadPromosDataEntity.fromJson(Map<String, dynamic> json) => $SpreadPromosDataEntityFromJson(json);

	Map<String, dynamic> toJson() => $SpreadPromosDataEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class SpreadPromosDataList {
	int? addTime;
	int? id;
	String? saveMoney;
	int? siteId;
	String? spreadPromos;
	String? topUsername;
	String? username;
	String? currency;

	SpreadPromosDataList();

	factory SpreadPromosDataList.fromJson(Map<String, dynamic> json) => $SpreadPromosDataListFromJson(json);

	Map<String, dynamic> toJson() => $SpreadPromosDataListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}