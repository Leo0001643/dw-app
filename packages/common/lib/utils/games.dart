import 'package:aone_common/common.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

enum GameInitStatus {
  done, // 成功
  unavailable, // 不支持试玩
  invalidUser, // 无效用户
  notGame, // 不是游戏
  outOfRange, // 超出处理范围
}

/// 游戏导航点击业务逻辑处理
GameInitStatus onBeforeGameInit(
    {OnGameParams? onGameParams,
    String? href,
    List<int>? onCategoryTypes //有些项目支持的分类不一样
    }) {
  print("------>jett  href  ${href} } ");

  // 处理商户在导航中配置的链接
  if (href != null) {
    EventBus.emit(EventType.onHandleHref, arg: href);
    return GameInitStatus.notGame;
  }
  if (onGameParams != null) {
    // 如果是支持的游戏类型厂商则跳转到category
    if ((onCategoryTypes ?? [2, 5, 6]).contains(onGameParams.type) &&
        onGameParams.ischangshang == 1) {
      Get.toNamed(Routes.gameCategory, arguments: onGameParams);
      return GameInitStatus.notGame;
    }
    final _userState = UserService.to.state;
    print("------>jett  authLevel  ${_userState.authLevel} }");

    switch (_userState.authLevel) {
      case AuthLevel.regular:
        Get.toNamed(Routes.gameInit, arguments: onGameParams);
        return GameInitStatus.done;
      case AuthLevel.trial:
        if (GlobalService.to
            .isTrialAble(onGameParams.subTag!, onGameParams.gameTag!)) {
          Get.toNamed(Routes.gameInit, arguments: onGameParams);
          return GameInitStatus.done;
        }
        SmartDialog.showToast('该游戏不支持试玩'.tr);
        return GameInitStatus.unavailable;
      case AuthLevel.visitor:
        {
          if (!UserService.to.state.isRegularUser) {
            EventBus.emit(EventType.onAuthRequire);
          }
          return GameInitStatus.invalidUser;
        }
    }
  }

  return GameInitStatus.outOfRange;
}

GameInitStatus onBeforeGameInitZ01({
  OnGameParams? onGameParams,
  String? href,
}) {
  // 处理商户在导航中配置的链接
  if (href != null) {
    EventBus.emit(EventType.onHandleHref, arg: href);
    return GameInitStatus.notGame;
  }
  if (onGameParams != null) {
    final _userState = UserService.to.state;

    switch (_userState.authLevel) {
      case AuthLevel.regular:
        Get.toNamed(Routes.gameInit, arguments: onGameParams);
        return GameInitStatus.done;
      case AuthLevel.trial:
        if (GlobalService.to
            .isTrialAble(onGameParams.subTag!, onGameParams.gameTag!)) {
          Get.toNamed(Routes.gameInit, arguments: onGameParams);
          return GameInitStatus.done;
        }
        SmartDialog.showToast('该游戏不支持试玩'.tr);
        return GameInitStatus.unavailable;
      case AuthLevel.visitor:
        {
          if (!UserService.to.state.isRegularUser) {
            EventBus.emit(EventType.onAuthRequire);
          }
          return GameInitStatus.invalidUser;
        }
    }
  }

  return GameInitStatus.outOfRange;
}
