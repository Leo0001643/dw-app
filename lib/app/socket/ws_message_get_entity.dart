import 'dart:convert';

import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/ws_message_get_entity.g.dart';

export 'package:leisure_games/generated/json/ws_message_get_entity.g.dart';

@JsonSerializable()
class WsMessageGetEntity {
	List<String>? msg;
	@JSONField(name: "unique_id")
	String? uniqueId;
	String? nickname;
	@JSONField(name: "site_id")
	String? siteId;
	String? avatar;
	int? time;
	String? type;
	@JSONField(name: "table_id")
	String? tableId;
	String? username;
	int? status;

	WsMessageGetEntity();

	factory WsMessageGetEntity.fromJson(Map<String, dynamic> json) => $WsMessageGetEntityFromJson(json);

	Map<String, dynamic> toJson() => $WsMessageGetEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}