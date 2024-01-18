import 'dart:async';
import 'dart:convert';
import 'package:leisure_games/app/res/game_request.dart';
import 'package:leisure_games/app/res/game_response.dart';
import 'package:leisure_games/ui/main/socket/game_connection_center.dart';
import 'package:leisure_games/ui/main/socket/status/websocket_connect_status.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'ws_service.dart';

//
// 只关心socket层的创建，销毁等工作
// 1. 重连机制，每个域名重连3次，3次失败后，换域名继续重连（要给前端显示）
//

// 域名结构体
class WsDomain {
  String mUrl = "";
  bool mBad = false;

  WsDomain(String url, bool use) {
    mUrl = url;
    mBad = use;
  }
}

// 连接器
class WsConnectionCenter {
  //
  late WeakReference<WSService> mWsService;

  /// 超时回调
  Function? onTimeout;

  /// 超时重连超时,退出b端
  Function? onLogout;

  /// close关闭
  Function? onClose;

  /// 长链接状态
  late WebSocketConnectStatus connectStatus;

  // 域名列表
  List<WsDomain> mDomainList = <WsDomain>[];

  int mReconectCount = 0;

  String mCurDomain = "";

  late Map<String, dynamic> _requestCaches;
  IOWebSocketChannel? _channel;
  StreamSubscription? streamSubscription;

  late GameConnectionParams _connectionParams;
  bool _isServerUpgrade = false; // 是否服务器升级
  bool _isKickout = false; // 被踢下线
  bool _isManualClose = false; // 手动断开
  String? connectSessionId;

  int firstReconnectTime = 0;

  final int resetContentTime = 6000;

  //
  WsConnectionCenter(WeakReference<WSService> service) {
    //
    mWsService = service;
    connectStatus = WebSocketConnectStatus.none;
    _requestCaches = <String, dynamic>{};
    _connectionParams = GameConnectionParams();
    _isServerUpgrade = false;

    /// 超时回调
    onTimeout = null;

    /// 超时重连超时,退出b端
    onLogout = null;
  }

  void destroy() {
    closeSocket(isMunual: true);
  }

  /// 找到缓存的请求并从缓存中移除
  GameRequest? _removeRequestCache(String requestKey) {
    GameRequest? request = _requestCaches.remove(requestKey);
    return request;
  }

  // 同步链接状态
  void _syncConnectState(WebSocketConnectStatus conState) {
    if (conState != connectStatus) {
      connectStatus = conState;
      dzLog("connectStatus $conState");
      // 同步给回上层
      if (connectStatus == WebSocketConnectStatus.connected) {
        // 开启心跳
        mWsService.target?.startHeart();
      } else if (connectStatus == WebSocketConnectStatus.failed) {
        reconnect();
      } else if (connectStatus == WebSocketConnectStatus.reconnect) {
        if (prepareReConnect()) {
          reconnect();
        } else {
          _syncConnectState(WebSocketConnectStatus.failed);
        }
      } else if (connectStatus == WebSocketConnectStatus.connecting) {
        // connecting
      } else if (connectStatus == WebSocketConnectStatus.disconnecting) {
        // disconnecting
      } else if (connectStatus == WebSocketConnectStatus.disconnected) {
        // disconnected
      } else if (connectStatus == WebSocketConnectStatus.logout) {
        // logout
      } else if (connectStatus == WebSocketConnectStatus.close) {
        // close
      } else if (connectStatus == WebSocketConnectStatus.timeout) {
        // timeout 连接超时
      }
      // 同步到主线程
      mWsService.target?.syncNetState(connectStatus);
    }
  }

  /// 清空缓存
  void _clearCaches() {
    // cancel all request
    for (GameRequest request in _requestCaches.values) {
      request.cancel();
    }
    // clear all data
    _requestCaches.clear();
  }

  // 更新用户信息
  void updateUserInfos(String userId, String token, int serverTimeInterval) {
    _connectionParams.updateUserInfos(userId, token, serverTimeInterval);
  }

  /// 更新Domain
  void updateConnectDomianList(List? domainList) {
    // dzLog('子线程拿到的《所有》domain ====> $domianList');
    mDomainList = [];
    mReconectCount = 0;
    firstReconnectTime = 0;
    if (domainList == null || domainList.isEmpty) {
      return;
    }
    // // test
    // mDomainList.add(WsDomain("abc1", false));
    // mDomainList.add(WsDomain("abc2", false));
    // mDomainList.add(WsDomain("abc3", false));
    // mDomainList.add(WsDomain("abc4", false));
    // mDomainList.add(WsDomain("abc5", false));
    // mDomainList.add(WsDomain("abc6", false));
    // mDomainList.add(WsDomain("abc7", false));
    // 剔除不可用的域名
    for (String v in domainList) {
      mDomainList.add(WsDomain(v, false));
    }
    mCurDomain = mDomainList[0].mUrl;
  }

  // 内部重连
  Future<bool> _connect() async {

    // 开始重连
    String url = "wss://9000ywfjn2.uy4ayov.com?language=zh";
    if (url.isEmpty) {
      _syncConnectState(WebSocketConnectStatus.emptyUrl);
      return false;
    }
    _syncConnectState(WebSocketConnectStatus.connecting);
    dzLog("发起建立连接的 url = $url");
    try {
      _channel = IOWebSocketChannel.connect(url,
          connectTimeout: const Duration(seconds: 10));
      await _channel?.ready;
    } catch (err) {
      dzLog('建立连接失败，继续重连 $err');
      _syncConnectState(WebSocketConnectStatus.reconnect);
      return false;
    }
    //连接成功
    mReconectCount = 0;
    firstReconnectTime = 0;
    dzLog('建立连接成功的 ');
    // 开启监听
    streamSubscription = _channel!.stream.handleError((err) {
      if (err is WebSocketChannelException) {
        dzLog("流错误1 ${err.message}");
      } else {
        dzLog("流错误2");
      }
    }).listen((event) {
      print("=========>有数据过来了");
      // 监听Socket正常返回数据
      _onData(event);
    }, onError: (err) {
      // 监听Socket异常
      dzLog("onError");
      _syncConnectState(WebSocketConnectStatus.failed);
    }, onDone: () {
      // 监听socket关闭或者服务器发送关闭
      dzLog("onDone-----> ");
      _syncConnectState(WebSocketConnectStatus.failed);
    });
    // 同步连接成功状态
    _syncConnectState(WebSocketConnectStatus.connected);
    return true;
  }

  void resetFlag() {
    _isManualClose = false;
    _isKickout = false;
    _isServerUpgrade = false;
  }

  // // 判断是否需要重连
  // bool canReconnect() {
  //   // 手动下线或者被踢  不需要再重连
  //   if (_isManualClose || _isKickout) {
  //     return false;
  //   }
  //   //连接中或者已经连接上了不需要重连
  //   if (connectStatus == ConnectStatus.emptyUrl ||
  //       connectStatus == ConnectStatus.connecting) {
  //     dzLog('不需要重连');
  //     return false;
  //   }
  //   return true;
  // }

  // 准备重连
  bool prepareReConnect() {
    // 重连机制
    mReconectCount++;
    if (mReconectCount > 3) {
      // 三次重连超时 切换域名
      mReconectCount = 0;
      try {
        for (WsDomain element in mDomainList) {
          if (element.mUrl == mCurDomain) {
            element.mBad = true;
          }
        }
        //
        WsDomain wsMain =
            mDomainList.firstWhere((element) => element.mBad == false);
        mCurDomain = wsMain.mUrl; // 需要clone string
        dzLog("切换域名成功 $mCurDomain");
        return true;
      } catch (err) {
        dzLog("所有域名都不可用");
        return false;
      }
    } else {
      dzLog("域名重试 $mCurDomain");
      return true;
    }
  }

  // 连接（重连）函数
  Future<void> reconnect({bool force = false}) async {
    dzLog('重连开始 force:$force');
    if (!force) {
      // 手动下线或者被踢  不需要再重连
      if (_isManualClose || _isKickout) {
        return;
      }
      //连接中或者已经连接上了不需要重连
      if (connectStatus == WebSocketConnectStatus.emptyUrl ||
          connectStatus == WebSocketConnectStatus.connecting) {
        dzLog('不需要重连');
        return;
      }
    }
    resetFlag();
    dzLog('重连之前关闭之前连接');
    closeSocket();
    // 重连计时
    // if (firstReconnectTime == 0) {
    //   firstReconnectTime = DateTime.now().millisecondsSinceEpoch;
    // } else {
    //   if (DateTime.now().millisecondsSinceEpoch - firstReconnectTime >
    //       resetContentTime) {
    //     firstReconnectTime = 0;
    //     dzLog('重连超时，不再重连');
    //     return;
    //   }
    // }
    //
    await _connect();
  }

  // 业务处理
  void _onData(event) {
    // 处理接收到的数据
    dzLog("======>Socket接收消息   ${event}");
    //消息解密
    GameResponse response = GameResponse.fromJson(event);
    // 发送给ws服务
    mWsService.target?.onReceivedData(response);
    // 判断下发的数据是请求还是通知，先简单处理
    if (response.type == GameResponseType.kickout.number) {
      // 收到被踢通知，只有是当前连接收到踢人 才去踢
      _isKickout = _needKickOut(response);
      if (_isKickout) {
        mWsService.target?.processResponse(response);
      }
    } else if (response.type ==
        GameResponseType.heartBeatTop.number) {
      // 主心跳处理
      mWsService.target?.processHeart(response);
    } else if (response.type == GameResponseType.heartBeat.number) {
      // 子心跳包处理
      mWsService.target?.processResponse(response);
    }else {
      // 请求响应处理
      String responseKey = response.responseKey();
      GameRequest? request = _removeRequestCache(responseKey);
      if (request != null) {
        dzLog(
            "响应成功!!! code ${response.code}  请求协议  ${response.type} messageId ${response.messageId}");
        mWsService.target?.processResponse(response);
      }
    }
    //
    if (response.type == 100) {
      dzLog(">>>>>>>>>>收到 100消息");
      return;
    }
  }

  void _clearWhenSocketClose() {
    // 清除缓存请求
    _clearCaches();
    streamSubscription?.cancel();
    streamSubscription = null;
    connectSessionId = null;
    _channel?.sink.close();
    _channel = null;
    dzLog('关闭长连接完成');
  }

  /// 主动断开连接，可能要转为对外接口
  void closeSocket({bool isMunual = false}) {
    _isManualClose = isMunual;
    _syncConnectState(WebSocketConnectStatus.disconnecting);
    _clearWhenSocketClose(); //清理ws相关
    _syncConnectState(WebSocketConnectStatus.disconnected);
    // if (!_isManualClose) {
    //   //不是手动断开 会通知上层
    //   if (onDisconnect != null) {
    //     onDisconnect!();
    //   }
    // } else {
    //   if (onClose != null) {
    //     onClose!();
    //   }
    // }
  }

  Future<void> sendRequest(GameRequest request) async {
    // 添加到请求服务中
    String requestKey = request.requestKey();
    _requestCaches[requestKey] = request;
    // 补充公共数据
    // 将数据交给长连接通道
    dynamic jsonData =
        request.packageData(_connectionParams.serverTimeInterval);
    // 发送数据
    try {
      if (jsonData is String) {
        jsonData = utf8.encode(jsonData);
      }else{
        jsonData = jsonEncode(jsonData);
      }
      print("发送数据----->   ${jsonData}");
      _channel!.sink.add(jsonData);
    } catch (error, stackTrace) {
      dzLog("sendRequest excpetion = $error stackTree = $stackTrace");
    }
    //
    if (needReconnectWhenTimeOut(request.type)) {
      request.timeout = 10000;
    } else {
      request.timeout = 3000;
    }
    // 添加超时操作
    // await Future.delayed(Duration(milliseconds: request.timeout!), () {
    //   dzLog("abc2-${request.type}");
    //   GameRequest? cachedRequest = _removeRequestCache(requestKey);
    //   if (cachedRequest != null) {
    //     // 消息没有返回，则触发重连机制
    //     cachedRequest.requestTimeout();
    //     if (needReconnectWhenTimeOut(cachedRequest.type!)) {
    //       dzLog('协议超时重连 type == ${cachedRequest.type}');
    //       reconnect(force: true); //立刻重连
    //     }
    //     if (onTimeout != null) {
    //       // 通知上层某个请求类型出现超时
    //       onTimeout!(cachedRequest.type);
    //     }
    //   }
    // });
  }

  // 超时重连协议
  bool needReconnectWhenTimeOut(String? type) {
    if (type == "connect") {
      return false;
    }
    return false;
  }


  bool _needKickOut(GameResponse response) {
    String? sessionId = response.data["remark"];
    dzLog('remark: $sessionId connectSessionId === $connectSessionId');
    if (sessionId != null && sessionId != connectSessionId) {
      //sessionId ！= null 则是重复链接 且被踢的sessionid不是当前链接的connectSessionId
      dzLog('不需要被踢出登录');
      return false;
    }
    return true;
  }

  // 分发日志
  void dzLog(String message) {
    // debugPrint("dispatchLoggerMessage-$hashCode-$message");
    mWsService.target?.dzLog("WsConnectionCenter $message");
  }

  //！end class
}
