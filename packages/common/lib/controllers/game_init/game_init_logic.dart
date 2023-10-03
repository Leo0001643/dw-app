import 'dart:math';

import 'package:aone_common/common.dart';
import 'package:aone_common/data/remote/providers/game_provider.dart';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:dio/dio.dart' as dio;
import '../../core/fetch/exception/unsupported_game_exception.dart';

class GameInitState {
  late final OnGameParams onGameParams;
  final RxBool _havaBool = false.obs;

  bool get havaBool => _havaBool.value;

  set havaBool(bool value) => _havaBool.value = value;

  /// 进度条进度
  /// remind: dio非multi-part content只会返回一次callback 所以做个假的
  final RxDouble _progress = 0.0.obs;

  double get progress => _progress.value;

  set progress(double value) => _progress.value = value;

  final RxBool _isShowErrorTip = false.obs;

  bool get isShowErrorTip => _isShowErrorTip.value;

  set isShowErrorTip(bool value) => _isShowErrorTip.value = value;

  final RxString _errorTip = ''.obs;

  String get errorTip => _errorTip.value;

  set errorTip(String value) => _errorTip.value = value;
}

class GameInitLogic extends BaseController {
  static GameInitLogic get to => Get.find();
  final _userState = UserService.to.state;
  GameProvider provider = GameProvider();
  GameInitState state = GameInitState();
  final AuthenticateProvider authProvider = AuthenticateProvider();

  final Random _random = Random();

  @override
  void onInit() async {
    super.onInit();
    state.onGameParams = Get.arguments;
    try {
      if (SpStorage.jwtToken != null) {
        var res = await authProvider.checkJwt(SpStorage.jwtToken!);
        printInfo(info: "res.token  ${res.token!}");

        if (res.token!) {
          getGameInitInfo();
        } else {
          UserService.to.onBeforeLogout();
        }
      }
      if (UserService.to.state.isTrial) {
        getGameInitInfo();
      }
    } catch (e) {
      UserService.to.onBeforeLogout();
    }
  }

  void getGameInitInfo() async {
    state.isShowErrorTip = false;
    state.errorTip = '';
    state.progress = _random.nextDouble();
    var _params = state.onGameParams;
    AllGameItem? allGameItem;

    int havErr = -1;
    try {
      allGameItem = state.onGameParams as AllGameItem;
      havErr = allGameItem.state ?? -1;
      printInfo(info: "获取值:$havErr");
    } catch (e) {
      printInfo(info: "转换出错");
      havErr = -1;
    }

    var dto = GameInitDto(
      gameTagPatch: _params.gameTag! + '|' + _params.subTag!,
      gameVal: "",
      test: _userState.authLevel == AuthLevel.regular ? 2 : 1,
    );
    print('GameInit提交的数据 == ${dto}');
    await fetchHandler<dio.Response>(provider.gameInit(dto), onSuccess: (res) {
      state.progress = 1.0;
      // if (kReleaseMode) {
      //   Sentry.captureMessage('''
      //   response>>>>
      //   url: ${res.url}
      //   code: ${res.statusCode}
      //   isVertical: ${res.isVertical}
      //   <<<<
      //   request>>>>
      //   gameTagPatch: ${dto.gameTagPatch}
      //   gameVal: ${dto.gameVal}
      //   test: ${dto.test}
      //   ''');
      // }
      if (havErr == 3) {
        state.isShowErrorTip = true;
        state.errorTip = res.data['message'];
        return;
      }
      if (res.data['data'] != null) {
        final entity = GameInitEntity.fromJson(res.data['data']);
        Get.offAndToNamed(Routes.gameWebView, arguments: entity);
      } else {
        state.isShowErrorTip = true;
        state.errorTip = res.data['message'];
      }
    }, onError: (err) {
      state.isShowErrorTip = true;
      state.errorTip = err.message;
      if (err is UnsupportedGameException) {}
    });
  }
}
