import 'dart:async';

import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/controller/avatar_controller.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/ui/bean/login_refresh_event.dart';
import 'package:leisure_games/ui/bean/login_user_entity.dart';

import 'recharge_state.dart';

class RechargeLogic extends GetxController {
  final RechargeState state = RechargeState();
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

  void loadData() {
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
      HttpService.getPaymentList(user.oid.em(), user.username.em()).then((value) {
        var usdtIndex = 0;
        value.banks?.forEach((element) {
          switch(element.bankCode){
            case "caifutong":
              element.icon = ImageX.icon_cft;
              break;
            case "qmf":
              element.icon = ImageX.icon_qmf;
              break;
            case "wangyin":
              element.icon = ImageX.icon_yhkzz;
              break;
            case "weixin":
              element.icon = ImageX.icon_wxpay;
              break;
            case "ysfzf":
              element.icon = ImageX.icon_unipay;
              break;
            case "zhifubao":
              element.icon = ImageX.icon_alipay;
              break;
            case "usdt":
              element.icon = ImageX.icon_dollar_grey;
              state.usdtBank.value = element;
              state.usdtBank.refresh();
              usdtIndex = value.banks!.indexOf(element);
              break;
            default:
              element.icon = ImageX.icon_cft;
              break;
          }
        });
        value.banks?.removeAt(usdtIndex);
        state.paymentList.value = value;
        state.paymentList.refresh();
      });
    } else {
      state.user.value = LoginUserEntity();
      state.user.refresh();
    }

  }

}
