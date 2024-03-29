
import 'dart:async';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/controller/avatar_controller.dart';
import 'package:leisure_games/app/controller/wallet_controller.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/ui/bean/base_api_oss_entity.dart';
import 'package:leisure_games/ui/bean/change_main_page_event.dart';
import 'package:permission_handler/permission_handler.dart';

import '/app/global.dart';
import 'main_state.dart';

class MainLogic extends GetxController {

  final state = MainState();
  StreamSubscription? changePageSub;
  StreamSubscription? apiSub;

  @override
  void onReady() {
    changePageSub = eventBus.on<ChangeMainPageEvent>().listen((event) {
      state.scaffoldKey.currentState?.closeEndDrawer();
      state.pageController.jumpToPage(event.pageIndex);
      state.tabController?.animateTo(event.pageIndex);
    });
    apiSub = eventBus.on<BaseWsApiEntity>().listen((event) {
      loadData();
    });
    loadData();
    super.onReady();
  }

  @override
  void onClose() {
    changePageSub?.cancel();
    apiSub?.cancel();
    state.pageController.dispose();
    super.onClose();
  }

  void initController(){
    Get.put(WalletController());
    Get.put(AvatarController());
  }


  void openDrawer() {
    state.scaffoldKey.currentState?.openEndDrawer();
    update();
  }

  Future<void> checkPermission(BuildContext context) async {
    ///android权限申请需要在AndroidManifest.xml里添加对应的权限声明
    ///iOS
    // You can request multiple permissions at once.
    Map<Permission, PermissionStatus>? statuses ;
    if(GetPlatform.isAndroid){
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      statuses = await [androidInfo.version.sdkInt <= 32 ? Permission.storage:Permission.photos].request();
    } else if(GetPlatform.isIOS){
      statuses = await [Permission.photos,].request();
    }
    statuses?.forEach((key, value) {
      loggerArray(['拒绝的权限',key,value]);
      if(value.isDenied){///被拒绝了
        showToast("${'permissionDenied'.tr}=$value");
        return;
      }
    });
  }

  void loadData() {

    HttpService.getWebConfig().then((value) {
      state.webConfig = value;
    });

    HttpService.protect().then((value) {
      state.protect = value;

    });

  }

}
