part of 'captcha_controller.dart';

class _GeeTestChannel extends ChannelInterface {

  _GeeTestChannel({required Future<void> Function(Map<String, String> result) onSuccess}) : super(onSuccess: onSuccess);


   String mLoginType="0";

  @override
  void onVerify(String loginType) {
    mLoginType=loginType;
    _captcha.verify();
  }

  @override
  void initChannel(String captchaId, String captchaMode) {
    debugPrint('Gee captcha initialized');
    _captcha = Gt4FlutterPlugin(captchaId, {
      'language': Get.locale!.languageCode.toUpperCase() == 'ZH' ? 'zho' : 'eng'
    });
    _initPlatformState();
  }

  static const MethodChannel _geeTestChannel =
      MethodChannel('gt4_flutter_plugin');

  /// TO-DO
  /// 集成前，请先替换从后台申请的 `captchaId`
  /// Before initial new instance, replace `captchaId` sample with one of the captchaId registered from account backend.
  late final Gt4FlutterPlugin _captcha;

  final RxString _platformVersion = 'Unknown'.obs;


  String get platformVersion => _platformVersion.value;
  set platformVersion(value) => _platformVersion.value = value;

  //gt4验证码
  Future<void> _initPlatformState() async {
    String platform;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platform =
          await Gt4FlutterPlugin.platformVersion ?? 'Unknown platform version';
    } on PlatformException {
      platform = 'Failed to get platform version.';
    }

    try {
      _geeTestChannel.setMethodCallHandler(_configurationChanged);
      _captcha.addEventHandler(
        onShow: _onCaptchaShow,
        onResult: _onCaptchaResult,
        onError: _onCaptchaError,
      );
    } catch (e) {
      debugPrint("Event handler exception " + e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    // if (!mounted) return;
    // setState(() {
    //   _platformVersion = platformVersion;
    // });
    platformVersion = platform;
  }

  Future<dynamic> _configurationChanged(MethodCall methodCall) async {
    return _captcha.configurationChanged(
      methodCall.arguments.cast<String, dynamic>(),
    );
  }

  Future<void> _onCaptchaShow(Map<String, dynamic> message) async {
    // 验证视图已展示
    debugPrint("Captcha did show");
  }

  ///[message["result"]]
  ///{
  /// pass_token: 5d4e9add6bda0ce17f6e931a4d5f22e5a409fd1cc6df5382ae74026c932d9da2,
  /// gen_time: 1653432219,
  /// captcha_output: 0vZX876ifHr8GZJavZoWnY03fqhvvT35SaM4wQXHsxsCEa1HuKXS34RrjI25oVUxUx7tuKvHSRTsoHCT5nrhMPGYIQ9d5e2ALQ0I9D7iX-8f94OF73D4JAvQJ1DJkdzsJTwmW1UMpcpGiBE2xN91qA==,
  /// captcha_id: 3eaa70e0bb2b7d20370e8ebdfb96393f,
  /// lot_number: a9e07313e74f4674a74e898ecbe763ed
  ///}
  Future<void> _onCaptchaResult(Map<String, dynamic> message) async {
    debugPrint("Captcha result: " + message.toString());

    String status = message["status"];
    if (status == "1") {
      // 发送 message["result"] 中的数据向服务端二次查询接口查询结果
      Map result = message["result"] as Map;
      result["loginType"]=mLoginType;
      onSuccess(
        result.map(
              (key, value) => MapEntry(
            key.toString(),
            value.toString(),
          ),
        ),
      );
    } else {
      // 终端用户完成验证错误，自动重试
      debugPrint("Captcha 'onResult' state: $status");
    }
  }

  Future<void> _onCaptchaError(Map<String, dynamic> message) async {
    debugPrint("Captcha onError: " + message.toString());

    String code = message["code"];

    if (Platform.isAndroid) {
      // Android 平台
      if (code == "-14460") {
        // 验证会话已取消
      } else {
        // 更多错误码参考开发文档
        // https://docs.geetest.com/gt4/apirefer/errorcode/android
      }
    }

    if (Platform.isIOS) {
      // iOS 平台
      if (code == "-20201") {
        // 验证请求超时
      } else if (code == "-20200") {
        // 验证会话已取消
      } else {
        // 更多错误码参考开发文档
        // https://docs.geetest.com/gt4/apirefer/errorcode/ios
      }
    }
  }

}
