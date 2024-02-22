import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/res/game_request.dart';
import 'package:leisure_games/app/res/game_response.dart';
import 'package:leisure_games/ui/main/socket/app/center/game_isolate_param.dart';
import 'package:leisure_games/ui/main/socket/app/center/impl/game_notification_center.dart';
import 'package:leisure_games/ui/main/socket/status/websocket_connect_status.dart';

import 'service/isolate_service.dart';
// WS主线程服务

class WSMainService extends IsolateService {
  // 状态监听器
  late List<GameConnectionListener> _connectionListeners;

  // 响应监听器
  late List<GameNotificationListener> _responseListeners;

  // 网络状态
  WebSocketConnectStatus mWsSate = WebSocketConnectStatus.none;

  // 消息缓存
  late List<List> mMsgCache = <List>[];

  // 阻塞请求缓存
  Map<String, DXIsolateParam> mRequestMap = <String, DXIsolateParam>{};

  WSMainService() {
    _connectionListeners = <GameConnectionListener>[];
    _responseListeners = <GameNotificationListener>[];
  }

  @override
  void bindPort(SendPort? mainPort, SendPort? childPort) {
    super.bindPort(mainPort, childPort);
    // 线程创建完毕
    for (List msg in mMsgCache) {
      mChildPort?.send(msg);
    }
  }

  @override
  void destroy() {
    _connectionListeners.clear();
    _responseListeners.clear();
  }

  // 是否连接中
  bool isConnect() {
    if (mWsSate == WebSocketConnectStatus.connected) {
      return true;
    }
    return false;
  }

  // 更新Domain
  void updateDomain() {
    if (mChildPort != null) {
      mChildPort?.send({});
    } else {}
  }

  // 长链接管理
  void startWsConnect() {
    List msgParams = ["startConnection"];
    if (mChildPort != null) {
      mChildPort?.send(msgParams);
    } else {
      mMsgCache.add(msgParams);
    }
  }

  void doWhenConnectCallBack(Function success, {Function? onFail}) async {
    int timeout = 3;
    if (isConnect()) {
      success();
      return;
    }
    showToast("正在重连");
    while (!isConnect()) {
      if (timeout < 0) {
        if (onFail != null) {
          onFail();
        }
        break;
      }
      if (isConnect()) {
        success();
        timeout = 3;
        break;
      } else {
        startWsConnect();
        sleep(Duration(seconds: 2));
        timeout--;
      }
    }
  }

  void stopWsConnect() {
    List msgParams = ["stopConnection"];
    if (mChildPort != null) {
      mChildPort?.send(msgParams);
    } else {
      mMsgCache.add(msgParams);
    }
  }

  void reStartWsConnect() {
    List msgParams = ["reStartConnection"];
    if (mChildPort != null) {
      mChildPort?.send(msgParams);
    } else {
      mMsgCache.add(msgParams);
    }
  }

  // 统一接口
  void sendMessageDirection(String message, {Map<String, dynamic>? params}) {
    print("WSMainService sendMessageDirection = $message");
    List msgParams = [];
    msgParams.add(message);
    if (params != null && params.isNotEmpty) {
      msgParams.add(params);
    }
    mChildPort?.send(msgParams);
  }

  /// 同步请求（兼容，同步请求和异步请求两种方式）
  /// 信用盘和大厅，可以使用同步请求方式【阻塞】
  Future<GameResponse> sendRequest(GameRequest request) async {
    // 包装公用参数
    // 构建callback
    Completer<GameResponse> completer = Completer<GameResponse>();
    DXIsolateParam param =
        DXIsolateParam(completer: completer, request: request);
    String paramKey = param.paramKey;
    mRequestMap[paramKey] = param;
    //
    completer.future.then((value) {
      // GameResponse response = value;
      print("WSMainService 请求返回 ${request.type}-${completer.hashCode}");
      // notifierResponse = response;
      // notifyListeners();
    });
    print("WSMainService 发送请求sync $request, $paramKey");
    List msgParams = [];
    msgParams.add("request");
    msgParams.add(request.toMap());
    mChildPort?.send(msgParams);
    return completer.future;
  }

  // 异步发送请求（返回数据，入队列处理）
  // 游戏中都要采用异步请求【非阻塞】
  void sendRequestAsync(GameRequest request) {
    print("WSMainService 发送请求async $request");
    List msgParams = [];
    msgParams.add("request");
    msgParams.add(request.toMap());
    mChildPort?.send(msgParams);
  }

  // 状态监听
  void addConnectionListener(GameConnectionListener listener) {
    print("WSMainService 添加WS状态监听。。。。。。");
    _connectionListeners.add(listener);
    // 同步最新的网络状态
    listener.notifyConnectStatus(mWsSate);
  }

  void removeConnectionListener(GameConnectionListener listener) {
    print("WSMainService 移除WS状态监听。。。。。。");
    _connectionListeners.remove(listener);
  }

  @override
  void dispatchConnectStatus(WebSocketConnectStatus state) {
    print("WSMainService dispatchConnectStatus $state");
    mWsSate = state;
    // 状态下传
    for (var listener in _connectionListeners) {
      listener.notifyConnectStatus(state);
    }
  }

  // 事件监听
  void addResponseListener(GameNotificationListener listener) {
    print("WSMainService 添加WS事件监听。。。。。。");
    _responseListeners.add(listener);
  }

  void removeResponseListener(GameNotificationListener listener) {
    print("WSMainService 移除WS事件监听。。。。。。");
    _responseListeners.remove(listener);
  }

  // 事件通知
  @override
  void dispatchResponse(GameResponse response) {
    print("===========>到了这里  ${_responseListeners.length}");
    if (response.type == "ping") {

    } else {

    }
    // String paramKey = response.responseKey();
    // DXIsolateParam? tmpIsolatePram = mRequestMap.remove(paramKey);
    // if (tmpIsolatePram != null) {
    //   print("WSMainService 处理Request = $paramKey");
    //   tmpIsolatePram.completer.complete(response);
    // } else {
    // 转发出去
    for (var listener in _responseListeners) {
      if (listener.supportHandleResponse(response)) {
        listener.notificationCallBack(response);
      }
    }
    // }
  }
//!end class ws service
}
