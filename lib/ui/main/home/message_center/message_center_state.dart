import 'package:flutter/cupertino.dart';
import 'package:leisure_games/ui/main/home/message_center/message/message_page.dart';
import 'package:leisure_games/ui/main/home/message_center/notice/notice_page.dart';

class MessageCenterState {
  MessageCenterState() {
    ///Initialize variables
    pageController = PageController();
    pages = [NoticePage(), MessagePage()];
  }

  late PageController pageController;
  late List<Widget> pages;


}