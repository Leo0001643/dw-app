import 'dart:async';

import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/controller/avatar_controller.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/ui/bean/base_api_oss_entity.dart';
import 'package:leisure_games/ui/bean/change_balance_event.dart';
import 'package:leisure_games/ui/bean/language_event.dart';
import 'package:leisure_games/ui/bean/login_refresh_event.dart';
import 'package:leisure_games/ui/bean/login_user_entity.dart';

import 'recharge_state.dart';

class RechargeLogic extends GetxController {
  final RechargeState state = RechargeState();
  StreamSubscription? loginStream;
  StreamSubscription? languageStream;
  StreamSubscription? balanceStream;
  StreamSubscription? apiSub;

  @override
  void onReady() {
    ///余额发生变化，刷新余额数据
    loginStream = eventBus.on<LoginRefreshEvent>().listen((event) {
      loadData();
    });
    Get.find<AvatarController>().addListener(() {
      state.user.value = AppData.user() ?? LoginUserEntity();
      state.user.refresh();
    });
    ///语言国际化更新
    languageStream = eventBus.on<LanguageEvent>().listen((event) {
      loadData();
    });
    balanceStream = eventBus.on<ChangeBalanceEvent>().listen((event) {
      loadBalance();
    });
    apiSub = eventBus.on<BaseWsApiEntity>().listen((event) {
      loadData();
    });
    super.onReady();
  }

  @override
  void onClose() {
    languageStream?.cancel();
    loginStream?.cancel();
    balanceStream?.cancel();
    apiSub?.cancel();
    super.onClose();
  }

  void loadData() {
    if(AppData.isLogin()){
      var user = AppData.user();
      loggerArray(["用户信息",user?.toJson()]);
      state.user.value = user!;
      state.user.refresh();

      loadBalance();

      HttpService.getPaymentList(user.oid.em(), user.username.em()).then((value) {
        // var usdtIndex = 0;
        if(unEmpty(value.digitalWallet)){
          state.usdtBank.value = value.digitalWallet!.first;
          state.usdtBank.value.icon = ImageX.usdtT();
          state.usdtBank.refresh();
        }
        value.banks?.forEach((element) {
          switch(element.bankCode){
            case Constants.code_caifutong:
              element.icon = ImageX.iconCftT();
              break;
            case Constants.code_qmf:
              element.icon = ImageX.qmfT();
              break;
            case Constants.code_wangyin:
              element.icon = ImageX.iconYhkzzT();
              break;
            case Constants.code_weixin:
              element.icon = ImageX.iconWxpayT();
              break;
            case Constants.code_ysfzf:
              element.icon = ImageX.iconUnipayT();
              break;
            case Constants.code_zhifubao:
              element.icon = ImageX.iconAlipayT();
              break;
            case Constants.code_jingdong:
              element.icon = ImageX.jingdongT();
              break;
            // case Constants.code_usdt:
            //   element.icon = ImageX.icon_cft;
            //   state.usdtBank.value = element;
            //   state.usdtBank.refresh();
              // usdtIndex = value.banks!.indexOf(element);
              // break;
            default:
              element.icon = ImageX.icOtherT();
              break;
          }
        });
        // value.banks?.removeAt(usdtIndex);
        state.paymentList.value = value;
        state.paymentList.refresh();
      });
    } else {
      state.user.value = LoginUserEntity();
      state.user.refresh();
    }

  }


  void loadBalance(){
    if(!AppData.isLogin()) return;

    var user = AppData.user()!;

    HttpService.getBalance({ "cur":1, "platform":"main","oid":user.oid,"username":user.username },loading: false).then((value) {
      state.cnyBal.value = value;
      state.cnyBal.refresh();
    });

    HttpService.getBalance({ "cur":5, "platform":"main","oid":user.oid,"username":user.username },loading: false).then((value) {
      state.usdtBal.value = value;
      state.usdtBal.refresh();
    });
  }

}
