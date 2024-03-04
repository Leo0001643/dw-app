import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/ui/bean/bank_entity.dart';
import 'package:leisure_games/ui/bean/user_draw_detail_entity.dart';

class AddBankState {
  AddBankState() {
    ///Initialize variables
  }

  ///手机区号数据
  Map<String,List<String>>? phoneData;

  ///银行转账的待选择银行列表
  var banks = List<BankEntity>.empty(growable: true);
  ///选择的银行
  var selectBank = BankEntity().obs;

  ///绑定账号详情
  var detail = UserDrawDetailEntity().obs;

  ///手机号码
  var bankMobile = "".obs;
  ///出款账户
  var bankAccount = "".obs;
  ///开户地址
  var openAddress = "".obs;
  ///验证出款密码
  var bankPwd = "".obs;

  ///区号
  var areaNo = "+86".obs;
  var scaffoldKey = GlobalKey<ScaffoldState>();


}
