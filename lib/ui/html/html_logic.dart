import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/ui/bean/html_event.dart';

import 'html_state.dart';

class HtmlLogic extends GetxController {
  final HtmlState state = HtmlState();

  @override
  void onReady() {
    if(unEmpty(Get.arguments) && Get.arguments is HtmlEvent){
      state.pageTitle.value = (Get.arguments as HtmlEvent).pageTitle.em();
      state.htmlEvent.value = Get.arguments;

    }
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void loadPage(InAppWebViewController controller){
    print("收到数据了吧 ${state.htmlEvent.value.toString()}");
    if(state.htmlEvent.value.isHtmlData == true){
      controller.loadData(data: state.htmlEvent.value.data.em());
    }else {
      controller.loadUrl(urlRequest: URLRequest(url: Uri.tryParse(state.htmlEvent.value.data.em())));
    }
  }


}
