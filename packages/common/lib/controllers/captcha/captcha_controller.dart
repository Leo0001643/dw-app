import 'dart:io';

import 'package:aone_common/common.dart';
import 'package:captcha_plugin_flutter/captcha_plugin_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gt4_flutter_plugin/gt4_flutter_plugin.dart';

part 'gee_test_mixin.dart';
part 'yun_mixin.dart';

abstract class ChannelInterface {
  final Future<void> Function(Map<String, String> result) onSuccess;

  ChannelInterface({required this.onSuccess});

  void initChannel(String captchaId, String captchaMode);

  void onVerify(String loginType);
}

abstract class CaptchaController extends BaseController {
  late final ChannelInterface captCha;
  final _siteHeaders = GlobalService.to.state.siteHeaders;



  @override
  void onInit() {
    registCallBack();
    super.onInit();
  }

  void registCallBack() {
    captCha = _siteHeaders.necMode!.contains('gee')
        ? _GeeTestChannel(onSuccess: validateCaptchaResult)
        : _YunChannel(onSuccess: validateCaptchaResult);
    print('GT4初始化 == ${_siteHeaders.necCaptchaId!} ${_siteHeaders.necMode!}');
    captCha.initChannel(_siteHeaders.necCaptchaId!, _siteHeaders.necMode!);
  }

  void verify(int t) {
    captCha.onVerify(t.toString());
  }

  // 验证成功后调用
  Future<void> validateCaptchaResult(Map<String, String> result);
}
