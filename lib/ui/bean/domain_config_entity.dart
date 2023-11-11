import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/domain_config_entity.g.dart';
import 'dart:convert';
export 'package:leisure_games/generated/json/domain_config_entity.g.dart';

@JsonSerializable()
class DomainConfigEntity {
	List<String>? agDomain;
	List<String>? frontDomain;

	DomainConfigEntity();

	factory DomainConfigEntity.fromJson(Map<String, dynamic> json) => $DomainConfigEntityFromJson(json);

	Map<String, dynamic> toJson() => $DomainConfigEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}