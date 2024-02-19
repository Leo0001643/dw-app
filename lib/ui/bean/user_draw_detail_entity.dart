import 'package:json_annotation/json_annotation.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/generated/json/user_draw_detail_entity.g.dart';
import 'package:leisure_games/ui/bean/usdt_entity.dart';

@JsonSerializable()
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



	factory UserDrawDetailEntity.fromJson(Map<String, dynamic> json) => $UserDrawDetailEntityFromJson(json);

	Map<String, dynamic> toJson() => $UserDrawDetailEntityToJson(this);


}

@JsonSerializable()
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

	factory UserDrawDetailBanks.fromJson(Map<String, dynamic> json) => $UserDrawDetailBanksFromJson(json);

	Map<String, dynamic> toJson() => $UserDrawDetailBanksToJson(this);


	String info(){
		if(isEmpty(bankAccount)|| bankAccount!.em().length < 14 ){
			return "$bankName${isEmpty(bankAccount) ? "" : "（${bankAccount.em()}）"}";
		} else {
			return "$bankName（***${bankAccount!.substring(14)}）";
		}
	}
}

