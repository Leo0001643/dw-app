import 'package:get/get.dart';
import 'package:leisure_games/ui/bean/var_code_entity.dart';

class SimpleLoginState {
  SimpleLoginState() {
    ///Initialize variables
  }
  var gesturetext = '绘制解锁图案'.obs;

  ///验证码
  var varcode = VarCodeEntity().obs;



}
