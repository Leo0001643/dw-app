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
    loadData(first: true);
    loadBalance();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void loadData({bool? first}) {
    var user = AppData.user();
    var cur = AppData.wallet() ? 1: 5;
    ///如果是初始化数据
    if(first == true){
      state.platforms.clear();
      state.leftAccount.value = PlatformEntity(money: 0,liveName: "main",currency: AppData.wallet()? "CNY":"USDT",liveId: -1,status: 1);
      state.platforms.add(state.leftAccount.value);
    }else {
      ///移除主账户之外的其他账户
      state.platforms.removeWhere((element) => element.liveId != -1);
    }
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
            if(e1.liveId == e2.id){
              e1.status = e2.status;
              if(e1.status == 1){///平台状态【1:开启，2:关闭】
                ///这里如果报错因为平台在维护中：{"code":900026,"message":{"zh":"查询余额异常，请稍后重试"},"data":null}
                ///不需要把错误信息提示出来
                HttpService.getBalance({ "oid":user?.oid,"username":user?.username,"cur":cur,"platform":e1.liveName}
                    ,loading: false,errorHandler: false).then((value3) {
                  loggerArray(["余额查询成功",e1.liveName]);
                  e1.money = value3.money;
                  ///更新账户余额
                  state.platforms[state.platforms.indexOf(e1)] = e1;
                  state.platforms.refresh();
                  ///刷新右侧第三方钱包金额
                  if(isEmpty(state.rightAccount.value.liveName)){
                    state.rightAccount.value = value1.first;
                    state.rightAccount.refresh();
                  }else if(e1.liveId == state.rightAccount.value.liveId){
                    state.rightAccount.value = e1;
                    state.rightAccount.refresh();
                  }
                  ///刷新左侧第三方钱包金额
                  if(e1.liveId == state.leftAccount.value.liveId){
                    state.leftAccount.value = e1;
                    state.leftAccount.refresh();
                  }
                });
              }
            }
          }
        }
      });
    });
  }

  void loadBalance(){
    var user = AppData.user();
    var cur = AppData.wallet() ? 1: 5;
    ///平台【main,ag,bbin..等等】
    HttpService.getBalance({ "cur":cur, "platform":"main","oid":user?.oid,"username":user?.username }).then((value) {
      ///更新主账户余额
      state.platforms.forEach((element) {
        ///如果是主账户需要更新
        if(element.liveId == -1){
         element.money = value.money;
        }
      });
      ///左侧如果是主账户也需要更新
      if(state.leftAccount.value.liveId == -1){
        state.leftAccount.value.money = value.money;
        state.leftAccount.refresh();
      }
      ///右侧是主账户也需要更新
      if(state.rightAccount.value.liveId == -1){
        state.rightAccount.value.money = value.money;
        state.rightAccount.refresh();
      }
      if(AppData.wallet()){
        state.mainBal.value = PlatformEntity(liveId: -1,currency:ImageX.iconJjGrey(), liveName: Intr().wallet_cny, money: value.money);
      }else {
        state.mainBal.value = PlatformEntity(liveId: -1,currency:ImageX.usdtT(), liveName: Intr().wallet_usdt, money: value.money);
      }
      state.mainBal.refresh();
    });
  }
  
  ///回收
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
      refreshBalance(item,state.leftAccount.value);
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
      refreshBalance(state.leftAccount.value,state.rightAccount.value);
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
      loadBalance();
      ///刷新钱包余额
      eventBus.fire(ChangeBalanceEvent());
    });
  }

  ///开通新账户
  void openPlatformPermit(PlatformEntity item){
    var user = AppData.user();
    var cur = AppData.wallet() ? 1: 5;
    var params = <String,dynamic>{ "cur":cur,"oid":user?.oid,"username":user?.username,"platform":item.liveName,};
    HttpService.openPlatformPermit(params).then((value) {
      HttpService.getBalance({ "oid":user?.oid,"username":user?.username,"cur":cur,"platform":item.liveName},loading: false).then((value3) {
        item.money = value3.money;
        item.status = 1;///修改为已开通状态
        state.platforms[state.platforms.indexOf(item)] = item;
        state.platforms.refresh();
      });
    });
  }

  ///刷新转出转入余额
  void refreshBalance(PlatformEntity outAcc, PlatformEntity inAcc) async {
    var user = AppData.user();
    var cur = AppData.wallet() ? 1: 5;
    var outBal = await HttpService.getBalance({ "oid":user?.oid,"username":user?.username,"cur":cur,"platform":outAcc.liveName},loading: false);
    outAcc.money = outBal.money;
    state.platforms[state.platforms.indexOf(outAcc)] = outAcc;
    state.platforms.refresh();

    var inBal = await HttpService.getBalance({ "oid":user?.oid,"username":user?.username,"cur":cur,"platform":inAcc.liveName},loading: false);
    inAcc.money = inBal.money;
    state.platforms[state.platforms.indexOf(inAcc)] = inAcc;
    state.platforms.refresh();

    ///如果需要更新的账户在左右两侧
    if(state.leftAccount.value == outAcc){
      state.leftAccount.value = outAcc;
      state.leftAccount.refresh();
    }else if(state.rightAccount.value == outAcc){
      state.rightAccount.value = outAcc;
      state.rightAccount.refresh();
    }

    if(state.leftAccount.value == inAcc){
      state.leftAccount.value = inAcc;
      state.leftAccount.refresh();
    }else if(state.rightAccount.value == inAcc){
      state.rightAccount.value = inAcc;
      state.rightAccount.refresh();
    }

    ///更新主账户余额
    if(state.mainBal.value.liveId == outAcc.liveId){
      state.mainBal.value.money = outAcc.money;
      state.mainBal.refresh();
    } else if(state.mainBal.value.liveId == inAcc.liveId){
      state.mainBal.value.money = inAcc.money;
      state.mainBal.refresh();
    }

  }






}
