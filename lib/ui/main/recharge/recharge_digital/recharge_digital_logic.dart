import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
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

  void loadData() async {
    state.paymentInfo = Get.arguments;
    state.title.value = state.paymentInfo.bankName.em();
    try{
      ///线上协议
      var online = await HttpService.getOnlineDigiccyChannel(AppData.user()!.oid.em(), AppData.user()!.username.em());
      state.onLineList.assignAll(online.wallet ?? []);
      state.onLineList.refresh();
    }catch(e){
      logger(e);
    }
    ///线下协议
    HttpService.getPaymentChannel(AppData.user()!.oid.em(),
        AppData.user()!.username.em(),state.paymentInfo.bankCode.em()).then((value) {
      state.offLineList.assignAll(value.bankSet ?? []);
      state.offLineList.refresh();
      setCurrentTab();
    });

    // Intr().xianshang,Intr().xianxia

    HttpService.getPaymentList(AppData.user()!.oid.em(), AppData.user()!.username.em()).then((value) {
      state.paymentList.value = value;
      state.paymentList.refresh();
    });
  }




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
      "inBankSetId":(state.currentAccount.value as PaymentChannelBankSet).id,"money":state.remitAmount,"userAddTime":DataUtils.format12Hour(DateTime.now().millisecondsSinceEpoch),
    "remark":state.walletAddress};
    HttpService.digiccyDeposit(params).then((value) {
      // value.remitName = AppData.user()?.username.em();
      value.symbol = "₮";
      Get.offAndToNamed(Routes.recharge_result,arguments: value);
    });
  }

  void setCurrentTab() {
    if(unEmpty(state.onLineList) && unEmpty(state.offLineList)){
      state.currentList.assignAll(state.onLineList);
      state.currentList.refresh();
      state.tabController.animateTo(0);
      state.currentAccount.value = state.onLineList.first;
      state.currentAccount.refresh();
    }else if(unEmpty(state.onLineList)){
      state.currentList.assignAll(state.onLineList);
      state.currentList.refresh();
      state.tabController.animateTo(0);
      state.currentAccount.value = state.onLineList.first;
      state.currentAccount.refresh();
    } else if(unEmpty(state.offLineList)){
      state.currentList.assignAll(state.offLineList);
      state.currentList.refresh();
      state.tabController.animateTo(1);
      state.currentAccount.value = state.offLineList.first;
      state.currentAccount.refresh();
    }
  }








  
}
