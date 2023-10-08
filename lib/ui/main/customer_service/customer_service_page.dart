import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'customer_service_logic.dart';

class CustomerServicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<CustomerServiceLogic>();
    final state = Get.find<CustomerServiceLogic>().state;

    return Container();
  }
}
