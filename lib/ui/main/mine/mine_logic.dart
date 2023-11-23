import 'dart:async';

import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/controller/avatar_controller.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/ui/bean/html_event.dart';
import 'package:leisure_games/ui/bean/login_refresh_event.dart';
import 'package:leisure_games/ui/bean/login_user_entity.dart';

import 'mine_state.dart';

class MineLogic extends GetxController {
  final MineState state = MineState();
  StreamSubscription? loginStream;

  @override
  void onReady() {
    loadData();
    ///余额发生变化，刷新余额数据
    loginStream = eventBus.on<LoginRefreshEvent>().listen((event) {
      loadData();
    });
    Get.find<AvatarController>().addListener(() {
      state.user.value = AppData.user() ?? LoginUserEntity();
      state.user.refresh();
    });
    super.onReady();
  }

  @override
  void onClose() {
    loginStream?.cancel();
    super.onClose();
  }




  void clickItem(int index){
    switch(index){
      case 0:
        Get.toNamed(Routes.coin_exchange);
        break;
      case 1:
        Get.toNamed(Routes.quota_conversion);
        break;
      case 2:
        Get.toNamed(Routes.bill_flow);
        break;
      case 3:
        Get.toNamed(Routes.set_withdraw_pwd);
        break;
      case 4:
        Get.toNamed(Routes.bind_bank);
        break;
      case 5:
        Get.toNamed(Routes.bind_usdt);
        break;
      case 6:
        Get.toNamed(Routes.betting_record);
        break;
      case 7:
        Get.toNamed(Routes.points_record);
        break;
      case 8:
        Get.toNamed(Routes.member_rebate);
        break;
      case 9:
        Get.toNamed(Routes.bonus_packet);
        break;
      case 10:
        Get.toNamed(Routes.promotion_profit);
        break;
      case 11:
        Get.toNamed(Routes.proxy_register);
        break;
      case 12:
        Get.toNamed(Routes.setting);
        break;
      case 13:
        Get.toNamed(Routes.help_center);
        break;
      case 14:
        Get.toNamed(Routes.html,arguments: HtmlEvent(isHtmlData: true,data: Constants.test_html,pageTitle: Intr().guanyuwomen));
        break;
    }
  }

  void loadData() {
    ///cur 币种类型【1:CNY,2:USD,3:KRW,4:INR,5:USDT,6:VND】
    ///platform 平台【main,ag,bbin..等等】
    if(AppData.isLogin()){
      var user = AppData.user();
      loggerArray(["用户信息",user?.toJson()]);
      state.user.value = user!;
      state.user.refresh();

      HttpService.getBalance({ "cur":1, "platform":"main","oid":user.oid,"username":user.username }).then((value) {
        state.cnyBal.value = value;
        state.cnyBal.refresh();
      });

      HttpService.getBalance({ "cur":5, "platform":"main","oid":user.oid,"username":user.username }).then((value) {
        state.usdtBal.value = value;
        state.usdtBal.refresh();
      });

      HttpService.queryBonus({ "oid":user.oid,"username":user.username }).then((value) {
        state.bonus.value = value;
        state.bonus.refresh();
      });

      HttpService.queryMemberPoint({ "oid":user.oid,"username":user.username }).then((value) {
        state.memberPoint.value = value;
        state.memberPoint.refresh();
      });
    } else {
      state.user.value = LoginUserEntity();
      state.user.refresh();
    }
  }






}
