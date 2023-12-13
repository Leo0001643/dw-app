import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';

class LoginState {
  LoginState() {
    ///Initialize variables
    btnEnable.value = (unEmpty(accountValue) && unEmpty(pwdValue));
  }

  var pwdVisible = false.obs;


  // var accountValue = "dsa0001";
  // var pwdValue = "aeuio888";

  var accountValue = "dms001";
  var pwdValue = "12345678";

  var btnEnable = false.obs;



}
