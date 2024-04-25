import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/controller/room_tendency_controller.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/drawer_scaffold.dart';
import 'package:leisure_games/app/widget/lc_tabbar.dart';
import 'package:leisure_games/ui/main/home/game_room/room_tendency/data_analysis/data_analysis_logic.dart';
import 'package:leisure_games/ui/main/home/game_room/room_tendency/double_queue/double_queue_logic.dart';
import 'package:leisure_games/ui/main/home/game_room/room_tendency/ds_dew/ds_dew_logic.dart';
import 'package:leisure_games/ui/main/home/game_room/room_tendency/dx_dew/dx_dew_logic.dart';
import 'package:leisure_games/ui/main/home/game_room/room_tendency/lottery_result/lottery_result_logic.dart';
import 'package:leisure_games/ui/main/home/game_room/room_tendency/number_trend/number_trend_logic.dart';

import 'room_tendency_logic.dart';

///走势
class RoomTendencyPage extends StatefulWidget {
  const RoomTendencyPage({Key? key}) : super(key: key);

  @override
  State<RoomTendencyPage> createState() => _RoomTendencyPageState();
}

class _RoomTendencyPageState extends State<RoomTendencyPage>
    with SingleTickerProviderStateMixin {
  final logic = Get.find<RoomTendencyLogic>();
  final state = Get.find<RoomTendencyLogic>().state;
  late TabController _tabController;

  var currentTab = 0.obs;

  @override
  void initState() {
    _tabController = TabController(length: state.pages.length, vsync: this);
    _tabController.addListener(() {
      currentTab.value = _tabController.index;
      // state.pageIndex.value = _tabController.index;
      state.pageController.jumpToPage(_tabController.index);
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    Get.delete<DataAnalysisLogic>();
    Get.delete<DoubleQueueLogic>();
    Get.delete<DsDewLogic>();
    Get.delete<DxDewLogic>();
    Get.delete<LotteryResultLogic>();
    Get.delete<NumberTrendLogic>();
    Get.delete<RoomTendencyController>();
    Get.delete<RoomTendencyLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      scaffoldKey: state.scaffoldKey,
      appBar: WidgetUtils().buildAppBar(Intr().qushi, backIcon: ImageX.iconDownArrow(),bgColor: ColorX.appBarBg(),scaffoldKey: state.scaffoldKey),
      backgroundColor: ColorX.pageBg(),
      body: Column(
        children: [
          LCTabBar(
            length: state.pages.length,
            tabBarHeight: 84.h,
            tabAlignment: TabAlignment.fill,
            controller: _tabController,
            tabBarColor: ColorX.appBarBg(),
            isScrollable: false,
            labelPadding: EdgeInsets.zero,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              color: ColorX.cardBg3(),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r)),
            ),
            labelStyle: TextStyle(color: ColorX.text0917(), fontSize: 11.sp),
            unselectedLabelStyle:
                TextStyle(color: ColorX.text586(), fontSize: 11.sp),
            labelColor: ColorX.text0917(),
            unselectedLabelColor: ColorX.text586(),
            tabs: [
              buildTabItem(0,Intr().kaijiangjieguo, ImageX.icon_result),
              buildTabItem(1,Intr().shujufenxi, ImageX.icon_data),
              buildTabItem(2,Intr().shuangmianchanglong, ImageX.icon_order),
              buildTabItem(3,Intr().danshuangluzhu, ImageX.icon_sd),
              buildTabItem(4,Intr().daxiaoluzhu, ImageX.icon_size),
              buildTabItem(5,Intr().haomazhoushi, ImageX.icon_zs),
            ],
          ),
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: state.pageController,
              children: state.pages,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTabItem(int index,String tab, String icon) {
    return Tab(
      icon: Obx(() {
        return Container(
          decoration: BoxDecoration(
            color: currentTab.value == index ? Colors.white:ColorX.cardBg5(),
            borderRadius: BorderRadius.circular(10.r),
          ),
          padding: EdgeInsets.all(8.r),
          child: Image.asset(icon),
        );
      }),
      iconMargin: EdgeInsets.only(bottom: 3.h),
      text: tab,
    );
  }
}
