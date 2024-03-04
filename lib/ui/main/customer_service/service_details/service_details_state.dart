import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/ui/bean/customer_service_entity.dart';

class ServiceDetailsState {
  ServiceDetailsState() {
    ///Initialize variables
  }

  var title = "".obs;

  var detail = CustomerServiceEntity();

  var scaffoldKey = GlobalKey<ScaffoldState>();

}
