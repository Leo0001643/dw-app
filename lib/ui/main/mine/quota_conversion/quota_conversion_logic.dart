import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/ui/bean/balance_entity.dart';
import 'package:leisure_games/ui/bean/platform_entity.dart';

import 'quota_conversion_state.dart';

class QuotaConversionLogic extends GetxController {
  final QuotaConversionState state = QuotaConversionState();

  @override
  void onReady() {
    loadData();
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void loadData() {
    var user = AppData.user();
    var cur = AppData.wallet() ? 1: 5;
    state.platforms.clear();
    state.rightAccount.value = PlatformEntity();
    loadBalance(true);

    HttpService.getPlatformList({"oid":user?.oid,"username":user?.username,"cur":cur}).then((value1) {
      ///平台开通状态 币种类型【1:CNY,2:USD,3:KRW,4:INR,5:USDT,6:VND】
      HttpService.getPlatformIsPermit({"oid":user?.oid,"username":user?.username,"cur":cur}).then((value2) {
        value1.forEach((e1) {
          value2.forEach((e2) {
            ///平台状态【1:开启，2:关闭】
            if(e1.liveId == e2.id && e2.status == 1){
              HttpService.getBalance({ "oid":user?.oid,"username":user?.username,"cur":cur,"platform":e1.liveName}).then((v3) {
                e1.money = v3.money;
                state.platforms.add(e1);
                state.platforms.refresh();
                if(isEmpty(state.rightAccount.value.liveName)){
                  state.rightAccount.value = e1;
                  state.rightAccount.refresh();
                }
              });
            }
          });
        });
      });
    });
  }

  void loadBalance(bool add){
    var user = AppData.user();
    var cur = AppData.wallet() ? 1: 5;
    ///平台【main,ag,bbin..等等】
    HttpService.getBalance({ "cur":cur, "platform":"main","oid":user?.oid,"username":user?.username }).then((value) {
      if(add){
        state.platforms.insert(0, PlatformEntity(money: value.money,liveName: "main",currency: AppData.wallet()? "CNY":"USDT"));
      }
      state.leftAccount.value = state.platforms.first;
      if(AppData.wallet()){
        state.mainBal.value = BalanceEntity(icon:ImageX.icon_jj_grey, language: Intr().wallet_cny, money: value.money);
      }else {
        state.mainBal.value = BalanceEntity(icon:ImageX.icon_dollar_grey, language: Intr().wallet_usdt, money: value.money);
      }
      state.mainBal.refresh();
    });

  }
  
  
  void transfer(PlatformEntity item){
    var user = AppData.user();
    var cur = AppData.wallet() ? 1: 5;
    var params = <String,dynamic>{ "cur":cur,"oid":user?.oid,"username":user?.username,"money": item.money,
      "tout":state.leftAccount.value.liveName,"tin":item.liveName,};
    HttpService.transfer(params).then((value) {
      showToast(Intr().caozuochenggong);
      ///成功刷新页面数据
      loadData();
      loadBalance(false);
    });
  }

  ///主业务 确认划转
  void transferConfirm(){
    var user = AppData.user();
    var cur = AppData.wallet() ? 1: 5;
    var params = <String,dynamic>{ "cur":cur,"oid":user?.oid,"username":user?.username,"money": state.inputAmount.value,
      "tout":state.leftAccount.value.liveName,"tin":state.rightAccount.value.liveName,};
    HttpService.transfer(params).then((value) {
      showToast(Intr().caozuochenggong);
      ///成功刷新页面数据
      loadData();
      loadBalance(false);
    });
  }

  ///一键归集
  void oneKeyCollect(){
    var user = AppData.user();
    var cur = AppData.wallet() ? 1: 5;
    var params = <String,dynamic>{ "cur":cur,"oid":user?.oid,"username":user?.username,"money": 1,
      "tout":"34","tin":"12",};
    HttpService.transfer(params).then((value) {
      showToast(Intr().caozuochenggong);
      ///成功刷新页面数据
      loadData();
      loadBalance(false);
    });
  }






}
