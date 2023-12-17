import 'dart:convert';

import 'package:leisure_games/generated/json/back_water_desc_entity.g.dart';
import 'package:leisure_games/generated/json/base/json_field.dart';

export 'package:leisure_games/generated/json/back_water_desc_entity.g.dart';

@JsonSerializable()
class BackWaterDescEntity {
	String? name;
	@JSONField(name: "lang_type")
	String? langType;
	String? content;
	String? url;

	BackWaterDescEntity();

	factory BackWaterDescEntity.fromJson(Map<String, dynamic> json) => $BackWaterDescEntityFromJson(json);

	Map<String, dynamic> toJson() => $BackWaterDescEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}