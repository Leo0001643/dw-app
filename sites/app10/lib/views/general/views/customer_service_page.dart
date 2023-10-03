import 'package:aone_common/interface/web_data.dart';
import 'package:aone_common/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../tab/controllers/main_tabbar_controller.dart';
import '../../../theme/theme_scaffold.dart';

class WebServicePage extends StatelessWidget {
  const WebServicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WebData param = Get.arguments;

    return ThemeScaffold(
      onBack: () {
        if (param.backType == '2') {
          Get.until(
              (route) => (route as GetPageRoute).settings.name == Routes.main);
          MainTabbarController.to.jumpToPage(0);
        } else {
          Get.back();
        }
      },
      title: param.title ?? ' ',
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: param.url,
      ),
    );
  }
}
