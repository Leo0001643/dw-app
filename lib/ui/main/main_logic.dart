
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:leisure_games/ui/bean/change_main_page_event.dart';
import 'package:permission_handler/permission_handler.dart';
import '/app/global.dart';

import 'main_state.dart';

class MainLogic extends GetxController {

  final state = MainState();
  StreamSubscription? changePageSub;

  @override
  void onReady() {
    changePageSub = eventBus.on<ChangeMainPageEvent>().listen((event) {
      state.scaffoldKey.currentState?.closeEndDrawer();
      state.pageController.jumpToPage(event.pageIndex);
      state.tabController?.animateTo(event.pageIndex);
    });
    super.onReady();
  }

  @override
  void onClose() {
    changePageSub?.cancel();
    super.onClose();
  }


  void openDrawer() {
    state.scaffoldKey.currentState?.openEndDrawer();
  }

  Future<void> checkPermission(BuildContext context) async {
    ///android权限申请需要在AndroidManifest.xml里添加对应的权限声明
    ///iOS
    // You can request multiple permissions at once.
    Map<Permission, PermissionStatus> statuses = await [
      Permission.phone,
      Permission.storage,
      Permission.mediaLibrary,
      Permission.photos,
    ].request();
    statuses.forEach((key, value) {
      if(value.isDenied){///被拒绝了
        showToast('permissionDenied'.tr + "=" + value.toString());
        return;
      }
    });
  }

  changeLanguage() {
    var locale = Get.locale;
    if(locale?.languageCode == 'cn'){
      Get.updateLocale(Locale('en','EN'));
    } else {
      Get.updateLocale(Locale('cn','ZH'));
    }
    // for (var localeFile in S.delegate.supportedLocales) {
    //   print("语言切换${locale.toString()}--${localeFile.toString()}");
    //   if (localeFile.languageCode != locale?.languageCode) {
    //     Get.updateLocale(localeFile);
    //     // MyAppState.appData.changeLocale(localeFile);
    //     return;
    //   }
    // }
  }

}
