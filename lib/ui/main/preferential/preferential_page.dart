import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/bean/html_event.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'preferential_logic.dart';

///优惠中心
class PreferentialPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => StatePreferentialPage();

}


class StatePreferentialPage extends State<PreferentialPage> with SingleTickerProviderStateMixin{

  final logic = Get.find<PreferentialLogic>();
  final state = Get.find<PreferentialLogic>().state;
  late TabController _tabController;
  late RefreshController _refreshController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _refreshController= RefreshController();
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildAppBar("优惠中心",msg: true,drawer: true,back: false,bgColor: Colors.white),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
            child: GFTabBar(
              length: 3,
              controller: _tabController,
              tabBarHeight: 35.h,
              tabBarColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.only(top: 28.h,left: 10.w,right: 10.w,bottom: 3.r),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(3.r),
                color: ColorX.color_091722,
              ),
              labelColor: ColorX.color_091722,
              unselectedLabelColor: ColorX.color_58698d,
              width: 180.w,
              tabs: [
                Text("全部",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600),),
                Text("充值",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600),),
                Text("其他",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600),),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.black12,
              child: SmartRefresher(
                controller: _refreshController,
                enablePullDown: true,
                enablePullUp: true,
                onRefresh: ()=> _refreshController.refreshCompleted(),
                onLoading: ()=> _refreshController.loadComplete(),
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context,index){
                    return InkWell(
                      onTap: (){
                        Get.toNamed(Routes.html,arguments: HtmlEvent(isHtmlData: true,data: Constants.test_html,pageTitle: "详情"));
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 20.w,right: 20.w,top: 15.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(topRight: Radius.circular(10.r),topLeft: Radius.circular(10.r),),
                              child: Image.network(Constants.test_image,fit: BoxFit.cover,
                                height: 163.h,width: 335.w,),
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10.h,),
                                    Padding(
                                      padding: EdgeInsets.only(left: 15.w),
                                      child: Text("真人视讯首存大派送",style: TextStyle(fontSize: 16.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
                                    ),
                                    SizedBox(height: 5.h,),
                                    Padding(
                                      padding: EdgeInsets.only(left: 15.w),
                                      child: Text("长期活动",style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d,),),
                                    ),
                                    SizedBox(height: 10.h,),
                                  ],
                                ),
                                Expanded(child: Container()),
                                Image.asset(ImageX.icon_right_black),
                                SizedBox(width: 15.w,),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}


