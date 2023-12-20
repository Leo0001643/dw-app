import 'dart:convert';

import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/usdt_channel_entity.g.dart';

export 'package:leisure_games/generated/json/usdt_channel_entity.g.dart';

@JsonSerializable()
class UsdtChannelEntity {
	String? mobile;
	String? account;
	String? type;
	int? status;

	UsdtChannelEntity();

	factory UsdtChannelEntity.fromJson(Map<String, dynamic> json) => $UsdtChannelEntityFromJson(json);

	Map<String, dynamic> toJson() => $UsdtChannelEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}

	// if (type.contains("TRC20")) return "1"
	// if (type.contains("ERC20")) return "2"
	// if (type.contains("OMNI")) return "3"
	String typeName(){
		if(type?.contains("TRC20") == true){
			return Intr().trc20_show;
		} else if(type?.contains("ERC20") == true){
			return Intr().erc20_show;
		} else if(type?.contains("OMNI") == true){
			return Intr().omni_show;
		} else {
			return "";
		}
	}

	//协议类型【1:TRC20,2:ERC20,3:OMNI】
	int typeId(){
		if(type?.contains("TRC20") == true){
			return 1;
		} else if(type?.contains("ERC20") == true){
			return 2;
		} else if(type?.contains("OMNI") == true){
			return 3;
		} else {
			return 1;
		}
	}


}