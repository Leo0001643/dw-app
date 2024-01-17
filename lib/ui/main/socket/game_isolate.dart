import 'dart:async';
import 'dart:isolate';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:leisure_games/app/res/game_request.dart';
import 'package:leisure_games/app/res/game_response.dart';
import 'package:leisure_games/ui/main/socket/game_connection_service_center.dart';
import 'package:leisure_games/ui/main/socket/status/websocket_connect_status.dart';

class GameIsolateParam {
  Completer completer;
  /// 请求
  GameRequest? request;
  /// 命令
  String? message;

  /// 命令参数，可为空
  Map<String, dynamic>? params;

  GameIsolateParam(
      {required this.completer, this.request, this.message, this.params});

  String get paramKey {
    if (request != null) {
      return request!.requestKey();
    } else if (message != null && message!.isNotEmpty) {
      return message!;
    } else {
      return "";
    }
  }
}

/// 游戏线程管理（Main线程中）
class GameIsolate extends ChangeNotifier {
  static final GameIsolate _singleInstance = GameIsolate._internal();

  static GameIsolate get instance => GameIsolate();

  GameRequest? notifierRequest;
  GameResponse? notifierResponse;
  factory GameIsolate() {
    return _singleInstance;
  }

  final Map<String, dynamic> _maps = <String, dynamic>{};
  Function? _connectedCallback;
  late bool _isIsolateStarted;

  GameIsolate._internal() {
    _isIsolateStarted = false;
  }

  late Isolate _isolate;
   SendPort? _gameSendPort;

  /// 使用静态变量记录sendPort，否则子线程里无法取到值
  static SendPort? _mainSendPort;

  // 开启网路线程
  Future<void> startGameIsolate() async {
    // 防止重复开启
    if (_isIsolateStarted) {
      return;
    }
    _isIsolateStarted = true;

    ReceivePort receivePort = ReceivePort();
    SendPort sendPort = receivePort.sendPort;
    _mainSendPort = sendPort;

    RootIsolateToken rootIsolateToken = RootIsolateToken.instance!;

    String debugName = 'gameIsolate-${Random().nextInt(10)}';

    _isolate = await Isolate.spawn(
        doWorkInGameIsolate, [sendPort, rootIsolateToken],
        debugName: debugName);

    /// 避免线程因未捕获的异常而自动terminate
    _isolate.setErrorsFatal(false);

    StreamSubscription? streamSubscription;
    streamSubscription = receivePort.listen((message) async {
      // print("root message = $message, ${Isolate.current.debugName}");
      // 主线程监听数据
      if (message is SendPort) {
        _gameSendPort = message;
        // gameSendPort.send(sendPort);
      } else if (message is String) {
        if (message == "startConnection") {
          // 主线程
          if (_connectedCallback != null) {
            _connectedCallback!();
          }
          GameIsolateParam? param = _maps.remove(message);

          if (param != null) {
            param.completer.complete();
          }
        } else if (message == "stopConnection") {
          GameIsolateParam? param = _maps.remove(message);
          if (param != null) {
            param.completer.complete();
          }
        } else if (message == "updateUserInfos") {
          GameIsolateParam? param = _maps.remove(message);
          if (param != null) {
            param.completer.complete();
          }
        } else if (message == "updateTableId") {
          GameIsolateParam? param = _maps.remove(message);
          if (param != null) {
            param.completer.complete();
          }
        } else if (message == "updateConnectDomianList") {
          GameIsolateParam? param = _maps.remove(message);
          if (param != null) {
            param.completer.complete();
          }
        } else if (message == "entryResumeState") {
          GameIsolateParam? param = _maps.remove(message);
          if (param != null) {
            param.completer.complete();
          }
        } else if (message == "entryInactiveState") {
          GameIsolateParam? param = _maps.remove(message);
          if (param != null) {
            param.completer.complete();
          }
        } else if (message == "entryPausedState") {
          GameIsolateParam? param = _maps.remove(message);
          if (param != null) {
            param.completer.complete();
          }
        } else if (message == "entryDetachedState") {
          GameIsolateParam? param = _maps.remove(message);
          if (param != null) {
            param.completer.complete();
          }
        } else if (message == "exit") {
          streamSubscription!.cancel();
          _isolate.kill();
        }
      } else if (message is List) {

      }
    });
  }

  Future<void> updateUserInfos(String userId, String token,
      int serverTimeInterval) async {
    await runInGameIsolate("updateUserInfos", params: {
      "userId": userId,
      "token": token,
      'serverTimeInterval': serverTimeInterval,
    });
  }

  Future<void> updateTableId(int? tableId) async {
    await runInGameIsolate("updateTableId", params: {"tableId": tableId});
  }

  Future<void> updateConnectDomianList(List? domianList) async {
    await runInGameIsolate("updateConnectDomianList",
        params: {"urlList": domianList});
  }

  void startConnection({Function? onConnected}) async {
    if (onConnected != null) {
      _connectedCallback = onConnected;
    }
    await runInGameIsolate("startConnection");
  }

  void stopConnection() async {
    runInGameIsolate("stopConnection");
  }

  void entryResumeState() {
    runInGameIsolate("entryResumeState");
  }

  void entryInactiveState() {}

  void entryPausedState() {
    runInGameIsolate("entryPausedState");
  }

  void entryDetachedState() {
    runInGameIsolate("entryDetachedState");
  }

  /// 子线程执行请求
  Future<GameResponse> runRequestInGameIsolate(GameRequest request) async {
    Completer<GameResponse> completer = Completer<GameResponse>();
    notifierRequest = request;
    notifyListeners();
    GameIsolateParam param =
        GameIsolateParam(completer: completer, request: request);
    String paramKey = param.paramKey;
    _maps[paramKey] = param;
    print(
        "runRequestInGameIsolate $_isolate, $_gameSendPort, $request, $paramKey");
    completer.future.then((value) {
      GameResponse response = value;
      print("BB发送消息回来 ${request.requestTypeId}-${completer.hashCode}");
      notifierResponse = response;
      notifyListeners();
    });
    print("BB发送消息前 ${request.requestTypeId}-${completer.hashCode}");
    _gameSendPort?.send(request);
    print("BB发送消息后 ${request.requestTypeId}-${completer.hashCode}");
    return completer.future;
  }

  /// 子线程执行命令
  Future<void> runInGameIsolate(String message,
      {Map<String, dynamic>? params}) async {
    print("runInGameIsolate message = $message");
    Completer<void> completer = Completer<void>();
    GameIsolateParam param =
        GameIsolateParam(completer: completer, message: message);

    String paramKey = param.paramKey;
    _maps[paramKey] = param;
    if (params == null || params.isEmpty) {
      if(_gameSendPort!=null) {
        _gameSendPort?.send(message);
      }
    } else {
        _gameSendPort?.send([message, params]);
    }

    return completer.future;
  }

  // 子线程空间
  void doWorkInGameIsolate(List params) {
    ReceivePort gameReceivePort = ReceivePort();
    _gameSendPort = gameReceivePort.sendPort;
    // DzLogger.init(params[2], isIsolate: true);

    SendPort sendPort = params[0]; // sendPort
    BackgroundIsolateBinaryMessenger.ensureInitialized(
        params[1]); // rootIsolateToken

    // 由于主线程与子线程是隔离的，所以通知主线程当前sendPort
    _mainSendPort = sendPort;
    print(
        "doWorkInGameIsolate mainSendPort = $_mainSendPort, ${Isolate.current.debugName}");
    sendPort.send(_gameSendPort);

    StreamSubscription? streamSubscription;
    streamSubscription = gameReceivePort.listen((message) async {
      print("${Isolate.current.debugName} message = $message");
      // 游戏线程监听数据
      if (message is Map<String, dynamic>) {
        GameRequest request = GameRequest.fromMap(message);
        GameResponse response = await request.requestData();
        print("isolate response = $response ${response.responseKey()}");
        sendPort.send(response);
      } else if (message is GameRequest) {
        GameRequest request = message;
        print("isolate request = $request ${request.requestKey()}");
        GameResponse response = await request.requestData();
        print("isolate response = $response ${response.responseKey()}");
        sendPort.send(response);
      } else if (message is String) {
        if (message == "startConnection") {
          GameConnectionServiceCenter.instance.startConnection(onConnected: () {
            // 成功后，给主线程发送回调
            sendPort.send(message);
          });
        } else if (message == "stopConnection") {
          GameConnectionServiceCenter.instance.stopConnection();
          sendPort.send(message);
        } else if (message == "entryResumeState") {
          GameConnectionServiceCenter.instance.entryResumeState();
          sendPort.send(message);
        } else if (message == "entryInactiveState") {
          GameConnectionServiceCenter.instance.entryInactiveState();
          sendPort.send(message);
        } else if (message == "entryPausedState") {
          GameConnectionServiceCenter.instance.entryPausedState();
          sendPort.send(message);
        } else if (message == "entryDetachedState") {
          GameConnectionServiceCenter.instance.entryDetachedState();
          sendPort.send(message);
        } else if (message == "exit") {
          streamSubscription!.cancel();
        }
      } else if (message is List) {
        if (message[0] is String) {
        }
      }
    });
  }

  // 分发消息
  void dispatchResponse(GameResponse response) {
    _mainSendPort!.send(["dispatchResponse", response]);
  }

  // 分发网路哦状态
  void dispatchConnectStatus(WebSocketConnectStatus state) {
    _mainSendPort!.send(["dispatchConnectStatus", state]);
  }

  // 分发日志
  void dispatchLoggerMessage(String message) {
    _mainSendPort!.send(["dispatchLoggerMessgae", message]);
  }

  //！end class
}
