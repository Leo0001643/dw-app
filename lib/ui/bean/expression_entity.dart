import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/expression_entity.g.dart';
import 'dart:convert';
export 'package:leisure_games/generated/json/expression_entity.g.dart';

@JsonSerializable()
class ExpressionEntity {
	String? type;
	String? typeImgUrl;
	List<String>? images;

	ExpressionEntity();

	factory ExpressionEntity.fromJson(Map<String, dynamic> json) => $ExpressionEntityFromJson(json);

	Map<String, dynamic> toJson() => $ExpressionEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}