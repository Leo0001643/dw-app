import 'dart:async';

import 'package:aone_common/common.dart';
import 'package:aone_common/services/network/network_service.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

abstract class BootstrapController extends BaseController {
  StreamSubscription<NetworkState>? subscription;

  @override
  Future<void> onInit() async {
    super.onInit();
    final networkService = Get.put(NetworkService());
    if (kReleaseMode) {
      subscription = networkService.stream.listen((event) async {
        if (event == NetworkState.normal) {
          await _init();
        }
      });
    } else {
      await _init();
    }
  }

  Future<void> _init() async {
    try {
      await initNetWorkLayer();
      await initAppServices();
      await initBusinessServices();
      onInitialized();
    } catch (err) {
      print('error');
      debugPrint(err.toString());
      onFailed();
    }
  }

  /// 初始化网络层
  Future<void> initNetWorkLayer();

  // 初始化App Service
  @mustCallSuper
  Future<void> initAppServices() async {
    await SpStorage.init();
  }

  // 初始化业务相关Services
  @mustCallSuper
  Future<void> initBusinessServices() async {
    final global = await Get.putAsync(
      () async => await GlobalService().init(),
    );

    await Get.putAsync(
      () async => await UserService().init(),
    );
    if (global.exception != null) {
      throw global.exception!;
    }
  }

  // 初始化完成后
  void onInitialized();

  // 初始化失败
  void onFailed();

  @override
  void onClose() {
    subscription?.cancel();
    super.onClose();
  }
}
