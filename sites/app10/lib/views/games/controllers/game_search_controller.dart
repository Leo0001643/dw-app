import 'package:get/get.dart';
import 'package:aone_common/common.dart';
import 'package:flutter/cupertino.dart';

class GameSearchController extends SearchLogic {
  final FocusNode accountFocus = FocusNode();
  final TextEditingController textCn = TextEditingController();

  @override
  void onReady() {
    super.onReady();
    FocusScope.of(Get.context!).requestFocus(accountFocus);
  }
}
