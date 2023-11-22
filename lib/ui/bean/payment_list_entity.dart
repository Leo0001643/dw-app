import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/payment_list_entity.g.dart';
import 'dart:convert';
export 'package:leisure_games/generated/json/payment_list_entity.g.dart';

@JsonSerializable()
class PaymentListEntity {
	List<PaymentListBanks>? banks;

	PaymentListEntity();

	factory PaymentListEntity.fromJson(Map<String, dynamic> json) => $PaymentListEntityFromJson(json);

	Map<String, dynamic> toJson() => $PaymentListEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PaymentListBanks {
	int? id;
	String? bankCode;
	String? bankName;
	String? icon;

	PaymentListBanks({this.bankName,this.icon,this.bankCode,this.id});

	factory PaymentListBanks.fromJson(Map<String, dynamic> json) => $PaymentListBanksFromJson(json);

	Map<String, dynamic> toJson() => $PaymentListBanksToJson(this);

	@override
	String toString() {
		return bankName.em();
	}
}