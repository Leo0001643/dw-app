
import 'dart:convert';
import 'dart:isolate';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/socket/isolate_msg_entity.dart';
import 'package:leisure_games/app/socket/ws_bet_entity.dart';
import 'package:leisure_games/app/socket/ws_login_entity.dart';
import 'package:leisure_games/app/socket/ws_logout_entity.dart';
import 'package:leisure_games/app/socket/ws_lottery_entity.dart';
import 'package:leisure_games/app/socket/ws_message_get_entity.dart';
import 'package:leisure_games/app/socket/ws_message_send_entity.dart';
import 'package:leisure_games/app/socket/ws_msg_error_entity.dart';
import 'package:leisure_games/app/socket/ws_to_bet_entity.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/ui/main/home/game_room/game_room_logic.dart';
import 'package:sprintf/sprintf.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/web_socket_channel.dart';

/// Author: Soushin
/// Date: 2024/2/26 16:53
/// Description: websocket长连接处理
/// 932707629@qq.com
///
class SocketUtils{

  SocketUtils._internal();

  static SocketUtils? instance;

  static getInstance() {
    instance ??= SocketUtils._internal();
    return instance;
  }

  factory SocketUtils() => getInstance();

  Isolate? isolate;

  SendPort? mainSendPort;
  SendPort? childSendPort;
  ///长连接状态
  bool isConnect = false;
  ///游客用户名生成
  String clientName = "#${DataUtils.buildClientName(5)}";

  void connect({Function? callback}) async {
    ReceivePort receivePort = ReceivePort();
    mainSendPort = receivePort.sendPort;
    isolate = await Isolate.spawn(isolateMain, mainSendPort!);
    receivePort.listen((message) {
      loggerArray(["收到来自子Isolate的消息",message]);
      if(message is String){
        var msg = IsolateMsgEntity.fromJson(jsonDecode(message));
        switch(msg.key){
          case "connected":
            loggerArray(["长连接连接成功"]);
            isConnect = true;
            callback?.call();
            break;
        }
      } else if(message is SendPort){
        childSendPort = message;
      } else if(message is WSLotteryEntity){
        try{
          Get.find<GameRoomLogic>().handleLottery(message);
        }catch(e){ logger(e); }
      } else if(message is WsBetEntity){
        try{
          Get.find<GameRoomLogic>().handleBetResult(message);
        }catch(e){ logger(e); }
      } else if(message is WsLogoutEntity){
        if(!AppData.isLogin()){
          showToast(message.reason.em());
          Get.until((ModalRoute.withName(Routes.main)));
          Get.toNamed(Routes.login);
        }
      } else if(message is WsMessageGetEntity){
        try{
          Get.find<GameRoomLogic>().handleMsgGetPic(message);
        }catch(e){ logger(e); }
      } else if(message is WsMsgErrorEntity){
        showToast(message.showMessage.em());
      }
    });
  }

  ///登录房间
  void loginRoom(String gameType,String roomId,String tableId){
    loggerArray(["开始登录房间",isConnect,gameType,roomId,tableId]);
    if(isConnect){
      var json = jsonEncode(WsLoginEntity.get(gameType: gameType,roomId: roomId,tableId: tableId).toJson());
      childSendPort?.send(buildMessage("login",value: json));
    }
  }

  ///切换房间-重新登录
  void changeRoom(String gameType,String roomId,String tableId){
    loggerArray(["切换房间-重新登录房间",isConnect,gameType,roomId,tableId]);
    SocketUtils().destroy();
    Future.delayed(const Duration(milliseconds: 200),(){
      SocketUtils().connect(callback: (){
        SocketUtils().loginRoom(gameType, roomId, tableId);
      });
    });
  }

  void sendMessage(dynamic msg,String gameType,String roomId,String tableId){
    loggerArray(["发送聊天消息",isConnect,msg,gameType,roomId,tableId]);
    if(isConnect){
      if(msg is String){///gif图
        var json = jsonEncode(WsMessageSendEntity.get(type: "msg_send_gif",msg: [msg],gameType: gameType,roomId: roomId,tableId: tableId));
        childSendPort?.send(buildMessage("msg_send_gif",value: json));
      }else {
        var json = jsonEncode(WsMessageSendEntity.get(type: "msg_send_pic",msg: msg,gameType: gameType,roomId: roomId,tableId: tableId));
        childSendPort?.send(buildMessage("msg_send_pic",value: json));
      }
    }
  }

  void toBet(String? moneyType, String? nowTerm, List<WsBetContent> betList,String gameType,String roomId,String tableId){
    loggerArray(["发送投注消息",isConnect,moneyType,nowTerm,betList,gameType,roomId,tableId]);
    if(isConnect){
      var json = jsonEncode(WsToBetEntity.get(moneyType: moneyType,nowTerm: nowTerm,betList: betList,gameType: gameType,roomId: roomId,tableId: tableId));
      childSendPort?.send(buildMessage("bet",value: json));
    }
  }


  void destroy(){
    childSendPort?.send(buildMessage("close"));
    isConnect = false;
    Future.delayed(const Duration(milliseconds: 100),(){
      childSendPort = null;
      mainSendPort = null;
      // ///立即停止异步任务
      isolate?.kill(priority: Isolate.immediate);
      isolate = null;
    });
  }


  ///异步任务工作区
  static void isolateMain(SendPort sendPort) {
    // sendPort.send('Message from child Isolate');
    var url = sprintf(AppData.baseWsUrl(),[Intr().currentLocale().languageCode]);
    WebSocketChannel channel = WebSocketChannel.connect(Uri.parse(url));
    channel.ready.then((value) {
      sendPort.send(buildMessage("connected"));
    });
    channel.stream.listen((event) {
      loggerArray(["异步任务收到长连接消息",event]);
      if(event is String){
        var json = jsonDecode(event);
        switch(json["type"]){
          case "lottery":
            var result = WSLotteryEntity.fromJson(json);
            sendPort.send(result);
            break;
          case "ping":
            channel.sink.add({"type":"pong"});
            break;
          case "bet_result":
            var result = WsBetEntity.fromJson(json);
            if(result.status == 10000){
              sendPort.send(result);
            }else {
              var error = WsMsgErrorEntity.fromJson(json);
              sendPort.send(error);
            }
            break;
          case "logout":
            var result = WsLoginEntity.fromJson(json);
            sendPort.send(result);
            break;
          case "msg_get_pic":
          case "msg_get_gif":
          var result = WsMessageGetEntity.fromJson(json);
          if(result.status == 10000){
              sendPort.send(result);
            }else {
              var error = WsMsgErrorEntity.fromJson(json);
              sendPort.send(error);
            }
            break;
        }
      }
    });

    ReceivePort receivePort = ReceivePort();
    sendPort.send(receivePort.sendPort);
    receivePort.listen((message) {
      loggerArray(["收到来自主Isolate的消息",message]);
      var msg = IsolateMsgEntity.fromJson(jsonDecode(message));
      switch(msg.key){
        case "login":
          channel.sink.add(msg.value);
          loggerArray(["长连接开始登录房间",msg.toJson()]);
          break;
        case "msg_send_pic":
        case "msg_send_gif":
          channel.sink.add(msg.value);
          loggerArray(["长连接发送聊天消息",msg.toJson()]);
          break;
        case "bet":
          channel.sink.add(msg.value);
          loggerArray(["长连接发送投注消息",msg.toJson()]);
          break;
        case "close":
          channel.sink.close(status.goingAway);
          logger("已关闭长连接");
          break;
      }
    });

  }


  static String buildMessage(String key,{String? value}){
    return jsonEncode(IsolateMsgEntity(key: key,value: value).toJson());
  }





}



