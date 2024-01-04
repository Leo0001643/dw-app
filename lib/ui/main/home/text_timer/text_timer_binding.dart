import 'package:get/get.dart';
import 'package:leisure_games/ui/main/home/text_timer/text_timer_logic.dart';


class TextTimerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TextTimerLogic());
  }
}
