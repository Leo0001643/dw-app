import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';

import 'recharge_category_logic.dart';

///
///充值页面 适配各种类型的充值
///author: Soushin
///2023/10/13 18:18
///
class RechargeCategoryPage extends StatefulWidget {
  const RechargeCategoryPage({Key? key}) : super(key: key);

  @override
  State<RechargeCategoryPage> createState() => _RechargeCategoryPageState();
}

class _RechargeCategoryPageState extends State<RechargeCategoryPage>  with SingleTickerProviderStateMixin{
  final logic = Get.find<RechargeCategoryLogic>();
  final state = Get.find<RechargeCategoryLogic>().state;
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    Get.delete<RechargeCategoryLogic>();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildAppBar("充值",msg: true),
      backgroundColor: ColorX.color_f7f8fb,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
            child: GFTabBar(
              length: 3,
              controller: _tabController,
              tabBarHeight: 35.h,
              tabBarColor: ColorX.color_f7f8fb,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.only(top: 31.h,left: 30.w,right: 30.w,bottom: 1.h),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(3.r),
                color: ColorX.color_091722,
              ),
              labelColor: ColorX.color_091722,
              unselectedLabelColor: ColorX.color_58698d,
              width: 355.w,
              tabs: [
                Text("线上(自动到账)",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600),),
                Text("线下(人工存款)",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600),),
              ],
            ),
          ),

        ],
      ),
    );
  }




}