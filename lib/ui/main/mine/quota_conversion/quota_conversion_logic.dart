import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/controller/wallet_controller.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/ui/bean/balance_entity.dart';
import 'package:leisure_games/ui/bean/change_balance_event.dart';
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
    // state.rightAccount.value = PlatformEntity();
    loadBalance(true);

    HttpService.getPlatformList({"oid":user?.oid,"username":user?.username,"cur":cur}).then((value1) {
      ///平台开通状态 币种类型【1:CNY,2:USD,3:KRW,4:INR,5:USDT,6:VND】
      ///需要对获得的结果做一个冒泡排序
      var n = value1.length;
      for (int i = 0; i < n - 1; i++) {
        for (int j = 0; j < n - i - 1; j++) {
          if (value1[j].sequence.em() > value1[j + 1].sequence.em()) {
            // 交换 arr[j] 和 arr[j+1]
            var temp = value1[j];
            value1[j] = value1[j + 1];
            value1[j + 1] = temp;
          }
        }
      }
      state.platforms.addAll(value1);
      state.platforms.refresh();
      HttpService.getPlatformIsPermit({"oid":user?.oid,"username":user?.username,"cur":cur}).then((value2) async {
        for (var e1 in value1) {
          for (var e2 in value2) {
            ///平台状态【1:开启，2:关闭】
            if(e1.liveId == e2.id && e2.status == 1){
              HttpService.getBalance({ "oid":user?.oid,"username":user?.username,"cur":cur,"platform":e1.liveName},loading: false).then((value3) {
                e1.money = value3.money;
                state.platforms[value1.indexOf(e1) + 1] = e1;
                state.platforms.refresh();
                ///刷新右侧第三方钱包金额
                if(isEmpty(state.rightAccount.value.liveName)){
                  state.rightAccount.value = value1.first;
                  state.rightAccount.refresh();
                }else if(e1.liveId == state.rightAccount.value.liveId){
                  state.rightAccount.value = e1;
                  state.rightAccount.refresh();
                }
              });
            }
          }
        }
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
      if(state.platforms.isNotEmpty){
        state.leftAccount.value = state.platforms.first;
      }
      if(AppData.wallet()){
        state.mainBal.value = BalanceEntity(icon:ImageX.iconJjGrey(), language: Intr().wallet_cny, money: value.money);
      }else {
        state.mainBal.value = BalanceEntity(icon:ImageX.usdtT(), language: Intr().wallet_usdt, money: value.money);
      }
      state.mainBal.refresh();
    });

  }
  
  
  void transfer(PlatformEntity item){
    var user = AppData.user();
    var cur = AppData.wallet() ? 1: 5;
    var params = <String,dynamic>{ "cur":cur,"oid":user?.oid,"username":user?.username,"money": item.money.em(),
      "tout":item.liveName,"tin":state.leftAccount.value.liveName,};
    loggerArray(["转出参数打印",params]);
    HttpService.transfer(params).then((value) {
      showToast(Intr().caozuochenggong);
      state.inputAmount.value = "";//确认划转清空金额
      ///成功刷新页面数据
      loadData();
      loadBalance(false);
      ///刷新钱包余额
      eventBus.fire(ChangeBalanceEvent());
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
      state.inputAmount.value = "";//确认划转清空金额
      ///成功刷新页面数据
      loadData();
      loadBalance(false);
      ///刷新钱包余额
      eventBus.fire(ChangeBalanceEvent());
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
      ///刷新钱包余额
      eventBus.fire(ChangeBalanceEvent());
    });
  }






}
