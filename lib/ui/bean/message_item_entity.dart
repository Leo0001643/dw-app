import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/message_item_entity.g.dart';
import 'dart:convert';
export 'package:leisure_games/generated/json/message_item_entity.g.dart';

@JsonSerializable()
class MessageItemEntity {
	int? id;
	String? noteContent;
	String? noteTitle;
	int? addTime;
	int? noteType;

	MessageItemEntity({this.id, this.noteContent, this.noteTitle, this.addTime, this.noteType});

  factory MessageItemEntity.fromJson(Map<String, dynamic> json) => $MessageItemEntityFromJson(json);

	Map<String, dynamic> toJson() => $MessageItemEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}
//        {
//             "id": 11217,
//             "noteContent": "欢迎来到国际站，期待与您携手并进，再创佳绩",
//             "noteTitle": "欢迎光临",
//             "addTime": 1639991272,
//             "noteType": 2
//         }