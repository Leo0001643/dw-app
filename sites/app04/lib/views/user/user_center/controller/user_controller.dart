import 'dart:io';

import 'package:aone_common/common.dart';
import 'package:app04/app_service.dart';
import 'package:app04/widget/misc/dj_image.dart';
import 'package:app04/widget/tool/light_text.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../widget/misc/dj_image.dart';
import '../../../../widget/tool/light_text.dart';

class UserController extends BaseController with GetTickerProviderStateMixin {
  final _userService = UserService.to;

  static UserController get to => Get.find();

  final showBalance = false.obs;

  final app = AppService.to;
  set showBalance(val) => showBalance.value = val;
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
  // Tuple2('安全信息', [
  // AccountListModel('修改登录密码'.tr, '修改'.tr, true, 'loginPassword'),
  // AccountListModel('修改取款密码'.tr, '未设置'.tr, true, 'fundPassword'),
  // ])

  void pushAccountDataClick() {
    Get.toNamed(Routes.accountData);
  }

  @override
  void onClose() {
    if (animationController != null) {
      ///要注意!!销毁animationController
      animationController!.dispose();
    }
    super.onClose();
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
    await factorNeed();
    juegeTrial();
    // reloadMoney();
    reloadCount();
    _getVersion();
  }

  late final Rx<FactorNeedEntity> _needEntity = Rx(FactorNeedEntity());
  FactorNeedEntity get needEntity => _needEntity.value;
  set needEntity(FactorNeedEntity value) => _needEntity.value = value;
  WithdrawalProvider provider = WithdrawalProvider();

  Future<void> factorNeed() async {
    if (_userService.state.isTrial) return;
    await fetchHandler<FactorNeedEntity>(
      provider.factorNeed(),
      onSuccess: (res) {
        needEntity = res;
      },
    );
  }

  void juegeTrial() {
    if (UserService.to.state.authLevel == AuthLevel.trial) {
      showBalance = true;
    } else {
      showBalance = false;
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
    if (_userService.state.isTrial) return;
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

      ///正常情况controller不会被销毁，一旦账号被挤下来，弹出所有控制器，这里会泄漏。
      if (animationController != null && !isClosed) {
        animationController!.stop();
      }
    });
  }

  void logout() {
    _userService.onBeforeLogout();
    Get.back();
  }

  Future<void> reloadCount() async {
    if (_userService.state.isTrial) return;
    _userService.getUserToatolByCallBack(() {
      update();
    });
  }

  @override
  void onReady() {
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

  void headerListClick(int index) {
    if (UserService.to.state.isTrial) {
      SmartDialog.showToast('请登录正式账号');
      return;
    }
    switch (index) {
      case 0:
        {
          print('存款');

          Get.toNamed(Routes.recharge);
        }
        break;
      case 1:
        {
          debugPrint('取款');
          debugPrint("state.needEntity.qktrue" + needEntity.qktrue.toString());
          goToPage();
        }
        break;
      case 2:
        {
          print('账单');
          Get.toNamed(Routes.personRecord);
        }
        break;
      default:
        {
          print('VIP');
        }
    }
  }

  void goToPage() async {
    //如果已经绑卡则无需判断
    if (needEntity.qktrue == true &&
        needEntity.regPhone == true &&
        needEntity.regMobilecode == true &&
        needEntity.bankCard == true) {
      Get.toNamed(Routes.withdraw);
    } else {
      //如果未绑卡则需要再判断一次
      await factorNeed();
      if (needEntity.qktrue == true &&
          needEntity.regPhone == true &&
          needEntity.regMobilecode == true &&
          needEntity.bankCard == true) {
        Get.toNamed(Routes.withdraw);
      } else {
        Get.toNamed(Routes.perfectDrawInfo);
      }
    }
  }

  void contentNumberClick(int index) {}
  void contentListClick(int index) {
    if (UserService.to.state.isTrial) {
      SmartDialog.showToast('请登录正式账号');
      return;
    }
    printInfo(info: "------->$index");
    if (index == 0) {
      Get.toNamed(Routes.modifyPasswordPage, arguments: "fundPassword");
    } else if (index == 1) {
      print('修改基本信息');
      Get.toNamed(Routes.modifyInformationPage);
    } else if (index == 2) {
      print('卡包管理');
      Get.toNamed(Routes.wallet);
      // Get.toNamed(Routes.promoRecord);

    } else if (index == 3) {
      print('修改登录密码');
      Get.toNamed(Routes.modifyPasswordPage, arguments: "loginPassword");
    } else if (index == 4) {
      //投注记录
      Get.toNamed(Routes.betHistoryRecord);
    } else if (index == 5) {
      //充值记录
      Get.toNamed(Routes.depositRecord);
    } else if (index == 6) {
      //提现记录
      Get.toNamed(Routes.withdrawRecord);
    } else if (index == 7) {
      //优惠记录
      Get.toNamed(Routes.promoRecord);
    } else if (index == 8) {
      print('我的收藏');
      //我的收藏
      Get.toNamed(Routes.rebateRecord);
    } else if (index == 9) {
      print('推广返利');
      Get.toNamed(Routes.promotionRebateView);
    } else if (index == 10) {
      print('我的收藏');
      //我的手长
      Get.toNamed(Routes.collectionsViewPage);
      // print('推广返利');
      // Get.toNamed(Routes.popularize);
    } else if (index == 11) {
      print('合作共赢，加载H5的');
      Get.toNamed(Routes.betBackWater);
    } else if (index == 12) {
      print('合作共赢，加载H5的');
      Get.toNamed(Routes.welfareCenter);
    } else if (index == 13) {
      print('合作共赢，加载H5的');
      Get.toNamed(Routes.personRecord);
    }
  }

  void contentListClick2(int index) {
    if (UserService.to.state.isTrial) {
      SmartDialog.showToast('请登录正式账号');
      return;
    }
    if (index == 0) {
      //充值
      Get.toNamed(Routes.depositRecord);
    } else if (index == 1) {
      //提现
      Get.toNamed(Routes.withdrawRecord);
    } else if (index == 2) {
      //优惠记录
      Get.toNamed(Routes.promoRecord);
    } else if (index == 3) {
      //下单
      Get.toNamed(Routes.betHistoryRecord);
      print('投注记录');
    } else if (index == 4) {
      //卡包
      Get.toNamed(Routes.wallet);
      print('卡包管理');
    } else if (index == 5) {
      //消息记录
      Get.toNamed(Routes.message);
    } else if (index == 6) {
      //返水记录
      Get.toNamed(Routes.rebateRecord);
    } else if (index == 7) {
      //收藏
      Get.toNamed(Routes.myCollect);
    } else if (index == 8) {
      Get.toNamed(Routes.popularize);
    } else if (index == 9) {
      Get.toNamed(Routes.franchisee);
      print('合作共赢，加载H5的');
    } else if (index == 10) {
      print('推广返利');
      Get.toNamed(Routes.personRecord);
    } else if (index == 11) {
      print('合作共赢，加载H5的');
    } else if (index == 12) {
      print('合作共赢，加载H5的');
      Get.toNamed(Routes.personRecord);
    }
  }

  void footListClick(int index) {
    switch (index) {
      case 0:
        {
          if (UserService.to.state.isTrial) {
            SmartDialog.showToast('请登录正式账号');
            return;
          }
          Get.toNamed(Routes.welfareCenter);
          print('优惠中心');
        }
        break;
      case 1:
        {
          Get.toNamed(Routes.helpCenter);
          print('帮助中心');
        }
        break;
      case 2:
        {
          Get.toNamed(Routes.agentReg);
          print('帮助中心');
        }
        break;
      case 3:
        {
          Get.toNamed(Routes.article);
          print('代理注册');
        }
        break;
      default:
        {
          Get.toNamed(Routes.agentReg);
        }
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
