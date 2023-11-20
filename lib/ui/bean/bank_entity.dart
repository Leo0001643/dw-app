import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/bank_entity.g.dart';
import 'dart:convert';
export 'package:leisure_games/generated/json/bank_entity.g.dart';

@JsonSerializable()
class BankEntity {
	int? id;
	String? bankName;
	String? bankCode;
	String? bankUrl;
	int? status;
	int? orderid;

	BankEntity();

	factory BankEntity.fromJson(Map<String, dynamic> json) => $BankEntityFromJson(json);

	Map<String, dynamic> toJson() => $BankEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}