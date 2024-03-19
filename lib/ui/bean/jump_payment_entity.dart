import 'dart:convert';

import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/jump_payment_entity.g.dart';

export 'package:leisure_games/generated/json/jump_payment_entity.g.dart';

@JsonSerializable()
class JumpPaymentEntity {
	double? moneyUp;
	int? moneyDown;
	int? id;
	dynamic fixedMoney;
	String? moneyQuick;
	String? mark;
	int? marksColor;
	double? rate;
	List<JumpPaymentBanks>? banks;

	JumpPaymentEntity();

	factory JumpPaymentEntity.fromJson(Map<String, dynamic> json) => $JumpPaymentEntityFromJson(json);

	Map<String, dynamic> toJson() => $JumpPaymentEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class JumpPaymentBanks {
	int? id;
	String? bankCode;
	String? bankCodePic;
	String? name;
	String? onlineName;

	JumpPaymentBanks();

	factory JumpPaymentBanks.fromJson(Map<String, dynamic> json) => $JumpPaymentBanksFromJson(json);

	Map<String, dynamic> toJson() => $JumpPaymentBanksToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}