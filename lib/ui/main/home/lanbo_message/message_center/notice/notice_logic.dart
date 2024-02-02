import 'package:get/get.dart';
import 'package:leisure_games/app/network/http_service.dart';

import 'notice_state.dart';

class NoticeLogic extends GetxController {
  final NoticeState state = NoticeState();

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
    //公告
    HttpService.getNotice(1).then((value) {
      state.noticeList.assignAll(value);
      HttpService.getNotice(2).then((value) {
        state.noticeList.addAll(value);
        state.noticeList.refresh();
      });
    });
  }
}
