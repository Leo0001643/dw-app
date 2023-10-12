
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:leisure_games/ui/bean/html_event.dart';

class HtmlState {
  HtmlState() {
    ///Initialize variables
  }

  var progress = 0.0.obs;
  var progressVisible= true.obs;//显示隐藏

  var pageTitle = "".obs;//页面标题

  var htmlEvent = HtmlEvent().obs;


}
