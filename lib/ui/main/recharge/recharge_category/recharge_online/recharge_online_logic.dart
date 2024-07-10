import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/ui/bean/html_event.dart';
import 'package:leisure_games/ui/bean/payment_channel_entity.dart';
import 'package:leisure_games/ui/bean/payment_list_entity.dart';

import 'recharge_online_state.dart';

class RechargeOnlineLogic extends GetxController {
  final RechargeOnlineState state = RechargeOnlineState();

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

    state.paymentList.assignAll(channel.jumpPayment ?? []);
    state.paymentList.refresh();
    state.selectIndex.value = 0;

  }

  void onlineDeposit(BuildContext context){
    var item =state.paymentList[state.selectIndex.value];

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
