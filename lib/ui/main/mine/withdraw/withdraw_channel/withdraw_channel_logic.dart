import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/ui/bean/usdt_entity.dart';
import 'package:leisure_games/ui/bean/user_draw_detail_entity.dart';

import 'withdraw_channel_state.dart';

class WithdrawChannelLogic extends GetxController {
  final WithdrawChannelState state = WithdrawChannelState();

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

  void loadData(){
    var user = AppData.user();

    HttpService.getUserDrawDetail({"oid":user?.oid,"username":user?.username}).then((value) {

      state.userDraw.value = value;
      state.userDraw.refresh();
    });
  }

  void jumpPage(BuildContext context,Object item){
    if(item is UserDrawDetailBanks){
      if(isEmpty(state.userDraw.value.banks)){
        DialogUtils().showMessageDialog(context, Intr().ninhaimeibangdingyhkzhanghu,btnConfirm: Intr().qubangding, onConfirm: (){
          Navigator.pop(context);
          Get.offAndToNamed(Routes.bind_bank);
        });
        return;
      }
      Get.toNamed(Routes.withdraw_check,arguments: Get.arguments);
    }else if(item is UsdtEntity){
      if(isEmpty(item.account)){
        DialogUtils().showMessageDialog(context, Intr().ninhaimeibangdingqianbao,btnConfirm: Intr().qubangding, onConfirm: (){
          Navigator.pop(context);
          Get.offAndToNamed(Routes.bind_wallet);
        });
        return;
      }
      Get.toNamed(Routes.withdraw_check,arguments: item);
    }
  }



}
