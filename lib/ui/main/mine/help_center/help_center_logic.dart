import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/ui/bean/help_entity.dart';
import 'package:leisure_games/ui/bean/html_event.dart';

import 'help_center_state.dart';

class HelpCenterLogic extends GetxController {
  final HelpCenterState state = HelpCenterState();

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
    HttpService.getHelpCenter().then((value) {
      state.aboutList.assignAll(value);
      state.aboutList.refresh();
    });

  }


  void clickItem(HelpEntity item){
    HttpService.getNewsRate(item.tag.em()).then((value) {
      Get.toNamed(Routes.html,arguments: HtmlEvent(isHtmlData: true,data: value.content.em(),pageTitle: item.name.em()));
    });
  }

}


