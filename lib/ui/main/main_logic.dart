
import 'dart:async';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/ui/bean/change_api_event.dart';
import 'package:leisure_games/ui/bean/base_api_oss_entity.dart';
import 'package:leisure_games/ui/bean/change_main_page_event.dart';
import 'package:leisure_games/ui/bean/register_currency_event.dart';
import 'package:permission_handler/permission_handler.dart';

import '/app/global.dart';
import 'main_state.dart';

class MainLogic extends GetxController {

  final state = MainState();
  StreamSubscription? changePageSub;
  StreamSubscription? apiSub;
  StreamSubscription? registerStream;

  @override
  void onReady() {
    changePageSub = eventBus.on<ChangeMainPageEvent>().listen((event) {
      state.scaffoldKey.currentState?.closeEndDrawer();
      state.pageController.jumpToPage(event.pageIndex);
      state.tabController?.animateTo(event.pageIndex);
    });
    apiSub = eventBus.on<ChangeApiEvent>().listen((event) {
      loadData();
    });
    registerStream = eventBus.on<RegisterCurrencyEvent>().listen((event) {
      DialogUtils().showCurrencyDialog(Get.context!).then((value) {
        ///切换钱包后的刷新逻辑弹窗里有处理，所以这里不需要做任何操作
      });
    });
    loadData();
    super.onReady();
  }

  @override
  void onClose() {
    changePageSub?.cancel();
    registerStream?.cancel();
    apiSub?.cancel();
    state.pageController.dispose();
    super.onClose();
  }

  // void initController(){
  //   Get.put(WalletController());
  //   Get.put(AvatarController());
  // }


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
      if(androidInfo.version.sdkInt >= 33){
        statuses = await [Permission.photos].request();
      } else {
        statuses = await [Permission.storage].request();
      }
    } else if(GetPlatform.isIOS){
      statuses = await [Permission.photos].request();
    }
    statuses?.forEach((key, value) {
      loggerArray(['申请权限的状态',key,value]);
      if(value.isDenied){///被拒绝了
        // showToast("${'permissionDenied'.tr}=$value");
        return;
      }
    });
  }

  void loadData() {

    HttpService.getWebConfig().then((value) {
      state.webConfig = value;
      ///获取主站域名
      if(unEmpty(value.frontDomain?.list)){
        state.stationHost = value.frontDomain?.list?.first ?? "";
      }
    });

    HttpService.protect().then((value) {
      state.protect = value;
    },onError: (e){
      if(e["code"] == 900004){//整站维护中
        DialogUtils().showMessageDialog(Get.context!,Intr().zunjingdekehu,title: Intr().xitonggonggao,
            btnCancel: Intr().shuaxin,btnConfirm: Intr().lxkf, onConfirm: (){
              eventBus.fire(ChangeMainPageEvent(3)); //转到客服显示
              Get.until((ModalRoute.withName(Routes.main)));
            },onCancel: (){//刷新
              eventBus.fire(ChangeApiEvent());
              Navigator.pop(Get.context!);
            });
      }
    });
  }






}
