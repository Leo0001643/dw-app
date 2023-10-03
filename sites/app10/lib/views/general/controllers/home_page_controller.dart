import 'package:aone_common/common.dart';
import 'package:aone_common/controllers/activity/sinin_logic.dart'
    as sinin_logic;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:red_task/red_task.dart';

import '../../../theme/color_schema.dart';
import '../../../widget/tool/persistent_storage.dart';
import '../../games/views/simple_category_view.dart';
import 'home_state.dart';

class HomePageController extends BaseController
    with GetTickerProviderStateMixin {
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

  ScrollController scrollController = ScrollController();

  //刷新金额动画
  AnimationController? animationController;
  Animation<double>? animation;

  var page = 1.obs;

  //抽屉
  final advancedDrawerController = AdvancedDrawerController();

  final _homeHotItems = <SubChildren>[].obs;
  RxList<SubChildren> get homeHotItems => _homeHotItems;
  set homeHotItems(value) => _homeHotItems.value = value;

  void logout() {
    UserService.to.onBeforeLogout();
    advancedDrawerController.hideDrawer();
    SmartDialog.showToast('退出登录成功');
  }

  // 首页弹出公告
  MessageCenterProvider messageCenterProvider = MessageCenterProvider();

  final String _youhuiTitle = '优惠';

  @override
  Future<void> onInit() async {
    super.onInit();
    const String path = 'assets/images/home/home_content/';

    for (int i = 0; i < GlobalService.to.state.navConfig.length; i++) {
      Navconfig element = GlobalService.to.state.navConfig[i];
      //去掉热门
      if (element.isYs == 'qt') {
        state.hotAllGameItem.value = element.subChildren ?? [];
        homeHotItems.addAll(element.subChildren ?? []);
      } else {
        element.image = '$path${element.isYs}.png';
        navConfigListCopy.add(element);
        printInfo(info: "isYs： ${element.isYs}");
      }
    }

    //添加彩票
    Navconfig youhui =
        Navconfig(image: '${path}youhui.png', nameCn: _youhuiTitle);
    navConfigListCopy.add(youhui);

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
  }

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

  void gameMenuClickIndex(int index) {
    Navconfig navItem = navConfigListCopy[index];
    if (navItem.nameCn == _youhuiTitle) {
      if (UserService.to.state.isTrial) {
        SmartDialog.showToast('请登录正式账号');
      } else if (UserService.to.state.isVisitor) {
        Get.toNamed(Routes.login);
      } else {
        Get.toNamed(Routes.welfareCenter);
      }
      return;
    }

    if (navItem.isYs == 'fish') {
      Get.to(() => SimpleCategoryView(index));
      return;
    }

    SubChildren? object;
    navItem.subChildren?.forEach((item) {
      if (object == null &&
          [2, 5, 6].contains(item.type) &&
          item.ischangshang == 1) {
        object = item;
      }
    });
    if (object == null) {
      Get.to(() => SimpleCategoryView(index));
      return;
    }

    Get.toNamed(Routes.gameCategory, arguments: object);
    // if (UserService.to.state.isRegularUser) {
    //   onBeforeGameInit(
    //     onGameParams: object,
    //   );
    // } else {
    //   if (UserService.to.state.isTrial) {
    //     onBeforeGameInit(
    //       onGameParams: object,
    //     );
    //     return;
    //   }
    //   SmartDialog.showToast('请先登录');
    //   Get.toNamed(Routes.login);
    // }
  }

  void _addQiandangItem() {
    String url = staticImageResolver(
        '/static/comm/gameImage/egame/60-118v6/huodong.png');
    printInfo(info: "---->url:   $url");
    SubChildren subChildren = SubChildren();
    subChildren.nameCn = "强档活动";
    subChildren.image = url;
    navConfigListCopy[4].subChildren?.insert(0, subChildren);
  }

  Future<void> reloadMoney() async {
    if (UserService.to.state.isTrial) {
      animationController!.repeat();
      Future.delayed(const Duration(seconds: 2), () {
        animationController!.stop();
      });
    } else if (UserService.to.state.isVisitor) {
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
    ever(UserService.to.state.loginState, (callback) => {
      if(UserService.to.state.loginState.isTrue){
        getZnxList()
      }
    });
  }

  void loginClick() {
    Get.toNamed(Routes.login);
  }

  //存款，取款，站内信
  void menuClick(int index) {
    if (UserService.to.state.isTrial) {
      SmartDialog.showToast('请登录正式账号');
      return;
    }
    switch (index) {
      case 0:
        Get.toNamed(Routes.recharge);
        break;
      case 1:
        goToPage();
        break;
      case 2:
        Get.toNamed(Routes.message);
        break;
    }
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
    Get.dialog(Center(
        child: Container(
            width: 300.w,
            height: 340.w,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              top: 19.w, left: 10.w, right: 10.w),
                          width: 300.w,
                          height: 220.w,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  topLeft: Radius.circular(8)),
                              color: AppTheme.itemBgColor),
                          child: CarouselSlider.builder(
                            options: CarouselOptions(
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
                                child: Text(
                                  item.body.toString(),
                                  style: TextStyle(
                                      color: const Color(0XFF4BAFFF),
                                      fontSize: 12.sp),
                                ),
                              );
                            },
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: GlobalService.to.state.scrollNotices
                                .asMap()
                                .entries
                                .map((entry) {
                              return GestureDetector(
                                onTap: () => () {},
                                child: ValueListenableBuilder<int>(
                                  builder: (_, value, __) {
                                    return Container(
                                      width: 8.0,
                                      height: 8.0,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 4.0),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: value == entry.key
                                              ? AppTheme.primary
                                              : AppTheme.disabled),
                                    );
                                  },
                                  valueListenable: noticecurrentIndex,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 300.w,
                      height: 58.w,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8)),
                          color: AppTheme.primaryBg),
                      child: const Center(
                          child: Text(
                        "公告",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(Get.context!).pop();
                      },
                      child: const Icon(
                        Icons.highlight_off_rounded,
                        color: Color(0xffffffff),
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ],
            ))));
  }

  //取款

  WithdrawalProvider provider = WithdrawalProvider();
  void goToPage() async {
    await fetchHandler<FactorNeedEntity>(
      provider.factorNeed(),
      onSuccess: (needEntity) {
        //如果已经绑卡则无需判断
        if (needEntity.qktrue == true &&
            needEntity.regPhone == true &&
            needEntity.regMobilecode == true &&
            needEntity.bankCard == true) {
          Get.toNamed(Routes.withdraw);
        } else {
          //如果未绑卡则需要再判断一次
          if (needEntity.qktrue == true &&
              needEntity.regPhone == true &&
              needEntity.regMobilecode == true &&
              needEntity.bankCard == true) {
            Get.toNamed(Routes.withdraw);
          } else {
            // Get.toNamed(Routes.perfectDrawInfo);
            // Get.bottomSheet(
            //   BottomSheetLayout(
            //     child: CardManagerView(),
            //   ),
            //   isScrollControlled: true,
            // );
          }
        }
      },
    );
  }

  //卡片点击
  void cardClick(SubChildren object) {
    // Get.toNamed(appRoutes.Routes.homeDetail, arguments: object);
    if (UserService.to.state.isRegularUser) {
      onBeforeGameInit(
        onGameParams: object,
      );
    } else {
      if (UserService.to.state.isTrial) {
        onBeforeGameInit(
          onGameParams: object,
        );
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
}
