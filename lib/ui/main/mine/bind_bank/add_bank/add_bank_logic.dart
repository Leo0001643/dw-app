import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/ui/bean/user_draw_detail_entity.dart';

import 'add_bank_state.dart';

class AddBankLogic extends GetxController {
  final AddBankState state = AddBankState();

  @override
  void onReady() {
    loadData(Get.arguments);
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void loadData(UserDrawDetailEntity detail) async{
    state.detail.value = detail;
    state.detail.refresh();

    var params = <String,dynamic>{"oid":AppData.user()?.oid.em(),
      "username":AppData.user()?.username.em(), "type":1,};
    HttpService.getBanks(params).then((value) {
      state.banks.assignAll(value);
    });

    DataUtils.readPhoneData().then((value) {
      state.phoneData = value;
      // loggerArray(["读取文件数据结果",state.phoneData]);
    });

  }


  void bindBank(){
    String? mobile;
    if(isEmpty(state.detail.value.mobile)){
      mobile = state.bankMobile.value.em();
      if(isEmpty(mobile)){
        showToast(Intr().shuruzhenshiyouxiao);
        return;
      }
      mobile = "${state.areaNo.value}$mobile";
    }
    if(isEmpty(state.selectBank.value.bankName)){
      showToast(Intr().qingxuanzhechukuanyinhang);
      return;
    }
    if(isEmpty(state.bankAccount.value)){
      showToast(Intr().shuruyinhangzhanghao);
      return;
    }
    if(isEmpty(state.openAddress.value)){
      showToast(Intr().shuruyinhangkakaihudizhi);
      return;
    }
    if(isEmpty(state.bankPwd.value) || state.bankPwd.value.length > 12 || state.bankPwd.value.length < 4){
      showToast(Intr().qingshuruchukuanmima);
      return;
    }
    var user = AppData.user();

    var params = <String,dynamic>{"oid":user?.oid,"username":user?.username,
      "realname":state.detail.value.realname.em(),"bankId":state.selectBank.value.id,"bankAccount":state.bankAccount.value,
      "bankAddress":state.openAddress.value,"getPassword":state.bankPwd.value};

    ///如果没绑定过手机号，需要传手机号
    if(unEmpty(mobile)){
      params["mobile"] = mobile;
    }

    HttpService.bindDrawDetail(params).then((value) {
      showToast(Intr().caozuochenggong);
      Get.until((ModalRoute.withName(Routes.main)));
    });


  }






}
