import 'package:get/get.dart';
import 'package:leisure_games/ui/bean/var_code_entity.dart';

class ProxyRegisterState {
  ProxyRegisterState() {
    ///Initialize variables
  }
  ///用户名
  var username = "".obs;
  ///密码
  var pwdVisible = false.obs;
  var pwdValue = "";
  ///确认密码
  var pwd1Visible = false.obs;
  var pwd1Value = "";
  ///真实姓名
  var realname = "".obs;
  ///验证码
  var validCode = "".obs;
  ///手机号
  var phone = "".obs;
  ///qq
  var qq = "".obs;
  ///电子邮箱
  var email = "".obs;
  ///验证码图片
  var varcode = VarCodeEntity().obs;

  ///区号
  var areaNo = "+86".obs;

  ///手机区号数据
  Map<String,List<String>>? phoneData;


}
