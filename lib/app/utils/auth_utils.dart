
import 'package:get/get.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/network/error_response_handler.dart';
import 'package:local_auth/local_auth.dart';

/// Author: Soushin-932707629@qq.com
/// Date: 2024/5/13 17:55
/// Description: 登录认证
class AuthUtils{
  AuthUtils._internal();

  static AuthUtils? instance;

  static getInstance() {
    instance ??= AuthUtils._internal();
    return instance;
  }

  factory AuthUtils() => getInstance();

  var auth = LocalAuthentication();

  //设备能力
  // 要检查该设备上是否有可用的本地认证，请调用canCheckBiometrics(如果您需要生物识别支持)和/或isDeviceSupported()(如果您只需要一些设备级认证):
  Future<bool> authEnable() async {
    if(GetPlatform.isIOS){
      await auth.canCheckBiometrics.then((value){
        loggerArray(["设置人脸检测",value]);
        return value;
      });
    } else {///是否支持生物识别
      return false;
    }
    return false;
  }

  ///生物识别是否支持
  Future<bool> getAvailableBiometrics() async{
    var availableBiometrics = await auth.getAvailableBiometrics();
    if (availableBiometrics.isNotEmpty) {
      loggerArray(["已注册的识别类型",availableBiometrics]);
      return availableBiometrics.contains(BiometricType.face) || availableBiometrics.contains(BiometricType.fingerprint);
    }
    return false;
  }

  ///开始认证
  Future<bool> authLogin()async{
    try {
      final bool didAuthenticate = await auth.authenticate(localizedReason: 'Please authenticate to login');
      return didAuthenticate;
    } catch(e) {
      ErrorResponseHandler().onErrorHandle(e);
      return false;
    }
  }



}

