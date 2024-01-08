import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/badge/gf_badge.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/lc_tabbar.dart';
import 'package:leisure_games/ui/bean/promotion_type_entity.dart';

import 'preferential_logic.dart';

///优惠中心
class PreferentialPage extends StatefulWidget {
  const PreferentialPage({super.key});


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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
            child: LCTabBar(
              length: state.tabs.length,
              controller: _tabController,
              tabBarHeight: 45.h,
              tabBarColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.only(top: 38.h,left: 20.w,right: 20.w,bottom: 3.r),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(3.r),
                color: ColorX.text0917(),
              ),
              labelPadding: EdgeInsets.zero,
              labelColor: ColorX.text0917(),
              unselectedLabelColor: ColorX.text586(),
              width: 0.483.sw,
              tabs: state.tabs.map((e) => buildTabBarItem(e, 0)).toList(),
            ),
          ),
          Expanded(
            child: Container(
              child: Obx(() {
                return ListView.builder(
                  itemCount: state.list.length,
                  itemBuilder: (context,index){
                    var item = state.list[index];
                    return buildPromotionItem(item);
                  },
                );
              }),
              color: Colors.black12,
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

  Widget buildPromotionItem(PromotionTypeKey item) {
    return InkWell(
      onTap: ()=> logic.onClickType(item),
      child: Container(
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
        margin: EdgeInsets.only(left: 20.w,right: 20.w,top: 15.h),
      ),
    );
  }

}


