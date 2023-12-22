import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/ui/bean/html_event.dart';
import 'package:leisure_games/ui/bean/login_game_agent_entity.dart';

import 'game_html_state.dart';

class GameHtmlLogic extends GetxController {
  final GameHtmlState state = GameHtmlState();

  @override
  void onReady() {
    if(unEmpty(Get.arguments)){
      ///区分游戏和普通网页
      if(Get.arguments is LoginGameAgentEntity){
        state.gameEvent = Get.arguments as LoginGameAgentEntity;
      }else if(Get.arguments is HtmlEvent){
        state.pageTitle.value = (Get.arguments as HtmlEvent).pageTitle.em();
        state.htmlEvent = Get.arguments;
      }
    }
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


  void loadPage(InAppWebViewController controller){
    loggerArray(["收到数据了吧 ${state.htmlEvent} ${state.gameEvent}"]);
    if(unEmpty(state.htmlEvent)){
      if(state.htmlEvent?.isHtmlData == true){
        controller.loadData(data: state.htmlEvent!.data.em());
      }else {
        controller.loadUrl(urlRequest: URLRequest(url: Uri.tryParse(state.htmlEvent!.data.em())));
      }
    }else if(unEmpty(state.gameEvent)){
      var params = "platformURL=${state.gameEvent!.platformURL.em()}&lid=${state.gameEvent!.lid}&r=${state.gameEvent!.params!.r.em()}&param=${state.gameEvent!.params!.param.em()}"
          "&encrypt=${state.gameEvent!.params!.encrypt.em()}";

      params = "$params&clientType=${state.gameEvent!.clientType ?? "mp"}";

      loggerArray(["组装好的数据",params]);
      //jsonEncode(params).codeUnits
      controller.loadUrl(urlRequest: URLRequest(url: Uri.tryParse(state.gameEvent!.url!.first),
        method: "POST",headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: Uint8List.fromList(utf8.encode(params)),));
    }
  }






}
