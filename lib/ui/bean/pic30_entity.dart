import 'dart:convert';

import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/pic30_entity.g.dart';

export 'package:leisure_games/generated/json/pic30_entity.g.dart';

@JsonSerializable()
class Pic30Entity {
	String? picurl;
	@JSONField(name: "link_type")
	String? linkType;
	String? link;
	@JSONField(name: "lang_type")
	String? langType;
	String? sortby;
	@JSONField(name: "link_out")
	String? linkOut;
	String? title;
	String? url;
	String? status;

	Pic30Entity();

	factory Pic30Entity.fromJson(Map<String, dynamic> json) => $Pic30EntityFromJson(json);

	Map<String, dynamic> toJson() => $Pic30EntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}