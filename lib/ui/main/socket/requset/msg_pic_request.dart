
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/constants.dart';

import '../../../../app/res/game_request.dart';

class WsMsgPicRequest extends GameRequest {
  String? table_id;
  String? room_id;
  String? game_type;
  List<String>? msg;

  WsMsgPicRequest({this.table_id,this.room_id,this.game_type,this.msg})
      : super("msg_send_pic");

  @override
  Map<String, dynamic>? requestParams() {
    Map<String, dynamic> params = <String, dynamic>{};
    params["table_id"] = table_id; // 房间id
    params["game_type"] = game_type; // 房间id
    params["room_id"] = room_id; // 房间id
    params["msg"] = msg; // 消息内容
    params["oid"] =  AppData.user()?.oid??"";
    params["client_name"] =  AppData.user()?.username??"";
    params["site_id"] =  "9000";
    params["terminal"] =  "APP";
    params["version"] =  Constants.version();

    return params;
  }


}