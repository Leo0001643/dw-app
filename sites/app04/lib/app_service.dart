import 'dart:async';

import 'package:aone_common/common.dart';
import 'package:app04/config/event_bus.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

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

  final RxBool _hasPermission = true.obs;
  bool get hasPermission => _hasPermission.value;
  set hasPermission(bool value) => _hasPermission.value = value;

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

  Future<bool> requestStoragePermission() async {
    //获取当前的权限
    var status = await Permission.storage.status;
    if (status == PermissionStatus.granted) {
      //已经授权
      return true;
    } else {
      //未授权则发起一次申请
      status = await Permission.storage.request();
      if (status == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  }

  Future<bool> requestPermission() async {
    bool hasBluetoothPermission = await requestStoragePermission();
    if (hasBluetoothPermission) {
      print("内存使用权限申请通过");
      hasPermission = true;
    } else {
      print("内存使用权限申请不通过");
      hasPermission = false;
    }
    return hasBluetoothPermission;
  }

  void toCustomerService() async {
    requestPermission();
    if (hasPermission) {
      final _globalState = GlobalService.to.state;
      var url = _globalState.siteItems.bases!.contactKefuApp;
      if (url != null) {
        if (await canLaunch(url ?? "")) {
          await launch(url ?? "");
        } else {
          Get.toNamed(Routes.webPage, arguments: WebData(url));
        }
      } else {
        SmartDialog.showToast("后台没有配置在线客服的url", alignment: Alignment.center);
        return;
      }
    } else {
      SmartDialog.showToast("app需要存储权限", alignment: Alignment.center);
      return;
    }
  }

  @override
  void onClose() {
    _connectivitySubscription?.cancel();
    super.onClose();
  }
}
