import 'dart:convert';

import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/site_wallet_config_entity.g.dart';

export 'package:leisure_games/generated/json/site_wallet_config_entity.g.dart';

@JsonSerializable()
class SiteWalletConfigEntity {
	String? afterCur;
	int? allowTransfer;
	String? beforeCur;
	double? rate;
	int? siteId;
	String? walletType;

	SiteWalletConfigEntity();

	factory SiteWalletConfigEntity.fromJson(Map<String, dynamic> json) => $SiteWalletConfigEntityFromJson(json);

	Map<String, dynamic> toJson() => $SiteWalletConfigEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}