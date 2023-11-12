
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';

import 'preferential_detail_state.dart';

class PreferentialDetailLogic extends GetxController {
  final PreferentialDetailState state = PreferentialDetailState();

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void loadPage(InAppWebViewController controller){
    print("收到数据了吧 ${state.detail.title}");
    var content = '${state.detail.content.em()}';
    controller.loadData(data: content);
  }

}
