import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/login_user_entity.g.dart';
import 'dart:convert';
export 'package:leisure_games/generated/json/login_user_entity.g.dart';

@JsonSerializable()
class LoginUserEntity {
	int? logintime;
	String? agent;
	String? topUsername;
	int? ulevel;
	int? moneyStatus;
	String? oid;
	String? corprator;
	int? expireat;
	String? realname;
	String? alias;
	String? avatar;
	int? lastLoginTime;
	String? world;
	String? loginip;
	int? deposit;
	int? freeTran;
	int? id;
	int? userType;
	int? grade;
	String? gradeName;
	String? username;
	int? mustChangePw;
	String? currency;
	dynamic language;
	@JSONField(name: "super")
	String? superName;
	int? upoints;

	LoginUserEntity();

	factory LoginUserEntity.fromJson(Map<String, dynamic> json) => $LoginUserEntityFromJson(json);

	Map<String, dynamic> toJson() => $LoginUserEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}