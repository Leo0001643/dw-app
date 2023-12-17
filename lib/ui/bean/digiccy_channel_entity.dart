import 'dart:convert';

import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/digiccy_channel_entity.g.dart';

export 'package:leisure_games/generated/json/digiccy_channel_entity.g.dart';

@JsonSerializable()
class DigiccyChannelEntity {
	double? moneyDown;
	double? moneyUp;
	List<DigiccyChannelWallet>? wallet;

	DigiccyChannelEntity();

	factory DigiccyChannelEntity.fromJson(Map<String, dynamic> json) => $DigiccyChannelEntityFromJson(json);

	Map<String, dynamic> toJson() => $DigiccyChannelEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class DigiccyChannelWallet {
	String? protocol;
	String? address;
	int? sequence;

	DigiccyChannelWallet();

	factory DigiccyChannelWallet.fromJson(Map<String, dynamic> json) => $DigiccyChannelWalletFromJson(json);

	Map<String, dynamic> toJson() => $DigiccyChannelWalletToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}