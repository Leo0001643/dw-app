import 'dart:async';

import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/ui/bean/base_api_oss_entity.dart';
import 'package:leisure_games/ui/bean/customer_service_entity.dart';
import 'package:leisure_games/ui/bean/language_event.dart';
import 'package:leisure_games/ui/bean/login_refresh_event.dart';

import 'customer_service_state.dart';

class CustomerServiceLogic extends GetxController {
  final CustomerServiceState state = CustomerServiceState();
  StreamSubscription? apiSub;
  StreamSubscription? loginStream;
  StreamSubscription? languageStream;

  @override
  void onReady() {
    apiSub = eventBus.on<BaseWsApiEntity>().listen((event) {
      loadData();
    });
    ///语言国际化更新
    languageStream = eventBus.on<LanguageEvent>().listen((event) {
      loadData();
    });
    loginStream = eventBus.on<LoginRefreshEvent>().listen((event) {
      if(AppData.isLogin()){
        state.hiYou.value = Intr().hello_you([AppData.user()?.username ?? ""]);
      }else {
        state.hiYou.value = "";
      }
    });
    loadData();
    super.onReady();
  }

  @override
  void onClose() {
    languageStream?.cancel();
    loginStream?.cancel();
    apiSub?.cancel();
    super.onClose();
  }

  void clickService(CustomerServiceEntity element){
    Get.toNamed(Routes.service_details,arguments: element);
  }

  void loadData() {
    if(AppData.isLogin()){
      state.hiYou.value = Intr().hello_you([AppData.user()?.username ?? ""]);
    }else {
      state.hiYou.value = "";
    }
    HttpService.getCustomerService().then((value) {
      state.services.assignAll(value);
    });
  }




}
