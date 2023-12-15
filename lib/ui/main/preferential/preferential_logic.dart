import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/ui/bean/promotion_type_entity.dart';

import 'preferential_state.dart';

class PreferentialLogic extends GetxController {
  final PreferentialState state = PreferentialState();

  @override
  void onReady() {
    loadData();
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void loadData() {
    HttpService.getPromotionTpe().then((value) {
      state.promotions = value;
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
