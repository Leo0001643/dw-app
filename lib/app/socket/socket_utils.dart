
import 'dart:convert';
import 'dart:isolate';

import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/socket/isolate_msg_entity.dart';
import 'package:leisure_games/app/socket/ws_login_entity.dart';
import 'package:sprintf/sprintf.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

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
            isConnect = false;
            callback?.call();
            break;
        }
      }else {
        childSendPort = message;
      }
    });
  }
  
  void loginRoom(String gameType,String roomId,String tableId){
    loggerArray(["开始登录房间",isConnect,gameType,roomId,tableId]);
    if(isConnect){
      var json = jsonEncode(WsLoginEntity.get(gameType: gameType,roomId: roomId,tableId: tableId).toJson());
      childSendPort?.send(buildMessage("login",value: json));
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
    });
  }


  ///异步任务工作区
  static void isolateMain(SendPort sendPort) {
    // sendPort.send('Message from child Isolate');
    var url = sprintf(Constants.websocket,[Intr().currentLocale().languageCode]);
    WebSocketChannel channel = WebSocketChannel.connect(Uri.parse(url));
    channel.ready.then((value) {
      sendPort.send(buildMessage("connected"));
    });
    channel.stream.listen((event) {
      loggerArray(["异步任务收到长连接消息",event]);
      
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



