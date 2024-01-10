import 'package:leisure_games/ui/bean/usdt_entity.dart';

import '../../app/global.dart';

class UserDrawDetailEntity {
	List<UserDrawDetailBanks> banks;
	List<UsdtEntity> dcBanks;
	int? isSetBankPwd;
	String? mobile;
	String? realname;
	String? username;

	UserDrawDetailEntity({
		this.banks = const [],
		this.dcBanks = const [],
		this.isSetBankPwd,
		this.mobile,
		this.realname,
		this.username,
	});

	factory UserDrawDetailEntity.fromJson(Map<String, dynamic> json) {
		return UserDrawDetailEntity(
			banks: List<UserDrawDetailBanks>.from(
				json['banks'].map((bank) => UserDrawDetailBanks.fromJson(bank)),
			),
			dcBanks: List<UsdtEntity>.from(
				json['dcBanks'].map((usdtEntity) => UsdtEntity.fromJson(usdtEntity)),
			),
			isSetBankPwd: json['isSetBankPwd'],
			mobile: json['mobile'],
			realname: json['realname'],
			username: json['username'],
		);
	}
}

class UserDrawDetailBanks {
	String? bankAccount;
	String? bankAddress;
	int? bankId;
	String? bankName;
	int? bankStatus;
	int? cardNumber;

	UserDrawDetailBanks({
		this.bankAccount,
		this.bankAddress,
		this.bankId,
		this.bankName,
		this.bankStatus,
		this.cardNumber,
	});

	factory UserDrawDetailBanks.fromJson(Map<String, dynamic> json) {
		return UserDrawDetailBanks(
			bankAccount: json['bankAccount'],
			bankAddress: json['bankAddress'],
			bankId: json['bankId'],
			bankName: json['bankName'],
			bankStatus: json['bankStatus'],
			cardNumber: json['cardNumber'],
		);
	}
	String info(){
		if(isEmpty(bankAccount)|| bankAccount!.em().length < 14 ){
			return "$bankName${isEmpty(bankAccount) ? "" : "（${bankAccount.em()}）"}";
		} else {
			return "$bankName（${bankAccount!.substring(14)}）";
		}
	}
}

