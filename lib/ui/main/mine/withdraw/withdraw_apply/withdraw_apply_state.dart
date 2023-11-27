import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/ui/bean/balance_entity.dart';
import 'package:leisure_games/ui/bean/language_menu_entity.dart';
import 'package:leisure_games/ui/bean/user_draw_detail_entity.dart';
import 'package:leisure_games/ui/bean/withdraw_check_entity.dart';

class WithdrawApplyState {
  WithdrawApplyState() {
    ///Initialize variables
  }

  ///稽核信息
  WithdrawCheckEntity? check;

  var dropdownValue = UserDrawDetailBanks(bankName: Intr().qingxuanzhetixianzhanghu).obs;

  var pwdVisible = false.obs;
  var pwdValue = "";

  ///页面类型
  var pageType = 1.obs;

  ///余额
  var balance = BalanceEntity().obs;

  ///提现账户
  var userDraw = UserDrawDetailEntity().obs;

  ///提现金额
  var withdrawAmount = "".obs;

  ///实际的金额
  var actualAmount = "0".obs;
  ///手续费
  var serviceAmount = "0".obs;




}







