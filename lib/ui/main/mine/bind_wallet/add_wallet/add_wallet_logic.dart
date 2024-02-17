import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/ui/bean/usdt_channel_entity.dart';

import 'add_wallet_state.dart';

class AddWalletLogic extends GetxController {
  final AddWalletState state = AddWalletState();

  @override
  void onReady() {
    loadData(Get.arguments);
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }



  void loadData(UsdtChannelEntity channel) {
    state.channel.value = channel;
    state.channel.refresh();

    DataUtils.readPhoneData().then((value) {
      state.phoneData = value;
      // loggerArray(["读取文件数据结果",state.phoneData]);
    });

  }

  void bindUsdt(){
    var mobile = isEmpty(state.channel.value.mobile) ? state.bankMobile.value.em() : state.channel.value.mobile;
    if(isEmpty(mobile)){
      showToast(Intr().shuruzhenshiyouxiao);
      return;
    }

    if(isEmpty(state.openAddress.value)){
      showToast(Intr().qingshuruqianbaodizhi);
      return;
    }
    if(isEmpty(state.bankPwd.value)){
      showToast(Intr().qingshuruqukuanmima);
      return;
    }

    var user = AppData.user();

    //协议类型【1:TRC20,2:ERC20,3:OMNI】
    var params = <String,dynamic>{"oid":user?.oid,"username":user?.username,
      "bankAccount":state.openAddress.value,
      "bankCode":state.channel.value.typeCode(),"bankPassword":state.bankPwd.value};
    ///如果是第一次填手机号
    if(isEmpty(state.channel.value.mobile)){
      params["mobile"] = mobile;
    }

    HttpService.bindVMDrawDetail(params).then((value) {
      showToast(Intr().caozuochenggong);
      Get.until((ModalRoute.withName(Routes.main)));
    });

  }




}
