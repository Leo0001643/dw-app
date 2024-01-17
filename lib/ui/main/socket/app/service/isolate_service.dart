// 线程服务基类
// 跟线程配合使用

import 'dart:isolate';

import 'package:leisure_games/ui/main/socket/status/websocket_connect_status.dart';

import '../../../../../app/res/game_response.dart';
// 线程服务类型

enum IsolateServerType {
  net(1),
  music(2),
  mNet(10),
  mMusic(20);

  final int number;

  const IsolateServerType(this.number);
}

// 线程服务
// 1.子线程服务的基类
// 2.主线程服务的积累
class IsolateService {
  // 主线程接口
  SendPort? mMainPort;

  SendPort? mChildPort;

  bool mReady = false;

  IsolateService() {
    mMainPort = null;
    mChildPort = null;
    mReady = false;
  }

  void bindPort(SendPort? mainPort, SendPort? childPort) {
    mMainPort = mainPort;
    mChildPort = childPort;
    mReady = true;
  }

  void destroy() {
    //
  }

  // 子线程服务，需要实现
  Future<void> procMessage(dynamic message) async {}

  // 主线程服务，需要实现
  Future<void> listen(dynamic message) async {}

  // 分发日志
  void dzLog(String message) {
    // debugPrint("dispatchLoggerMessage-$hashCode-$message");
    mMainPort?.send(["dispatchLoggerMessgae", message]);
  }

  void dispatchConnectStatus(WebSocketConnectStatus state) {}

  void dispatchResponse(GameResponse response) {}

  //end class isolate service
}
