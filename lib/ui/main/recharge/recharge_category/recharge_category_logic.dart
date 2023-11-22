import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/ui/bean/payment_list_entity.dart';
import 'package:leisure_games/ui/main/recharge/recharge_category/recharge_offline/recharge_offline_logic.dart';
import 'package:leisure_games/ui/main/recharge/recharge_category/recharge_online/recharge_online_logic.dart';

import 'recharge_category_state.dart';

class RechargeCategoryLogic extends GetxController {
  final RechargeCategoryState state = RechargeCategoryState();

  @override
  void onReady() {
    loadData(Get.arguments);
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


  void loadData(PaymentListBanks info) {
    state.paymentInfo = info;
    state.title.value = state.paymentInfo.bankName.em();
    ///只有银行转账和支付宝支持线下线上两种付款方式
    state.supportOnline.value = state.paymentInfo.bankCode == Constants.code_wangyin ||
        state.paymentInfo.bankCode == Constants.code_zhifubao;
    state.pageController.jumpToPage(state.supportOnline.value ? 0:1);
    state.tabController.index = state.supportOnline.value ? 0:1;

    HttpService.getPaymentList(AppData.user()!.oid.em(), AppData.user()!.username.em()).then((value) {
      state.paymentList.value = value;
      state.paymentList.refresh();
    });

    ///线下协议
    HttpService.getPaymentChannel(AppData.user()!.oid.em(),
        AppData.user()!.username.em(),info.bankCode.em()).then((value) {
      if(state.supportOnline.isTrue){
        Get.find<RechargeOnlineLogic>().loadData(info, value);
      }
      Get.find<RechargeOfflineLogic>().loadData(info, value);
    });



  }






}
