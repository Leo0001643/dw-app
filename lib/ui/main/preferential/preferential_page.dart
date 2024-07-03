
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/empty_data_widget.dart';
import 'package:leisure_games/app/widget/lc_tabbar.dart';
import 'package:leisure_games/ui/bean/base_api_oss_entity.dart';
import 'package:leisure_games/ui/bean/language_event.dart';
import 'package:leisure_games/ui/bean/promotion_type_entity.dart';
import 'package:leisure_games/ui/main/main_logic.dart';
import 'package:lifecycle/lifecycle.dart';

import 'preferential_logic.dart';

///优惠中心
class PreferentialPage extends StatefulWidget {
  const PreferentialPage({super.key});

  @override
  State<StatefulWidget> createState() => StatePreferentialPage();

}


class StatePreferentialPage extends State<PreferentialPage> with TickerProviderStateMixin,LifecycleAware, LifecycleMixin {

  final logic = Get.find<PreferentialLogic>();
  final state = Get.find<PreferentialLogic>().state;
  // late RefreshController _refreshController;
  StreamSubscription? languageStream;
  StreamSubscription? apiSub;

  @override
  void initState() {
    // _refreshController= RefreshController();
    state.tabs.listen((p0) {
      if(unEmpty(p0) && mounted){
        state.tabController = TabController(length: p0.length, vsync: this)
          ..addListener(() {
            logic.clickTab(state.tabController!.index);
          });
      }
    });
    super.initState();
  }

  @override
  void onLifecycleEvent(LifecycleEvent event) {
    loggerArray(["生命周期变化了",event]);
    if(event == LifecycleEvent.active){
      logic.loadData();
    }
  }

  @override
  void dispose() {

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildAppBar(Intr().youhuizhongxin,
          msg: true,drawer: true,back: false,scaffoldKey: Get.find<MainLogic>().state.scaffoldKey,bgColor: ColorX.appBarBg()),
      backgroundColor: ColorX.pageBg(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() {
            if(isEmpty(state.tabs)) return Container();
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 0,vertical: 10.h),
              child: LCTabBar(
                length: state.tabs.length,
                controller: state.tabController,
                isScrollable: true,
                tabBarHeight: 45.h,
                tabBarColor: ColorX.textWhite(),
                tabAlignment: TabAlignment.start,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorPadding: EdgeInsets.only(top: 20.r,bottom: 0),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.r),
                  color: ColorX.textBlack(),
                ),
                labelPadding: EdgeInsets.symmetric(horizontal: 10.r),
                labelColor: ColorX.textBlack(),
                unselectedLabelColor: ColorX.text586(),
                tabs: state.tabs.map((e) => buildTabBarItem(e)).toList(),
              ),
            );
          }),
          Expanded(
            child: Container(
              color: Colors.black12,
              child: Obx(() {
                if(isEmpty(state.list)){
                  return EmptyDataWidget(width: 1.sw, height: 50.h);
                }
                return ListView.builder(
                  itemCount: state.list.length,
                  itemBuilder: (context,index){
                    var item = state.list[index];
                    return buildPromotionItem(item);
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }



  Widget buildTabBarItem(String tab) {
    return Text(tab,style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600),);
  }

  Widget buildPromotionItem(PromotionTypeKey item) {
    return InkWell(
      onTap: ()=> logic.onClickType(item),
      child: Container(
        decoration: BoxDecoration(
          color: ColorX.cardBg(),
          borderRadius: BorderRadius.circular(10.r),
        ),
        margin: EdgeInsets.only(left: 20.w,right: 20.w,top: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(topRight: Radius.circular(10.r),topLeft: Radius.circular(10.r),),
              child: Image.network("${state.promotions.url.em()}${item.picurl.em()}",fit: BoxFit.fill,
                height: 163.h,width: 335.w,),
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h,),
                      Padding(
                        padding: EdgeInsets.only(left: 15.w),
                        child: Text(item.title.em(),style: TextStyle(fontSize: 16.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
                      ),
                      SizedBox(height: 5.h,),
                      Padding(
                        padding: EdgeInsets.only(left: 15.w),
                        child: Text(logic.formatPreTime(item),style: TextStyle(fontSize: 12.sp,color: ColorX.text586(),),),
                      ),
                      SizedBox(height: 10.h,),
                    ],
                  ),
                ),
                Image.asset(ImageX.icon_right_black),
                SizedBox(width: 15.w,),
              ],
            ),
          ],
        ),
      ),
    );
  }

}


