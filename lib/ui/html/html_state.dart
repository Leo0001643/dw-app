
import 'package:get/get.dart';
import 'package:leisure_games/ui/bean/html_event.dart';
import 'package:leisure_games/ui/bean/login_game_agent_entity.dart';

class HtmlState {
  HtmlState() {
    ///Initialize variables
  }

  var progress = 0.0.obs;
  var progressVisible= true.obs;//显示隐藏

  var pageTitle = "".obs;//页面标题

  HtmlEvent? htmlEvent;

  LoginGameAgentEntity? gameEvent;


}
