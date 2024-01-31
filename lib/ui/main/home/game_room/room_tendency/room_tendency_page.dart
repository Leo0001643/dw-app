import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/controller/room_tendency_controller.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
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

  @override
  void initState() {
    _tabController = TabController(length: state.pages.length, vsync: this);
    _tabController.addListener(() {
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
    return Scaffold(
      appBar: WidgetUtils().buildAppBar("趋势", bgColor: Colors.white),
      backgroundColor: ColorX.pageBg(),
      body: Column(
        children: [
          LCTabBar(
            length: state.pages.length,
            tabBarHeight: 100.w,
            controller: _tabController,
            tabBarColor: Colors.white,
            isScrollable: false,
            labelPadding: EdgeInsets.zero,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              color: ColorX.color_F7F8FB,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),topRight: Radius.circular(10.r)),
            ),
            labelStyle: TextStyle(color: ColorX.text0917(), fontSize: 11.sp),
            unselectedLabelStyle:
                TextStyle( color: ColorX.appBarBg(),  fontSize: 11.sp),
            labelColor: ColorX.text0917(),
            unselectedLabelColor: ColorX.text586(),
            tabs: [
              buildTabItem(Intr().kaijiangjieguo, ImageX.icon_result),
              buildTabItem(Intr().shujufenxi, ImageX.icon_data),
              buildTabItem(Intr().shuangmianchanglong, ImageX.icon_order),
              buildTabItem(Intr().danshuangluzhu, ImageX.icon_sd),
              buildTabItem(Intr().daxiaoluzhu, ImageX.icon_size),
              buildTabItem(Intr().haomazhoushi, ImageX.icon_zs),
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

  Widget buildTabItem(String tab, String icon) {
    return Container(
        width: 62.w,
        height: 84.w,
        child: Tab(
          iconMargin: EdgeInsets.only(bottom: 14.w),
          height: 84.w,
          icon: Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
                color: ColorX.cardBg5(),
                borderRadius: BorderRadius.circular(10.r)),
            child: Image.asset(icon),
          ),
          text: tab,
        ));
  }
}
