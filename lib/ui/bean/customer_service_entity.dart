import 'dart:convert';

import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/customer_service_entity.g.dart';

export 'package:leisure_games/generated/json/customer_service_entity.g.dart';

@JsonSerializable()
class CustomerServiceEntity {
	String? name;
	dynamic config;
	String? type;
	String? image;
	String? comments;
	List<CustomerServiceCusterServers>? custerServers;

	CustomerServiceEntity();

	factory CustomerServiceEntity.fromJson(Map<String, dynamic> json) => $CustomerServiceEntityFromJson(json);

	Map<String, dynamic> toJson() => $CustomerServiceEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class CustomerServiceCusterServers {
	String? name;
	String? number;
	String? image;
	String? numberClass;
	dynamic marks;
	String? url;
	String? email;
	int? isDefault;
	int? sort;
	int? addTime;

	CustomerServiceCusterServers();

	factory CustomerServiceCusterServers.fromJson(Map<String, dynamic> json) => $CustomerServiceCusterServersFromJson(json);

	Map<String, dynamic> toJson() => $CustomerServiceCusterServersToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}