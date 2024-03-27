import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/bet_detail_list_entity.g.dart';
import 'dart:convert';
export 'package:leisure_games/generated/json/bet_detail_list_entity.g.dart';

@JsonSerializable()
class BetDetailListEntity {
	double? betamount;
	double? validamount;
	double? winlose;
	int? betCount;
	String? currency;
	List<BetDetailListRecord>? record;

	BetDetailListEntity({this.betamount,this.validamount,this.winlose,this.betCount,this.currency,this.record});

	factory BetDetailListEntity.fromJson(Map<String, dynamic> json) => $BetDetailListEntityFromJson(json);

	Map<String, dynamic> toJson() => $BetDetailListEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class BetDetailListRecord {
	double? betAmount;
	double? validAmount;
	double? winlose;
	int? betCount;
	int? gameKind;
	String? gameKindName;
	List<BetDetailListRecordRecord>? record;

	BetDetailListRecord({this.betAmount,this.validAmount,this.winlose,this.betCount,this.gameKind,this.gameKindName,this.record});

	factory BetDetailListRecord.fromJson(Map<String, dynamic> json) => $BetDetailListRecordFromJson(json);

	Map<String, dynamic> toJson() => $BetDetailListRecordToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class BetDetailListRecordRecord {
	double? betamount;
	double? validamount;
	double? winlose;
	int? betCount;
	int? gameKind;
	String? gameKindName;
	String? gameName;
	int? gameType;
	String? currency;

	BetDetailListRecordRecord();

	factory BetDetailListRecordRecord.fromJson(Map<String, dynamic> json) => $BetDetailListRecordRecordFromJson(json);

	Map<String, dynamic> toJson() => $BetDetailListRecordRecordToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}