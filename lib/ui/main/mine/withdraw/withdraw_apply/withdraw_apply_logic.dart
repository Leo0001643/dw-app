import 'package:common_utils/common_utils.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/ui/bean/digiccy_deposit_data_entity.dart';
import 'package:leisure_games/ui/bean/usdt_entity.dart';
import 'package:leisure_games/ui/bean/user_draw_detail_entity.dart';
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
    super.onClose();
  }

  void loadData(WithdrawCheckEntity data) {
    state.check = data;
    var user = AppData.user();
    if(data.checkType is UsdtEntity){
      state.walletChannel = data.checkType as UsdtEntity;
    }
    state.pageType.value = data.checkType != '5' ? '1': '5';

    if(data.checkType is UsdtEntity){
      var item = (data.checkType as UsdtEntity);
      state.selectValue = UserDrawDetailBanks(bankName: item.type.em(),bankAccount: item.account.em());
      state.dropdownValue.value = state.selectValue.toString();
      state.dropdownValue.refresh();
    }

    HttpService.getBalance({ "cur":state.pageType.value, "platform":"main","oid":user?.oid,"username":user?.username }).then((value) {
      state.balance.value = value;
      state.balance.refresh();
    });

    HttpService.getUserDrawDetail({"oid":user?.oid,"username":user?.username}).then((value) {
      state.userDraw.value = value;
      state.userDraw.refresh();
    });
  }

  void withdraw() {
    if(isEmpty(state.selectValue)){
      showToast(Intr().qingxuanzhetixianzhanghu);
      return;
    }
    if(isEmpty(state.withdrawAmount.value)){
      showToast(Intr().qingshurutixianjine);
      return;
    }
    if(isEmpty(state.pwdValue)){
      showToast(Intr().qingshurutixianmima);
      return;
    }

    var user = AppData.user();
    var params = {"oid":user?.oid,"username":user?.username, "cur":state.pageType.value,
      "getPassword":state.pwdValue,"gold":state.actualAmount.value,"money":state.withdrawAmount.value};
    if(unEmpty(state.walletChannel)){
      params["bankCode"] = state.walletChannel!.type.em();
    } else if(state.selectValue is UsdtEntity){
      params["bankCode"] = state.selectValue.type;
      // params["cardNumber"] = "${state.dropdownValue.value.cardNumber}";
    } else {
      params["bankCode"] = state.pageType.value;
    }

    HttpService.takeSubmit(params).then((value) {
      Get.toNamed(Routes.withdraw_result,arguments: DigiccyDepositDataEntity(money: int.parse(state.withdrawAmount.value),
      date: DataUtils.format12Hour(DateTime.now().millisecondsSinceEpoch),info:state.dropdownValue.value,
        orderId: state.actualAmount.value,status: state.pageType.value));
    });

  }

  ///计算提现手续费
  void conculateRate(String v) {
    state.withdrawAmount.value = v;
    var amount = double.tryParse(state.withdrawAmount.value) ?? 0;
    if(state.check?.timeFeeStatus == 2 || (state.check?.timeFeePercent ?? 0) > 0){
      /// 时效稽核手续费
      var timeFee = amount * (state.check?.timeFeePercent ?? 0.0) / 100;
      var rate = timeFee + (state.check?.allNeedFee ??  0.0);
      var actual = (amount - rate) < 0 ? "0" : DataUtils.formatMoney(amount - rate);

      state.serviceAmount.value = DataUtils.formatMoney(rate);
      state.actualAmount.value = actual;
    } else {
      var rate = state.check?.allNeedFee ??  0.0;
      var actual = (amount - rate) < 0 ? "0" : DataUtils.formatMoney(amount - rate);

      state.serviceAmount.value = DataUtils.formatMoney(rate);
      state.actualAmount.value = actual;
    }
  }



}
