import 'dart:convert';

import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/isolate_msg_entity.g.dart';
@JsonSerializable()
class IsolateMsgEntity {
	String? key;
	String? value;

	IsolateMsgEntity({this.key,this.value});

	factory IsolateMsgEntity.fromJson(Map<String, dynamic> json) => $IsolateMsgEntityFromJson(json);

	Map<String, dynamic> toJson() => $IsolateMsgEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}