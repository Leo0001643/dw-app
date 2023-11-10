
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/bean/notice_entity.dart';
import 'package:leisure_games/ui/main/home/game_menu_view.dart';
import 'package:marquee/marquee.dart';
import 'home_logic.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StateHomePage();

}

class StateHomePage extends State<HomePage> with SingleTickerProviderStateMixin{

  final logic = Get.find<HomeLogic>();
  final state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetMaterialController>(
      builder: (ct){
        return Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                color: ColorX.pageBg(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: ScreenUtil().statusBarHeight,),
                    WidgetUtils().buildHomeAppBar(msg: true,drawer: true),
                    Obx(() {
                      if(isEmpty(state.bannerList)){ return Container(); }
                      return GFCarousel(
                          autoPlay: true,
                          aspectRatio: 335/154,
                          viewportFraction: 1.0,
                          hasPagination: true,
                          passiveIndicator: Colors.white60,
                          activeIndicator: Colors.white,
                          items: state.bannerList.map((e) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 20.w),
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(20.r)),
                                child: Image.network("${e.url}${e.picurl}", fit: BoxFit.cover,width: 1000,),
                              ),
                            );
                          }).toList()
                      );
                    }),
                    SizedBox(height: 20.h,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Container(
                        decoration: BoxDecoration(
                          // gradient: const LinearGradient(
                          //   colors: [ColorX.color_fff4f2,ColorX.color_fefff4],
                          //   begin: Alignment.topLeft,
                          //   end: Alignment.bottomRight,
                          // ),
                          color: ColorX.cardBg(),
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
                                child: Obx(() {
                                  if(isEmpty(state.noticeList)){ return Container(); }
                                  return Marquee(
                                    text: buildNoticeString(state.noticeList.value),
                                    style: TextStyle(fontSize: 13.sp,color: ColorX.text0917()),
                                    scrollAxis: Axis.horizontal,
                                    startPadding: 10.w,
                                    blankSpace: 5.w,
                                  );
                                }),
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
                          buildMenuItem(Intr().charge,ImageX.iconChargeT(),0),
                          buildMenuItem(Intr().tixian,ImageX.iconWithdrawT(),1),
                          buildMenuItem(Intr().choujiang,ImageX.iconDrawT(),2),
                          buildMenuItem(Intr().zoushi,ImageX.iconTrendT(),3),
                        ],
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
                    //   child: GFTabBar(
                    //     length: 3,
                    //     controller: _tabController,
                    //     tabBarHeight: 35.h,
                    //     tabBarColor: Colors.white,
                    //     indicatorSize: TabBarIndicatorSize.label,
                    //     indicatorPadding: EdgeInsets.only(top: 30.h,left: 13.w,right: 13.w),
                    //     indicator: const BoxDecoration(
                    //       shape: BoxShape.circle,
                    //       color: ColorX.color_fc243b,
                    //     ),
                    //     labelColor: ColorX.color_fc243b,
                    //     unselectedLabelColor: ColorX.color_091722,
                    //     width: 180.w,
                    //     tabs: [
                    //       Text(Intr().remen,style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600),),
                    //       Text(Intr().zuijin,style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600),),
                    //       Text(Intr().shoucang,style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600),),
                    //     ],
                    //   ),
                    // ),
                    // Container(
                    //   alignment: Alignment.center,
                    //   // child: EmptyDataWidget(iconWidth:88.r,iconHeight: 88.r,),
                    //   child: GFCarousel(
                    //     height: 100.h,
                    //     viewportFraction: 0.23,
                    //     autoPlay: true,
                    //     autoPlayInterval: Duration(milliseconds: 3000),
                    //     autoPlayAnimationDuration: Duration(milliseconds: 4000),
                    //     items: [
                    //       buildHotItem(HomeGameMenuEntity(name:"热门",group: "")),
                    //       buildHotItem(HomeGameMenuEntity(name:"热门",group: "")),
                    //       buildHotItem(HomeGameMenuEntity(name:"热门",group: "")),
                    //       buildHotItem(HomeGameMenuEntity(name:"热门",group: "")),
                    //       buildHotItem(HomeGameMenuEntity(name:"热门",group: "")),
                    //       buildHotItem(HomeGameMenuEntity(name:"热门",group: "")),
                    //     ],
                    //   ),
                    // ),
                    SizedBox(height: 10.h,),
                    SizedBox(
                      height: 351.h,
                      child: GameMenuView(logic),
                    ),
                    Container(
                      color: ColorX.pageBg(),
                      margin: EdgeInsets.only(top: 10.h,bottom: 10.h),
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildActivityItem(4,ImageX.yhhdT(),Intr().qiandaoyouli),
                          buildActivityItem(5,ImageX.qdyjT(),Intr().jifenyaojiang),
                          buildActivityItem(6,ImageX.tjylT(),Intr().tuijianyouli),
                        ],
                      ),
                    ),
                    Container(
                      height: 225.h,
                      color: ColorX.cardBg(),
                      padding: EdgeInsets.only(left: 20.w,top: 30.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildComInfo(Intr().gaunyuwomen,Intr().guanwangjieshao,0,Intr().xiazhaiyingyong,1,Intr().pingtaifuwu,2),
                          buildComInfo(Intr().yonghuzhongxin,Intr().huiyuan,3,Intr().chongzhijilu,4,Intr().qiandaochoujiang,5),
                          buildComInfo(Intr().jishuzhichi,Intr().fangjiechijiaocheng,6,Intr().shiyongbangzhu,7,"",-1),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Obx(() {
            //   return Visibility(
            //     visible: state.hongbaoVisible.value,
            //     child: DraggableWidget(logic,state.act.value,),
            //   );
            // }),
          ],
        );
      },
    );
  }


  buildMenuItem(String text, String icon, int i) {
    return InkWell(
      onTap: ()=> logic.clickMenu(context,i),
      child: Column(
        children: [
          Image.asset(icon,width: 48.h,),
          SizedBox(height: 4.h,),
          Text(text,style: TextStyle(fontSize: 13.sp,color: ColorX.text0917()),),
        ],
      ),
    );
  }


  buildComInfo(String title, String t, int i, String u, int j, String v, int k) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
          SizedBox(height: 14.h,),
          InkWell(
            onTap: ()=> logic.clickInfo(context, i),
            child: Text(t,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
          ),
          SizedBox(height: 5.h,),
          InkWell(
            onTap: ()=> logic.clickInfo(context, j),
            child: Text(u,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
          ),
          SizedBox(height: 5.h,),
          InkWell(
            onTap: ()=> logic.clickInfo(context, k),
            child: Text(v,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
          ),
        ],
      ),
    );
  }

  Widget buildActivityItem(int i, String bg, String tab) {
    return InkWell(
      onTap: ()=> logic.clickMenu(context, i),
      child: Container(
        width: 105.w,height: 95.h,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage(bg), fit: BoxFit.fill,),),
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 10.h),
        child: Text(tab,style: TextStyle(fontSize: 16.sp,color: Colors.white),),
      ),
    );
  }

  String buildNoticeString(List<NoticeEntity> value) {
    var builder = StringBuffer();
    value.forEach((element) {
      builder.write("【${element.noteTitle.em()}】：");
      builder.write(element.noteContent.em());
    });
    return builder.toString();
  }

  // buildHotItem(HomeGameMenuEntity element) {
  //   return Container(
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         ClipRRect(
  //           borderRadius: BorderRadius.all(Radius.circular(10.r)),
  //           child: Image.network(state.test_image,width: 72.r,height: 72.r,fit: BoxFit.cover,),
  //         ),
  //         SizedBox(height: 5.h,),
  //         Text(
  //           element.name.em(),
  //           style: TextStyle(
  //             fontSize: 12.sp,
  //             color: Colors.black54,
  //             overflow: TextOverflow.ellipsis,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }


}


