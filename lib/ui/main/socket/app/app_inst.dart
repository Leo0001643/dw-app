// 应用程序，全局Inst


import 'package:leisure_games/ui/main/socket/app/service/isolate_service.dart';
import 'package:leisure_games/ui/main/socket/app/ws_main_service.dart';
import 'package:leisure_games/ui/main/socket/game_data_service_center.dart';

import 'game_isolate.dart';

// 线程服务类型


class AppInst {
  static final AppInst _singleInstance = AppInst._internal();

  factory AppInst() {
    return _singleInstance;
  }

  static AppInst get instance => AppInst();

  AppInst._internal() {
  }

  static final GameIsolate mGameIsolate = GameIsolate();

  static GameIsolate get gameIsolate {
    return mGameIsolate;
  }

  // App初始化
  Future<void> init() async {
    // 开启网络线程
    await AppInst.gameIsolate
        .startNetIsolate(IsolateServerType.mNet, IsolateServerType.net);
  }

  // 开启ws
  void startWs() {
    print("AppInst 开启长连接");
    IsolateService? serv = gameIsolate.mainService();
    if (serv != null && serv is WSMainService) {
      serv.startWsConnect();
    }
  }

  // 关闭Ws
  void stopWs() {
    print("AppInst 关闭长连接");
    GameDataServiceCenter.instance.stopConnection();
  }

  // App是可见状态并且接受用户的交互
  Future<void> enterResumed() async {
    //
  }

  // App不是激活状态并且不再接受用户的交互，下一步将会切换到paused状态，inactive状态持续时间很短。
  // 在Android上，下面的行为会让App进入到inactive状态
  // 关闭屏幕
  // 有电话打进来
  // 展示系统对话框
  // 在iOS上，下面的行为会让App进入到inactive状态
  // 关闭屏幕
  // 有电话打进来
  // 应用程序在响应Touch ID或者Face ID等
  // 进入到应用切换器或者控制中心
  Future<void> enterInactive() async {
    //
  }

  // 应用程序切换到了后台，用户不可见不再接受用户交互，在当前状态时候，Flutter会做一些优化，
  // 例如停止执行PlatformDispatcher.onBeginFrame 和 PlatformDispatcher.onDrawFrame来节能。
  Future<void> enterPaused() async {
    //
  }

  // Flutter没有视图展示的时候的状态，一般会在App退出的时候执行。
  Future<void> enterDetached() async {
    //
  }

  //!end class app inst
}
