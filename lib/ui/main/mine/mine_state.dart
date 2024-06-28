import 'package:get/get.dart';
import 'package:leisure_games/ui/bean/balance_entity.dart';
import 'package:leisure_games/ui/bean/bonus_total_entity.dart';
import 'package:leisure_games/ui/bean/login_user_entity.dart';
import 'package:leisure_games/ui/bean/member_point_entity.dart';
import 'package:leisure_games/ui/bean/web_config_entity.dart';

class MineState {
  MineState() {
    ///Initialize variables
  }

  ///余额
  var usdtBal = BalanceEntity().obs;
  var cnyBal = BalanceEntity().obs;

  ///奖金
  var bonus = BonusTotalEntity().obs;

  ///会员积分
  var memberPoint = MemberPointEntity().obs;

  ///用户信息
  var user = LoginUserEntity().obs;


}
