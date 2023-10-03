import 'dart:io';

import 'package:aone_common/common.dart';
import 'package:aone_common/services/global/global_state.dart';
import 'package:app04/app_service.dart';
import 'package:app04/config/site_config.dart';
import 'package:app04/views/activities/views/activity_view.dart';
import 'package:app04/views/user/start_recharge/recharge_view.dart';
import 'package:app04/views/user/user_center/views/user_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:fortune_wheel/fortune_wheel.dart';
import 'package:generics/generics.dart' hide RechargeView;
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:red_task/red_task.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../theme/color_schema.dart';
import '../../views/activities/views/fortune_wheel_page.dart';
import '../views/home_page_view.dart';

class MainTabbarController extends GetxController {
  static MainTabbarController get to => Get.find();
  final RxBool _hasPermission = true.obs;

  bool get hasPermission => _hasPermission.value;

  set hasPermission(bool value) => _hasPermission.value = value;

  late final PageController pageController = PageController(keepPage: true);

  final RxInt _selectIndex = 0.obs;

  get selectIndex => _selectIndex.value;

  set selectIndex(value) => _selectIndex.value = value;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final double totHeight = Platform.isIOS ? 47.r : 53.r;
  List<Widget> bodyList = const [
    HomePageView(),
    ActivityView(),
    RechargeView(),
    SizedBox(),
    UserView(),
  ];

  @override
  void onInit() {
    super.onInit();
    initWithdraw();
    print("加载我的页面");
    int? pageIndex = Get.arguments;
    if (pageIndex != null) {
      pageController.jumpToPage(pageIndex);
    }
  }

  void initWithdraw() {

    if (AppRuntimeConfig.siteTag == 'h09')
    {
      WithdrawTheme()
      ..appbarDecoration = BoxDecoration(gradient: AppTheme.primaryGradient)
      ..primary = AppTheme.primary
      ..normalButtonDecoration = BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.r)),
        color: AppTheme.primary,
      )
      ..balanceColor = const Color(0xFF7DBAFE)
      ..washTxtColor = AppTheme.primary
      ..refreshButtonDecoration = BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
        color: AppTheme.primary,
      )
      ..cardBgGradient = AppTheme.primaryGradient
      ..normalButtonTextColor = const Color(0xFFffffff)
      ..cancelButtonDecoration = BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: const Color(0xFF504d4d)),
          borderRadius: BorderRadius.all(Radius.circular(5.r)))
      ..cancelButtonTextColor = const Color(0xFF504d4d)
      ..lightButtonTextColor = const Color(0xFF504d4d)
      ..lightButtonDecoration = BoxDecoration(
          color: const Color(0xFFF5F7FA),
          borderRadius: BorderRadius.all(Radius.circular(5.r)))
      ..dialogTopTextColor = const Color(0xFF504d4d)
      ..dialogTopDecoration = const BoxDecoration(
          color: Color(0xFFF5F7FA),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5), topRight: Radius.circular(5)))
      ..addButtonDecoration = BoxDecoration(
          image: const DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/blank.png', package: 'generics'),
          ),
          color: Colors.white,
          // border: Border.all(color: Color(0xFFB1B1B1)),
          borderRadius: BorderRadius.all(Radius.circular(5.r)))
      ..addButtonTextColor = const Color(0xFFa7adbb)
      ..addAccountButtonTextColor = AppTheme.primary
      ..addAccountButtonDecoration = BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(width: 1, color: AppTheme.primary),
      )
      ..inputLabelColor = const Color(0xFF282828)
      ..inputBorderColor = const Color(0xFFa7adbb)
      ..inputTextColor = const Color(0xFF282828)
      ..inputHintTextColor = const Color(0xFFa7adbb)
      ..accountInfoCardDecoration = BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.r)),
        color: const Color(0xFFffffff),
      )
      ..accountInfoTextColor = const Color(0xFF504d4d)
      ..withdrawTipTextColor = const Color(0xFF504d4d)
      ..withdrawKfTextColor = const Color(0xffff0000)
      ..onCustomerServiceTap = () {
        toCustomerService();
      }
      ..bankCardTextColor = Colors.white
      ..bankCardBgImage =
          'assets/images/user/$siteTagAssets${'_card_manager_bankcardground.png'}'
      ..hideBottomTips =  AppRuntimeConfig.siteTag == 'h09' ? true : false;
    }
    else if (AppRuntimeConfig.siteTag == 'h18') {

      WithdrawTheme()
      // ..appbarDecoration = BoxDecoration(gradient: AppTheme.primaryGradient)
      ..primary = AppTheme.primary
      // ..normalButtonDecoration = BoxDecoration(
      //   borderRadius: BorderRadius.all(Radius.circular(5.r)),
      //   color: AppTheme.primary,
      // )
      // ..balanceColor = const Color(0xFF7DBAFE)
      // ..washTxtColor = AppTheme.primary
      ..refreshButtonDecoration = BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
        color: AppTheme.primary,
      )
      ..cardBgGradient = AppTheme.primaryGradient
      // ..normalButtonTextColor = const Color(0xFFffffff)
      // ..cancelButtonDecoration = BoxDecoration(
      //     color: Colors.white,
      //     border: Border.all(width: 1, color: const Color(0xFF504d4d)),
      //     borderRadius: BorderRadius.all(Radius.circular(5.r)))
      // ..cancelButtonTextColor = const Color(0xFF504d4d)
      // ..lightButtonTextColor = const Color(0xFF504d4d)
      // ..lightButtonDecoration = BoxDecoration(
      //     color: const Color(0xFFF5F7FA),
      //     borderRadius: BorderRadius.all(Radius.circular(5.r)))
      // ..dialogTopTextColor = const Color(0xFF504d4d)
      // ..dialogTopDecoration = const BoxDecoration(
      //     color: Color(0xFFF5F7FA),
      //     borderRadius: BorderRadius.only(
      //         topLeft: Radius.circular(5), topRight: Radius.circular(5)))
      // ..addButtonDecoration = BoxDecoration(
      //     image: const DecorationImage(
      //       fit: BoxFit.fill,
      //       image: AssetImage('assets/images/blank.png', package: 'generics'),
      //     ),
      //     color: Colors.white,
      //     // border: Border.all(color: Color(0xFFB1B1B1)),
      //     borderRadius: BorderRadius.all(Radius.circular(5.r)))
      // ..addButtonTextColor = const Color(0xFFa7adbb)
      // ..addAccountButtonTextColor = AppTheme.primary
      // ..addAccountButtonDecoration = BoxDecoration(
      //   color: const Color(0xFFFFFFFF),
      //   borderRadius: BorderRadius.circular(5),
      //   border: Border.all(width: 1, color: AppTheme.primary),
      // )
      // ..inputLabelColor = const Color(0xFF282828)
      // ..inputBorderColor = const Color(0xFFa7adbb)
      // ..inputTextColor = const Color(0xFF282828)
      // ..inputHintTextColor = const Color(0xFFa7adbb)
      // ..accountInfoCardDecoration = BoxDecoration(
      //   borderRadius: BorderRadius.all(Radius.circular(5.r)),
      //   color: const Color(0xFFffffff),
      // )
      // ..accountInfoTextColor = const Color(0xFF504d4d)
      // ..withdrawTipTextColor = const Color(0xFF504d4d)
      // ..withdrawKfTextColor = const Color(0xffff0000)
      ..onCustomerServiceTap = () {
        toCustomerService();
      }
      // ..bankCardTextColor = Colors.white
      ..bankCardBgImage =
          'assets/images/user/$siteTagAssets${'_card_manager_bankcardground.png'}'
      ..hideBottomTips =  false;
    }
    
  }




  Future<bool> requestStoragePermission() async {
    //获取当前的权限
    var status = await Permission.storage.status;
    if (status == PermissionStatus.granted) {
      //已经授权
      return true;
    } else {
      //未授权则发起一次申请
      status = await Permission.storage.request();
      if (status == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  }

  Future<bool> requestPermission() async {
    bool hasBluetoothPermission = await requestStoragePermission();
    if (hasBluetoothPermission) {
      print("内存使用权限申请通过");
      hasPermission = true;
    } else {
      print("内存使用权限申请不通过");
      hasPermission = false;
    }
    return hasBluetoothPermission;
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

  void jumpToPage(int index) {
    // if (index == 3 && UserService.to.state.isVisitor) {
    //   Get.toNamed(Routes.login);
    //   return;
    // }
    if (index == 4 && UserService.to.state.isVisitor) {
      Get.toNamed(Routes.login);
      return;
    }
    if (index == 2 && UserService.to.state.isVisitor) {
      Get.toNamed(Routes.login);
      return;
    }
    if (index == 3) {
      if (Platform.isIOS) {
        AppService.to.toCustomerService();
      } else {
        toCustomerService();
      }
      return;
    }
    selectIndex = index;
    pageController.jumpToPage(index);
  }

  @override
  void onClose() {
    super.onClose();
  }

  void logout() {
    UserService.to.onBeforeLogout();
    SmartDialog.showToast('退出成功');
  }

  void walletClick() {
    Get.toNamed(Routes.recharge);
  }

  Future<void> contentListClick(int index) async {
    if (index == 0) {
      Get.back();
      jumpToPage(4);
    } else if (index == 1) {
      //代理注册
      Get.toNamed(Routes.agentReg);
    } else if (index == 2) {
      final String? url = GlobalService.to.state.siteItems.agentDomian;
      if (url != null) {
        AppService.to.openUrl(url!);
      }
    } else if (index == 3) {
      //大转盘
      if (!UserService.to.state.isRegularUser) {
        SmartDialog.showToast('请登录正式账号');
        return;
      }
      Get.put(
        FortuneWheelService(
          // 回调为自行实现的widget
          toFortuneWheelPage: () => Get.dialog(const FortuneWheelPage()),
          openCS: () {},
        ),
      );
      FortuneWheelService.to.onBeforeEntry();
    } else if (index == 4) {
      //抢红包
      if (!UserService.to.state.isRegularUser) {
        SmartDialog.showToast('请登录正式账号');
        return;
      }
      RedTaskService.to.numberPage = 1;
      RedTaskService.to.onEntryRedTask();
      // Get.toNamed(Routes.grabRed);
    } else if (index == 5) {
      Get.toNamed(Routes.welfareCenter);
    } else if (index == 6) {
      // Get.toNamed(Routes.helpCenter);
      toCustomerService();
    } else if (index == 7) {
      Get.toNamed(Routes.upgrade);
    }
  }
}

class KeepAliveWrapper extends StatefulWidget {
  final Widget child;

  const KeepAliveWrapper({Key? key, required this.child}) : super(key: key);

  @override
  _KeepAliveWrapperState createState() => _KeepAliveWrapperState();
}

class _KeepAliveWrapperState extends State<KeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
