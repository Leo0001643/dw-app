import 'dart:convert';

import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/socket_base_entity.g.dart';

export 'package:leisure_games/generated/json/socket_base_entity.g.dart';

@JsonSerializable()
class SocketBaseEntity {
	String? type;

	SocketBaseEntity({this.type});

	factory SocketBaseEntity.fromJson(Map<String, dynamic> json) => $SocketBaseEntityFromJson(json);

	Map<String, dynamic> toJson() => $SocketBaseEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}