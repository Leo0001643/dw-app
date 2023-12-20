import 'dart:convert';

import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/user_draw_detail_entity.g.dart';

export 'package:leisure_games/generated/json/user_draw_detail_entity.g.dart';

@JsonSerializable()
class UserDrawDetailEntity {
	String? mobile;
	String? realname;
	String? username;
	int? isSetBankPwd;
	List<UserDrawDetailBanks>? banks;
	List<UserDrawDetailBanks>? dcBanks;

	UserDrawDetailEntity();

	factory UserDrawDetailEntity.fromJson(Map<String, dynamic> json) => $UserDrawDetailEntityFromJson(json);

	Map<String, dynamic> toJson() => $UserDrawDetailEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserDrawDetailBanks {
	int? cardNumber;
	String? bankAccount;
	String? bankAddress;
	int? bankId;
	String? bankName;
	int? bankStatus;

	UserDrawDetailBanks({this.bankName});

	factory UserDrawDetailBanks.fromJson(Map<String, dynamic> json) => $UserDrawDetailBanksFromJson(json);

	Map<String, dynamic> toJson() => $UserDrawDetailBanksToJson(this);

	@override
	String toString() {
		return bankName.toString();
	}
	
	String info(){
		if(isEmpty(bankAccount)|| bankAccount!.em().length < 14 ){
			return "$bankName${isEmpty(bankAccount) ? "" : "（${bankAccount.em()}）"}";
		} else {
			return "$bankName（${bankAccount!.substring(14)}）";
		}
	}
	
	
}
