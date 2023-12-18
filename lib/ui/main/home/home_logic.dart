import 'dart:async';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/controller/avatar_controller.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/bean/act_status_entity.dart';
import 'package:leisure_games/ui/bean/change_main_page_event.dart';
import 'package:leisure_games/ui/bean/login_refresh_event.dart';
import 'package:leisure_games/ui/bean/login_user_entity.dart';

import 'home_state.dart';

class HomeLogic extends GetxController {
  final HomeState state = HomeState();
  StreamSubscription? loginStream;

  @override
  void onReady() {
    loadData();
    loadUserData();
    ///余额发生变化，刷新余额数据
    loginStream = eventBus.on<LoginRefreshEvent>().listen((event) {
      loadUserData();
    });
    Get.find<AvatarController>().addListener(() {
      state.user.value = AppData.user() ?? LoginUserEntity();
      state.user.refresh();
    });
    super.onReady();
  }

  @override
  void onClose() {
    state.timer?.cancel();
    loginStream?.cancel();
    super.onClose();
  }

  void clickMenu(BuildContext context,int index){
    switch(index){
      case 0:///充值
        // DialogUtils().showLanguageDialog(context);
        if(AppData.isLogin()){
          eventBus.fire(ChangeMainPageEvent(2));
        } else {
          WidgetUtils().goLogin();
        }
        break;
      case 1:///提现
        // DialogUtils().showCurrencyDialog(context);
        if(AppData.isLogin()){
          Get.toNamed(Routes.withdraw);
        } else {
          WidgetUtils().goLogin();
        }
        break;
      case 4:///签到抽奖
        if(AppData.isLogin()){
          Get.toNamed(Routes.sign_in);
        } else {
          WidgetUtils().goLogin();
        }
        break;
      case 5:///积分抽奖
        // eventBus.fire(ChangeMainPageEvent(1));
        // DialogUtils().showAccessRouteDialog(context);
        if(AppData.isLogin()){
          Get.toNamed(Routes.points_lottery);
        } else {
          WidgetUtils().goLogin();
        }
        break;
      case 6:///推荐有礼
        if(AppData.isLogin()){
          Get.toNamed(Routes.promotion_profit);
        } else {
          WidgetUtils().goLogin();
        }
        break;
      case 7:///个人中心
        Navigator.pop(context);
        if(AppData.isLogin()){
          eventBus.fire(ChangeMainPageEvent(4));
        } else {
          WidgetUtils().goLogin();
        }
        break;
      case 8:///走势
        Navigator.pop(context);
        Get.toNamed(Routes.lottery_trend);
        break;
      case 9:///额度转换
        Navigator.pop(context);

        if(AppData.isLogin()){
          Get.toNamed(Routes.quota_conversion);
        } else {
          WidgetUtils().goLogin();
        }
        break;
      case 10:///币币兑换
        Navigator.pop(context);

        if(AppData.isLogin()){
          Get.toNamed(Routes.coin_exchange);
        } else {
          WidgetUtils().goLogin();
        }
        break;
      case 11:///投注记录
        Navigator.pop(context);

        WidgetUtils().goLogin();

        break;
      case 12:///推广赚钱
        Navigator.pop(context);

        if(AppData.isLogin()){
          Get.toNamed(Routes.promotion_profit);
        } else {
          WidgetUtils().goLogin();
        }
        break;
    }

  }



  void clickInfo(BuildContext context,int index){
    switch(index){
      case 0:

        break;
      case 1:

        break;
      case 2:

        break;
      case 3:

        break;
    }

  }

  void loadData(){
    HttpService.getGameKind().then((value) {
      state.menuGroup.assignAll(value);
      state.menuGroup.refresh();
    });

    //公告
    HttpService.getNotice(1).then((value) {
      state.noticeList.assignAll(value);
      state.noticeList.refresh();
    });

    HttpService.getRotate().then((value) {
      state.bannerList.assignAll(value);
      state.bannerList.refresh();
    });

    HttpService.getActStatus().then((value) {
      var hongbao = value.list?["hongbao"];
      ///显示红包
      if(hongbao?.status == 1){
        startCountDown(value.cTime.em(),hongbao!);
        HttpService.getActPic().then((value) {
          state.act.value = value;
          state.act.refresh();
        });
      }
    });
  }


  void startCountDown(int ctime,ActStatusList act) {
    var offTime = DateTime.now().millisecondsSinceEpoch ~/ 1000 - ctime;
    state.timer?.cancel();
    state.timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      var curTime = DateTime.now().millisecondsSinceEpoch ~/ 1000 - offTime;
      if(curTime < act.picStartTime.em() || curTime > act.endTime.em()){
        state.hongbaoVisible.value = false;
      }else if(curTime < act.startTime.em()){
        state.act.value.logo?.status = Intr().weikaishi;//未开始
        state.hongbaoVisible.value = true;
      }else if(curTime > act.startTime.em() && curTime < act.endTime.em()){
        var countTime = act.endTime.em() - curTime;
        if(countTime > 24*60*60){
          state.act.value.logo?.status = Intr().jinxingzhong;//进行中
        }else {
          state.act.value.logo?.status = DateUtil.formatDateMs(countTime*1000,format: "HH:mm:ss");//进行中
        }
        state.act.refresh();
        state.hongbaoVisible.value = true;
      }else if(curTime < act.startTime.em()){
        state.act.value.logo?.status = Intr().yijieshu;//已结束
        state.hongbaoVisible.value = true;
      }
    });



  }

  ///加载用户登录信息
  void loadUserData() {
    if(AppData.isLogin()){
      var user = AppData.user();
      state.user.value = user!;

      HttpService.getBalance({ "cur":1, "platform":"main","oid":user.oid,"username":user.username }).then((value) {
        state.cnyBal.value = value;
        state.cnyBal.refresh();
      });

      HttpService.getBalance({ "cur":5, "platform":"main","oid":user.oid,"username":user.username }).then((value) {
        state.usdtBal.value = value;
        state.usdtBal.refresh();
      });
      state.user.refresh();
    }else {
      state.user.value = LoginUserEntity();
      state.user.refresh();
    }

  }





}
