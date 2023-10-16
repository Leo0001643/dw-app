import 'package:get/get.dart';

class RechargeDigitalState {
  RechargeDigitalState() {
    ///Initialize variables
  }

  //选择的是在线 or 线下
  var selectOnline = true.obs;

  var selectAgree = 0.obs;

  var agreeList = <String>["TRC充值","CRC20充值"];

}
