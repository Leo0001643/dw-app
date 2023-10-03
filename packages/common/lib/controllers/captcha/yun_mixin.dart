part of 'captcha_controller.dart';

class _YunChannel extends ChannelInterface {
  _YunChannel({
    required Future<void> Function(Map<String, String> result) onSuccess,
  }) : super(onSuccess: onSuccess);

  final CaptchaPluginFlutter _captchaPlugin = CaptchaPluginFlutter();
  String mLoginType="0";
  // void _onYunValidate(dynamic response) {
  //   if (response is Map && !response.containsKey('closed')) {
  //     var validate = response["validate"];
  //     if (validate != "" && validate != null) {
  //       onSuccess({
  //         'validate': validate,
  //       });
  //     }
  //   }
  // }

  @override
  void onVerify(String loginType) {
    mLoginType=loginType;
    _captchaPlugin.showCaptcha(onSuccess: (response) {

      if (response['result'] == true || response['result'] == "true") {
        onSuccess({
          'validate': response['validate'],
        "loginType":mLoginType
        });
      }
    }, onError: (err) {
      print(err);
    }, onLoaded: () {
      print('loaded');
    });
  }

  @override
  void initChannel(String captchaId, String captchaMode) {
    CaptchaPluginConfig styleConfig = CaptchaPluginConfig();
    _captchaPlugin.init({
      'captcha_id': captchaId,
      'is_debug': kDebugMode,
      'language_type': Get.locale!.toLanguageTag(),
      'is_no_sense_mode': captchaMode != 'popup',
      "dimAmount": 0.3,
    });
    debugPrint('Yun captcha initialized');
  }
}
