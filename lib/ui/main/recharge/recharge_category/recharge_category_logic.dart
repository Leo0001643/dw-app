import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
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

    ///协议
    HttpService.getPaymentChannel(AppData.user()!.oid.em(),
        AppData.user()!.username.em(),info.bankCode.em()).then((value) {
          state.supportOnline.value = unEmpty(value.jumpPayment);
          state.supportOffline.value = unEmpty(value.bankSet);
          if(unEmpty(value.jumpPayment) && unEmpty(value.bankSet)){///离在线都支持
            state.pageController.jumpToPage(0);
            state.tabController.index = 0;
          } else if(unEmpty(value.jumpPayment)){///仅支持在线
            state.pageController.jumpToPage(0);
            state.tabController.index = 0;
          }else  if(unEmpty(value.bankSet)){///仅支持离线
            state.pageController.jumpToPage(1);
            state.tabController.index = 1;
          }
          if(unEmpty(value.jumpPayment)){
            Get.find<RechargeOnlineLogic>().loadData(info, value);
          }
          if(unEmpty(value.bankSet)){
            Get.find<RechargeOfflineLogic>().loadData(info, value);
          }
    });
/*
    ///只有银行转账和支付宝支持线下线上两种付款方式
    ///如果只支持在线支付
    state.supportOnline.value = state.paymentInfo.bankCode == Constants.code_wangyin ||
        state.paymentInfo.bankCode == Constants.code_zhifubao ||state.paymentInfo.bankCode == Constants.code_jingdong;
    ///京东只支持在线
    state.supportOffline.value = state.paymentInfo.bankCode != Constants.code_jingdong;
    if(state.supportOnline.value && !state.supportOffline.value){///仅支持在线
      state.pageController.jumpToPage(0);
      state.tabController.index = 0;
    }else if(state.supportOnline.value && state.supportOffline.value){///离在线都支持
      state.pageController.jumpToPage(0);
      state.tabController.index = 0;
    }else if(!state.supportOnline.value && state.supportOffline.value){///仅支持离线
      state.pageController.jumpToPage(1);
      state.tabController.index = 1;
    }
*/

    HttpService.getPaymentList(AppData.user()!.oid.em(), AppData.user()!.username.em()).then((value) {
      state.paymentList.value = value;
      state.paymentList.refresh();
    });

  }






}
