import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/ui/bean/usdt_channel_entity.dart';
import 'package:leisure_games/ui/bean/wallet_draw_detail_entity.dart';

class BindWalletState {
  BindWalletState() {
    ///Initialize variables
  }

  ///最大绑卡数量
  var maxCount = 10;

  ///提现账户
  var userDraw = WalletDrawDetailEntity().obs;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  ///数字钱包绑定信息
  RxList<UsdtChannelEntity> list = RxList.empty(growable: true);
  ///未绑定钱包信息
  List<UsdtChannelEntity> dclist = List.empty(growable: true);



}
