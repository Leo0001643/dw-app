import 'package:aone_common/core/fetch/exception/base_api_exception.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../../services/user/user_service.dart';
import '../../../services/user/user_state.dart';
import '../../app_env.dart';
import '../../event_bus.dart';

class JwtExpireException extends BaseApiException {
  JwtExpireException({
    required int httpCode,
    required int statusCode,
    required String message,
  }) : super(
          httpCode: httpCode,
          statusCode: statusCode,
          message: message,
        ) {
    if (AppEnv.config.siteTag != "z01") {
      if (DateTime.now().millisecondsSinceEpoch - UserService.to.state.tokenExpireTime.value > 10000) {
        SmartDialog.showToast('登录凭证已失效，请重新登录');
      }
      UserService.to.state.tokenExpireTime.value = DateTime.now().millisecondsSinceEpoch;
    }
    Future.delayed(const Duration(milliseconds: 500), () {
      final _userService = UserService.to;
      UserService.to.state.loginState.value = false;
      _userService.onBeforeLogout();
    });
  }
}
