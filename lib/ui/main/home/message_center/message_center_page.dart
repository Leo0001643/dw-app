import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';

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
      appBar: WidgetUtils().buildAppBar("消息",bgColor: Colors.white),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
            child: GFTabBar(
              length: 2,
              controller: _tabController,
              tabBarHeight: 45.h,
              tabBarColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.only(top: 38.h,left: 20.w,right: 20.w,bottom: 3.r),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(3.r),
                color: ColorX.color_091722,
              ),
              labelColor: ColorX.color_091722,
              unselectedLabelColor: ColorX.color_58698d,
              width: 180.w,
              tabs: [
                buildTabBarItem("公告", 100),
                buildTabBarItem("消息", 100),
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
    );
  }

  buildTabBarItem(String tab, int num) {
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