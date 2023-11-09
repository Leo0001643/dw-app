import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/notice_entity.g.dart';
import 'dart:convert';
export 'package:leisure_games/generated/json/notice_entity.g.dart';

@JsonSerializable()
class NoticeEntity {
	int? id;
	String? noteContent;
	String? noteTitle;
	int? addTime;
	int? noteType;

	NoticeEntity();

	factory NoticeEntity.fromJson(Map<String, dynamic> json) => $NoticeEntityFromJson(json);

	Map<String, dynamic> toJson() => $NoticeEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}