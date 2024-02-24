import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/ws_game_odds_server.dart';

import '../game_request.dart';

class SubmitBetRequest extends GameRequest {
  String? table_id;
  String? room_id;

  String? game_type;
  String? moneyType;
  String? nowTerm;
  List<OddsContent>? betList;

  SubmitBetRequest(
      {this.table_id,
      this.room_id,
      this.game_type,
      this.moneyType,
      this.nowTerm,
      this.betList})
      : super("bet");

  @override
  Map<String, dynamic>? requestParams() {
    Map<String, dynamic> params = <String, dynamic>{};
    params["type"] = "bet"; // 房间id
    params["site_id"] = "9000";
    params["client_name"] = AppData.user()?.username ?? "";
    params["oid"] = AppData.user()?.oid ?? "";
    params["game_type"] = game_type; // 房间id
    params["room_id"] = room_id; // 房间id
    params["table_id"] = table_id; // 房间id
    params["moneyType"] = moneyType; // 房间id
    params["now_term"] = nowTerm; // 房间id
    List<Map<String, String>> contentList = [];
    for (OddsContent content in betList ?? []) {
      Map<String, String> map = {};
      map["type"] = content.type ?? "";
      map["money"] = "${content.money}";
      map["num"] = content.contentMap["Key_Num"] ?? "";
      map["odds"] = content.contentMap["Key_Odds"] ?? "";
      map["odds_1314"] = content.contentMap[""] ?? "";
      map["msg"] = content.play ?? "";
      contentList.add(map);
    }
    params["content"] = contentList;
    return params;
  }
}
