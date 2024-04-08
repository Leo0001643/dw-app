import 'dart:async';
import 'dart:convert';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/controller/avatar_controller.dart';
import 'package:leisure_games/app/controller/wallet_controller.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/app/utils/oss_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/bean/act_status_entity.dart';
import 'package:leisure_games/ui/bean/base_api_oss_entity.dart';
import 'package:leisure_games/ui/bean/change_balance_event.dart';
import 'package:leisure_games/ui/bean/change_main_page_event.dart';
import 'package:leisure_games/ui/bean/html_event.dart';
import 'package:leisure_games/ui/bean/language_event.dart';
import 'package:leisure_games/ui/bean/login_refresh_event.dart';
import 'package:leisure_games/ui/bean/login_user_entity.dart';
import 'package:leisure_games/ui/bean/notice_entity.dart';
import 'package:sprintf/sprintf.dart';

import 'home_state.dart';

class HomeLogic extends GetxController {
  final HomeState state = HomeState();
  StreamSubscription? loginStream;
  StreamSubscription? languageStream;
  StreamSubscription? balanceStream;
  StreamSubscription? apiSub;

  var count = 100; //测试倒计时
  @override
  void onReady() {
    loadData();
    loadUserData();
    queryRoutes();///查询线路信息
    ///余额发生变化，刷新余额数据
    loginStream = eventBus.on<LoginRefreshEvent>().listen((event) {
      loadUserData(jumpNotice: event.show_notice);
    });
    Get.find<AvatarController>().addListener(() {
      state.user.value = AppData.user() ?? LoginUserEntity();
      state.user.refresh();
    });
    Get.find<WalletController>().addListener(() {
      ///钱包切换的时候游戏种类会有变化，所以需要刷新列表
      loadData();
    });
    ///语言国际化更新
    languageStream = eventBus.on<LanguageEvent>().listen((event) {
      loadData();
      loadUserData();
    });
    balanceStream = eventBus.on<ChangeBalanceEvent>().listen((event) {
      loadBalance();
    });
    apiSub = eventBus.on<BaseWsApiEntity>().listen((event) {
      loadData();
      loadUserData();
      ///线路切换 修改当前线路名称
      queryRoutes();
    });
    super.onReady();
  }

  @override
  void onClose() {
    state.timer?.cancel();
    loginStream?.cancel();
    languageStream?.cancel();
    balanceStream?.cancel();
    apiSub?.cancel();
    super.onClose();
  }

  @override
  void onInit() {
    OssUtils().initData();
    super.onInit();
  }

  void clickMenu(BuildContext context, int index) {
    switch (index) {
      case 0:
        ///充值
        if (AppData.isLogin()) {
          eventBus.fire(ChangeMainPageEvent(2));
        } else {
          WidgetUtils().goLogin();
        }
        break;
      case 1:
        ///提现
        // DialogUtils().showCurrencyDialog(context);
        if (AppData.isLogin()) {
          Get.toNamed(Routes.withdraw);
        } else {
          WidgetUtils().goLogin();
        }
        break;
      case 4:

        ///签到抽奖
        if (AppData.isLogin()) {
          Get.toNamed(Routes.sign_in);
        } else {
          WidgetUtils().goLogin();
        }
        break;
      case 5:

        ///积分抽奖
        // eventBus.fire(ChangeMainPageEvent(1));
        // DialogUtils().showAccessRouteDialog(context);
        if (AppData.isLogin()) {
          Get.toNamed(Routes.points_lottery);
        } else {
          WidgetUtils().goLogin();
        }
        break;
      case 6:
        ///抢红包
        if(state.hongbaoVisible.isFalse){
          showToast(Intr().huodongweikaiqi);
          return;
        }
        if(unEmpty(state.domainConfig?.frontDomain)){
          if (AppData.isLogin()) {
            var path = sprintf("${state.domainConfig!.frontDomain!.first}/m/#/Hongbao/%s/%s/%s",
                [AppData.user()?.oid,AppData.user()?.username,Intr().currentLocale().languageCode]);
            // print("抢红包>>地址"+path);
            Get.toNamed(Routes.html,
                arguments: HtmlEvent(
                    data: path,
                    isHtmlData: false,
                    pageTitle: Intr().hongbaohuodong));
          } else {
            WidgetUtils().goLogin();
          }
        }
        break;
      case 7:

        ///个人中心
        Navigator.pop(context);
        if (AppData.isLogin()) {
          eventBus.fire(ChangeMainPageEvent(4));
        } else {
          WidgetUtils().goLogin();
        }
        break;
      case 8:

        ///走势
        Navigator.pop(context);
        Get.toNamed(Routes.lottery_trend);
        break;
      case 9:

        ///额度转换
        Navigator.pop(context);

        if (AppData.isLogin()) {
          Get.toNamed(Routes.quota_conversion);
        } else {
          WidgetUtils().goLogin();
        }
        break;
      case 10:

        ///币币兑换
        Navigator.pop(context);

        if (AppData.isLogin()) {
          Get.toNamed(Routes.coin_exchange);
        } else {
          WidgetUtils().goLogin();
        }
        break;
      case 11:

        ///投注记录
        Navigator.pop(context);

        if (AppData.isLogin()) {
          Get.toNamed(Routes.betting_record);
        } else {
          WidgetUtils().goLogin();
        }
        break;
      case 12:

        ///推广赚钱
        Navigator.pop(context);

        if (AppData.isLogin()) {
          Get.toNamed(Routes.promotion_profit);
        } else {
          WidgetUtils().goLogin();
        }
        break;
    }
  }

  void clickInfo(BuildContext context, String title) {
    if (Intr().guanyuwomen == title) {
      HttpService.getNewsRate("about").then((value) {
        Get.toNamed(Routes.html,
            arguments: HtmlEvent(
                isHtmlData: true,
                data: value.content.em(),
                pageTitle: Intr().guanyuwomen));
      });
    } else if (Intr().yonghuzhongxin == title) {
      if (AppData.isLogin()) {
        eventBus.fire(ChangeMainPageEvent(4));
      } else {
        WidgetUtils().goLogin();
      }
    } else if (Intr().lianxiwomen == title) {
      HttpService.getNewsRate("llwm").then((value) {
        Get.toNamed(Routes.html,
            arguments: HtmlEvent(
                isHtmlData: true,
                data: value.content.em(),
                pageTitle: Intr().lianxiwomen));
      });
    } else if (Intr().eduzhuanhuan == title) {
      if (AppData.isLogin()) {
        Get.toNamed(Routes.quota_conversion);
      } else {
        WidgetUtils().goLogin();
      }
    } else if (Intr().jishuzhichi == title) {
      HttpService.getNewsRate("wenti").then((value) {
        Get.toNamed(Routes.html,
            arguments: HtmlEvent(
                isHtmlData: true,
                data: value.content.em(),
                pageTitle: Intr().jishuzhichi));
      });
    } else if (Intr().fangjiechijiaocheng == title) {
      HttpService.getNewsRate("jiechijiaocheng").then((value) {
        Get.toNamed(Routes.html,
            arguments: HtmlEvent(
                isHtmlData: true,
                data: value.content.em(),
                pageTitle: Intr().fangjiechijiaocheng));
      });
    }
  }

  void loadData() {

    ///更换站点logo
    state.stationLogo.value = ImageX.icStationHomeZ();

    HttpService.getGameKind(AppData.wallet() ? 1: 5).then((value) {
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
    HttpService.getPc28LottoList().then((value) {
      state.pc28Lotto.value = value;
      state.pc28Lotto.refresh();
    });

    ///提示信息
    HttpService.getRoomCopyWriting().then((value) {
      AppData.saveRoomWritingEntity(JsonUtil.encodeObj(value).em());
    });

    //请求倒计时
    // HttpService.getPC28Plan(5).then((value) {
    //   state.timerEntity.value = value;
    //   state.timerEntity.refresh();
    // });

    HttpService.getActStatus().then((value) {
      var hongbao = value.list?["hongbao"];

      ///显示红包
      if (hongbao?.status == 1) {
        startCountDown(value.cTime.em(), hongbao!);
        HttpService.getActPic().then((value) {
          state.act.value = value;
          state.act.refresh();
        });
      }
    });
  }

  void startCountDown(int ctime, ActStatusList act) {
    var offTime = DateTime.now().millisecondsSinceEpoch ~/ 1000 - ctime;
    state.timer?.cancel();
    state.timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      var curTime = DateTime.now().millisecondsSinceEpoch ~/ 1000 - offTime;
      if (curTime < act.picStartTime.em() || curTime > act.endTime.em()) {
        state.hongbaoVisible.value = false;
      } else if (curTime < act.startTime.em()) {
        state.act.value.logo?.status = Intr().weikaishi; //未开始
        state.hongbaoVisible.value = true;
      } else if (curTime > act.startTime.em() && curTime < act.endTime.em()) {
        var countTime = act.endTime.em() - curTime;
        if (countTime > 24 * 60 * 60) {
          state.act.value.logo?.status = Intr().jinxingzhong; //进行中
        } else {
          state.act.value.logo?.status =
              DataUtils.format12Hour(countTime * 1000, format: "HH:mm:ss"); //进行中
        }
        state.act.refresh();
        state.hongbaoVisible.value = true;
      } else if (curTime < act.startTime.em()) {
        state.act.value.logo?.status = Intr().yijieshu; //已结束
        state.hongbaoVisible.value = true;
      }
    });
  }

  ///加载用户登录信息
  void loadUserData({bool jumpNotice = true}) {
    if (AppData.isLogin()) {
      var user = AppData.user();
      state.user.value = user!;
      state.user.refresh();

      loadBalance();

      if (jumpNotice) {
        //2跳弹公告
        HttpService.getNotice(2).then((value) {
          if (unEmpty(value)) {
            showNotice(value, 0);
          }
        });
      }

      ///域名配置
      HttpService.getDomainConfig({"oid": user.oid, "username": user.username}).then((value) {
        state.domainConfig = value;
      });
      ///未读消息数量
      var params = {"oid":user.oid,"username":user.username};
      HttpService.getMessage(params).then((value) {
        var count = 0;
        value.forEach((element) {
          if(element.mstatus == 0){
            count++;
          }
        });
        state.unreadCount.value = count;
      });

    } else {
      state.user.value = LoginUserEntity();
      state.user.refresh();
    }
  }


  void loadBalance(){
    if(!AppData.isLogin()) return;

    var user = AppData.user()!;

    HttpService.getBalance({ "cur":1, "platform":"main","oid":user.oid,"username":user.username }).then((value) {
      state.cnyBal.value = value;
      state.cnyBal.refresh();
    });

    HttpService.getBalance({ "cur":5, "platform":"main","oid":user.oid,"username":user.username }).then((value) {
      state.usdtBal.value = value;
      state.usdtBal.refresh();
    });

  }

  void showNotice(List<NoticeEntity> value, int i) {
    if (value.length > i) {
      DialogUtils()
          .showNoticeDialog(
              Get.context!, value[i].noteTitle.em(), value[i].noteContent.em())
          .then((v) {
        showNotice(value, i + 1);
      });
    }
  }

  ///请求云存储里的路线
  void queryRoutes() async {
    var value = AppData.ossApi();
    if(isEmpty(value) || value!.updateTime.em() < (DateTime.now().millisecondsSinceEpoch - 86400000)){
      value = await OssUtils().downloadFile();
      ///用于判断是否需要更新缓存使用
      value!.updateTime = DateTime.now().millisecondsSinceEpoch;
      AppData.setOssApi(value);
      ///适配多渠道环境 如果换成其他渠道本地host就跟线路里的不是一回事了 所以得处理一下多渠道的环境问题
      AppData.checkBaseUrl(value);
    }

    var list = value.toApiList();
    for(var i=0;i<list.em();i++){
      loggerArray(["线路对比结果",list[i].baseApi,AppData.baseUrl()]);
      if(list[i].baseApi == AppData.baseUrl()){
        state.routeName.value = Intr().xianlu_(["${i + 1}"]);
        return;
      }
    }
  }


}
