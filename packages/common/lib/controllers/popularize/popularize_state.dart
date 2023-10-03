import 'package:get/get.dart';

import '../../common.dart';

class PopularizeState {
  final Rx<QuanmintgYiIntroduce> _quanmintgYiIntroduce =
      Rx(QuanmintgYiIntroduce());

  QuanmintgYiIntroduce get quanmintgYiIntroduce => _quanmintgYiIntroduce.value;

  set quanmintgYiIntroduce(QuanmintgYiIntroduce value) =>
      _quanmintgYiIntroduce.value = value;

  final Rx<QuanmintgUserYjInfo> _quanmintgUserYjInfo =
      Rx(QuanmintgUserYjInfo());

  QuanmintgUserYjInfo get quanmintgUserYjInfo => _quanmintgUserYjInfo.value;

  set quanmintgUserYjInfo(QuanmintgUserYjInfo value) =>
      _quanmintgUserYjInfo.value = value;

  final Rx<QuanmintgYiOrderList> _quanmintgYiOrderList =
      Rx(QuanmintgYiOrderList());

  QuanmintgYiOrderList get quanmintgYiOrderList => _quanmintgYiOrderList.value;

  set quanmintgYiOrderList(QuanmintgYiOrderList value) =>
      _quanmintgYiOrderList.value = value;

  final RxBool _hasPermission = true.obs;

  bool get hasPermission => _hasPermission.value;

  set hasPermission(bool value) => _hasPermission.value = value;

  final RxString _echoImg = "".obs;

  String get echoImg => _echoImg.value;

  set echoImg(String value) => _echoImg.value = value;

  final RxString _tjUrl = "".obs;

  String get tjUrl => _tjUrl.value;

  set tjUrl(String value) => _tjUrl.value = value;
}
