import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/ws_bet_entity.g.dart';
import 'dart:convert';
export 'package:leisure_games/generated/json/ws_bet_entity.g.dart';

@JsonSerializable()
class WsBetEntity {
	String? moneyType;
	String? nickname;
	String? term;
	String? avatar;
	int? time;
	String? type;
	List<WsBetContent>? content;
	String? username;
	int? status;

	WsBetEntity();

	factory WsBetEntity.fromJson(Map<String, dynamic> json) => $WsBetEntityFromJson(json);

	Map<String, dynamic> toJson() => $WsBetEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class WsBetContent {
	@JSONField(name: "A")
	String? a;//投注类型
	@JSONField(name: "B")
	String? b;//单点数字
	@JSONField(name: "C")
	String? c;//投注金额
	@JSONField(name: "D")
	String? d;//常规赔率
	@JSONField(name: "E")
	String? e;//特殊赔率

	WsBetContent();

	factory WsBetContent.fromJson(Map<String, dynamic> json) => $WsBetContentFromJson(json);

	Map<String, dynamic> toJson() => $WsBetContentToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}