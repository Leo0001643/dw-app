import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/login_game_agent_entity.g.dart';
import 'dart:convert';
export 'package:leisure_games/generated/json/login_game_agent_entity.g.dart';

@JsonSerializable()
class LoginGameAgentEntity {
	String? platformURL;
	int? lid;
	String? clientType;
	LoginGameAgentParams? params;
	List<String>? url;

	LoginGameAgentEntity();

	factory LoginGameAgentEntity.fromJson(Map<String, dynamic> json) => $LoginGameAgentEntityFromJson(json);

	Map<String, dynamic> toJson() => $LoginGameAgentEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class LoginGameAgentParams {
	String? r;
	String? param;
	String? encrypt;

	LoginGameAgentParams();

	factory LoginGameAgentParams.fromJson(Map<String, dynamic> json) => $LoginGameAgentParamsFromJson(json);

	Map<String, dynamic> toJson() => $LoginGameAgentParamsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}