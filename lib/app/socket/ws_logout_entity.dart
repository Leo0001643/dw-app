import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/ws_logout_entity.g.dart';
import 'dart:convert';
export 'package:leisure_games/generated/json/ws_logout_entity.g.dart';

@JsonSerializable()
class WsLogoutEntity {
	String? type;
	@JSONField(name: "from_client_id")
	String? fromClientId;
	@JSONField(name: "client_name")
	String? clientName;
	String? time;
	String? reason;

	WsLogoutEntity();

	factory WsLogoutEntity.fromJson(Map<String, dynamic> json) => $WsLogoutEntityFromJson(json);

	Map<String, dynamic> toJson() => $WsLogoutEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}