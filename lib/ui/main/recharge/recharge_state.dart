import 'package:get/get.dart';
import 'package:leisure_games/ui/bean/balance_entity.dart';
import 'package:leisure_games/ui/bean/login_user_entity.dart';
import 'package:leisure_games/ui/bean/payment_list_entity.dart';

class RechargeState {
  RechargeState() {
    ///Initialize variables
  }

  ///余额
  var cnyBal = BalanceEntity().obs;
  var usdtBal = BalanceEntity().obs;

  ///用户信息
  var user = LoginUserEntity().obs;

  ///支付方式
  var paymentList = PaymentListEntity().obs;


}
