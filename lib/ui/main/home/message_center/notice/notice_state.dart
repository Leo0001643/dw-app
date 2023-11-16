import 'package:get/get.dart';
import 'package:leisure_games/ui/bean/notice_entity.dart';

class NoticeState {
  NoticeState() {
    ///Initialize variables
  }


  var noticeList = RxList<NoticeEntity>.empty(growable: true);



}
