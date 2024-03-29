import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/ui/bean/html_event.dart';
import 'package:leisure_games/ui/bean/payment_list_entity.dart';

import 'recharge_wallet_state.dart';

class RechargeWalletLogic extends GetxController {
  final RechargeWalletState state = RechargeWalletState();

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



  void loadData(PaymentListBanks info) {
    state.paymentInfo.value = info;
    state.title.value = info.bankName.em();
    state.selectIndex.value = 0;

    HttpService.getPaymentList(AppData.user()!.oid.em(), AppData.user()!.username.em()).then((value) {
      state.paymentList.value = value;
      state.paymentList.refresh();
    });

    ///线下协议
    HttpService.getPaymentChannel(AppData.user()!.oid.em(),
        AppData.user()!.username.em(),info.bankCode.em()).then((value) {
        // Get.find<RechargeOnlineLogic>().loadData(info, value);
      state.channelList.value = value.jumpPayment ?? [];
      state.channelList.refresh();
    });
  }

  void onlineDeposit(BuildContext context){
    var item =state.channelList[state.selectIndex.value];

    var params = <String,dynamic>{"oid":AppData.user()?.oid.em(),"username":AppData.user()?.username.em(),
      "id":item.id,"money":state.remitAmount.value,
      "bankCode": item.banks?.first.bankCode};

    HttpService.onlineDeposit(params).then((value) {
      DialogUtils().showMessageDialog(context, Intr().quedingtijiaodingdan,onConfirm: (){
        Navigator.pop(context);
        Get.offAndToNamed(Routes.html,arguments: HtmlEvent(data: value.info.em(),isHtmlData: false,pageTitle: ""));
      },onCancel: ()=> Navigator.pop(context),divider: false);
    });
  }


}
