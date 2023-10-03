import 'dart:collection';

import 'package:aone_common/common.dart';
import 'package:aone_common/core/fetch/exception/unsupported_game_exception.dart';
import 'package:app04/config/site_config.dart';
import 'package:app04/views/general/widget/notice_dialog.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:red_task/red_task.dart';
import 'package:aone_common/controllers/activity/sinin_logic.dart'
as sinin_logic;
import '../../../theme/color_schema.dart';
import 'home_state.dart';
import 'package:dio/dio.dart' as dio;

class HomePageController extends BaseController
    with GetTickerProviderStateMixin {
  //TODO: Implement HomePageController
  static HomePageController get to => Get.find();

  HomeState state = HomeState();

  final RxList<Slides> _bannerList = GlobalService.to.state.slideList;
  late final RxList<MessageItems>? znxMessageItems = RxList.empty();

  get bannerList => _bannerList.value;

  //点击下标
  final RxInt _selectIndex = 0.obs;

  get selectIndex => _selectIndex.value;

  set selectIndex(value) => _selectIndex.value = value;

  //是否打开标签
  final RxBool _showDialogOpen = false.obs;

  get showDialogOpen => _showDialogOpen.value;

  set showDialogOpen(value) => _showDialogOpen.value = value;

  final RxList<ScrollNoticeItem> scrollerList =
      GlobalService.to.state.scrollNotices;

  List<Navconfig> navConfigList = GlobalService.to.state.navConfig;
  List<Navconfig> navConfigListCopy = [];

  // get navConfigList => _navConfigList.value;
  ScrollController scrollController = ScrollController();

  //刷新金额动画
  AnimationController? animationController;
  Animation<double>? animation;

  //抽屉
  final advancedDrawerController = AdvancedDrawerController();

  void logout() {
    UserService.to.onBeforeLogout();
    advancedDrawerController.hideDrawer();
    SmartDialog.showToast('退出登录成功');
  }

  // 首页弹出公告
  MessageCenterProvider messageCenterProvider = MessageCenterProvider();

  Future<void> getPopNotice() async {
    await fetchHandler<NoticeEntity>(
      messageCenterProvider.getPopNotice(),
    ).then((value) {
      state.noticeItems.addAll(value!.items!);
    });
  }

  Future<void> getZnxList() async {
    if (!UserService.to.state.isRegularUser) return;
    await fetchHandler<Map<String, dynamic>>(
      messageCenterProvider.getZnxListWithPop(),
    ).then((value) {
      print("value is $value");
      if (value!["is_pop"] == true) {
        Get.dialog(Center(
          child: Container(
              width: ScreenUtil().screenWidth,
              height: 280.w,
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.message);
                    },
                    child: Container(
                      width: ScreenUtil().screenWidth,
                      height: 240.w,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/home/notificationPopup.png"),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      child: const Text(""),
                    ),
                  ),
                  Positioned(
                      top: 44,
                      right: 0,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(Get.context!).pop();
                        },
                        child: const Icon(
                          Icons.highlight_off_rounded,
                          color: Color(0xffffffff),
                          size: 40,
                        ),
                      )),
                ],
              )),
        ));
      }
    });
  }

  final Map<String, String> _icons = {
    "qt": "assets/images/home/home_hot_icon.png",
    "sports": "assets/images/home/home_sports_icon.png",
    "egame": "assets/images/home/home_egame_icon.png",
    "fish": "assets/images/home/home_fish_icon.png",
    "chess": "assets/images/home/home_chess_icon.png",
    "live": "assets/images/home/home_live_icon.png",
    "lottery": "assets/images/home/home_lottery_icon.png",
    "esports": "assets/images/home/home_esports_icon.png"
  };

  @override
  Future<void> onInit() async {
    super.onInit();
    GlobalService.to.state.navConfig.forEach((element) {
      navConfigListCopy.add(element);
    });

    // for (int i = 0; i < GlobalService.to.state.navConfig.length; i++) {
    //   Navconfig navconfig = GlobalService.to.state.navConfig[i];
    //   printInfo(info: "jett----->数据 ${navconfig.toJson()}");
    // }
    _addQiandangItem();
    // SubChildren subChildren = SubChildren();
    // subChildren.nameCn = "强档活动";
    // navConfigListCopy[3].subChildren?.insert(0, subChildren);
    state.tabController =
        TabController(length: navConfigListCopy.length, vsync: this);
    for (var element in navConfigListCopy) {
      element.image = _icons[element.isYs];
    }
    state.tabController?.addListener(() {
      selectIndex = state.tabController?.index ?? 0;
    });
    showDialogOpen = false;
    animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    animation = CurvedAnimation(
        parent: animationController!, curve: Curves.bounceInOut);
    //响应页面的加载动画
    ever(pageStateObs, (state) {
      if (state == PageState.loading) {
        SmartDialog.showLoading();
      } else {
        SmartDialog.dismiss(status: SmartStatus.loading);
      }
    });
    // _addQiandangItem();
    // getPopNotice();
  }

  void _addQiandangItem() {
    String url = staticImageResolver(
        '/static/comm/gameImage/egame/60-118v6/huodong.png');
    printInfo(info: "---->url:   $url");
    SubChildren subChildren = SubChildren();
    subChildren.nameCn = "本站推荐";
    subChildren.image = url;
    int index = navConfigList.indexWhere((element) => element.isYs == "egame");
    navConfigListCopy[index].subChildren?.insert(0, subChildren);
  }

  Future<void> reloadMoney() async {
    if (!UserService.to.state.isRegularUser) {
      EventBus.emit(EventType.onAuthRequire);
    } else {
      animationController!.repeat();
      await UserService.to.getUserMoney();
      animationController!.stop();
    }
  }

  @override
  void onReady() {
    super.onReady();
    getZnxList();
    PopupService.to.triggerPopup(routeName: Routes.home, isSupportStyle5: true);
    ever(
        UserService.to.state.loginState,
            (callback) => {
          if (UserService.to.state.loginState.isTrue) {getZnxList()}
        });
  }

  void loginClick() {
    Get.toNamed(Routes.login);
  }

  void savemoneyClick() {
    if (UserService.to.state.isRegularUser) {
      Get.toNamed(Routes.recharge);
    } else {
      Get.toNamed(Routes.login);
    }
  }

  void redpacketClick() async {
    if (UserService.to.state.isRegularUser) {
      print('点击了红包');
      RedTaskService.to.onEntryRedTask();
    } else {
      Get.toNamed(Routes.login);
    }
  }

  void signClick() async {
    if (UserService.to.state.isRegularUser) {
      var sininConfigInfo = await sinin_logic.getSininConfigInfo();
      if (sininConfigInfo?.trueQd == 1) {
        Get.toNamed(Routes.signCenter);
      } else if (sininConfigInfo?.trueQd == 0) {
        EventBus.emit(EventType.onActivityInvalid);
      }
    } else {
      Get.toNamed(Routes.login);
    }
  }

  void discountClick() {
    if (UserService.to.state.isRegularUser) {
      Get.toNamed(Routes.welfareCenter);
    } else {
      Get.toNamed(Routes.login);
    }
  }

  void downloadccClick() {
    print('下载cc');
  }

  void registerClick() {
    Get.toNamed(Routes.login, arguments: 1);
  }

  ValueNotifier<int> noticecurrentIndex = ValueNotifier<int>(0);

  void noticeClick() {
    if (GlobalService.to.state.scrollNotices.isEmpty) {
      SmartDialog.showToast('暂无公告');
      return;
    }
    final double contentHeight = 270.r;
    final double contentWidth = 300.r;
    final double headerHeight = contentWidth * 0.2;

    Get.dialog(Center(
        child: SizedBox(
            width: contentWidth,
            height: headerHeight + contentHeight + 55.r,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: contentWidth,
                      height: headerHeight,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            //600*121
                              "assets/images/home/${AppTheme.siteTag}_notice-popup-header.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: isSiteTagH09
                          ? null
                          : Text(
                        '公告',
                        style: TextStyle(
                            fontSize: 26.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      height: contentHeight,
                      color: Colors.white,
                      child: Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.r, horizontal: 10.r),
                            width: contentWidth,
                            height: contentHeight - 30.r,
                            color: Colors.white,
                            child: CarouselSlider.builder(
                              options: CarouselOptions(
                                  height: contentHeight - 30.r,
                                  autoPlay: false,
                                  viewportFraction: 1,
                                  onPageChanged: (value, reason) {
                                    noticecurrentIndex.value = value;
                                  }),
                              itemCount:
                              GlobalService.to.state.scrollNotices.length,
                              itemBuilder: (BuildContext context, int index,
                                  int realIndex) {
                                final item =
                                GlobalService.to.state.scrollNotices[index];
                                return SingleChildScrollView(
                                  padding: EdgeInsets.zero,
                                  child: Container(
                                    child: Text(
                                      item.body.toString(),
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12.sp),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              height: 30.r,
                              color: Colors.white,
                              width: contentWidth,
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: GlobalService.to.state.scrollNotices
                                    .asMap()
                                    .entries
                                    .map((entry) {
                                  return GestureDetector(
                                    onTap: () => () {},
                                    child: ValueListenableBuilder<int>(
                                      builder: (_, value, __) {
                                        return Container(
                                          width: 8.r,
                                          height: 8.r,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 4.0, vertical: 5.r),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: value == entry.key
                                                  ? AppTheme.primary
                                                  : const Color(0x44000000)),
                                        );
                                      },
                                      valueListenable: noticecurrentIndex,
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.r,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(Get.context!).pop();
                      },
                      child: Icon(
                        Icons.highlight_off_rounded,
                        color: Color(0xffffffff),
                        size: 40.r,
                      ),
                    ),
                  ],
                ),
              ],
            ))));
  }

  //卡片点击
  void cardClick(SubChildren object) {
    if (UserService.to.state.isRegularUser) {
      onBeforeGameInit(
        onGameParams: object,
      );
    } else {
      if (UserService.to.state.isTrial) {
        getGameInitInfo(object);
        return;
      }
      SmartDialog.showToast('请先登录');
      Get.toNamed(Routes.login);
    }
  }

  @override
  void onClose() {
    if (animationController != null) animationController!.dispose();
  }

  GameProvider provider = GameProvider();
  Future<void> getGameInitInfo(SubChildren object) async {
    var dto = GameInitDto(
      gameTagPatch: object.gameTag! + '|' + object.subTag!,
      gameVal: "",
      test: 1,
    );
    print('GameInit提交的数据 == ${dto}');
    await fetchHandler<dio.Response>(provider.gameInit(dto),
        onSuccess: (res) {
          onBeforeGameInit(
            onGameParams: object,
          );
          return true;
          // Get.offAndToNamed(Routes.gameWebView, arguments: res);
        }, onError: (err) {
          SmartDialog.showToast("${err.message}");
        });
  }
}
