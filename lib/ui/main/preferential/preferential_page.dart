import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/lc_tabbar.dart';
import 'package:leisure_games/ui/bean/html_event.dart';
import 'package:leisure_games/ui/bean/promotion_type_entity.dart';
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
  // late RefreshController _refreshController;

  @override
  void initState() {
    _tabController = TabController(length: state.tabs.length, vsync: this)
    ..addListener(() {
      logic.clickTab(_tabController.index);
    });
    // _refreshController= RefreshController();
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    // _refreshController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    state.tabs = [Intr().quanbu,Intr().chongzhi,Intr().qita];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildAppBar(Intr().youhuizhongxin,
          msg: true,drawer: true,back: false,bgColor: ColorX.appBarBg()),
      backgroundColor: ColorX.pageBg(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
            color: ColorX.cardBg(),
            width: 1.sw,
            child: LCTabBar(
              length: state.tabs.length,
              controller: _tabController,
              tabBarHeight: 35.h,
              tabBarColor: Colors.transparent,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.only(top: 30.h,left: 20.w,right: 20.w,bottom: 2.h),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(3.r),
                color: ColorX.text0917(),
              ),
              labelPadding: EdgeInsets.zero,
              labelColor: ColorX.text0917(),
              unselectedLabelColor: ColorX.text586(),
              width: 0.55.sw,
              tabs: state.tabs.map((e) => Text(e,style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600),),).toList(),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.black12,
              child: Obx(() {
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

  Widget buildPromotionItem(PromotionTypeKey item) {
    return InkWell(
      onTap: ()=> logic.onClickType(item),
      child: Container(
        margin: EdgeInsets.only(left: 20.w,right: 20.w,top: 15.h),
        decoration: BoxDecoration(
          color: ColorX.cardBg(),
          borderRadius: BorderRadius.circular(10.r),
        ),
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
                Column(
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
                      child: Text(item.titleSec.em(),style: TextStyle(fontSize: 12.sp,color: ColorX.text586(),),),
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
  }

}


