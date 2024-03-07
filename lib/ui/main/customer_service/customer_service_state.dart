import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/ui/bean/customer_service_entity.dart';

class CustomerServiceState {
  CustomerServiceState() {
    ///Initialize variables
  }

  ///服务列表
  var services = RxList<CustomerServiceEntity>.empty(growable: true);



}
