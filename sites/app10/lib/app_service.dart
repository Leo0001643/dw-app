import 'dart:async';

import 'package:aone_common/common.dart';
import 'package:app10/config/event_bus.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class AppService extends AppBaseService {
  static AppService get to => Get.find();

  final RxBool isInit = false.obs;

  get getIsInit => isInit.value;

  set isInit(value) => isInit.value = value;

  final RxBool _isSecondPage = false.obs;

  get isSecondPage => _isSecondPage.value;

  set isSecondPage(value) => _isSecondPage.value = value;

  final RxInt _headerImg = 0.obs;

  get headerImg => _headerImg.value;

  set headerImg(value) => _headerImg.value = value;

  final Connectivity _connectivity = Connectivity();
  final Rx<ConnectivityResult> _connectivityResult =
      Rx(ConnectivityResult.none);

  ConnectivityResult get connectivityResult => _connectivityResult.value;

  set connectivityResult(val) => _connectivityResult.value = val;
  StreamSubscription<ConnectivityResult>? _connectivitySubscription;

  bool isShowDialog = false;

  final RxString _stateText = '无网络链接，请连接网络以继续。'.obs;
  get stateText => _stateText.value;
  set stateText(val) => _stateText.value = val;

  @override
  void onInit() {
    if (kReleaseMode) {
      _connectivitySubscription =
          _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    }
    super.onInit();
    getHeadImg();
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    connectivityResult = result;
    if (isShowDialog) {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        stateText = '正在检查网络质量。。。';
        try {
          await Dio().get('https://www.baidu.com/');
          connectivityResult = result;
          SmartDialog.dismiss(status: SmartStatus.dialog, tag: 'network');
          isShowDialog = false;
        } catch (err) {
          SmartDialog.showToast('该连接无法访问网络');
        }
      } else {
        stateText = '无网络链接，请连接网络以继续。';
      }
    }
    if (result == ConnectivityResult.none) {
      // SmartDialog.show(
      //   widget: const NetWorkingPage(),
      //   tag: 'network',
      //   clickBgDismissTemp: false,
      //   backDismiss: false,
      // );
      // isShowDialog = true;
    }
  }

  void routingCallBack(Routing? route) {
    isSecondPage = route!.current != Routes.home;
    if ([
      Routes.webPage,
      Routes.gameWebView,
    ].contains(route.previous)) {
      Get.offNamed(route.previous);
    }
  }

  // 初始化全局事件
  void initEventBus() {
    registerEvent();
  }

  setHeadImg(int headImg) async {
    SharedPreferences? sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setInt("headImg", headImg);
    headerImg = headImg;
  }

  getHeadImg() async {
    SharedPreferences? sharedPreferences =
        await SharedPreferences.getInstance();
    var type = sharedPreferences.getInt("headImg");
    if (type != null) {
      headerImg = type;
    }
  }

  void toCustomerService() {
    final _globalState = GlobalService.to.state;
    var url = _globalState.siteItems.bases!.contactKefuApp;
    if (url != null) {
      Get.toNamed(Routes.webPage, arguments: WebData(url, '在线客服'));
    }
  }

  @override
  void onClose() {
    _connectivitySubscription?.cancel();
    super.onClose();
  }
}
