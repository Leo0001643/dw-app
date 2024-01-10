import 'package:get/get.dart';
import 'package:leisure_games/ui/bean/usdt_channel_entity.dart';
import 'package:leisure_games/ui/bean/user_draw_detail_entity.dart';

class BindUsdtState {
  BindUsdtState() {
    ///Initialize variables
  }

  ///最大绑卡数量
  var maxCount = 4;

  ///提现账户
  var userDraw = UserDrawDetailEntity().obs;

  ///数字钱包绑定信息
  List<UsdtChannelEntity>? list;



}
