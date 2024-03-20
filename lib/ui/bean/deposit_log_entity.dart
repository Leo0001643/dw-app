import 'dart:convert';

import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/deposit_log_entity.g.dart';

export 'package:leisure_games/generated/json/deposit_log_entity.g.dart';

@JsonSerializable()
class DepositLogEntity {
	int? addTime;
	String? bankName;
	String? billno;
	String? currency;
	int? money;
	int? status;

	DepositLogEntity();

	factory DepositLogEntity.fromJson(Map<String, dynamic> json) => $DepositLogEntityFromJson(json);

	Map<String, dynamic> toJson() => $DepositLogEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}

	///状态[1:成功,2:处理中,3:已取消]
	String statusText(){
		switch(status){
			case 1:
				return Intr().chenggong;
			case 2:
				return Intr().chulizhong;
			case 3:
				return Intr().yiquxiao;
			default:
				return "";
		}
	}



}