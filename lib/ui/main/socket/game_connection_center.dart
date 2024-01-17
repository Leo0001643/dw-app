import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:leisure_games/app/res/game_request.dart';
import 'package:leisure_games/app/res/game_response.dart';
import 'package:web_socket_channel/io.dart';

import '../../bean/device_info.dart';
import 'status/game_connection_status.dart';

/// 长连接参数，用于构造连接地址
class GameConnectionParams {
  late String _url; // 地址缓存
  late String _userId; // 用户Id缓存
  late String _token; // token缓存
  late String _deviceId;
  late int _deviceType;
  late int _platformId;
  late String _applicationId;
  late String _version;
  int _serverTimeInterval = 0;

  int get serverTimeInterval => _serverTimeInterval;

  GameConnectionParams() {
    _url = "wss://9000ywfjn2.uy4ayov.com?language=zh";
    _userId = "";
    _token = "";
    _deviceId = "";
    _applicationId = "";
    _version = "v1.0.0";
    _platformId = 1;
    if (Platform.isAndroid) {
      _applicationId = '11';
    } else if (Platform.isIOS) {
      _applicationId = '9';
    } else {
      // 不支持，默认值为0
      _deviceType = 0;
    }
  }

  String get userId {
    return _userId;
  }

  void updateUserInfos(String userId, String token, int serverTimeInterval) {
    // 账号异常，清空缓存数据
    if (userId.isEmpty || token.isEmpty) {
      _userId = "";
      _token = "";
      _url = "";
      return;
    }
    if (_userId == userId && _token == token) {
      // 同一个账号，不处理数据
    } else {
      // 账号信息有变化，需要重新
      _userId = userId;
      _token = token;
      _url = "";
    }
    _serverTimeInterval = serverTimeInterval;
  }

  Future<void> _loadAppInfos() async {
    // 异步获取设备信息
    // _applicationId = await DeviceInfo.getPackageInfo();
  }

  Future<String> generateUrl(String connectSessionId, String? domian) async {
    if (_token.isEmpty || _userId.isEmpty || domian == null) {
      _url = "";
      return _url;
    }

    // 获取设备信息
    if (_deviceId.isEmpty || _applicationId.isEmpty) {
      await _loadAppInfos();
    }
    int requestTime =
        DateTime.now().millisecondsSinceEpoch + _serverTimeInterval;
    // 构造新连接地址
    Map<String, dynamic> params = <String, dynamic>{};
    params["deviceId"] = _deviceId; // 设备Id
    params["deviceType"] = _deviceType; // 设备类型
    params["requestTime"] = "$requestTime";
    params["messageId"] = "${DateTime.now().microsecondsSinceEpoch}";
    params["jwtToken"] = _token;
    params["userId"] = _userId;
    params["remark"] = connectSessionId;
    // print("建立连接参数 = $params");
    String applicationId = _applicationId; // 应用id
    int platformId = _platformId; // 平台
    String version = _version; // 版本
    var param = Uri.encodeComponent(jsonEncode(params));
    _url =
        "wss://$domian?param=$param&platformId=$platformId&applicationId=$applicationId&version=$version";
    return _url;
  }
}

/// 网络线程中
/// 长连接中心
/// 负责长连接的建立与数据的收发
class GameConnectionCenter {
  static final GameConnectionCenter _singleInstance =
      GameConnectionCenter._internal();

  static GameConnectionCenter get instance => GameConnectionCenter();

  factory GameConnectionCenter() {
    return _singleInstance;
  }

  /// 连接中回调
  late Function? onConnecting;

  /// 连接建立成功
  late Function? onConnected;

  /// 成功回调
  late Function? onSuccess;

  /// 超时回调
  late Function? onTimeout;

  /// 超时重连超时,退出b端
  late Function? onLogout;

  /// 收到数据回调
  late Function? onReceivedData;

  /// 出错回调
  late Function? onError;

  /// 失败回调
  late Function? onFailed;

  /// 断开回调
  late Function? onDisconnect;

  /// 获取用户信息
  late Function? onLoadUserInfo;

  /// close关闭
  late Function? onClose;

  /// 长链接状态
  late ConnectStatus connecSocketState;

  List _domianList = [];

  List _badDomianList = [];
  int reconectCount = 0;

  late Map<String, dynamic> _requestCaches;
  IOWebSocketChannel? _channel;
  StreamSubscription? streamSubscription;
  Timer? _backoffTimer;

  late GameConnectionParams _connectionParams;
  bool _isServerUpgrade = false; // 是否服务器升级
  bool _isKickout = false; // 被踢下线
  bool _isManualClose = false; // 手动断开
  String? connectSessionId;

  int firstReconnectTime = 0;

  final int resetContentTime = 6000;

  GameConnectionCenter._internal() {
    _requestCaches = <String, dynamic>{};
    connecSocketState = ConnectStatus.none;
    _connectionParams = GameConnectionParams();
    _isServerUpgrade = false;
  }

  /// 缓存请求，并返回key
  String _addRequestCache(GameRequest request) {
    String requestKey = request.requestKey();
    _requestCaches[requestKey] = request;
    return requestKey;
  }

  /// 找到缓存的请求并从缓存中移除
  GameRequest? _removeRequestCache(String requestKey) {
    GameRequest? request = _requestCaches.remove(requestKey);
    return request;
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

  void updateUserInfos(String userId, String token, int serverTimeInterval) {
    // 更新用户信息
    _connectionParams.updateUserInfos(userId, token, serverTimeInterval);
  }

  /// 更新用户信息
  void updateConnectDomianList(List? domianList) {
    // print('子线程拿到的《所有》domain ====> $domianList');
    // print('子线程拿到的《无效》domain ====> $_badDomianList');
    // 更新用户信息
    _domianList = [];
    reconectCount = 0;
    firstReconnectTime = 0;
    if (domianList == null || domianList.isEmpty) return;
    // 剔除不可用的域名
    for (String domian in domianList) {
      if (_badDomianList.isEmpty) {
        //没有记录不可用的域名直接拿全量域名 然后break
        _domianList.addAll(domianList);
        break;
      }
      // 剔除不可用域名
      if (!_badDomianList.contains(domian) && !_domianList.contains(domian)) {
        _domianList.add(domian);
      }
    }
    // 如果所有的域名都不能连，就把认定为不可以的域名拿来尝试重连
    if (_domianList.isEmpty) {
      _domianList.addAll(_badDomianList);
    }
  }

  Future<void> _connect() async {
    try {
      String url ="wss://9000ywfjn2.uy4ayov.com?language=zh";
      if (url.isEmpty) {
        connecSocketState = ConnectStatus.emptyUrl;
        return;
      }
      print("connecSocketState ConnectStatus.connecting");
      connecSocketState = ConnectStatus.connecting;
      if (onConnecting != null) {
        onConnecting!(); // 状态同步走到另外一个Isolate
      }
      print("发起建立连接的 url = $url");
      // url = ""; //move test
      _channel = IOWebSocketChannel.connect(url,
          connectTimeout: const Duration(seconds: 15));
      await _channel?.ready;
      //
      print("连接状态: ${_channel?.innerWebSocket?.readyState}");
      //连接成功
      if (_channel?.innerWebSocket?.readyState == 1) {
        reconectCount = 0;
        firstReconnectTime = 0;
        connecSocketState = ConnectStatus.connected;
        print('建立连接成功的 connectSessionId =====> $connectSessionId');
        stopTimer();
        // 开启监听
        streamSubscription = _channel!.stream
            .listen(_onData, onError: _onError, onDone: _onDone);
        if (onConnected != null) {
          onConnected!();
        }
      }
    } catch (e) {
      print('建立连接失败，继续重连 $e');
      connecSocketState = ConnectStatus.failed;
      if (_backoffTimer == null) {
        reconnect();
        startTimer();
      }
    }
  }

  void startTimer() {
    _backoffTimer ??= Timer.periodic(const Duration(seconds: 2), (timer) {
      if (connecSocketState != ConnectStatus.connected) {
        reconnect();
      } else {
        stopTimer();
      }
    });
  }

  void stopTimer() {
    if (_backoffTimer != null) {
      _backoffTimer?.cancel();
      _backoffTimer = null;
    }
  }

  void resetFlag() {
    _isManualClose = false;
    _isKickout = false;
    _isServerUpgrade = false;
  }

  // 判断是否需要重连
  bool canReconnect() {
    // 手动下线或者被踢  不需要再重连
    if (_isManualClose || _isKickout) {
      return false;
    }
    //连接中或者已经连接上了不需要重连
    if (connecSocketState == ConnectStatus.emptyUrl ||
        connecSocketState == ConnectStatus.connecting) {
      print('不需要重连');
      return false;
    }
    return true;
  }

  void reconnect({bool force = false}) async {
    print('重连开始 force:$force');
    if (!force) {
      // 如果强制重连会
      stopTimer();
      // 手动下线或者被踢  不需要再重连
      if (_isManualClose || _isKickout) {
        return;
      }
      //连接中或者已经连接上了不需要重连
      if (connecSocketState == ConnectStatus.emptyUrl ||
          connecSocketState == ConnectStatus.connecting) {
        print('不需要重连');
        return;
      }
    }
    resetFlag();
    print('重连之前关闭之前连接');
    closeSocket();

    if (firstReconnectTime == 0) {
      firstReconnectTime = DateTime.now().millisecondsSinceEpoch;
    } else {
      if (DateTime.now().millisecondsSinceEpoch - firstReconnectTime >
          resetContentTime) {
        //重连了一分钟,告诉用户已经与服务器失去连接，需要退出重进
        // _isManualClose = true;
        // closeSocket();
        firstReconnectTime = 0;
        print('重连超时，不再重连');
        if (onLogout != null) {
          onLogout!();
        }
        return;
      }
    }
    // 重连机制
    reconectCount++;
    if (reconectCount > 3) {
      //三次重连超时 切换域名
      print("重连继续，3次后切换域名");
      exchangeDomain();
      await _connect();
    } else {
      await _connect();
    }
    //
  }

  // 域名切换
  void exchangeDomain() {
    if (_domianList.isEmpty) {
      _domianList.addAll(_badDomianList);
    } else {
      if (!_badDomianList.contains(_domianList.first)) {
        _badDomianList.add(_domianList.first);
      }
    }
    _domianList.removeAt(0);
    if (_domianList.isEmpty) _domianList.addAll(_badDomianList);
  }

  void _onData(event) {
    // 处理接收到的数据
    _receivedData(event);
  }

  void _onError(err) {
    // 出现错误，需要根据错误信息来分开处理
    print("=======>_onError  = $onError");
    connecSocketState = ConnectStatus.failed;
    reconnect();
    if (onError != null) {
      print("=======>_onError  = $onError");
      onError!(err);
    }
  }

  void _onDone() {
    //_channel被关闭调用
    print("==============>_onDone closeCode = ${_channel?.closeCode}");
    connecSocketState = ConnectStatus.failed;
    if (_backoffTimer == null) {
      reconnect();
      startTimer();
    }
  }

  void _clearWhenSocketClose() {
    // 清除缓存请求
    _clearCaches();
    streamSubscription?.cancel();
    streamSubscription = null;
    connectSessionId = null;
    _channel?.sink.close();
    print('关闭长连接完成');
    if (_channel != null) {
      _channel = null;
    }
  }

  void stopResetContent() {
    _isManualClose = true;
  }

  /// 主动断开连接，可能要转为对外接口
  void closeSocket({bool isMunual = false}) {
    _isManualClose = isMunual;
    connecSocketState = ConnectStatus.disconnecting;
    _clearWhenSocketClose(); //清理ws相关
    connecSocketState = ConnectStatus.disconnected;
    if (!_isManualClose) {
      //不是手动断开 会通知上层
      if (onDisconnect != null) {
        onDisconnect!();
      }
    } else {
      if (onClose != null) {
        onClose!();
      }
    }
  }

  /// 检查网络状态
  bool checkNetworkReachable() {
    if (connecSocketState == ConnectStatus.connected) {
      return true;
    }
    // 用户主动触发连接操作，需要强制重连
    print("发送消息发现断连请求重连===>readState = $connecSocketState");
    reconnect(force: true);
    return false;
  }

  Future<void> sendRequest(GameRequest request) async {
    // 添加到请求服务中
    String requestKey = _addRequestCache(request);
    // 将数据交给长连接通道
    dynamic jsonData =
        request.packageData(_connectionParams.serverTimeInterval);
    // 发送数据
    try {
      if (jsonData is String) {
        jsonData = utf8.encode(jsonData);
      }
      _channel!.sink.add(jsonData);
    } catch (error, stackTrace) {
      print("_sendMessage excpetion = $error stackTree = $stackTrace");
    }
    //
    if (needReconnectWhenTimeOut(request.requestTypeId)) {
      request.timeout = 10000;
    } else {
      request.timeout = 3000;
    }
    print("关键协议【${request.requestTypeId}】发送，该协议超时时间: ${request.timeout}");
    // 添加超时操作
    await Future.delayed(Duration(milliseconds: request.timeout), () {
      print("abc2-${request.requestTypeId}");
      GameRequest? cachedRequest = _removeRequestCache(requestKey);
      if (cachedRequest != null) {
        // 消息没有返回，则触发重连机制
        cachedRequest.requestTimeout();
        if (needReconnectWhenTimeOut(cachedRequest.requestTypeId)) {
          print('协议超时重连 requestTypeId == ${cachedRequest.requestTypeId}');
          reconnect(force: true); //立刻重连
        }
        if (onTimeout != null) {
          // 通知上层某个请求类型出现超时
          onTimeout!(cachedRequest.requestTypeId);
        }
      }
    });
    print("abc1-${request.requestTypeId}");
  }

  // 超时重连协议
  bool needReconnectWhenTimeOut(int requestTypeId) {
    if (requestTypeId == 100 ||
        requestTypeId == 101 ||
        requestTypeId == 102 ||
        requestTypeId == 103 ||
        requestTypeId == 104 ||
        requestTypeId == 105 ||
        requestTypeId == 107 ||
        requestTypeId == 110 ||
        requestTypeId == 112 ||
        requestTypeId == 117 ||
        requestTypeId == 119 ||
        requestTypeId == 120) {
      return true;
    }
    return false;
  }

  // // 协议过滤器(过滤掉前端不支持的协议)
  // bool _passSupportProtocal(int respondId) {
  //   if (respondId == 201) {
  //     return false;
  //   }
  //   return true;
  // }

  // 接收协议并处理【网络线程】
  void _receivedData(dynamic data) {
    print("_receivedData ${DateTime.now().millisecondsSinceEpoch}");
    //消息解秘
    GameResponse response = GameResponse.fromJson(data);
    if (onReceivedData != null) {
      onReceivedData!(response);
    }
   {
      // 请求响应处理
      String responseKey = response.responseKey();
      GameRequest? request = _removeRequestCache(responseKey);
      if (request != null) {
        print(
            ">>>>>>请求响应 成功!!! code ${response.code}  请求协议  ${response.responseTypeId} messageId ${response.messageId}");
        // 响应成功，通知上层
        if (onSuccess != null) {
          onSuccess!(response);
        }
        request.receivedResponse(response);
      }
    }
    //
    if (response.responseTypeId == 100) {
      print(">>>>>>>>>>收到 100消息");
      return;
    }
  }


  bool needKickOut(GameResponse response) {
    String? sessionId = response.data["remark"];
    print('remark === $sessionId');
    print('connectSessionId === $connectSessionId}');
    if (sessionId != null && sessionId != connectSessionId) {
      //sessionId ！= null 则是重复链接 且被踢的sessionid不是当前链接的connectSessionId
      print('不需要被踢出登录');
      return false;
    }
    return true;
  }

  String get userId {
    return _connectionParams.userId;
  }

  //！end class
}
