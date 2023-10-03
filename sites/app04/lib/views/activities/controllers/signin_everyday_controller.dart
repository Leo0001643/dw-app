import 'package:aone_common/common.dart';
import 'package:aone_common/controllers/activity/sinin_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import '../widgets/signin_widgets/signin_not_dailog.dart';
import '../widgets/signin_widgets/signin_reset_dailog.dart';
import '../widgets/signin_widgets/signin_success_dailog.dart';

class SigninEverydayController extends SininLogic {
  static SigninEverydayController get to => Get.find();
  List<Navconfig> navConfigList = GlobalService.to.state.navConfig;
  List<SubChildren>? subChildren;
  var dayNum = getCurrentMonthAllDay();
  int get startWeek => getStartWeekWithYearMonth(
      year: currentYear.value, month: currentMonth.value);

  //查看当月签到按钮状态
  final RxBool _showMore = false.obs;
  set showMore(bool value) => _showMore.value = value;
  bool get showMore => _showMore.value;

  late String back_Type = '';
  RxInt currentMonth = int.parse(getCurrentTimefor(TimeType.month)).obs;
  RxInt currentYear = int.parse(getCurrentTimefor(TimeType.year)).obs;

  @override
  void onInit() {
    selDirection = 'torigth';
    // getUserSininInfoList();
    getSininInfoList();
    getShowGameList();
    back_Type = Get.arguments ?? '2';
    super.onInit();
  }

  //判断是否展示
  String showDayState(int index) {
    if (startWeek == (index + 1) || (index + 1) > startWeek) {
      return (index - startWeek + 2).toString();
    } else {
      return "";
    }
  }

  getSininInfoList() async {
    var res = await getUserSininInfoList();
    sininData = res?.sininEntivity;
    state.signinRecordList.clear();
    state.signinRecordList.addAll(sininData!.qiandaoRecord!);
    if (showSigninResetWidget(false)) {
      return;
    }
    print('${sininData?.sininBreak}');
  }

  goToSignin() async {
    // SininBackEntivity signinBackEntivity = SininBackEntivity(
    //     statusCode: 200,
    //     message: 'message',
    //     qiandaoMoney: '200.0',
    //     extraMoney: '12.0',
    //     lxCount: 3,
    //     czDiff: '1.4',
    //     dmlDiff: '3.3');
    //
    // Get.dialog(SigninNotSatisfied(
    //   siginBackEntivity: signinBackEntivity!,
    //   isReissue: true,
    // ));

    // Get.dialog(
    //   SigninReset(
    //     haveResumeLimit: false,
    //   ),
    //   // barrierDismissible: false
    // );

    // Get.dialog(SigninSuccessDailog(
    //   siginBackEntivity: signinBackEntivity,
    //   isReissueSinin: '2',
    // ));

    if (!sininData!.todayIsQiandao!) {
      if (showSigninResetWidget(true)) {
        return;
      }
      var signinBackEntivity = await postSininData();
      if (signinBackEntivity?.statusCode == 400) {
        Get.dialog(SigninNotSatisfied(
          siginBackEntivity: signinBackEntivity!,
          isReissue: false,
        ));
      } else if (signinBackEntivity?.statusCode == 200) {
        getSininInfoList();
        if (double.parse(signinBackEntivity!.extraMoney.toString()) > 0) {
          Get.dialog(SigninSuccessDailog(
            siginBackEntivity: signinBackEntivity,
            isReissueSinin: '1',
          ));
        }
        Get.dialog(SigninSuccessDailog(
          siginBackEntivity: signinBackEntivity,
          isReissueSinin: '2',
        ));
      } else {
        // SmartDialog.showToast(signinBackEntivity!.message!);
      }
    }
  }

  goToReissueSignin(SevenDay sevenDay) async {
    if (sevenDay.state == 4) {
      // goToSigninReset();

      if (showSigninResetWidget(false)) {
        return;
      }
      var signinBackEntivity = await postReissueSininData(sevenDay.riqiDate!);
      // Get.back();

      if (signinBackEntivity?.statusCode == 400) {
        Get.dialog(SigninNotSatisfied(
          siginBackEntivity: signinBackEntivity!,
          isReissue: true,
        ));
      } else if (signinBackEntivity?.statusCode == 200) {
        getSininInfoList();
        Get.dialog(SigninSuccessDailog(
          siginBackEntivity: signinBackEntivity!,
          isReissueSinin: '3',
        ));
      } else {
        if (signinBackEntivity!.message != "") {
          SmartDialog.showToast(signinBackEntivity!.message!);
        }
      }
    }
  }

  goToSigninReset() async {
    var signinBackEntivity = await postSigninReset();
    if (signinBackEntivity?.statusCode == 200) {
      getSininInfoList();
    }
  }

  bool showSigninResetWidget(bool verification) {
    if ((sininData?.sininBreak ?? false)) {
      if (int.parse('${sininData?.resumeLimit.toString()}') > 0) {
        if (verification == true) {
          Get.dialog(
            SigninReset(
              haveResumeLimit: true,
            ),
            // barrierDismissible: false
          );

          return true;
        }
      } else if (int.parse('${sininData?.resumeLimit.toString()}') == 0) {
        Get.dialog(
          SigninReset(
            haveResumeLimit: false,
          ),
          // barrierDismissible: false
        );

        return true;
      }
    }
    return false;
  }

  //查看当前月签到
  showCurrentMonthSignin() {
    showMore = !showMore;
  }

  //赛选列表
  getShowGameList() {
    if (GlobalService.to.state.navConfig == null ||
        GlobalService.to.state.navConfig!.isEmpty) {
      subChildren = [];
      return;
    }
    for (Navconfig navconfig in GlobalService.to.state.navConfig) {
      print('${navconfig.nameCn} == ${navconfig.tag}');
    }

    // GlobalService.to.state.navConfig.where((element) => element.name == '体育');
    List<Navconfig> navConfigList1 = GlobalService.to.state.navConfig;
    if (navConfigList1 == null || navConfigList1!.isEmpty) {
      subChildren = [];
    } else {
      subChildren = navConfigList1[0].subChildren;
    }
  }

  //卡片点击
  void cardClick(SubChildren? object) {
    // Get.toNamed(appRoutes.Routes.homeDetail, arguments: object);
    if (object == null) return;
    if (UserService.to.state.isRegularUser) {
      onBeforeGameInit(
        onGameParams: object,
      );
    } else {
      SmartDialog.showToast('请先登录');
      Get.toNamed(Routes.login);
    }
  }

  @override
  SininLabelState getSininLabel(SevenDay sevenDay) {
    switch (sevenDay.state) {
      case 0:
        {
          if (double.parse(sevenDay.extraMoney!.toString()) > 0) {
            return SininLabelState(
              labelColor: const Color(0xFFEB3F34),
              groundColor: const Color(0xFFEB3F34),
              labelText: '待签',
              topGroundColor: stringToColor('FFE6B2'),
              toplabeldColor: stringToColor('CF903F'),
              showType:
                  double.parse(sevenDay.extraMoney!.toString()) > 0 ? '5' : '1',
            );
          } else {
            return SininLabelState(
              labelColor: const Color(0xFFEC2121),
              groundColor: const Color(0xFFEB3F34),
              labelText: '待签',
              topGroundColor: stringToColor('dddddd'),
              toplabeldColor: stringToColor('2E2D30'),
              showType:
                  double.parse(sevenDay.extraMoney!.toString()) > 0 ? '5' : '1',
            );
          }
        }
      case 1:
        {
          return SininLabelState(
            labelColor: const Color(0xFFEF8658),
            groundColor: const Color(0xFFEF8658),
            labelText: '已签',
            topGroundColor: stringToColor('B7D9FF'),
            toplabeldColor: stringToColor('3276F5'),
            showType: '2',
          );
        }
      case 2:
        {
          if (double.parse(sevenDay.extraMoney!.toString()) > 0) {
            return SininLabelState(
              labelColor: const Color(0xFF4DB1EF),
              groundColor: const Color(0xFF4DB1EF),
              labelText: '已补',
              topGroundColor: stringToColor('F6E1B5'),
              toplabeldColor: stringToColor('2E2D30'),
              showType: '4',
            );
          } else {
            return SininLabelState(
              labelColor: const Color(0xFF4DB1EF),
              groundColor: const Color(0xFF4DB1EF),
              labelText: '已补',
              topGroundColor: stringToColor('dddddd'),
              toplabeldColor: stringToColor('2E2D30'),
              showType: '4',
            );
          }
        }
      case 4: //4
        {
          if (double.parse(sevenDay.extraMoney!.toString()) > 0) {
            return SininLabelState(
              labelColor: const Color(0xFFAAAAAA),
              groundColor: const Color(0XFFAAAAAA),
              labelText: '补签',
              topGroundColor: stringToColor('F6E1B5'),
              toplabeldColor: stringToColor('2E2D30'),
              showType: '5',
            );
          } else {
            return SininLabelState(
              labelColor: const Color(0xFFAAAAAA),
              groundColor: const Color(0XFFAAAAAA),
              labelText: '补签',
              topGroundColor: stringToColor('dddddd'),
              toplabeldColor: stringToColor('2E2D30'),
              showType: '5',
            );
          }
        }
      default:
        return SininLabelState(
          labelColor: const Color(0xFF3DC070),
          groundColor: const Color(0xFF3DC070),
          labelText: '过期',
          topGroundColor: stringToColor('F6E1B5'),
          toplabeldColor: stringToColor('2E2D30'),
          showType: '1',
        );
    }
  }

  //判断当天签到状态的颜色
  SigninRecordColor getSignInRecordState(String index) {
    SigninRecordColor returnColor =
        SigninRecordColor(Colors.black, Colors.transparent);
    for (int i = 0; i < state.dayList.length; i++) {
      SevenDay sevenDay = state.dayList[i];
      if (sevenDay.riqiDate != null && sevenDay.riqiDate?.isEmpty != true) {
        DateTime dateTime = DateTime.parse(sevenDay.riqiDate!);
        bool isSame = ((dateTime.month) == (currentMonth.value)) &&
            (dateTime.year == currentYear.value);
        if (isSame == true) {
          if (sevenDay.dataIndex == index.toString()) {
            returnColor = getSigninShowColor(sevenDay.state!);
          }
        }
      }
    }
    return returnColor;
  }

  SigninRecordColor getSigninShowColor(int state) {
    switch (state) {
      case 1: //已签
        {
          return SigninRecordColor(
            Colors.white,
            const Color(0xFFEF8658),
          );
        }
      case 2: //已补
        {
          return SigninRecordColor(
            Colors.white,
            const Color(0xFF4DB1EF),
          );
        }

      case 3: //补签
        {
          return SigninRecordColor(
            Colors.white,
            const Color(0xFFEB3F34),
          );
        }

      case 4: //补签
        {
          return SigninRecordColor(
            Colors.white,
            const Color(0xFFAAAAAA),
          );
        }

      default:
        {
          return SigninRecordColor(
            Colors.black,
            Colors.transparent,
          );
        }
    }
  }

  void preMonth() {
    if (currentMonth.value == 1) {
      currentYear -= 1;
      currentMonth.value = 12;
    } else {
      currentMonth.value -= 1;
    }
  }

  void nextMonth() {
    if (currentMonth.value == 12) {
      currentYear += 1;
      currentMonth.value = 1;
    } else {
      currentMonth.value += 1;
    }
  }
}

class SigninRecordColor {
  Color color;
  Color bgColor;
  SigninRecordColor(
    this.color,
    this.bgColor,
  );
}
