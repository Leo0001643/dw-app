import 'dart:async';
import 'dart:isolate';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/res/game_request.dart';
import 'package:leisure_games/app/res/game_response.dart';
import 'package:leisure_games/ui/main/socket/app/center/ws_service.dart';
import 'package:leisure_games/ui/main/socket/app/service/isolate_service.dart';

import 'ws_main_service.dart';

/// 基础线程
class GameIsolate extends ChangeNotifier {
  StreamSubscription? mMainstreamSub;

  // 关联服务
  // 主线程服务
  static IsolateService? mMainServ;

  // 子线程服务
  static IsolateService? mChildServ;

  // 用于监听模块
  GameRequest? notifierRequest;

  // 用于监听模块
  GameResponse? notifierResponse;

  final Map<String, dynamic> _maps = <String, dynamic>{};

  Isolate? _isolate;

  static SendPort? _childSendPort;

  /// 使用静态变量记录sendPort，否则子线程里无法取到值
  static SendPort? _mainSendPort;

  // 初始化线程
  GameIsolate() {
    _mainSendPort = null;
    _childSendPort = null;
    mMainstreamSub = null;
    mMainServ = null;
    mChildServ = null;
  }

  void destroy() {
    // 先切断主服务，销毁主服务
    mMainServ?.destroy();
    mMainServ = null;
    // 销毁子线程服务
    mChildServ?.procMessage("exit");
    mChildServ?.destroy();
    mChildServ = null;
  }

  IsolateService? mainService() {
    return mMainServ;
  }

  // 开启网路线程
  Future<void> startNetIsolate(IsolateServerType mainServerType,
      IsolateServerType childServerType) async {
    String debugName = 'isolate-${Random().nextInt(10)}';
    if(_isolate != null){
      _isolate?.kill();
      _isolate = null;
    }
    print("开启线程 $debugName-$hashCode ${_isolate == null}");

    ReceivePort receivePort = ReceivePort();
    SendPort sendPort = receivePort.sendPort;
    _mainSendPort = sendPort;
    print("线程:$debugName 主端口:${_mainSendPort.hashCode}");
    //
    RootIsolateToken rootIsolateToken = RootIsolateToken.instance!;
    //
    if (mainServerType == IsolateServerType.mNet) {
      mMainServ = WSMainService();
    }
    //
    try{
      _isolate = await Isolate.spawn(doWorkInChild,
          [sendPort, rootIsolateToken, childServerType, ""],
          debugName: debugName);
    }catch(e){
      loggerArray(["app_game_isolate-isolate启动异常",e]);
    }

    /// 避免线程因未捕获的异常而自动terminate
    _isolate?.setErrorsFatal(false);

    // 主线程监听
    mMainstreamSub = receivePort.listen((message) async {
      if (message is SendPort) {
        _childSendPort = message;
        mMainServ?.bindPort(_mainSendPort, _childSendPort);
      } else if (message is String && message == 'exit') {
        print("主线程$debugName退出");
        mMainstreamSub!.cancel();
        _isolate?.kill();
      } else if (message is List) {
        if (message[0] is String) {
          if (message[0] == "dispatchResponse") {
            mMainServ?.dispatchResponse(message[1]);
          } else if (message[0] == "dispatchConnectStatus") {
            mMainServ?.dispatchConnectStatus(message[1]);
          } else if (message[0] == "dispatchLoggerMessgae") {
            // print("子线程：responseTypeId:${message[0]}}");
            print(message[1]);
          }
        }
      }
    });
  }

  // 子线程空间
  static void doWorkInChild(List params) {
    debugPrint("doWorkInChild ${Isolate.current.debugName}");
    ReceivePort gameReceivePort = ReceivePort();
    _childSendPort = gameReceivePort.sendPort;
    String? debugName = Isolate.current.debugName;
    debugPrint("子线程:$debugName 子端口:${_childSendPort.hashCode}");
    SendPort tmpMainPort = params[0];
    BackgroundIsolateBinaryMessenger.ensureInitialized(params[1]);
    IsolateServerType serverType = params[2];
    if (serverType == IsolateServerType.net) {
      mChildServ = WSService();
      mChildServ?.bindPort(_mainSendPort, _childSendPort);
      dzLog("子线程:$debugName 创建Ws服务:${mChildServ.hashCode}");
    }
    // 回传端口号
    tmpMainPort.send(_childSendPort);
    //
    StreamSubscription? streamSubscription;
    streamSubscription = gameReceivePort.listen((message) async {
      loggerArray(["都收到了些啥消息",message]);
      if (message is String) {
        if (message == "exit") {
          dzLog("子线程退出！");
          streamSubscription!.cancel();
        } else {
          await mChildServ?.procMessage(message);
        }
      } else {
        await mChildServ?.procMessage(message);
      }
    });
  }

  /// 提供简单的能力，发送给子线程消息
  void sendToChildMsg(String message, {Map<String, dynamic>? params}) {
    print("main2child message = $message");
    List msgParams = [];
    msgParams.add(message);
    if (params != null && params.isNotEmpty) {
      msgParams.add(params);
    }
    _childSendPort?.send(msgParams);
  }

  // 分发消息
  void dispatchResponse(GameResponse response) {
    _mainSendPort?.send(["dispatchResponse", response]);
  }

  // 分发日志
  static void dzLog(String message) {
    _mainSendPort?.send(["dispatchLoggerMessgae", message]);
  }

  //！end class
}
