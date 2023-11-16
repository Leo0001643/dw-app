import 'dart:async';

import 'package:get/get.dart';
import 'package:leisure_games/ui/bean/act_status_entity.dart';
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

/*
  var images = [
    "http://ddm.dingdangmao6.cn/renren-fast/upload/2022112813_20221128211908.jpg",
    "http://www.dingdangmao6.cn:8080/renren-fast/upload/005z4Cgply1gma8yrm5xoj_20210104143243.jpg",
    "http://ddm.dingdangmao6.cn/renren-fast/upload/2022112802_20221128211814.jpg",
    "http://ddm.dingdangmao6.cn/renren-fast/upload/2022112812_20221128211908.jpg",
  ];*/

  ///游戏大类菜单
  var menuGroup = RxList<GameKindEntity>.empty(growable: true);

  ///公告信息
  var noticeList = RxList<NoticeEntity>.empty(growable: true);

  ///轮播图
  var bannerList = RxList<Pic30Entity>.empty(growable: true);

  ///活动内容
  var act = Pic30BackEntity().obs;
  var hongbaoVisible = false.obs;
  var hongbaoManual = true.obs;//手动关闭
  Timer? timer;


  ///用户信息
  var user = LoginUserEntity().obs;
  ///余额
  var usdtBal = BalanceEntity().obs;
  var cnyBal = BalanceEntity().obs;


}
