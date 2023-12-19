import 'dart:convert';

import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/point_record_entity.g.dart';

export 'package:leisure_games/generated/json/point_record_entity.g.dart';

@JsonSerializable()
class PointRecordEntity {
	int? totalNumber;
	int? pageSize;
	int? page;
	List<PointRecordRecord>? record;

	PointRecordEntity();

	factory PointRecordEntity.fromJson(Map<String, dynamic> json) => $PointRecordEntityFromJson(json);

	Map<String, dynamic> toJson() => $PointRecordEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PointRecordRecord {
	String? date;
	String? username;
	String? transPoint;
	String? afterPoint;
	String? remark;

	PointRecordRecord();

	factory PointRecordRecord.fromJson(Map<String, dynamic> json) => $PointRecordRecordFromJson(json);

	Map<String, dynamic> toJson() => $PointRecordRecordToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}

	String dateStr(){
		if((date?.length ?? 0) > 8){
			return date!.substring(0,8);
		}else {
			return date.em();
		}
	}


}