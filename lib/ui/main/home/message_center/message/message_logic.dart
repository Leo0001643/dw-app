import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/ui/bean/message_item_entity.dart';

import 'message_state.dart';

class MessageLogic extends GetxController {
  final MessageState state = MessageState();

  @override
  void onReady() {
    loadData();
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void loadData() {
    var user = AppData.user();
    if(isEmpty(user)){ return; }
    HttpService.getMessage(user!.oid.em(), user.username.em()).then((value) {
      state.messageList.assignAll(value);
      state.messageList.refresh();
    });

  }

  void updateMessageStatus(MessageItemEntity item){
    var user = AppData.user()!;
    var params = {"oid":user.oid,"username":user.username,"id":item.id.em()};
    HttpService.updateMessageStatus(params).then((value) {
      Get.toNamed(Routes.message_details,arguments: item);
      if(item.mstatus == 0){
        loadData();///状态为未读的时候刷新数据
      }
    });
  }





}
