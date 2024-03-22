import 'dart:async';

import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/ui/bean/base_api_oss_entity.dart';
import 'package:leisure_games/ui/bean/customer_service_entity.dart';

import 'customer_service_state.dart';

class CustomerServiceLogic extends GetxController {
  final CustomerServiceState state = CustomerServiceState();
  StreamSubscription? apiSub;

  @override
  void onReady() {
    apiSub = eventBus.on<BaseWsApiEntity>().listen((event) {
      loadData();
    });
    loadData();
    super.onReady();
  }

  @override
  void onClose() {
    apiSub?.cancel();
    super.onClose();
  }

  void clickService(CustomerServiceEntity element){
    Get.toNamed(Routes.service_details,arguments: element);
  }

  void loadData() {
    HttpService.getCustomerService().then((value) {
      state.services.assignAll(value);
      state.services.refresh();
    });
  }




}
