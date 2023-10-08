
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:getwidget/components/tabs/gf_segment_tabs.dart';
import 'package:getwidget/components/tabs/gf_tabbar.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:marquee/marquee.dart';

import 'home_logic.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StateHomePage();

}

class StateHomePage extends State<HomePage> with SingleTickerProviderStateMixin{


  buildMenuItem(String text, String icon, int i) {
    return InkWell(
      onTap: (){
        showToast("$i");
      },
      child: Column(
        children: [
          Image.asset(icon,width: 48.h,),
          SizedBox(height: 4.h,),
          Text(text,style: TextStyle(fontSize: 13.sp,color: ColorX.color_091722),),
        ],
      ),
    );
  }


  buildComInfo(String title, String t, int i, String u, int j, String v, int k) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
        SizedBox(height: 14.h,),
        InkWell(
          onTap: (){},
          child: Text(t,style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722),),
        ),
        SizedBox(height: 5.h,),
        InkWell(
          onTap: (){},
          child: Text(u,style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722),),
        ),
        SizedBox(height: 5.h,),
        InkWell(
          onTap: (){},
          child: Text(v,style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722),),
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: ScreenUtil().statusBarHeight,),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 11.w),
              child: Row(
                children: [
                  SizedBox(width: 10.w,),
                  Image.asset(ImageX.icon_logo,),
                  Expanded(child: Container()),
                  InkWell(
                    child: Padding(
                      padding: EdgeInsets.all(10.r),
                      child: Image.asset(ImageX.icon_user_msg,),
                    ),
                  ),
                  InkWell(
                    child: Padding(
                      padding: EdgeInsets.all(10.r),
                      child: Image.asset(ImageX.icon_more,),
                    ),
                  ),
                ],
              ),
            ),
            GFCarousel(
                autoPlay: true,
                aspectRatio: 335/154,
                viewportFraction: 1.0,
                hasPagination: true,
                passiveIndicator: Colors.white60,
                activeIndicator: Colors.white,
                items: state.images.map((e) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20.r)),
                      child: Image.network(e, fit: BoxFit.cover,width: 1000,),
                    ),
                  );
                }).toList()
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [ColorX.color_fff4f2,ColorX.color_fefff4],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                ),
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: Row(
                  children: [
                    SizedBox(width: 16.w,),
                    Image.asset(ImageX.icon_ntf),
                    SizedBox(width: 5.w,),
                    Expanded(
                      child: SizedBox(
                        height: 40.h,
                        child: Marquee(
                          text: "通知知通知通知通知通知",
                          style: TextStyle(fontSize: 13.sp,color: ColorX.color_091722),
                          scrollAxis: Axis.horizontal,
                          startPadding: 10.w,
                          blankSpace: 5.w,
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w,),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildMenuItem(Intr().charge,ImageX.icon_charge,0),
                  buildMenuItem(Intr().tixian,ImageX.icon_withdraw,1),
                  buildMenuItem(Intr().choujiang,ImageX.icon_draw,2),
                  buildMenuItem(Intr().zoushi,ImageX.icon_trend,3),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
              child: GFTabBar(
                length: 3,
                controller: _tabController,
                tabBarHeight: 35.h,
                tabBarColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: ColorX.color_fc243b,
                indicatorWeight: 3.r,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 17.r),
                labelColor: ColorX.color_fc243b,
                unselectedLabelColor: ColorX.color_091722,
                width: 180.w,
                tabs: [
                  Text(Intr().remen,style: TextStyle(fontSize: 15.sp),),
                  Text(Intr().zuijin,style: TextStyle(fontSize: 15.sp),),
                  Text(Intr().shoucang,style: TextStyle(fontSize: 15.sp),),
                ],
              ),
            ),
            SizedBox(height: 150.h,),
            SizedBox(
              height: 351.h,
              child: Container(
                color: ColorX.color_fc243b,
              ),
            ),
            SizedBox(
              height: 170.h,
              child: Container(
                color: Colors.white,
              ),
            ),
            Container(
              height: 275.h,
              color: ColorX.color_f7f8fb,
              padding: EdgeInsets.only(left: 20.w,top: 30.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildComInfo(Intr().gaunyuwomen,Intr().guanwangjieshao,0,Intr().xiazhaiyingyong,1,Intr().pingtaifuwu,2),
                  SizedBox(width: 37.w,),
                  buildComInfo(Intr().yonghuzhongxin,Intr().huiyuan,3,Intr().chongzhijilu,4,Intr().qiandaochoujiang,5),
                  SizedBox(width: 37.w,),
                  buildComInfo(Intr().jishuzhichi,Intr().fangjiechijiaocheng,6,Intr().shiyongbangzhu,7,"",-1),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


  final logic = Get.find<HomeLogic>();
  final state = Get.find<HomeLogic>().state;

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


}


