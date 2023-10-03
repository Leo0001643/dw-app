import 'package:aone_common/common.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var isLogin = true.obs;
  var current = 0;

  var pickerChildren = [
    '大连银行',
    '成都银行',
    '贵阳银行',
    '中国银行',
    '工商银行',
    '建设银行',
    '平安银行',
    '农业银行',
  ];
  var sexSelect = 0.obs;

  void changeItem(int tag) {
    // Get.toNamed(Routes.activity);

    print(tag);
    if (current == tag) {
      return;
    }
    current = tag;
    if (tag == 0) {
      isLogin.value = true;
    } else {
      isLogin.value = false;
    }
  }

  void loginAction() {
    print('点击了登录');
    Get.toNamed(Routes.user);
  }

  void clickService() {
    print('点击了客服');
  }

  void clickTryPlay() {
    print('点击了试玩');
  }
}
