import 'dart:convert';

import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/payment_channel_entity.g.dart';
import 'package:leisure_games/ui/bean/jump_payment_entity.dart';

export 'package:leisure_games/generated/json/payment_channel_entity.g.dart';

@JsonSerializable()
class PaymentChannelEntity {
	List<JumpPaymentEntity>? jumpPayment;
	List<PaymentChannelBankSet>? bankSet;

	PaymentChannelEntity();

	factory PaymentChannelEntity.fromJson(Map<String, dynamic> json) => $PaymentChannelEntityFromJson(json);

	Map<String, dynamic> toJson() => $PaymentChannelEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PaymentChannelBankSet {
	int? id;
	int? bankId;
	String? cardNumber;
	String? cardUsername;
	dynamic controlCardName;
	dynamic viewCardName;
	String? bankBranch;
	String? bankName;
	String? bankCode;
	dynamic bankUrl;
	String? moneyQuick;
	double? rate;
	String? pic;
	String? payUrl;
	String? qrcodeLogo;
	dynamic payTip;
	String? payMarks;
	dynamic marksColor;

	PaymentChannelBankSet();

	factory PaymentChannelBankSet.fromJson(Map<String, dynamic> json) => $PaymentChannelBankSetFromJson(json);

	Map<String, dynamic> toJson() => $PaymentChannelBankSetToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}