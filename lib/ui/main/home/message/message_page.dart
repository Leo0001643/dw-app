import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'message_logic.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final logic = Get.find<MessageLogic>();
  final state = Get.find<MessageLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void dispose() {
    Get.delete<MessageLogic>();
    super.dispose();
  }
}