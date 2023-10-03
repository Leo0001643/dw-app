import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../interface/web_data.dart';
import '../router/routes.dart';

class AppBaseService extends GetxService {
  static AppBaseService get to => Get.find();

  void openUrl(String urlStr, {LaunchMode? openType}) async {
    Uri _url = Uri.parse(urlStr);
    if (await canLaunchUrl(_url)) {
      await launchUrl(_url, mode: openType ?? LaunchMode.externalApplication);
    } else {
      // throw '无法跳转该链接';
      Get.toNamed(Routes.webPage, arguments: WebData(urlStr));
    }
  }
}
