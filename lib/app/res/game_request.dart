import 'dart:async';
import 'dart:convert';

import 'package:leisure_games/app/res/game_response.dart';
import 'package:leisure_games/ui/main/socket/game_connection_center.dart';


/// 请求类型
enum GameRequestType {
  /// 心跳
  heartbeat(1);
  final int number;
  const GameRequestType(this.number);
}

/// 请求
class GameRequest {
  /// 请求类型
  late int requestTypeId;

  /// 请求的服务类型，0 网关，1 德州，2 短牌 3 大厅
  late int? serviceTypeId;


  /// 超时时间，默认3000毫秒
  late int timeout;

  /// 请求参数
  late Map<String, dynamic>? _params;

  /// 请求成功回调函数
  Function? onSuccess;

  /// 请求超时回调函数
  Function? onFailed;

  /// 取消请求回调函数
  Function? onCancelled;

  /// 异步处理
  late Completer<GameResponse>? _completer;

  /// 当前请求次数
  late int _tryCount;

  GameRequest({
    required this.requestTypeId,
    this.serviceTypeId = 0,
    this.timeout = 3000,
    this.onSuccess,
    this.onFailed,
  }) {
    // 生成消息id，用于日志与去重，暂时使用微秒，如1686033253595526
    _messageId = "${DateTime.now().microsecondsSinceEpoch}";
    _tryCount = 0;
    _params = null;
  }

  GameResponse _customResponse() {
    GameResponse response = GameResponse();
    response.responseTypeId = requestTypeId;
    response.data = null; // 空结果
    return response;
  }

  void _sendRequest() {
    _tryCount++;
    GameConnectionCenter.instance.sendRequest(this);
  }

  Future<GameResponse> requestData() async {
    // 判断当前连接是否建立，如果未建立则开始建立，并返回网络不可用响应
    if (!GameConnectionCenter.instance.checkNetworkReachable()) {
      GameResponse response = _customResponse();
      response.code = GameResponseErrorCode.unreachable.number;
      response.msg = "网络断开，请检查网络设置";
      return response;
    }
    _completer = Completer<GameResponse>();
    _sendRequest();
    return _completer!.future;
  }

  void requestTimeout() {
    // 106 解散房间 / 109 实时账单 / 111 补充筹码
    if (requestTypeId == 106 || requestTypeId == 109 || requestTypeId == 111) {
      // 请求超时，重新生成messageId 用于新的请求
      _messageId = "${DateTime.now().microsecondsSinceEpoch}";
      _sendRequest();
    } else {
      GameResponse response = _customResponse();
      response.code = GameResponseErrorCode.timeout.number;
      response.msg = null;
      if (_completer != null) {
        // 由于调用 completeError会抛出异常，因此构造超时响应
        // _completer!.completeError(response);
        _completer!.complete(response);
      }
      if (onFailed != null) {
        onFailed!(response);
      }
    }
  }

  void receivedResponse(GameResponse response) {
    if (_completer != null) {
      _completer!.complete(response);
    }
    if (onSuccess != null) {
      onSuccess!(response);
    }
  }

  void cancel() {
    // 连接超时，子类可重写
    GameResponse response = _customResponse();
    response.code = GameResponseErrorCode.autoCancel.number;
    response.msg = null;
    if (_completer != null) {
      _completer!.complete(response);
    }
    if (onCancelled != null) {
      onCancelled!(response);
    }
  }

  /// 记录消息id
  late String _messageId;
  String requestKey() {
    return "$requestTypeId-$_messageId";
  }

  /// 获取包数据
  dynamic packageData(int serverTimeInterval) {
    // 封装请求参数 生成请求时间，时间为毫秒，
    int currentTime = DateTime.now().millisecondsSinceEpoch;
    String requestTime = "${currentTime + serverTimeInterval}";

    // 设置公共参数
    Map<String, dynamic> headers = <String, dynamic>{};
    headers["requestTypeId"] = requestTypeId;
    headers["serviceTypeId"] = serviceTypeId;
    headers["messageId"] = _messageId; // 消息ID，暂时以时间作为id，微秒
    headers["requestTime"] = requestTime; // 请求时间
    headers["userId"] = userId; // 用户ID
    // 具体请求参数
    Map<String, dynamic>? params = _params ?? requestParams();
    if (params != null && params.isNotEmpty) {
      headers["param"] = jsonEncode(params);
      // 生成签名信息
    } else {
      headers["param"] = "";
    }
    return headers;
  }

  Map<String, dynamic>? requestParams() {
    // 封装请求参数，子类实现
    return null;
  }

  // 获取userId（当前方法处理子线程中）
  String get userId {
    return GameConnectionCenter.instance.userId;
  }

  /// 添加方法，用于单线程数据传输
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map["messageId"] = _messageId;
    map["requestTypeId"] = requestTypeId;
    map["serviceTypeId"] = serviceTypeId;
    map["timeout"] = timeout;
    map["params"] = _params ?? requestParams();
    return map;
  }

  GameRequest.fromMap(Map<String, dynamic> map) {
    _messageId = map["messageId"];
    requestTypeId = map["requestTypeId"];
    serviceTypeId = map["serviceTypeId"];
    timeout = map["timeout"];
    _params = map["params"];

    // 由于线程隔离，所以主线程使用userId时返回为空
    if (_params != null &&
        _params!["userId"] != null &&
        _params!["userId"].isEmpty) {
      // 此处在子线程中重新赋值
      _params!["userId"] = userId;
    }
  }
}