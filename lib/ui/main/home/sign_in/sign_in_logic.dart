import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';

import 'sign_in_state.dart';

class SignInLogic extends GetxController {
  final SignInState state = SignInState();

  @override
  void onReady() {
    queryCheckInInfo();
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void queryCheckInInfo() {
    var user = AppData.user();
    var params = {"oid":user?.oid,"username":user?.username};

    HttpService.queryCheckInInfo(params).then((value) {
      state.checkInfo.value = value;
      state.checkInfo.refresh();
    });
  }

  void checkInPoint(BuildContext context){
    var user = AppData.user();
    var params = {"oid":user?.oid,"username":user?.username};

    HttpService.checkInPoint(params).then((value) {
      queryCheckInInfo();///签到成功，刷新签到信息
      DialogUtils().showSignSuccessDialog(context, this, value);
    });
  }





}
