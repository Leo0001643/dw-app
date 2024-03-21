import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/base_api_oss_entity.g.dart';
import 'dart:convert';
export 'package:leisure_games/generated/json/base_api_oss_entity.g.dart';

@JsonSerializable()
class BaseApiOssEntity {
	List<String>? baseAPIs;
	List<String>? webSockets;
	List<String>? dns;

	BaseApiOssEntity();

	factory BaseApiOssEntity.fromJson(Map<String, dynamic> json) => $BaseApiOssEntityFromJson(json);

	Map<String, dynamic> toJson() => $BaseApiOssEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}