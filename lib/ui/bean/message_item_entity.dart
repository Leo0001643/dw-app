import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/message_item_entity.g.dart';
import 'dart:convert';
export 'package:leisure_games/generated/json/message_item_entity.g.dart';

@JsonSerializable()
class MessageItemEntity {
	int? id;
	String? message;
	String? language;
	int? mstatus;
	String? username;
	int? addTime;

	MessageItemEntity({this.username,this.message,this.addTime});

  factory MessageItemEntity.fromJson(Map<String, dynamic> json) => $MessageItemEntityFromJson(json);

	Map<String, dynamic> toJson() => $MessageItemEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}