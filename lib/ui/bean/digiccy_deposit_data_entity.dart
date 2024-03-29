import 'dart:convert';

import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/digiccy_deposit_data_entity.g.dart';

export 'package:leisure_games/generated/json/digiccy_deposit_data_entity.g.dart';

@JsonSerializable()
class DigiccyDepositDataEntity {
	String? date;
	String? info;
	int? money;
	String? orderId;
	String? status;
	String? remitName;
	String? symbol;

	DigiccyDepositDataEntity({this.date,this.info,this.money,this.orderId,this.status});

	factory DigiccyDepositDataEntity.fromJson(Map<String, dynamic> json) => $DigiccyDepositDataEntityFromJson(json);

	Map<String, dynamic> toJson() => $DigiccyDepositDataEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}