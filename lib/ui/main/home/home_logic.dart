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
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/bean/act_status_entity.dart';
import 'package:leisure_games/ui/bean/change_main_page_event.dart';
import 'package:leisure_games/ui/bean/html_event.dart';
import 'package:leisure_games/ui/bean/login_refresh_event.dart';
import 'package:leisure_games/ui/bean/login_user_entity.dart';
import 'package:leisure_games/ui/bean/notice_entity.dart';
import 'package:sprintf/sprintf.dart';

import '../../bean/game_kind_entity.dart';
import '../../bean/pc28_lotto_entity.dart';
import '../../bean/pc28_plan_entity.dart';
import 'home_state.dart';

class HomeLogic extends GetxController {
  final HomeState state = HomeState();
  StreamSubscription? loginStream;
  var count = 100; //测试倒计时
  @override
  void onReady() {
    loadData();
    loadUserData();
    ///余额发生变化，刷新余额数据
    loginStream = eventBus.on<LoginRefreshEvent>().listen((event) {
      loadUserData(jumpNotice: event.show_notice);
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

  void clickMenu(BuildContext context, int index) {
    switch (index) {
      case 0:

        ///充值
        // DialogUtils().showLanguageDialog(context);
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
        if (AppData.isLogin()) {
          var path = sprintf("http://soptj9qq.com/m/#/Hongbao/1/2/3", [
            AppData.user()?.oid,
            AppData.user()?.username,
            Intr().currentLocale().languageCode
          ]);
          Get.toNamed(Routes.html,
              arguments: HtmlEvent(
                  data: path,
                  isHtmlData: false,
                  pageTitle: Intr().hongbaohuodong));
        } else {
          WidgetUtils().goLogin();
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

        WidgetUtils().goLogin();

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
    HttpService.getPc28LottoList().then((value) {
      state.pc28Lotto.value = value;
      state.pc28Lotto.refresh();
    });
    //请求倒计时
    HttpService.getPC28Plan(5).then((value) {
      state.timerEntity.value = value;
      state.timerEntity.refresh();
    });

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
              DateUtil.formatDateMs(countTime * 1000, format: "HH:mm:ss"); //进行中
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

      HttpService.getBalance({
        "cur": 1,
        "platform": "main",
        "oid": user.oid,
        "username": user.username
      }).then((value) {
        state.cnyBal.value = value;
        state.cnyBal.refresh();
      });

      HttpService.getBalance({
        "cur": 5,
        "platform": "main",
        "oid": user.oid,
        "username": user.username
      }).then((value) {
        state.usdtBal.value = value;
        state.usdtBal.refresh();
      });
      state.user.refresh();
      if (jumpNotice) {
        //2跳弹公告
        HttpService.getNotice(2).then((value) {
          if (unEmpty(value)) {
            showNotice(value, 0);
          }
        });
      }
    } else {
      state.user.value = LoginUserEntity();
      state.user.refresh();
    }
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

  void loadPc28Data(
      GameKindGameKindList gameKind, Pc28LottoEntity pc28lottoEntity) {
    HttpService.getPc28LottoList().then((value) {
      state.pc28Lotto.value = value;
      state.pc28Lotto.refresh();
      for (Pc28LottoRooms item in pc28lottoEntity.rooms!) {
        print(">>item.gameType" + item.gameType.toString());
        // 判断 gameCode 和 gameType 是否相等
        if (gameKind.gameCode == item.gameType) {
          // 执行倒计时逻辑
          loadTimerData(item);
          break; // 找到匹配的 gameType 后可以退出循环
        }
      }
    });
  }

  void loadTimerData(Pc28LottoRooms pc28lottoRoom) {
    //请求倒计时
    HttpService.getPC28Plan(5).then((value) {
      state.timerEntity.value = value;
      state.timerEntity.refresh();
      // 模拟异步获取的数据
      _calculateCountdown(pc28lottoRoom, state.timerEntity.value);
    });
  }

  void _calculateCountdown(
      Pc28LottoRooms pc28lottoRoom, Pc28PlanEntity pc28PlanEntity) {
    // 服务器的误差时间
    var diffTime =
        pc28PlanEntity.timestamp! - DateTime.now().millisecondsSinceEpoch;
    Timer.periodic(Duration(seconds: 1), (timer) {
      count--;
      state.text_timer.value = count.toString();
      timeCountOnly(diffTime, pc28lottoRoom, pc28PlanEntity);
    });
  }

  void timeCountOnly(
      diffTime, Pc28LottoRooms pc28lottoRoom, Pc28PlanEntity pc28planEntity) {
    Map<String, dynamic> allTime = pc28planEntity.all!.toJson();
    Map<String, dynamic> roomcountdown = {};
    Map<String, dynamic> roominf = pc28lottoRoom.toJson();

    for (String key in allTime.keys) {
      if (roominf[key]?.stateMsg != 0) {
        if (roominf[key]?.stateMsg == 1) {
          roomcountdown[key + 'Time'] = "维护中";
        } else if (roominf[key]?.stateMsg == 3) {
          roomcountdown[key + 'Time'] = "已关盘";
        } else if (roominf[key]?.stateMsg == 4) {
          roomcountdown[key + 'Time'] = "已休市";
        }
        roomcountdown[key + 'Term'] = '--';
        roomcountdown[key + 'Notice'] = allTime[key]['msg'] ?? '';
        continue;
      }

      if (allTime[key]['code'] == 100020) {
        roomcountdown[key + 'Time'] = "Index.等待开盘";
        roomcountdown[key + 'Term'] = '--';
        roomcountdown[key + 'Notice'] = allTime[key]['msg'];
      } else {
        if (allTime[key]['data'].length > 1) {
          for (int s = 0; s < allTime[key]['data'].length - 1; s++) {
            int onlineT =
                DateTime.now().millisecondsSinceEpoch + int.parse(diffTime);
            if (onlineT <= allTime[key]['data'][s + 1]['openTime']) {
              int openT = (int.parse(allTime[key]['data'][s + 1]['openTime']) -
                      onlineT) ~/
                  1000;
              roomcountdown[key + 'OpenResult'] = openT;
              if (openT == 0) {
                roomcountdown[key + 'OpenResult'] = 'MiPai.开奖中';
              }

              if (onlineT < allTime[key]['data'][s]['closeTime'] &&
                  onlineT > allTime[key]['data'][s]['openTime']) {
                int rrtime = allTime[key]['data'][s]['closeTime'];
                int showT = (rrtime - onlineT) ~/ 1000;
                String showtime = secToTime(showT);
                roomcountdown[key + 'Time'] = showtime;
                roomcountdown[key + 'Term'] = allTime[key]['data'][s]['term'];
                break;
              } else if (onlineT > allTime[key]['data'][s]['closeTime'] &&
                  onlineT < allTime[key]['data'][s + 1]['openTime']) {
                roomcountdown[key + 'Time'] = "Index.封盘中";
                roomcountdown[key + 'Term'] = allTime[key]['data'][s]['term'];
                break;
              }
            }
          }
        } else if (allTime[key]['data'].length == 1) {
          int onlineT =
              DateTime.now().millisecondsSinceEpoch + int.parse(diffTime);
          if (onlineT < allTime[key]['data'][0]['closeTime'] &&
              onlineT > allTime[key]['data'][0]['openTime']) {
            int rrtime = allTime[key]['data'][0]['closeTime'];
            int showT = (rrtime - onlineT) ~/ 1000;
            String showtime = secToTime(showT);
            roomcountdown[key + 'Time'] = showtime;
            roomcountdown[key + 'Term'] = allTime[key]['data'][0]['term'];
          } else if (onlineT < allTime[key]['data'][0]['openTime']) {
            roomcountdown[key + 'Time'] = "Index.封盘中";
            roomcountdown[key + 'Term'] = allTime[key]['data'][0]['term'];
          }
        }
      }
      state.text_timer.value = roomcountdown[key + 'Time'];
    }
  }

  String secToTime(int sec) {
    int hours = sec ~/ 3600;
    int minutes = (sec % 3600) ~/ 60;
    int seconds = sec % 60;
    return '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
