import 'dart:convert';

import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/user_detail_entity.g.dart';

export 'package:leisure_games/generated/json/user_detail_entity.g.dart';

@JsonSerializable()
class UserDetailEntity {
	String? email;
	String? mobile;
	String? qq;
	String? wechat;
	String? username;
	String? realName;
	String? alias;
	int? aliasCount;
	int? siteId;

	UserDetailEntity();

	factory UserDetailEntity.fromJson(Map<String, dynamic> json) => $UserDetailEntityFromJson(json);

	Map<String, dynamic> toJson() => $UserDetailEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}