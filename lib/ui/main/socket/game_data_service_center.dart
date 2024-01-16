import 'dart:async';
import 'dart:convert';

import 'package:leisure_games/ui/main/socket/game_isolate.dart';
class GameResultData {
  dynamic entity;
  int code;
  String msg;
  int tableId;
  int serviceTypeId;

  GameResultData(
      {this.entity,
      this.code = 0,
      this.msg = "",
      this.tableId = 0,
      this.serviceTypeId = 1});
}

/// 数据服务中心
/// 提供请求接口，接受并处理响应数据
class GameDataServiceCenter {
  static final GameDataServiceCenter _singleInstance =
      GameDataServiceCenter._internal();

  static GameDataServiceCenter get instance => GameDataServiceCenter();

  factory GameDataServiceCenter() {
    return _singleInstance;
  }

  GameDataServiceCenter._internal() {
    // 开启网络监听
    // _startNetworkMonitor();
  }

  /// 网络状态判断不正确，更改监控Socket State
  Future<bool> checkNetWorkState() async {
    return true;
  }

  void startConnection({Function? onConnected}) async {
    GameIsolate.instance.startConnection(onConnected: onConnected);
  }

  void stopConnection() {
    GameIsolate.instance.stopConnection();
  }


}
