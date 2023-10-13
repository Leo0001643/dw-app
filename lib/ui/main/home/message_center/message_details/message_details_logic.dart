import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/ui/bean/message_item_entity.dart';

import 'message_details_state.dart';

class MessageDetailsLogic extends GetxController {
  final MessageDetailsState state = MessageDetailsState();

  @override
  void onReady() {
    if(unEmpty(Get.arguments) && Get.arguments is MessageItemEntity){
      state.details.value = Get.arguments;
    }
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
