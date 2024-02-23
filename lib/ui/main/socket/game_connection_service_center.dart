import 'dart:async';

import 'package:leisure_games/app/res/game_request.dart';
import 'package:leisure_games/app/res/game_response.dart';
import 'package:leisure_games/ui/main/socket/game_connection_center.dart';
import 'package:leisure_games/ui/main/socket/game_isolate.dart';

import 'requset/game_heartbeat_request.dart';
import 'status/websocket_connect_status.dart';
/// 游戏连接服务中心
/// 负责长连接的管理与维护，如心跳、重连等
class GameConnectionServiceCenter {
  static final GameConnectionServiceCenter _singleInstance =
      GameConnectionServiceCenter._internal();
  static GameConnectionServiceCenter get instance =>
      GameConnectionServiceCenter();
  factory GameConnectionServiceCenter() {
    return _singleInstance;
  }

  /// 超时次数
  late int _timeoutCount;

  ///  心跳相关参数
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

  late Function? _connectedCallback;

  int? _tableId;

  GameConnectionServiceCenter._internal() {
    // 超时计数
    _timeoutCount = 0;
    //心跳超时次数
    _heartbeatTimeout = 0;
    // 上次请求协议
    _lastResponseId = 0;

    // 默认开启长连接
    _initConnection();
  }

  /// 开始长连接
  void startConnection({Function? onConnected}) {
    if (onConnected != null) {
      _connectedCallback = onConnected;
    }
    print('startConnection');
    _connection.resetFlag();
    _connection.reconnect(force: true);
  }

  /// 停止长连接 //这个是给外边调用的
  void stopConnection({isMunual = true}) {
    print("stopConnection$isMunual");
    _doSomethingWhenDisconnecting();
    _connection.closeSocket(isMunual: isMunual);
  }



  /// 更新用户信息
  void updateTableId(int? tableId) {
    // 更新用户信息
    _tableId = tableId;
  }

  /// 更新用户信息
  void updateConnectDomianList(List? domianList) {
    // 更新用户信息
    _connection.updateConnectDomianList(domianList);
  }

  /// 更新用户信息
  void updateEnvir(String? envir) {
    // 更新用户信息
  }

  // 长连接通道
  late GameConnectionCenter _connection;
  void _initConnection() {
    _connection = GameConnectionCenter.instance;
    _connection.onConnecting = _onConnecting;
    _connection.onConnected = _onConnected;
    _connection.onSuccess = _onSuccess;
    _connection.onReceivedData = _onReceivedData;
    _connection.onDisconnect = _onDisconnect;
    _connection.onError = _onError;
    _connection.onTimeout = _onTimeout;
    _connection.onLogout = _onLogout;
    _connection.onClose = _onClose;
  }

  void _syncNetState(WebSocketConnectStatus connectStatus) {
    GameIsolate.instance.dispatchConnectStatus(connectStatus);
  }

  // 正在连接
  void _onConnecting() {
    _syncNetState(WebSocketConnectStatus.connecting);
  }

  // 连接成功
  void _onConnected() {
    _syncNetState(WebSocketConnectStatus.connected);
    // 重置参数
    _timeoutCount = 0;
    _lastResponseId = 0;
    // 开启心跳
    print("_onConnected----开启心跳");
    _startHeartbeat();
    // 获取用户状态
    if (_connectedCallback != null) {
      _connectedCallback!();
    }
  }

  // 成功
  void _onSuccess(GameResponse response) {
    // 请求成功，重置超时次数
    if (response.type == GameRequestType.heartbeat.number) {
      serverTime = response.data["serverTime"]; // 心跳请求则更新服务器时间
      _heartbeatTimeout = 0;
      // 心跳包也向上层反
    } else {
      _timeoutCount = 0;
    }
  }

  // 接受到数据
  void _onReceivedData(GameResponse response) {
        _activeReconnect();
  }

  // 网络错误
  void _onError(error) {
    // 请求出错，如何处理
    _syncNetState(WebSocketConnectStatus.failed);
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
        _syncNetState(WebSocketConnectStatus.timeout);
        print("心跳请求连续超时3次，主动重连ws");
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

  void _onLogout() {
    _syncNetState(WebSocketConnectStatus.logout);
  }

  void _onDisconnect() {
    _syncNetState(WebSocketConnectStatus.disconnected);
    // 连接断开，执行被动重连操作
    _doSomethingWhenDisconnecting();
  }

  void _onClose() {
    _syncNetState(WebSocketConnectStatus.close);
  }

  /// 连接断开时需要执行的操作
  void _doSomethingWhenDisconnecting() {
    // 停止心跳
    _stopHeartbeat();
    // 重置参数
    _timeoutCount = 0;
    _lastResponseId = 0;
  }

  /// 主动重连操作
  void _activeReconnect() {
    // 主动关闭连接
    _doSomethingWhenDisconnecting();
    _connection.reconnect();
  }

  /// 开启心跳
  void _startHeartbeat() {
    _heartbeatTimer?.cancel();
    _heartbeatTimer = null;
    // 每秒监控一次，如果不小于3秒，则重新发送心跳
    _heartbeatTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      int now = DateTime.now().millisecondsSinceEpoch;
      if (now - _lastHeartbeatSecond >= 1950) {
        _lastHeartbeatSecond = now;
        _sendHeartbeat();
      }
      // _sendHeartbeat();
    });
  }

  /// 停止心跳
  void _stopHeartbeat() {
    // 停止心跳计时，并重置心跳参数
    print("停止心跳计时，并重置心跳参数");
    _heartbeatTimer?.cancel();
    _heartbeatTimer = null;
    _lastHeartbeatSecond = 0;
    _heartbeatTimeout = 0;
  }

  /// 发送心跳
  void _sendHeartbeat() async {
    GameHeartbeatRequest? gameHeartbeatRequest = GameHeartbeatRequest(_tableId);
    await gameHeartbeatRequest.requestData();
    gameHeartbeatRequest = null;
    // GameResponse response = await GameHeartbeatRequest().requestData();
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
    //     print("entryResumeState");
    //     _activeReconnect();
    //   } else {
    //     _pausedStartTime = 0;
    //   }
    // }
  }

  void entryInactiveState() {}
  //从后台返回
  void entryPausedState() {
    // _pausedStartTime = DateTime.now().millisecondsSinceEpoch;
    // stopConnection();
  }

  void entryDetachedState() {
    // app退出
    stopConnection();
  }
}
