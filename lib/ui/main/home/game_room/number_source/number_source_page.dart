import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';

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
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      state.pageController.jumpToPage(_tabController.index);
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    Get.delete<NumberSourceLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildAppBar("官方号源",bgColor: Colors.white),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Center(
              child: GFTabBar(
                length: 3,
                controller: _tabController,
                tabBarHeight: 35.h,
                tabBarColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorPadding: EdgeInsets.only(top: 32.h,left: 10.w,right: 10.w,),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.r),
                  color: ColorX.color_091722,
                ),
                labelColor: ColorX.color_091722,
                unselectedLabelColor: ColorX.color_58698d,
                width: 300.w,
                tabs: [
                  Text("奖号展示",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600),),
                  Text("奖号说明",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600),),
                  Text("工具校验",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600),),
                ],
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
      ),
    );
  }

}