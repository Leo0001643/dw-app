import 'dart:io';
import 'package:aone_common/common.dart';
import 'package:app10/views/activities/views/activity_view.dart';
import 'package:app10/views/general/controllers/home_page_controller.dart';
import 'package:app10/views/user/user_center/views/user_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:fortune_wheel/fortune_wheel.dart';
import 'package:generics/generics.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../app_service.dart';
import '../../theme/color_schema.dart';
import '../../views/activities/views/fortune_wheel_page.dart';
import '../../views/user/all_recharge_help/all_recharge_help_view.dart';
import '../views/home_page_view.dart';

class MainTabbarController extends BaseController {
  static MainTabbarController get to => Get.find();
  final RxBool _hasPermission = true.obs;

  bool get hasPermission => _hasPermission.value;

  set hasPermission(bool value) => _hasPermission.value = value;

  late final PageController pageController = PageController(keepPage: true);

  final RxInt _selectIndex = 0.obs;

  get selectIndex => _selectIndex.value;

  set selectIndex(value) => _selectIndex.value = value;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  AuthenticateProvider provider = AuthenticateProvider();

  bool isHideAgent = false;

  Future<void> initAgentState() async {
    await fetchHandler<RegisterConfigEntity>(
      provider.registerConfig(),
      onSuccess: (res) {
        isHideAgent = res.info?.regAgent == '2';
        update();
      },
    );
  }

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
    initRecharge();
    initWithdraw();
    initAgentState();
    int? pageIndex = Get.arguments;
    //pageController可能为null
    if (pageIndex != null && pageController != null) {
      pageController.jumpToPage(pageIndex);
    }
  }

  //配置RechargeView
  void initRecharge() {
    RechargeTheme()
      ..appbarDecoration = BoxDecoration(color: AppTheme.primaryBg)
      ..isShowRechargeDiscount = false
      ..normalButtonDecoration = BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.r)),
        color: AppTheme.rechargeCardColor,
      )
      ..normalButtonTextColor = AppTheme.mainTextColor
      ..amountMoneyChipsSelectedBgColor = AppTheme.rechargeCardColor
      ..amountMoneyChipsSelectedTextColor = AppTheme.mainTextColor
      // ..isShowChannelSimple = true
      ..channelSelectedColor = AppTheme.rechargeCardColor
      ..isPromotionCanSelect = true
      ..isRechargeListStyle = true
      ..noDataImage = 'assets/images/common/no_data_img.png'
      ..startPageBg = const Color(0xFF111111)
      ..startPageTitleColor = Colors.white
      ..startPageSubTitleColor = Colors.grey
      ..startPageItemColor = const Color(0xFF111111)
      ..startPageBorderColor = const Color(0xFF222222)
      ..startPageArrowColor = const Color(0xFF808080)
      ..noDataStyle = const TextStyle(color: Colors.white)
      ..onUSDTHelpTap = () {
        AppService.to.openUrl('https://77556js.com/wap.html');
      }
      ..helpItemBackgroundColor = const Color(0xFF171717)
      ..helpItemTextColor = Colors.white
      ..jiiaochengPageBg = const Color(0xFF111111)
      ..isHideChannelTips = true
      ..onCustomerServiceTap = () {
        toCustomerService();
      };
  }

  //配置取款绑卡
  void initWithdraw() {
    WithdrawTheme()
      // ..appbarDecoration = BoxDecoration(color: AppTheme.primaryBg)
      // ..normalButtonDecoration = BoxDecoration(
      //   borderRadius: BorderRadius.all(Radius.circular(5.r)),
      //   color: AppTheme.rechargeCardColor,
      // )
      // ..balanceColor = const Color(0xFF7DBAFE)
      // ..washTxtColor = const Color(0xFFC1923E)
      // ..normalButtonTextColor = AppTheme.mainTextColor
      // ..dialogTopTextColor = const Color(0xFF504d4d)
      // ..dialogTopDecoration = const BoxDecoration(
      //     color: Color(0xFFF5F7FA),
      //     borderRadius: BorderRadius.only(
      //         topLeft: Radius.circular(5), topRight: Radius.circular(5)))
      ..onCustomerServiceTap = () {
        toCustomerService();
      }
      ..remarks = '备注:\n可以添加多张卡片，请按需添加；\n点击已添加的卡片，可对卡片信息进行修改；\n左滑已邦定的卡片可以进行删除。'
      ..bankCardTextColor = Colors.white
      ..bankCardBgImage = 'assets/images/user/card_manager_bankcardground.png';
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
    if (index == 2) {
      if (UserService.to.state.isVisitor) {
        Get.toNamed(Routes.login);
        return;
      } else if (UserService.to.state.isRegularUser) {
        // 重新刷新充值
        EventBus.emit(EventType.onRechargeReload);
      }
    }

    if (index == 3) {
      if (Platform.isIOS) {
        AppService.to.toCustomerService();
      } else {
        toCustomerService();
      }
      return;
    }
    if (index == 4 && UserService.to.state.isVisitor) {
      Get.toNamed(Routes.login);
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

  void contentListClick(int index) async {
    switch (index) {

      ///回到首页
      case 0:
        Get.back();
        jumpToPage(0);
        break;

      ///会员中心
      case 1:
        if (UserService.to.state.isVisitor) {
          Get.toNamed(Routes.login);
          return;
        }
        MainTabbarController.to.jumpToPage(4);
        break;

      ///USDT充值教程
      case 2:
        AppService.to.openUrl('https://77556js.com/wap.html');
        break;

      ///大转盘
      case 3:
        if (UserService.to.state.isVisitor) {
          Get.toNamed(Routes.login);
          return;
        }
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
        break;

      ///优惠办理大厅
      case 4:
        if (UserService.to.state.isVisitor) {
          Get.toNamed(Routes.login);
          return;
        }
        if (UserService.to.state.isTrial) {
          SmartDialog.showToast('请登录正式账号');
          return;
        }
        Get.toNamed(Routes.welfareCenter);
        break;

      ///代理介绍
      case 5:
        final SiteConfigProvider provider = SiteConfigProvider();
        await fetchHandler<ArticleEntity>(
          provider.article('507'),
          onSuccess: (res) {
            var title = "代理介绍";
            var body = "";
            if (res.info?.isNotEmpty ?? true) {
              title = res.info?.first.title ?? "代理介绍";
              body = res.info?.first.body ?? "代理介绍";
            }
            Get.to(() => AllRechargeDetailView(title: title, content: body));
          },
        );
        break;

      ///代理加盟
      case 6:
        Get.toNamed(Routes.agentReg);
        break;

      ///代理登陆
      case 7:
        final _globalState = GlobalService.to.state;
        var url = _globalState.siteItems.agentDomian;
        AppService.to.openUrl('$url');
        break;
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
