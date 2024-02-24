import 'dart:async';

import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/ui/bean/login_refresh_event.dart';

import 'coin_exchange_state.dart';

class CoinExchangeLogic extends GetxController {
  final CoinExchangeState state = CoinExchangeState();
  StreamSubscription? loginStream;

  @override
  void onReady() {
    loadData();
    ///余额发生变化，刷新余额数据
    loginStream = eventBus.on<LoginRefreshEvent>().listen((event) {
      loadData();
    });
    super.onReady();
  }

  @override
  void onClose() {
    loginStream?.cancel();
    super.onClose();
  }

  void loadData() {
    var user = AppData.user();

    HttpService.getBalance({ "cur":1, "platform":"main","oid":user?.oid,"username":user?.username }).then((value) {
      value.icon = ImageX.icon_jj_grey;
      value.language = Intr().wallet_cny;
      state.cnyBal.value = value;
      state.cnyBal.refresh();
    });

    HttpService.getBalance({ "cur":5, "platform":"main","oid":user?.oid,"username":user?.username }).then((value) {
      value.icon = ImageX.icon_dollar_grey;
      value.language = Intr().wallet_usdt;
      state.usdtBal.value = value;
      state.usdtBal.refresh();
    });

    HttpService.getSiteWalletConfig({"oid":user?.oid,"username":user?.username}).then((value) {
      value.forEach((element) {
        if(element.walletType == "CNY"){
          state.cnyRate.value = element.rate.em();
        } else if(element.walletType == "USDT"){
          state.usdtRate.value = element.rate.em();
        }
      });
    });


  }


  void exchangeCoin(String value){
    if(unEmpty(value) && value.isNum){
      var v =  int.parse(value);
      state.fromAmount.value = v.toString();
      var amount = state.c2u.value ?  v * state.cnyRate.value:v * state.usdtRate.value ;
      state.toAmount.value = amount.toInt().toString();
    }else {
      state.fromAmount.value = "";
      state.toAmount.value = "";
    }
  }


  ///兑换
  void exchange(){

    if(isEmpty(state.fromAmount.value)){ return; }

    var user = AppData.user();
    var params = <String,dynamic>{"oid":user?.oid,"username":user?.username,
    "money":state.fromAmount.value};

    //转出币种类型【1:CNY,2:USD,3:KRW,4:INR,5:USDT,6:VND】
    if(state.c2u.value){
      params["tin"] = 5;
      params["tout"] = 1;
    } else {
      params["tin"] = 1;
      params["tout"] = 5;
    }


    HttpService.internalTransfer(params).then((value) {
      ///兑换成功余额变化
      eventBus.fire(LoginRefreshEvent(show_notice: false));
      showToast(Intr().caozuochenggong);
    });
  }



}
