import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';

import '../bean/var_code_entity.dart';

class LoginState {
  LoginState() {
    ///Initialize variables
    accountValue = AppData.loginUser();
    pwdValue = AppData.loginPwd();
    btnEnable.value = (unEmpty(accountValue) && unEmpty(pwdValue));
  }

  var pwdVisible = false.obs;


  var accountValue = "dsa0001";
  var pwdValue = "aeuio888";

  // var accountValue = "sansan01";
  // var pwdValue = "sansan01";

  // var accountValue = "24010202";
  // var pwdValue = "aeuio888";

  // var accountValue = "dms001";
  // var pwdValue = "12345678";

  // var accountValue = "";
  // var pwdValue = "";

  var btnEnable = false.obs;
  var vcode = "";
  var varcode = VarCodeEntity().obs;

}
