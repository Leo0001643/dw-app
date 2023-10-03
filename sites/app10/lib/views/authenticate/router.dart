

import 'package:aone_common/common.dart';
import 'package:get/get.dart';

import 'bindings/forget_password_binding.dart';
import 'bindings/join_us_binding.dart';
import 'bindings/login_binding.dart';
import 'view/forget_password_widget.dart';
import 'view/join_us_view.dart';
import 'view/login_view.dart';

final List<GetPage> authenticateRoutes = [
  //登录路由
  GetPage(
    name: Routes.login,
    page: () => const LoginView(),
    binding: LoginBinding(),
  ),
  //忘记密码
  GetPage(
    name: Routes.forgetPwd,
    page: () => const ForgetPasswordWidget(),
    binding: ForgetPasswordBinding(),
  ),
  //加入我们
  GetPage(
    name: Routes.agentReg,
    page: () => const JoinUsView(),
    binding: JoinUsBinding(),
  ),
];