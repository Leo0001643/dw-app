import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/pic30_back_entity.g.dart';
import 'dart:convert';
export 'package:leisure_games/generated/json/pic30_back_entity.g.dart';

@JsonSerializable()
class Pic30BackEntity {
	Pic30BackBack? back;
	Pic30BackBack? logo;
	String? url;

	Pic30BackEntity();

	factory Pic30BackEntity.fromJson(Map<String, dynamic> json) => $Pic30BackEntityFromJson(json);

	Map<String, dynamic> toJson() => $Pic30BackEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class Pic30BackBack {
	String? name;
	@JSONField(name: "lang_type")
	String? langType;
	String? tag;
	String? position;
	@JSONField(name: "pic_url")
	String? picUrl;
	String? type;
	String? status;

	Pic30BackBack();

	factory Pic30BackBack.fromJson(Map<String, dynamic> json) => $Pic30BackBackFromJson(json);

	Map<String, dynamic> toJson() => $Pic30BackBackToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}
