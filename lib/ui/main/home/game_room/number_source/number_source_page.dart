import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/drawer_scaffold.dart';
import 'package:leisure_games/app/widget/lc_tabbar.dart';

import 'number_source_logic.dart';

//号源
class NumberSourcePage extends StatefulWidget {
  const NumberSourcePage({Key? key}) : super(key: key);

  @override
  State<NumberSourcePage> createState() => _NumberSourcePageState();
}

class _NumberSourcePageState extends State<NumberSourcePage> with SingleTickerProviderStateMixin {
  final logic = Get.find<NumberSourceLogic>();
  final state = Get.find<NumberSourceLogic>().state;

  @override
  void initState() {
    state.tabController = TabController(length: state.tabs.length, vsync: this);
    state.tabController.addListener(() {
      state.pageController.jumpToPage(state.tabController.index);
    });
    super.initState();
  }

  @override
  void dispose() {
    state.tabController.dispose();
    Get.delete<NumberSourceLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      scaffoldKey: state.scaffoldKey,
      appBar: WidgetUtils().buildAppBar(Intr().guanfanghaoyuan,backIcon: ImageX.iconDownArrow(),bgColor: ColorX.appBarBg(),scaffoldKey: state.scaffoldKey),
      backgroundColor: ColorX.pageBg(),
      body: Column(
        children: [
          Center(
            child: LCTabBar(
              length: state.tabs.length,
              controller: state.tabController,
              tabBarHeight: 35.h,
              tabBarColor: ColorX.appBarBg(),
              tabAlignment: TabAlignment.fill,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.only(top: 32.h,left: 20.w,right: 20.w,),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(3.r),
                color: ColorX.text0917(),
              ),
              labelColor: ColorX.text0917(),
              unselectedLabelColor: ColorX.text586(),
              width: 300.w,
              tabs: state.tabs.map((e) => Text(e,style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600),)).toList(),
            ),
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

}