import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/ui/bean/customer_service_entity.dart';

class CustomerServiceState {
  CustomerServiceState() {
    ///Initialize variables
  }

  ///服务列表
  var services = RxList<CustomerServiceEntity>.empty(growable: true);

  ///用户你好
  var hiYou = Intr().hello_you([""]).obs;

}
