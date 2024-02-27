import 'dart:convert';

import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/socket/socket_utils.dart';
import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/ws_login_entity.g.dart';

export 'package:leisure_games/generated/json/ws_login_entity.g.dart';

@JsonSerializable()
class WsLoginEntity {
	String? type;
	@JSONField(name: "site_id")
	String? siteId;
	@JSONField(name: "client_name")
	String? clientName;
	String? oid;
	@JSONField(name: "game_type")
	String? gameType;
	@JSONField(name: "room_id")
	String? roomId;
	@JSONField(name: "table_id")
	String? tableId;

	WsLoginEntity();

	factory WsLoginEntity.fromJson(Map<String, dynamic> json) => $WsLoginEntityFromJson(json);

	Map<String, dynamic> toJson() => $WsLoginEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}

	factory WsLoginEntity.get({String? gameType,String? roomId,String? tableId}){
		var entity = WsLoginEntity();
		entity.siteId = "9000";
		entity.oid = AppData.user()?.oid ?? "";
		entity.clientName = AppData.user()?.username ?? SocketUtils().clientName;
		entity.type = "login";
		entity.gameType = gameType;
		entity.roomId = roomId;
		entity.tableId = tableId;
		return entity;
	}


}