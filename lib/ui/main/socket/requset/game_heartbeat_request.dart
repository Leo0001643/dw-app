
import 'package:leisure_games/app/res/game_request.dart';

/// 心跳请求
class GameHeartbeatRequest extends GameRequest {
  // 心跳超时时间调整成1.5s，不支持重试
  GameHeartbeatRequest(int? tableId)
      : super("pong",
            timeout: 3500);
}
