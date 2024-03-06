import 'dart:convert';

import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/bet_record_group_entity.g.dart';

export 'package:leisure_games/generated/json/bet_record_group_entity.g.dart';

@JsonSerializable()
class BetRecordGroupEntity {
	double? betAmountTotal;
	String? validAmountTotal;
	double? winloseTotal;
	int? betCountTotal;
	List<BetRecordGroupRecord>? record;

	BetRecordGroupEntity();

	factory BetRecordGroupEntity.fromJson(Map<String, dynamic> json) => $BetRecordGroupEntityFromJson(json);

	Map<String, dynamic> toJson() => $BetRecordGroupEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class BetRecordGroupRecord {
	String? betamount;
	String? validamount;
	num? winlose;
	String? betCount;
	String? time;
	String? title;
	String? cur;
	BetRecordGroupRecord();

	factory BetRecordGroupRecord.fromJson(Map<String, dynamic> json) => $BetRecordGroupRecordFromJson(json);

	Map<String, dynamic> toJson() => $BetRecordGroupRecordToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}