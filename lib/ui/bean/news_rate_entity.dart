import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/news_rate_entity.g.dart';
import 'dart:convert';
export 'package:leisure_games/generated/json/news_rate_entity.g.dart';

@JsonSerializable()
class NewsRateEntity {
	String? name;
	@JSONField(name: "lang_type")
	String? langType;
	String? content;
	String? url;

	NewsRateEntity();

	factory NewsRateEntity.fromJson(Map<String, dynamic> json) => $NewsRateEntityFromJson(json);

	Map<String, dynamic> toJson() => $NewsRateEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}




}