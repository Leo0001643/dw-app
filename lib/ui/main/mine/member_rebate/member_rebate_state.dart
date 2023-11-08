import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';

class MemberRebateState {
  MemberRebateState() {
    ///Initialize variables
  }

  var currentTime = Intr().jinri.obs;
  late var times = [currentTime.value,Intr().day_7,Intr().day_15,Intr().day_30];


}
