import 'package:get/get.dart';
import 'package:leisure_games/ui/bean/message_item_entity.dart';

class MessageState {
  MessageState() {
    ///Initialize variables
  }

  var messageList = RxList<MessageItemEntity>.empty(growable: true);


}
