import 'dart:async';

import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/res/game_request.dart';
import 'package:leisure_games/app/res/game_response.dart';
import 'package:leisure_games/app/res/request/login_request.dart';
import 'package:leisure_games/app/res/request/msg_gif_request.dart';
import 'package:leisure_games/app/res/request/msg_pic_request.dart';
import 'package:leisure_games/app/res/request/sumbit_bet_request.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/ws_game_odds_server.dart';
import 'package:leisure_games/ui/main/socket/app/app_inst.dart';
import 'package:leisure_games/ui/main/socket/app/service/isolate_service.dart';
import 'package:leisure_games/ui/main/socket/app/ws_main_service.dart';
import 'package:leisure_games/ui/main/socket/game_isolate.dart';

class GameResultData {
  dynamic entity;
  int code;
  String msg;
  int tableId;
  int serviceTypeId;

  GameResultData(
      {this.entity,
      this.code = 0,
      this.msg = "",
      this.tableId = 0,
      this.serviceTypeId = 1});
}

/// 数据服务中心
/// 提供请求接口，接受并处理响应数据
class GameDataServiceCenter {
  static final GameDataServiceCenter _singleInstance =
      GameDataServiceCenter._internal();

  static GameDataServiceCenter get instance => GameDataServiceCenter();

  factory GameDataServiceCenter() {
    return _singleInstance;
  }

  GameDataServiceCenter._internal() {
    // 开启网络监听
    // _startNetworkMonitor();
  }

  /// 网络状态判断不正确，更改监控Socket State
  Future<bool> checkNetWorkState() async {
    return true;
  }

  void startConnection({Function? onConnected}) async {
    GameIsolate.instance.startConnection(onConnected: onConnected);
  }

  void stopConnection() {
    GameIsolate.instance.stopConnection();
  }
  void wSLogin({String? table_id,String? room_id,String? game_type}) async{
    WsLoginRequest loginRequest=WsLoginRequest(table_id:table_id,room_id:room_id,game_type:game_type);
    GameResponse response = await requestData(loginRequest);
  }

  void wSBet({String? table_id,String? room_id,String? game_type,  String? moneyType,
    String? nowTerm,
    List<OddsContent>? betList}) async{

    SubmitBetRequest loginRequest=SubmitBetRequest(table_id:table_id,room_id:room_id,game_type:game_type,moneyType:moneyType,nowTerm:nowTerm,betList:betList);
    GameResponse response = await requestData(loginRequest);

  }

  void sumbitBet({String? table_id,String? room_id,String? game_type}) async{
    WsLoginRequest loginRequest=WsLoginRequest(table_id:table_id,room_id:room_id,game_type:game_type);
    GameResponse response = await requestData(loginRequest);

  }

  void submitBullet({String? table_id,String? room_id,String? game_type,String? msg}) async{
    GameRequest msgRequest;
    if(msg.isUrl()){
      msgRequest = WsMsgGifRequest(table_id: table_id,room_id: room_id,game_type: game_type,msg: [msg.em()]);
    }else {
      msgRequest = WsMsgPicRequest(table_id: table_id,room_id: room_id,game_type: game_type,msg: [msg.em()]);
    }
    GameResponse response = await requestData(msgRequest);
    // loggerArray(['发送弹幕返回结果',response.code,response.msg,response.type]);
  }


  /// 统一请求函数，方便调整内部逻辑
  Future<GameResponse> requestData(GameRequest request) async {
    //
    IsolateService? serv = AppInst.gameIsolate.mainService();
    if (serv != null && serv is WSMainService) {
      GameResponse response = await serv.sendRequest(request);
      int currentTime = DateTime.now().millisecondsSinceEpoch;
      return response;
    }
    return GameResponse.errResponse();
  }

}
