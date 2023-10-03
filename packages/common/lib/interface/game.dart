import 'package:aone_common/common.dart';
import 'package:flutter/cupertino.dart';

abstract class OnGameParams extends LangField {
  String? gameTag;
  String? subTag;
  int? ischangshang;
  int? type;
}

/// 处理导航链接
/// 商户除了会在导航中配置游戏以外还会配置外部链接和活动快捷
abstract class INavHandler {
  @mustCallSuper
  void handle(String href) {
    Map<String, Function> strategyMap = {
      '/dzp': handleFortuneWheel, //
      '/newdzp': handleFortuneWheel, //大转盘
      '/redwar': handleRedTask, // 红包任务
      '/promoCenter': handlePromoCenter, // 优惠中心
      '/activity': handleActivity, // 优惠活动
    };

    if (strategyMap.containsKey(href)) {
      strategyMap[href]!();
      return;
    }

    if (href.contains('http')) {
      handleLink(href);
    }
  }

  // 外部链接
  void handleLink(String href);

  void handleFortuneWheel();

  void handleRedTask();

  void handlePromoCenter();

  void handleActivity();
}
