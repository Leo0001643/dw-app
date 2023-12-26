
import 'package:get/get.dart';
import 'package:leisure_games/ui/bean/bet_shake_entity.dart';
import 'package:leisure_games/ui/bean/shake_info_entity.dart';
import 'package:luckywheel/luckywheel.dart';

class PointsLotteryState {
  PointsLotteryState() {
    ///Initialize variables
  }

  ///转盘状态切换
  var wheelState = true.obs;

  late LuckyWheelController wheelController;
  var lotterys = [888,15.8,388,88,3888,88,1888,5.8,18888,1.8,0,8888,];

  ///积分抽奖
  var pointLottery = ShakeInfoEntity().obs;

  ///连续多少次的
  var continuousCount = -1;

  ///摇奖结果
  List<BetShakeEntity>? result;



}
