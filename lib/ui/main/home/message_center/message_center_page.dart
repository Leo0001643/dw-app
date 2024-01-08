import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/lc_tabbar.dart';

import 'message_center_logic.dart';

class MessageCenterPage extends StatefulWidget {
  const MessageCenterPage({Key? key}) : super(key: key);

  @override
  State<MessageCenterPage> createState() => _MessageCenterPageState();
}

class _MessageCenterPageState extends State<MessageCenterPage> with SingleTickerProviderStateMixin {
  final logic = Get.find<MessageCenterLogic>();
  final state = Get.find<MessageCenterLogic>().state;
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      state.pageController.jumpToPage(_tabController.index);
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    state.pageController.dispose();
    Get.delete<MessageCenterLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildAppBar(Intr().xiaoxi,bgColor: ColorX.appBarBg()),
      backgroundColor: ColorX.pageBg(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
            child: LCTabBar(
              length: state.tabs.length,
              controller: _tabController,
              tabBarHeight: 45.h,
              tabBarColor: Colors.transparent,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.only(top: 38.h,left: 20.w,right: 20.w,bottom: 3.r),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(3.r),
                color: ColorX.text0917(),
              ),
              labelPadding: EdgeInsets.zero,
              labelColor: ColorX.text0917(),
              unselectedLabelColor: ColorX.text586(),
              width: 0.33.sw,
              tabs: state.tabs.map((e) => buildTabBarItem(e, 0)).toList(),
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

  Widget buildTabBarItem(String tab, int num) {
    var read = num > 99 ? "99+" : "$num";
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Text(tab,style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600),),
        ),
        Visibility(
          visible: num > 0,
          child: Positioned(
            top: 0,right: 0,
            child: GFBadge(
              text: read,textStyle: TextStyle(color: Colors.white,fontSize: 8.sp),
              size: 20.r,
              borderShape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(6.r),
                  topLeft: Radius.circular(6.r),bottomRight: Radius.circular(6.r))),
            ),
          ),
        ),
      ],
    );
  }


}