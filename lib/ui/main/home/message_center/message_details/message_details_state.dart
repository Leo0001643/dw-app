import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/ui/bean/message_item_entity.dart';

class MessageDetailsState {
  MessageDetailsState() {
    ///Initialize variables
  }
  var scaffoldKey = GlobalKey<ScaffoldState>();

  var details = MessageItemEntity().obs;


}
