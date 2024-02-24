import 'dart:convert';

import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/wallet_draw_detail_entity.g.dart';
import 'package:leisure_games/ui/bean/usdt_channel_entity.dart';

export 'package:leisure_games/generated/json/wallet_draw_detail_entity.g.dart';

@JsonSerializable()
class WalletDrawDetailEntity {
	String? mobile;
	String? username;
	String? realName;
	int? isSetBankPwd;
	List<UsdtChannelEntity>? list;

	WalletDrawDetailEntity();

	factory WalletDrawDetailEntity.fromJson(Map<String, dynamic> json) => $WalletDrawDetailEntityFromJson(json);

	Map<String, dynamic> toJson() => $WalletDrawDetailEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}
