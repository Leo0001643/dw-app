import 'package:get/get.dart';
import 'package:leisure_games/ui/bean/var_code_entity.dart';

class SimpleLoginVarState {
  SimpleLoginVarState() {
    ///Initialize variables
  }
  ///验证码
  var varcode = VarCodeEntity().obs;
  var vcode = "";


}
