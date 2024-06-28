import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../bean/var_code_entity.dart';

class RegisterState {
  RegisterState() {
    ///Initialize variables
  }

  var pwdVisible = false.obs;
  var confirmPwdVisible = false.obs;

  var emailVisible = false.obs;
  var emailMust = false.obs;
  var agentVisible = false.obs;
  var agentMust = false.obs;
  var weixinVisible = false.obs;
  var weixinMust = false.obs;
  var mobileVisible = false.obs;
  var mobileMust = false.obs;
  var qqVisible = false.obs;
  var qqMust = false.obs;


  // var agreeCheck = true.obs;

  var accountValue = "";

  var pwdValue = "";
  var confirmPwdValue = "";

  var realname = "";
  var nameFocus = FocusNode();

  var vcode = "";

  var varcode = VarCodeEntity().obs;

  ///手机号
  var mobile = "";

  ///推广码 介绍人
  var tgcode = "";

  ///邮箱
  var email = "";

  ///qq
  var qq = "";

  ///wechat
  var wechat = "";

  var areaNo = "+86".obs;
  ///手机区号数据
  Map<String,List<String>>? phoneData;


}
