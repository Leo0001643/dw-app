import 'dart:developer';

import 'package:aone_common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RouteAuthMiddleware extends GetMiddleware {

  AuthLevel authLevel;

  RouteAuthMiddleware({
    required this.authLevel,
    int? priority,
  }): super(priority: priority);

  @override
  RouteSettings? redirect(String? route) {
    var userState = Get.find<UserService>().state;
    if (authLevel == userState.authLevel) {
      return null;
    }

    return const RouteSettings(name: Routes.login);
  }

}