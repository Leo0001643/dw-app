import 'dart:io';

import 'package:aone_common/common.dart';
import 'package:aone_common/controllers/activity/sinin_logic.dart'
    as sinin_logic;
import 'package:aone_common/data/model/entities/user/back_water_program.dart';
import 'package:aone_common/data/model/entities/user/ladder_fs.dart';
import 'package:app10/app_service.dart';
import 'package:app10/config/site_config.dart';
import 'package:app10/widget/misc/dj_image.dart';
import 'package:app10/widget/tool/light_text.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:fortune_wheel/fortune_wheel.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../tab/controllers/main_tabbar_controller.dart';
import '../../../activities/views/fortune_wheel_page.dart';
import '../../article/article_code.dart';
import '../../message_center/message_center_logic.dart';

class UserController extends BaseController with GetTickerProviderStateMixin {
  final _userService = UserService.to;

  static UserController get to => Get.find();

  final app = AppService.to;

  final RxBool _showBalance = true.obs;

  get showBalance => _showBalance.value;

  set showBalance(val) => _showBalance.value = val;

  final moneyLoaded = false.obs;
  final RxString _appVersion = '1.0.0'.obs;

  String get appVersion => _appVersion.value;

  set appVersion(value) => _appVersion.value = value;

  late final String platformName;
  SiteConfigProvider versionProvider = SiteConfigProvider();
  final RxBool _haveNewVersion = false.obs;

  bool get haveNewVersion => _haveNewVersion.value;

  set haveNewVersion(bool val) => _haveNewVersion.value = val;
  String downloadLink = '';
  String newVersion = '';

  //刷新金额动画
  AnimationController? animationController;
  late bool isRefreshing = false;
  int refreshCount = 0;

  void pushAccountDataClick() {
    Get.toNamed(Routes.accountData);
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    platformName = Platform.isAndroid ? 'android' : 'ios';

    animationController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animationController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);

    //响应页面的加载动画
    ever(pageStateObs, (state) {
      if (state == PageState.loading) {
        SmartDialog.showLoading();
      } else {
        SmartDialog.dismiss(status: SmartStatus.loading);
      }
    });
    getShowBalance();
    await factorNeed();
    juegeTrial();
    // reloadMoney();
    reloadCount();
    _getVersion();
    _fsFanganExist();
  }

  late final Rx<FactorNeedEntity> _needEntity = Rx(FactorNeedEntity());

  FactorNeedEntity get needEntity => _needEntity.value;

  set needEntity(FactorNeedEntity value) => _needEntity.value = value;
  WithdrawalProvider provider = WithdrawalProvider();

  UserReportProvider userProvider = UserReportProvider();
  bool showBackWater = false;

  tapBalanceEye() async {
    _showBalance.toggle();
    SharedPreferences? spf = await SharedPreferences.getInstance();
    if (_userService.state.isRegularUser) {
      spf.setBool("setShowBalance", _showBalance.value);
    }
  }

  getShowBalance() async {
    SharedPreferences? sbf = await SharedPreferences.getInstance();
    bool? show = sbf.getBool("setShowBalance");
    if (show != null && _userService.state.isRegularUser) {
      _showBalance.value = show;
    }
  }

  Future<void> factorNeed() async {
    if (_userService.state.isTrial) return;
    await fetchHandler<FactorNeedEntity>(
      provider.factorNeed(),
      onSuccess: (res) {
        needEntity = res;
      },
    );
  }

  Future<void> _fsFanganExist() async {
    if (UserService.to.state.isTrial) return;
    await fetchHandler<BackWaterProgramEntity>(
      userProvider.fsFanganExist(),
      onSuccess: (res) {
        getBackwaterType(res.exist ?? false);
      },
    );
  }

  //获取分类
  void getBackwaterType(bool exist) async {
    await fetchHandler<LadderFsEntity>(userProvider.getBetBackwater(),
        onSuccess: (res) {
      bool backWater = false;
      if (res.items != null && res.items!.isNotEmpty) {
        backWater = res.items!.indexWhere((element) =>
                element.items != null && element.items!.isNotEmpty) >
            -1;
      }
      showBackWater = exist && backWater;
      update();
    });
  }

  void juegeTrial() {
    if (UserService.to.state.authLevel == AuthLevel.trial) {
      showBalance = true;
    } else {
      // showBalance = false;
    }
  }

  Future<void> checkUpDate() async {
    try {
      CheckUpdateDto dto = CheckUpdateDto(
        currentVersion: appVersion,
        devices: platformName,
      );
      var res = await versionProvider.checkUpdate(dto);
      if (res.items != null) {
        haveNewVersion = true;
        downloadLink = res.items!;
        newVersion = 'V${res.version!}';
        printInfo(info: "jett--->检查更新2 $newVersion");
        Get.dialog(Center(
          child: Container(
            width: 245.w,
            height: 263.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(7.0)),
              border: Border.all(width: 1, color: Colors.white),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 25.w,
                ),
                DjImage.asset(
                  'assets/images/user/upgrade_header.png',
                  width: 112.w,
                  height: 104.w,
                ),
                SizedBox(
                  height: 10.w,
                ),
                LightText.buildColorFont(
                    "版本更新", stringToColor("333333"), 17.sp),
                SizedBox(
                  height: 20.w,
                ),
                LightText.buildColorFont(
                    "第一时间享受最新功能", stringToColor("999999"), 12.sp),
                SizedBox(
                  height: 10.w,
                ),
                Container(
                  color: stringToColor("F4F4F4"),
                  width: 250.w,
                  height: 1.w,
                ),
                SizedBox(
                  height: 6.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 30.w),
                        child: LightText.buildColorFont(
                            "稍后再说", stringToColor("666666"), 12.sp),
                      ),
                    ),
                    Container(
                      color: stringToColor("F4F4F4"),
                      width: 1.w,
                      height: 35.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        try {
                          launchUrlString(downloadLink,
                              mode: LaunchMode.externalApplication);
                        } catch (err) {
                          debugPrint(err.toString());
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 30.w),
                        child: LightText.buildColorFont(
                            "立即更新", stringToColor("168EF5"), 12.sp),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
      } else {
        SmartDialog.showToast('当前版本已为最新版');
      }
    } catch (err) {
      printInfo(info: "jett--->异常  $err");
    }
  }

  Future<void> reloadMoney() async {
    if (_userService.state.isTrial) {
      SmartDialog.showToast('当前是试玩模式');
      return;
    }

    if (refreshCount >= 2) {
      SmartDialog.showToast('操作过于频繁，我们休息下吧');
    }
    refreshCount++;
    if (isRefreshing) return;
    isRefreshing = true;
    animationController!.repeat(period: const Duration(milliseconds: 1000));
    await UserService.to.getUserMoney();
    await UserService.to.getUserToatolByCallBack(() {
      update();
    });
    Future.delayed(const Duration(milliseconds: 1000), () {
      isRefreshing = false;
      refreshCount = 0;
      animationController!.stop();
    });
  }

  void logout() {
    _userService.onBeforeLogout();
    Get.back();
    SmartDialog.showToast('退出成功');

  }

  Future<void> reloadCount() async {
    if (_userService.state.isTrial) return;
    _userService.getUserToatolByCallBack(() {
      update();
    });
  }

  @override
  void onReady() {
    printInfo(info: "========>1");

    // SmartDialog.show(widget: WalletPage());
  }

  String getNumberMoney(int index) {
    String? data = "";
    switch (index) {
      case 0:
        data = _userService.state.totalCount.items?.dayBetValid;
        break;
      case 1:
        data = _userService.state.totalCount.items?.dayBetValid;
        break;
      case 2:
        data = _userService.state.totalCount.items?.dayUserTxTotal;
        break;
      case 3:
        data = _userService.state.totalCount.items?.betValid;
        break;
      case 4:
        data = _userService.state.totalCount.items?.userFsTotal;
        break;
      case 5:
        data = _userService.state.totalCount.items?.userYhTotal;
        break;
    }
    return data ?? "";
  }

  _getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;
    print('$appName == $packageName == $version == $buildNumber');
    appVersion = version;
  }

  Future<void> actionsClick(int index) async {
    if (UserService.to.state.isTrial) {
      SmartDialog.showToast('请登录正式账号');
      return;
    }
    if (index == 0) {
      Get.toNamed(Routes.message);
    } else if (index == 1) {
      Get.toNamed(Routes.accountData);
    }
  }

  Future<void> headerListClick(int index) async {
    if (UserService.to.state.isTrial) {
      SmartDialog.showToast('请登录正式账号');
      return;
    }
    switch (index) {
      case 0:
        Get.toNamed(Routes.accountData);
        break;
      case 1:
        {
          //每日签到
          var sininConfigInfo = await sinin_logic.getSininConfigInfo();
          if (sininConfigInfo?.trueQd == 1) {
            Get.toNamed(Routes.signCenter);
          } else if (sininConfigInfo?.trueQd == 0) {
            EventBus.emit(EventType.onActivityInvalid);
          }
          return;
        }
        break;
      case 2:
        Get.toNamed(Routes.recharge);
        break;
      case 3:
        goToPage();
        break;
      case 4:
        Get.toNamed(Routes.personRecord);
        break;
    }
  }

  void goToPage() async {
    //如果已经绑卡则无需判断
    if (needEntity.qktrue == true &&
        needEntity.regPhone == true &&
        needEntity.regMobilecode == true &&
        needEntity.bankCard == true) {
      Get.toNamed(Routes.withdraw)?.then((value) {
        reloadMoney();
      });
    } else {
      // //如果未绑卡则需要再判断一次
      // await factorNeed();
      // if (needEntity.qktrue != true) {
      //   Get.toNamed(Routes.modifyPasswordPage, arguments: "fundPassword");
      //   return;
      // }
      // if (needEntity.regPhone != true && needEntity.regMobilecode != true) {
      //   SmartDialog.showToast('请绑定手机号');
      //   return;
      // }
      // if (needEntity.bankCard != true) {
      //   Get.toNamed(Routes.bankBind, arguments: true);
      //   return;
      // } else {
      //   Get.toNamed(Routes.withdraw);
      // }
      Get.toNamed(Routes.withdraw)?.then((value) {
        reloadMoney();
      });
    }
  }

  void contentListClick(int index) {
    if (UserService.to.state.isTrial) {
      SmartDialog.showToast('请登录正式账号');
      return;
    }
    printInfo(info: "------->$index");
    if (index == 0) {
      //充值记录
      Get.toNamed(Routes.depositRecord);
    } else if (index == 1) {
      //提现记录
      Get.toNamed(Routes.withdrawRecord);
    } else if (index == 2) {
      //优惠记录
      Get.toNamed(Routes.promoRecord);
    } else if (index == 3) {
      //投注记录
      Get.toNamed(Routes.betHistoryRecord);
    } else if (index == 4) {
      //卡包管理
      Get.toNamed(Routes.wallet);
    } else if (index == 5) {
      //消息记录
      Get.toNamed(Routes.message);
    } else if (index == 6) {
      //修改登录密码
      Get.toNamed(Routes.modifyPasswordPage, arguments: "loginPassword");
    } else if (index == 7) {
      //修改取款密码
      Get.toNamed(Routes.modifyPasswordPage, arguments: "fundPassword");
    } else if (index == 8) {
      //返水记录
      Get.toNamed(Routes.rebateRecord);
    } else if (index == 9) {
      //我的收藏
      Get.toNamed(Routes.myCollect);
    } else if (index == 10) {
      if (UserService.to.state.userYjInfo.isQm == '2') {
        Get.toNamed(Routes.welfareCenter);
      } else {
        //推广返利
        Get.toNamed(Routes.promotionRebateView);
      }
    } else if (index == 11) {
      Get.toNamed(Routes.welfareCenter);
    }
  }

  void footListClick(int index) async {
    switch (index) {
      case 0:
        {
          if (UserService.to.state.isTrial) {
            SmartDialog.showToast('请登录正式账号');
            return;
          }
          Get.toNamed(Routes.betBackWater);
        }
        break;
      case 1:
        {
          MainTabbarController.to.jumpToPage(1);
          Get.back();
        }
        break;
      case 2:
        {
          if (UserService.to.state.isTrial) {
            SmartDialog.showToast('请登录正式账号');
            return;
          }
          Get.put(
            FortuneWheelService(
              toFortuneWheelPage: () => Get.dialog(const FortuneWheelPage()),
              openCS: () {},
            ),
          );
          FortuneWheelService.to.onBeforeEntry();
        }
        break;
      case 3:
        // Get.toNamed(Routes.franchisee);
        Get.toNamed(Routes.article, arguments: ArticleType.aboutUs);
        break;
      case 4:
        Get.toNamed(Routes.upgrade);
        break;

      default:
        {
          Get.toNamed(Routes.agentReg);
        }
    }
  }

  void toCustomerService() async {
    final _globalState = GlobalService.to.state;
    var url = _globalState.siteItems.bases!.contactKefuApp;
    if (await canLaunch(url ?? "")) {
      await launch(url ?? "");
    } else {
      throw 'Could not launch $url';
    }
  }
}

class AccountListModel {
  var title = '';
  var content = '';
  var showContent = true;
  var keyWord = '';

  AccountListModel(this.title, this.content, this.showContent, this.keyWord);
}
