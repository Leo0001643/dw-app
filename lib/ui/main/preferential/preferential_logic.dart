import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/ui/bean/language_event.dart';
import 'package:leisure_games/ui/bean/promotion_type_entity.dart';

import 'preferential_state.dart';

class PreferentialLogic extends GetxController {
  final PreferentialState state = PreferentialState();
  StreamSubscription? languageStream;

  @override
  void onReady() {
    loadData();
    ///语言国际化更新
    languageStream = eventBus.on<LanguageEvent>().listen((event) {
      loadData();
    });
    super.onReady();
  }

  @override
  void onClose() {
    languageStream?.cancel();
    super.onClose();
  }

  void loadData() {
    HttpService.getPromotionTpe().then((value) {
      loggerArray(["让我看看这里返回了什么呢",value]);
      var data = jsonDecode(value);
      state.promotions = PromotionTypeEntity.fromJson(data);
      clickTab(0);
    });
  }

  void clickTab(int index) {
    switch(index){
      case 0:
        state.list.assignAll(state.promotions.chongzhi ?? []);
        state.list.addAll(state.promotions.qita ?? []);
        state.list.refresh();
        break;
      case 1:
        state.list.assignAll(state.promotions.chongzhi ?? []);
        state.list.refresh();
        break;
      case 2:
        state.list.assignAll(state.promotions.qita ?? []);
        state.list.refresh();
        break;
    }
  }

  void onClickType(PromotionTypeKey item) {
    HttpService.getPromotionDetail(item.id.em()).then((value) {
      Get.toNamed(Routes.preferential_detail,arguments: value);
    });
  }




}
