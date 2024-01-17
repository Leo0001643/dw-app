import 'dart:async';

import 'package:leisure_games/app/res/game_request.dart';

class DXIsolateParam {
  // 回调
  Completer completer;

  /// 请求
  GameRequest? request;

  /// 命令
  String? message;

  /// 命令参数，可为空
  Map<String, dynamic>? params;

  DXIsolateParam(
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
