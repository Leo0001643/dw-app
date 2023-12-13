import 'dart:convert';

import 'package:leisure_games/generated/json/base/json_field.dart';
import '/generated/json/chapter_info_entity.g.dart';

@JsonSerializable()
class ChapterInfoEntity {

	int? courseId;
	String? name;
	int? order;
	int? parentChapterId;
	bool? userControlSetTop;
	int? visible;
  List<String>? children;

  ChapterInfoEntity();

  factory ChapterInfoEntity.fromJson(Map<String, dynamic> json) => $ChapterInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $ChapterInfoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}