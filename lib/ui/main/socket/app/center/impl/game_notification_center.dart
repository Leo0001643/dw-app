import 'package:leisure_games/app/res/game_response.dart';
import 'package:leisure_games/ui/main/socket/status/websocket_connect_status.dart';

abstract class GameNotificationListener {
  /// 通知响应回调
  void notificationCallBack(GameResponse response);

  /// 支持处理响应
  bool supportHandleResponse(GameResponse response);
}

abstract class GameConnectionListener {
  /// 通知长连接状态回调
  void notifyConnectStatus(WebSocketConnectStatus state);
}
