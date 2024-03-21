import 'package:common_utils/common_utils.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/ui/bean/payment_channel_entity.dart';
import 'package:leisure_games/ui/bean/payment_list_entity.dart';

import 'recharge_offline_state.dart';

class RechargeOfflineLogic extends GetxController {
  final RechargeOfflineState state = RechargeOfflineState();

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void loadData(PaymentListBanks info,PaymentChannelEntity channel) {
    state.paymentInfo.value = info;
    state.paymentInfo.refresh();

    state.agreeList.assignAll(channel.bankSet ?? []);
    state.agreeList.refresh();
    state.selectIndex.value = 0;

    if(state.paymentInfo.value.bankCode == Constants.code_wangyin){
      var params = <String,dynamic>{"oid":AppData.user()?.oid.em(),
        "username":AppData.user()?.username.em(), "type":1,};
      HttpService.getBanks(params).then((value) {
        state.banks.assignAll(value);
      });
    }

  }

  void companyDeposit() {

    var agree = state.agreeList[state.selectIndex.value];

    ///如果是银行转账，传参不一样
    var outBankId = (state.paymentInfo.value).id;
    var outBankName = (state.paymentInfo.value).bankName;

    if(unEmpty(state.selectBank.value.bankName)){
      outBankId = state.selectBank.value.id;
      outBankName = state.selectBank.value.bankName;
    }

    var params = <String,dynamic>{"oid":AppData.user()?.oid.em(),"username":AppData.user()?.username.em(),
      "inBankSetId":agree.id,"money":state.remitAmount,
      "userAddTime":DateUtil.formatDateMs(DateTime.now().millisecondsSinceEpoch),
      "outBankId":outBankId,"outBankName":outBankName,"outCardUser":state.remitName,};

    HttpService.companyDeposit(params).then((value) {
      value.remitName = state.remitName;///回传姓名显示
      value.symbol = "¥";
      Get.offAndToNamed(Routes.recharge_result,arguments: value);
    });
  }
}
