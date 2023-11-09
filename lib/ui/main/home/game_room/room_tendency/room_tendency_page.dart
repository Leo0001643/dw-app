import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/lc_tabbar.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'room_tendency_logic.dart';

///走势
class RoomTendencyPage extends StatefulWidget {
  const RoomTendencyPage({Key? key}) : super(key: key);

  @override
  State<RoomTendencyPage> createState() => _RoomTendencyPageState();
}

class _RoomTendencyPageState extends State<RoomTendencyPage> with SingleTickerProviderStateMixin{
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
    Get.delete<RoomTendencyLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildAppBar("趋势",bgColor: ColorX.appBarBg3()),
      backgroundColor: ColorX.pageBg(),
      body: Column(
        children: [
          LCTabBar(
            length: state.pages.length,
            tabBarHeight: 84.h,
            controller: _tabController,
            tabBarColor: ColorX.cardBg3(),
            isScrollable: false,
            labelPadding: EdgeInsets.zero,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              color: ColorX.appBarBg(),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),topRight: Radius.circular(10.r)),
            ),
            labelStyle: TextStyle(color: ColorX.text0917(),fontSize: 11.sp),
            unselectedLabelStyle: TextStyle(color: ColorX.text586(),fontSize: 11.sp),
            labelColor: ColorX.text0917(),
            unselectedLabelColor: ColorX.text586(),
            tabs: [
              buildTabItem(Intr().kaijiangjieguo,ImageX.icon_result),
              buildTabItem(Intr().shujufenxi,ImageX.icon_data),
              buildTabItem(Intr().shuangmianchanglong,ImageX.icon_order),
              buildTabItem(Intr().danshuangluzhu,ImageX.icon_sd),
              buildTabItem(Intr().daxiaoluzhu,ImageX.icon_size),
              buildTabItem(Intr().haomazhoushi,ImageX.icon_zs),
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
    return Tab(
      icon: Container(
        decoration: BoxDecoration(color: ColorX.cardBg5(),borderRadius: BorderRadius.circular(10.r)),
        padding: EdgeInsets.all(8.r),
        child: Image.asset(icon),
      ),
      iconMargin: EdgeInsets.only(bottom: 3.h),
      text: tab,
    );
  }







}