import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/ui/bean/news_rate_entity.dart';

import 'loss_percent_state.dart';

class LossPercentLogic extends GetxController {
  final LossPercentState state = LossPercentState();

  @override
  void onReady() {
    if(unEmpty(Get.arguments)){
      if(Get.arguments is NewsRateEntity){
        state.pageTitle.value = Intr().peilvshuoming;
        state.subTitle.value = (Get.arguments as NewsRateEntity).name.em();
        state.htmlEvent = Get.arguments;
      }
    }
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void loadPage(InAppWebViewController controller){
    loggerArray(["收到数据了吧 ${state.htmlEvent} "]);
    if(unEmpty(state.htmlEvent)){
      controller.loadData(data: state.htmlEvent!.content.em());
    }
  }

}
