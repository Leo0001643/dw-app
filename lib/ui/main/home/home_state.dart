import 'dart:async';
import 'package:get/get.dart';
import 'package:leisure_games/ui/bean/balance_entity.dart';
import 'package:leisure_games/ui/bean/game_kind_entity.dart';
import 'package:leisure_games/ui/bean/login_user_entity.dart';
import 'package:leisure_games/ui/bean/notice_entity.dart';
import 'package:leisure_games/ui/bean/pic30_back_entity.dart';
import 'package:leisure_games/ui/bean/pic30_entity.dart';

class HomeState {
  HomeState() {
    ///Initialize variables
  }

  ///游戏大类菜单
  var menuGroup = RxList<GameKindEntity>.empty(growable: true);

  ///公告信息
  var noticeList = RxList<NoticeEntity>.empty(growable: true);

  ///轮播图
  var bannerList = RxList<Pic30Entity>.empty(growable: true);

  ///活动内容
  var act = Pic30BackEntity().obs;
  ///红包是否可见
  var hongbaoVisible = false.obs;
  var hongbaoManual = true.obs;//手动关闭
  Timer? timer;


  ///用户信息
  var user = LoginUserEntity().obs;
  ///余额
  var usdtBal = BalanceEntity().obs;
  var cnyBal = BalanceEntity().obs;


}
