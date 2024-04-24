import 'dart:convert';

import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/config_manager.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/socket/socket_utils.dart';
import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/ws_message_send_entity.g.dart';

export 'package:leisure_games/generated/json/ws_message_send_entity.g.dart';

@JsonSerializable()
class WsMessageSendEntity {
	String? type;
	@JSONField(name: "client_name")
	String? clientName;
	@JSONField(name: "room_id")
	String? roomId;
	String? oid;
	@JSONField(name: "table_id")
	String? tableId;
	@JSONField(name: "site_id")
	String? siteId;
	@JSONField(name: "game_type")
	String? gameType;
	List<String>? msg;

	WsMessageSendEntity();

	factory WsMessageSendEntity.fromJson(Map<String, dynamic> json) => $WsMessageSendEntityFromJson(json);

	Map<String, dynamic> toJson() => $WsMessageSendEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}

	factory WsMessageSendEntity.get({String? type,List<String>? msg,String? gameType,String? roomId,String? tableId}){
		var entity = WsMessageSendEntity();
		entity.siteId = ConfigManager.siteid();
		entity.oid = AppData.user()?.oid.em();
		entity.clientName = AppData.user()?.username ?? SocketUtils().clientName;
		entity.type = type;
		entity.gameType = gameType;
		entity.roomId = roomId;
		entity.tableId = tableId;
		entity.msg = msg;
		return entity;
	}



}