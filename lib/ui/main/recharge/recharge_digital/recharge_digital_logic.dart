import 'package:common_utils/common_utils.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/ui/bean/digiccy_channel_entity.dart';
import 'package:leisure_games/ui/bean/payment_channel_entity.dart';

import 'recharge_digital_state.dart';

class RechargeDigitalLogic extends GetxController {
  final RechargeDigitalState state = RechargeDigitalState();

  @override
  void onReady() {
    loadData();
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void loadData() {
    state.paymentInfo = Get.arguments;
    state.title.value = state.paymentInfo.bankName.em();
    ///线上协议
    HttpService.getOnlineDigiccyChannel(AppData.user()!.oid.em(),
        AppData.user()!.username.em()).then((value) {
          state.walletList.assignAll(value.wallet ?? []);
          state.walletList.refresh();
          state.currentAccount.value = value.wallet?.first ?? Object();
          state.currentAccount.refresh();
          // changeWallet(0);
    });
    ///线下协议
    HttpService.getPaymentChannel(AppData.user()!.oid.em(),
        AppData.user()!.username.em(),state.paymentInfo.bankCode.em()).then((value) {
      state.agreeList.assignAll(value.bankSet ?? []);
      state.agreeList.refresh();
      // changeWallet(0);
    });

    HttpService.getPaymentList(AppData.user()!.oid.em(), AppData.user()!.username.em()).then((value) {
      state.paymentList.value = value;
      state.paymentList.refresh();
    });
  }
  
  // void changeWallet(int index){
  //   if(state.agreeList.em() > index){
  //     var item = state.agreeList[index];
  //     state.walletList.forEach((element) {
  //       // loggerArray(["数据对比",element.protocol,item.bankName]);
  //       if(element.protocol == item.bankName){
  //         state.currentAccount.value = element;
  //         state.currentAccount.refresh();
  //       }
  //     });
  //   }
  // }


  String getAddress(){
    var address = "";
    if(state.currentAccount.value is DigiccyChannelWallet){
      address = (state.currentAccount.value as DigiccyChannelWallet).address.em();
    }else if(state.currentAccount.value is PaymentChannelBankSet){
      address = (state.currentAccount.value as PaymentChannelBankSet).cardNumber.em();
    }
    return address;
  }

  void digiccyDeposit() {
    ///线下才可调用此方法
    var params = <String,dynamic>{"oid":AppData.user()?.oid.em(),"username":AppData.user()?.username.em(),
      "inBankSetId":(state.currentAccount.value as PaymentChannelBankSet).id,"money":state.remitAmount,"userAddTime":DateUtil.formatDateMs(DateTime.now().millisecondsSinceEpoch),
    "remark":state.walletAddress};
    HttpService.digiccyDeposit(params).then((value) {
      // value.remitName = AppData.user()?.username.em();
      value.symbol = "₮";
      Get.offAndToNamed(Routes.recharge_result,arguments: value);
    });
  }








  
}
