import 'package:aone_common/common.dart';
import 'package:app10/theme/theme_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatelessWidget {
  const WebPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WebData param = Get.arguments;

    return ThemeScaffold(
      title: param.title ?? ' ',
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: param.url,
      ),
    );
  }
}
