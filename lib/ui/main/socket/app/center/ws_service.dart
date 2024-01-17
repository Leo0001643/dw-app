import 'dart:isolate';
import 'package:leisure_games/app/res/game_request.dart';
import 'package:leisure_games/app/res/game_response.dart';
import 'package:leisure_games/ui/main/socket/app/service/isolate_service.dart';
import 'package:leisure_games/ui/main/socket/requset/game_heartbeat_request.dart';
import 'package:leisure_games/ui/main/socket/status/websocket_connect_status.dart';

import 'dart:async';

import 'ws_connection_center.dart';

// WS子线程服务
// ws 业务处理模块
// 1.持有ws连接器
// 2.接收主线程消息
// 3.返回主线程消息

class WSService extends IsolateService {
  /// 超时次数
  late int _timeoutCount;

  // 心跳超时次数
  late int _heartbeatTimeout;

  // 心跳计时器
  Timer? _heartbeatTimer;

  // 上次心跳时间
  int _lastHeartbeatSecond = 0;

  /// 响应id，用于判断是否需要断开重连
  late int _lastResponseId;

  /// 服务器返回时间，可用于同步
  late int serverTime;

  /// 牌桌ID
  int? _tableId;

  /// 网络位置 0: 信用盘 1: 德州大厅 2:游戏
  int? mLocation;

  // ws连接器
  WsConnectionCenter? mConnection;
  WSService() {
    // 超时计数
    _timeoutCount = 0;
    //心跳超时次数
    _heartbeatTimeout = 0;
    // 上次请求协议
    _lastResponseId = 0;
    // 牌桌ID
    _tableId = 0;
    //
    mLocation = 0;
  }

  @override
  void bindPort(SendPort? mainPort, SendPort? childPort) {
    super.bindPort(mainPort, childPort);
    mConnection = WsConnectionCenter(WeakReference(this));
  }

  @override
  void destroy() {
    //
    mConnection?.destroy();
  }

  /// 开始长连接
  void startConnection() {
    mConnection?.resetFlag();
    mConnection?.reconnect(force: true);
  }

  /// 停止长连接 //这个是给外边调用的
  void stopConnection({isMunual = true}) {
    dzLog("stopConnection$isMunual");
    _doSomethingWhenDisconnecting();
    mConnection?.destroy();
    mConnection = null;
  }

  /// 更新环境
  void updateEnvir(String? envir) {
    //
  }

  void syncNetState(WebSocketConnectStatus connectStatus) {
    mMainPort?.send(["dispatchConnectStatus", connectStatus]);
    if (connectStatus == WebSocketConnectStatus.timeout) {
      // 网络超时
      stopHeart();
      // timeout 连接超时 需要关闭socket，重新连接
      mConnection?.closeSocket(isMunual: true);
      mConnection = null;
      // 创建新的连接器
      mConnection = WsConnectionCenter(WeakReference(this));
      mConnection?.reconnect(force: true);
    } else if (connectStatus == WebSocketConnectStatus.connected) {
      // 连接成功
      startHeart();
    } else if (connectStatus == WebSocketConnectStatus.disconnected) {
      // 断开连接
      stopHeart();
    } else if (connectStatus == WebSocketConnectStatus.logout) {
      // 账号登出 / 切换账号
      stopHeart();
    } else if (connectStatus == WebSocketConnectStatus.failed) {
      // 网络失败 / 异常
      stopHeart();
    } else if (connectStatus == WebSocketConnectStatus.close) {
      // 网络关闭 /
      stopHeart();
    }
  }

  // 开启心跳
  void startHeart() {
    _timeoutCount = 0;
    _lastResponseId = 0;
    // 开启心跳
    dzLog("_onConnected----开启心跳");
    _heartbeatTimer?.cancel();
    _heartbeatTimer = null;
    // 每秒监控一次，如果不小于3秒，则重新发送心跳
    _heartbeatTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      int now = DateTime.now().millisecondsSinceEpoch;
      if (now - _lastHeartbeatSecond >= 1950) {
        _lastHeartbeatSecond = now;
        // 发送心跳包
        dzLog("发送心跳");
        GameHeartbeatRequest heartRequest = GameHeartbeatRequest(_tableId);
        mConnection?.sendRequest(heartRequest);
      }
    });
  }

  // 关闭心跳
  void stopHeart() {
    // 停止心跳计时，并重置心跳参数
    dzLog("停止心跳计时，并重置心跳参数");
    _heartbeatTimer?.cancel();
    _heartbeatTimer = null;
    _lastHeartbeatSecond = 0;
    _heartbeatTimeout = 0;
  }

  void processHeart(GameResponse response) {
    serverTime = response.data["serverTime"]; // 心跳请求则更新服务器时间
    _heartbeatTimeout = 0;
    // 发送给主线程
    mMainPort?.send(["dispatchResponse", response]);
  }

  void processResponse(GameResponse response) {
    // 发送给主线程
    mMainPort?.send(["dispatchResponse", response]);
  }

  // 接受到数据
  void onReceivedData(GameResponse response) {

  }

  // 网络错误
  void _onError(error) {
    // 请求出错，如何处理
    syncNetState(WebSocketConnectStatus.failed);
    _doSomethingWhenDisconnecting();
  }

  // 超时处理
  void _onTimeout(type) {
    if (type == GameRequestType.heartbeat.number) {
      // 心跳请求连续超时3次，主动断开重连
      if (_heartbeatTimeout < 2) {
        _heartbeatTimeout++;
      } else {
        _heartbeatTimeout = 0; //重制心跳计算
        // 需要弹网络异常提示
        // 不能在子线程展示ui
        // showMsgToast("网络连接超时，请稍后重试");
        syncNetState(WebSocketConnectStatus.timeout);
        dzLog("心跳请求连续超时3次，主动重连ws");
        _activeReconnect();
      }
    } else {
      // 其他请求超时处理
      if (_timeoutCount < 1) {
        // 超时一次，是否需要重发
      } else {
        _timeoutCount++;
      }
    }
  }

  void _onDisconnect() {
    syncNetState(WebSocketConnectStatus.disconnected);
    // 连接断开，执行被动重连操作
    _doSomethingWhenDisconnecting();
  }

  /// 连接断开时需要执行的操作
  void _doSomethingWhenDisconnecting() {
    // 停止心跳
    stopHeart();
    // 重置参数
    _timeoutCount = 0;
    _lastResponseId = 0;
  }

  /// 主动重连操作
  void _activeReconnect() {
    // 主动关闭连接
    _doSomethingWhenDisconnecting();
    mConnection?.reconnect();
  }

  /// 记录进入后台的开始时间
  // int _pausedStartTime = 0;
  void entryResumeState() {
    // _doSomethingWhenDisconnecting();
    // _connection.reconnect(force: true);
    // if (_pausedStartTime == 0) {
    //   // 不处理
    // } else {
    //   // 从后台回到前台
    //   int currentTime = DateTime.now().millisecondsSinceEpoch;
    //   if (currentTime - _pausedStartTime > 5000) {
    //     _pausedStartTime = 0;
    //     // 超过5秒就自动重连
    //     DzLogger.i("entryResumeState");
    //     _activeReconnect();
    //   } else {
    //     _pausedStartTime = 0;
    //   }
    // }
  }

  void entryInactiveState() {
    //
  }

  //从后台返回
  void entryPausedState() {
    // _pausedStartTime = DateTime.now().millisecondsSinceEpoch;
    // stopConnection();
  }

  void entryDetachedState() {
    // app退出
    stopConnection();
  }

  // 游戏线程监听数据
  @override
  Future<void> procMessage(dynamic message) async {
    if (message is List) {
      // 标准协议
      if (message[0] is String) {
        if (message[0] == "updateUserInfos") {
          Map<String, dynamic> params = message[1];
          String userId = params["userId"];
          String token = params["token"];
          int serverTimeInterval = params["serverTimeInterval"];
          mConnection?.updateUserInfos(userId, token, serverTimeInterval);
        } else if (message[0] == "updateTableId") {
          Map<String, dynamic> params = message[1];
          _tableId = params["tableId"];
        } else if (message[0] == "updateConnectDomianList") {
          Map<String, dynamic> params = message[1];
          mConnection?.updateConnectDomianList(params["urlList"]);
        } else if (message[0] == "updateNetLocation") {
          Map<String, dynamic> params = message[1];
          mLocation = params["location"];
        } else if (message[0] == "startConnection") {
          mConnection?.reconnect(force: true);
        } else if (message[0] == "stopConnection") {
          stopConnection();
        } else if (message[0] == "entryResumeState") {
          //
        } else if (message[0] == "entryInactiveState") {
          //
        } else if (message[0] == "entryPausedState") {
          //
        } else if (message[0] == "entryDetachedState") {
          //
        } else if (message[0] == "request") {
          Map<String, dynamic> body = message[1];
          GameRequest request = GameRequest.fromMap(body);
          mConnection?.sendRequest(request);
        }
      }
    } else if (message is Map<String, dynamic>) {
      // 请求
      // GameRequest request = GameRequest.fromMap(message);
      // GameResponse response = await request.requestData();
      // dzLog("isolate response = $response ${response.responseKey()}");
      // mChildPort?.send(response);
    } else if (message is GameRequest) {
      // GameRequest request = message;
      // dzLog("isolate request = $request ${request.requestKey()}");
      // GameResponse response = await request.requestData();
      // dzLog("isolate response = $response ${response.responseKey()}");
      // mChildPort?.send(response);
    }
  }

  //!end class ws service
}
