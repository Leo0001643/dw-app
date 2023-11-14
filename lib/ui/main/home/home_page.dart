
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/draggable_widget.dart';
import 'package:leisure_games/ui/bean/notice_entity.dart';
import 'package:leisure_games/ui/main/home/game_menu_view.dart';
import 'package:leisure_games/ui/main/home/more_tab_view.dart';
import 'package:marquee/marquee.dart';
import 'package:popover/popover.dart';
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
                          aspectRatio: 345/110,
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
                    SizedBox(height: 9.h,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [ColorX.color_fff4f2,ColorX.color_fefff4],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          color: ColorX.cardBg(),
                          borderRadius: BorderRadius.all(Radius.circular(10.r)),
                        ),
                        height: 32.h,
                        // padding: EdgeInsets.symmetric(vertical: 12.h),
                        child: Row(
                          children: [
                            SizedBox(width: 10.w,),
                            Image.asset(ImageX.icon_ntf),
                            SizedBox(width: 5.w,),
                            Expanded(
                              child: Obx(() {
                                if(isEmpty(state.noticeList)){ return Container(); }
                                return Marquee(
                                  text: buildNoticeString(state.noticeList),
                                  style: TextStyle(fontSize: 13.sp,color: ColorX.text0917()),
                                  scrollAxis: Axis.horizontal,
                                  startPadding: 10.w,
                                  blankSpace: 5.w,
                                );
                              }),
                            ),
                            SizedBox(width: 10.w,),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 8.h),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: AppData.isLogin() ? userHeader():noLoginHeader(),
                          ),
                          SizedBox(width: 20.w,),
                          buildMenuItem(Intr().charge,ImageX.icChongzhiT(),0),
                          buildMenuItem(Intr().tixian,ImageX.icTixianT(),1),
                          MoreTabView(logic),
                          // buildMenuItem(Intr().zoushi,ImageX.iconTrendT(),3),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    SizedBox(
                      height: 400.h,
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
            Obx(() {
              return Visibility(
                visible: state.hongbaoVisible.value && state.hongbaoManual.value,
                child: DraggableWidget(logic,state.act.value,),
              );
            }),
          ],
        );
      },
    );
  }


  buildMenuItem(String text, String icon, int i) {
    return InkWell(
      onTap: ()=> logic.clickMenu(context,i),
      child: SizedBox(
        width: 40.w,
        child: Column(
          children: [
            Image.asset(icon,width: 20.r,fit: BoxFit.fill,),
            SizedBox(height: 4.h,),
            Text(text,style: TextStyle(fontSize: 12.sp,color: ColorX.text0917()),),
          ],
        ),
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

  ///登录后
  Widget userHeader() {
    return Column(
      children: [
        Row(
          children: [
            Text("Hala",style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
            SizedBox(width: 5.w,),
            Image.asset(ImageX.icon_vip),
            Expanded(child: Container(),),
            InkWell(
              onTap: (){},
              child: Image.asset(ImageX.icShuaxinT(),width: 17.r,fit: BoxFit.fill,),
            ),
            SizedBox(width: 3.w,),
            Container(height: 10.h,width: 1.w,color: ColorX.color_091722,),
            SizedBox(width: 5.w,),
            InkWell(
              onTap: (){},
              child: Image.asset(ImageX.icQiehuanT(),width: 10.r,fit: BoxFit.fill,),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Image.asset(ImageX.icon_rmb_grey,color: ColorX.icon586(),),
                  SizedBox(width: 3.w,),
                  Text("¥6666.6",style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),overflow: TextOverflow.ellipsis,),maxLines: 1,),
                ],
              ),
            ),
            Row(
              children: [
                Image.asset(ImageX.icon_ustd2_grey,),
                SizedBox(width: 3.w,),
                Text("₮6666.66",style: TextStyle(fontSize: 14.sp,color: ColorX.color_58698d,),maxLines: 1,)
              ],
            ),
          ],
        ),
      ],
    );
  }

  ///未登录
  Widget noLoginHeader() {
    return Row(
      children: [
        WidgetUtils().buildElevatedButton(Intr().login, 88.w, 32.h,textSize: 13.sp,textColor: ColorX.color_091722,
            bg: Colors.white,onPressed: ()=>Get.toNamed(Routes.login)),
        SizedBox(width: 10.w,),
        WidgetUtils().buildElevatedButton(Intr().register, 88.w, 32.h,textSize: 13.sp,
            bg: ColorX.color_fe2427,onPressed: ()=>Get.toNamed(Routes.register)),
      ],
    );
  }



}


