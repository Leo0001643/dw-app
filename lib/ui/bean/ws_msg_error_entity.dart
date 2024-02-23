import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/ws_msg_error_entity.g.dart';
import 'dart:convert';
export 'package:leisure_games/generated/json/ws_msg_error_entity.g.dart';

@JsonSerializable()
class WsMsgErrorEntity {
	String? showMessage;
	String? nickname;
	String? avatar;
	String? type;
	String? username;
	int? status;

	WsMsgErrorEntity();

	factory WsMsgErrorEntity.fromJson(Map<String, dynamic> json) => $WsMsgErrorEntityFromJson(json);

	Map<String, dynamic> toJson() => $WsMsgErrorEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}