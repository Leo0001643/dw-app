import 'package:common_utils/common_utils.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/ui/bean/digiccy_deposit_data_entity.dart';
import 'package:leisure_games/ui/bean/withdraw_check_entity.dart';

import 'withdraw_apply_state.dart';

class WithdrawApplyLogic extends GetxController {
  final WithdrawApplyState state = WithdrawApplyState();

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

  void loadData(WithdrawCheckEntity data) {
    state.check = data;
    var user = AppData.user();

    state.pageType.value = data.checkType.em();

    HttpService.getBalance({ "cur":data.checkType, "platform":"main","oid":user?.oid,"username":user?.username }).then((value) {
      state.balance.value = value;
      state.balance.refresh();
    });

    HttpService.getUserDrawDetail({"oid":user?.oid,"username":user?.username}).then((value) {
      state.userDraw.value = value;
      state.userDraw.refresh();
    });

  }

  void withdraw() {
    if(isEmpty(state.dropdownValue.value.bankAccount)){
      showToast(Intr().qingxuanzhetixianzhanghu);
      return;
    }
    if(isEmpty(state.withdrawAmount.value)){
      showToast(Intr().qingxuanzhetixianzhanghu);
      return;
    }
    if(isEmpty(state.pwdValue)){
      showToast(Intr().qingshurutixianmima);
      return;
    }

    var user = AppData.user();
    var params = {"oid":user?.oid,"username":user?.username,"cardNumber":state.dropdownValue.value.cardNumber,
    "cur":state.pageType.value,"getPassword":state.pwdValue,"gold":state.actualAmount.value,"money":state.withdrawAmount.value};
    HttpService.takeSubmit(params).then((value) {
      Get.toNamed(Routes.withdraw_result,arguments: DigiccyDepositDataEntity(money: int.parse(state.withdrawAmount.value),
      date: DateUtil.formatDateMs(DateTime.now().millisecondsSinceEpoch),info:state.dropdownValue.value.info(),
        orderId: state.actualAmount.value,status: "${state.pageType.value}"));
    });

  }

  ///计算提现手续费
  void conculateRate(String v) {
    state.withdrawAmount.value = v;
    if(state.check?.timeFeeStatus == 2 || (state.check?.timeFeePercent ?? 0) > 0){
      /// 时效稽核手续费
      var timeFee = double.parse(state.withdrawAmount.value) * (state.check?.timeFeePercent ?? 0.0) / 100;
      var rate = timeFee + (state.check?.allNeedFee ??  0.0);
      state.serviceAmount.value = rate.toString();
      state.actualAmount.value = "${double.parse(state.withdrawAmount.value) - rate}";
    } else {
      var rate = state.check?.allNeedFee ??  0.0;
      state.serviceAmount.value = rate.toString();
      state.actualAmount.value = "${double.parse(state.withdrawAmount.value) - rate}";
    }
  }



}
