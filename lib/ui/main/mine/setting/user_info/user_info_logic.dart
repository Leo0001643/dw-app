import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/controller/avatar_controller.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/res/jsonx.dart';
import 'package:leisure_games/app/utils/data_utils.dart';

import 'user_info_state.dart';

class UserInfoLogic extends GetxController {
  final UserInfoState state = UserInfoState();

  @override
  void onReady() {
    loadData();
    DataUtils.readPhoneData().then((value) {
      state.phoneData = value;
    });
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void loadData() {
    var user = AppData.user();

    HttpService.getUserDetail({"oid":user?.oid,"username":user?.username}).then((value) {
      state.userDetail.value = value;
      state.userDetail.refresh();
    });

  }

  void saveUser(){
    var params = <String,dynamic>{};
    if(unEmpty(state.mobile) && state.userDetail.value.mobile != state.mobile){
      params["mobile"] = "${state.areaNo.value}${state.mobile}";
    }
    if(unEmpty(state.userEdit.value.alias) && state.userDetail.value.alias != state.userEdit.value.alias){
      params["alias"] = state.userEdit.value.alias;
    }
    if(unEmpty(state.userEdit.value.qq) && state.userDetail.value.qq != state.userEdit.value.qq){
      params["qq"] = state.userEdit.value.qq;
    }
    if(unEmpty(state.userEdit.value.wechat) && state.userDetail.value.wechat != state.userEdit.value.wechat){
      params["wechat"] = state.userEdit.value.wechat;
    }
    if(unEmpty(state.userEdit.value.email) && state.userDetail.value.email != state.userEdit.value.email){
      params["email"] = state.userEdit.value.email;
    }
    ///如果没做任何更改就返回了
    if(isEmpty(params)){
      Get.back();
      return;
    }

    var user = AppData.user();
    params.addAll({"oid":user?.oid,"username":user?.username});


    HttpService.updateUserDetail(params).then((value) {
      showToast(Intr().caozuochenggong);
      ///更改个人信息
      Get.find<AvatarController>().refresh();
      Get.back();
    });
  }





}
