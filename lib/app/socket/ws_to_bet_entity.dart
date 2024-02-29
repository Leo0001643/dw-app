import 'dart:convert';

import 'package:common_utils/common_utils.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/socket/socket_utils.dart';
import 'package:leisure_games/app/socket/ws_bet_entity.dart';
import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/ws_to_bet_entity.g.dart';

export 'package:leisure_games/generated/json/ws_to_bet_entity.g.dart';

@JsonSerializable()
class WsToBetEntity {
	String? type;
	@JSONField(name: "client_name")
	String? clientName;
	@JSONField(name: "room_id")
	String? roomId;
	String? oid;
	@JSONField(name: "table_id")
	String? tableId;
	@JSONField(name: "site_id")
	String? siteId;
	@JSONField(name: "game_type")
	String? gameType;
	@JSONField(name: "now_term")
	String? nowTerm;
	String? moneyType;
	List<WsToBetContent>? content;

	WsToBetEntity();

	factory WsToBetEntity.fromJson(Map<String, dynamic> json) => $WsToBetEntityFromJson(json);

	Map<String, dynamic> toJson() => $WsToBetEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}


	factory WsToBetEntity.get({String? moneyType, String? nowTerm, List<WsBetContent>? betList,String? gameType,String? roomId,String? tableId}){
		var entity = WsToBetEntity();
		entity.siteId = "9000";
		entity.oid = AppData.user()?.oid ?? "";
		entity.clientName = AppData.user()?.username ?? SocketUtils().clientName;
		entity.type = "bet";
		entity.gameType = gameType;
		entity.roomId = roomId;
		entity.tableId = tableId;
		entity.moneyType = moneyType;
		entity.nowTerm = nowTerm;
		var list = List<WsToBetContent>.empty(growable: true);
		for (WsBetContent content in betList ?? []) {
			var betCon = WsToBetContent();
			///type单点类型固定位cao字
			///num为投注cao类型时的单点数字，只有当投注单点类型时有值，投注其他类型时传空字符串即可
			if(RegexUtil.matches(r'\d', content.a.em())){
				betCon.type = "cao";
				betCon.num = content.a.em();
			} else {
				betCon.type = content.a;
				betCon.num = "";
			}
			betCon.money = content.c;
			betCon.odds = content.d;
			betCon.odds1314 = content.e.em();
			// betCon.odds1314 = content.contentMap[""] ?? "";
			// map["msg"] = content.play ?? "";
			list.add(betCon);
		}
		entity.content = list;
		return entity;
	}


}

@JsonSerializable()
class WsToBetContent {
	String? money;
	String? num;
	String? odds;
	@JSONField(name: "odds_1314")
	String? odds1314;
	String? type;

	WsToBetContent();

	factory WsToBetContent.fromJson(Map<String, dynamic> json) => $WsToBetContentFromJson(json);

	Map<String, dynamic> toJson() => $WsToBetContentToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}