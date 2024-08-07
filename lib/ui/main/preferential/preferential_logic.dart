import 'dart:async';
import 'dart:convert';

import 'package:common_utils/common_utils.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/ui/bean/change_api_event.dart';
import 'package:leisure_games/ui/bean/base_api_oss_entity.dart';
import 'package:leisure_games/ui/bean/language_event.dart';
import 'package:leisure_games/ui/bean/promotion_type_entity.dart';

import 'preferential_state.dart';

class PreferentialLogic extends GetxController {
  final PreferentialState state = PreferentialState();
  StreamSubscription? languageStream;
  StreamSubscription? apiSub;

  @override
  void onReady() {
    ///语言国际化更新
    languageStream = eventBus.on<LanguageEvent>().listen((event) {
      loadData();
    });
    apiSub = eventBus.on<ChangeApiEvent>().listen((event) {
      loadData();
    });
    super.onReady();
  }

  @override
  void onClose() {
    languageStream?.cancel();
    apiSub?.cancel();
    state.tabController?.dispose();
    super.onClose();
  }

  void loadData() {
    HttpService.getPromotionTpe().then((value) {
      var data = jsonDecode(value);
      state.promotions = PromotionTypeEntity.fromJson(data);
      ///需要对tab进行排序
      var containOther = false;
      var tabs = List<String>.empty(growable: true);
      tabs.add(Intr().quanbu);
      state.promotions.data?.forEach((key, value) {
        if(key == Intr().qita){
          containOther = true;
        } else if(key != Intr().quanbu){
          tabs.add(key);
        }
      });
      if(containOther){
        tabs.add(Intr().qita);
      }
      state.tabs.assignAll(tabs);
      clickTab(0);
    });
  }

  void clickTab(int index) {
    state.list.assignAll(state.promotions.data![state.tabs[index]] ?? []);
    loggerArray(["这里切换没有刷新吗",state.list]);
    // state.list.refresh();
  }

  void onClickType(PromotionTypeKey item) {
    HttpService.getPromotionDetail(item.id.em()).then((value) {
      Get.toNamed(Routes.preferential_detail,arguments: value);
    });
  }

  String formatPreTime(PromotionTypeKey item){
    if(item.startTime == item.endTime && item.startTime == 0 || (item.startTime.em() > 0 && item.endTime.em() <= 0) ){
      return Intr().changqihuodong;
    }else if(item.startTime.em() < item.endTime.em()){
      if(item.startTime.em() == 0){
        return "${Intr().jiehzhiriqizhi}${DataUtils.format12Hour(item.endTime.em() * 1000,format: DateFormats.full)}";
      } else {
        return "${DataUtils.format12Hour(item.startTime.em()* 1000,format: DateFormats.full)}${Intr().dao}${DataUtils.format12Hour(item.endTime.em()* 1000,format: DateFormats.full)}";
      }
    }
    return "";
  }





}
