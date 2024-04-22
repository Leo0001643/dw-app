import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../bean/var_code_entity.dart';

class RegisterState {
  RegisterState() {
    ///Initialize variables
  }

  var pwdVisible = false.obs;
  var confirmPwdVisible = false.obs;

  // var agreeCheck = true.obs;

  var accountValue = "";

  var pwdValue = "";
  var confirmPwdValue = "";

  var realname = "";
  var nameFocus = FocusNode();

  var vcode = "";

  var varcode = VarCodeEntity().obs;

  var mobile = "";

  ///推广码
  var tgcode = "";

  var areaNo = "+86".obs;
  ///手机区号数据
  Map<String,List<String>>? phoneData;

}
