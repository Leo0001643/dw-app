import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/ui/bean/usdt_channel_entity.dart';

class AddWalletState {
  AddWalletState() {
    ///Initialize variables
  }

  ///手机区号数据
  Map<String,List<String>>? phoneData;

  ///手机号码
  var bankMobile = "".obs;

  ///usdt渠道信息
  var channel = UsdtChannelEntity().obs;
  ///区号
  var areaNo = "+86".obs;
  ///开户地址
  var openAddress = "".obs;
  ///验证出款密码
  var bankPwd = "".obs;

  var scaffoldKey = GlobalKey<ScaffoldState>();



}
