import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/empty_data_widget.dart';
import 'package:leisure_games/app/widget/lc_tabbar.dart';
import 'package:leisure_games/ui/bean/spread_promos_data_entity.dart';
import 'package:leisure_games/ui/bean/spread_user_entity.dart';

import 'promotion_profit_logic.dart';

///
///推广赚钱
class PromotionProfitPage extends StatefulWidget {
  const PromotionProfitPage({Key? key}) : super(key: key);

  @override
  State<PromotionProfitPage> createState() => _PromotionProfitPageState();
}

class _PromotionProfitPageState extends State<PromotionProfitPage> with SingleTickerProviderStateMixin{
  final logic = Get.find<PromotionProfitLogic>();
  final state = Get.find<PromotionProfitLogic>().state;
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: state.tabs.length, vsync: this)
      ..addListener(() {
        logic.clickTab(_tabController.index);
      });
    super.initState();
  }


  @override
  void dispose() {
    _tabController.dispose();
    Get.delete<PromotionProfitLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildAppBar(Intr().tuiguangzhuanqian,msg: true),
      backgroundColor: ColorX.pageBg2(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 12.w,bottom: 10.h),
                child: Text(Intr().jieshaorenxinxi,style: TextStyle(fontSize: 14.sp,color: ColorX.text586()),),
              ),
              Container(
                decoration: BoxDecoration(color: ColorX.cardBg(),borderRadius: BorderRadius.circular(12.r),),
                padding: EdgeInsets.all(15.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(Intr().daima,style: TextStyle(fontSize: 13.sp,color: ColorX.text586()),),
                    SizedBox(height: 5.h,),
                    GFListTile(
                      onTap: (){},
                      title: Obx(() {
                        return Text(state.userCode.value,
                          style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),fontWeight: FontWeight.w500),);
                      }),
                      padding: EdgeInsets.symmetric(vertical: 13.h,horizontal: 10.w),
                      margin: EdgeInsets.zero,
                      radius: 10.r,
                      color: ColorX.cardBg2(),
                      shadow: BoxShadow(color: Colors.transparent),
                      icon: InkWell(
                        onTap: ()=> WidgetUtils().clickCopy(state.userCode.value),
                        child: Text(Intr().fuzhi,style: TextStyle(fontSize: 14.sp,color: ColorX.text5862()),),
                      ),
                    ),
                    SizedBox(height: 14.h,),
                    Text(Intr().lianjie,style: TextStyle(fontSize: 13.sp,color: ColorX.text586()),),
                    SizedBox(height: 5.h,),
                    GFListTile(
                      onTap: (){},
                      title: Obx(() {
                        return Text(state.userLink.value,
                          style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),fontWeight: FontWeight.w500),);
                      }),
                      padding: EdgeInsets.symmetric(vertical: 13.h,horizontal: 10.w),
                      margin: EdgeInsets.zero,
                      radius: 10.r,
                      color: ColorX.cardBg2(),
                      shadow: BoxShadow(color: Colors.transparent),
                      icon: InkWell(
                        onTap: ()=> WidgetUtils().clickCopy(state.userLink.value),
                        child: Text(Intr().fuzhi,style: TextStyle(fontSize: 14.sp,color: ColorX.text5862()),),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 12.w,bottom: 10.h,top: 20.h),
                child: Text(Intr().tuiguangerweima,style: TextStyle(fontSize: 14.sp,color: ColorX.text586()),),
              ),
              Container(
                decoration: BoxDecoration(color: ColorX.cardBg(),borderRadius: BorderRadius.circular(12.r),),
                padding: EdgeInsets.all(15.r),
                child: Row(
                  children: [
                    Obx(() {
                      if(state.qrLinkData.value.isEmpty){ return Container(); }
                      return Padding(
                        padding: EdgeInsets.all(10.r),
                        child: Image.memory(state.qrLinkData.value),
                      );
                    }),
                    SizedBox(width: 36.w,),
                    Column(
                      children: [
                        WidgetUtils().buildElevatedButton(Intr().baocuntupian, 132.w, 40.h,
                            bg: ColorX.cardBg2(),textColor:ColorX.text0917(),onPressed: ()=> logic.saveQrLink()),
                        SizedBox(height: 15.h,),
                        WidgetUtils().buildElevatedButton(Intr().fuzhilianjie, 132.w, 40.h,
                            bg: ColorX.cardBg2(),textColor:ColorX.text0917(),
                          onPressed: ()=>WidgetUtils().clickCopy(state.userLink.value),),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 10.h,top: 20.h),
                // color: ColorX.cardBg(),
                width: 1.sw,
                child: LCTabBar(
                  length: state.tabs.length,
                  controller: _tabController,
                  tabBarHeight: 35.h,
                  tabBarColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorPadding: EdgeInsets.only(top: 32.h,left: 20.w,right: 20.w,bottom: 1.h),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.r),
                    color: ColorX.text0917(),
                  ),
                  labelPadding: EdgeInsets.zero,
                  labelColor: ColorX.text0917(),
                  unselectedLabelColor: ColorX.text586(),
                  // width: 0.55.sw,
                  tabs: state.tabs.map((e) => Text(e,style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600),),).toList(),
                ),
              ),
              Container(
                decoration: BoxDecoration(color: ColorX.cardBg(),borderRadius: BorderRadius.circular(12.r),),
                padding: EdgeInsets.all(15.r),
                alignment: Alignment.center,
                child: Obx(() {
                  return buildPromotionList(state.showList);
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget buildPromotionList(List list) {
    if(isEmpty(list)){ return EmptyDataWidget(iconWidth: 170.r, iconHeight: 170.r,text: "",); }
    var childs = List<Widget>.empty(growable: true);
    childs.add(Row(
      children: [
        Expanded(
          flex: 30,
          child: Text(Intr().riqi,style: TextStyle(fontSize: 13.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
        ),
        Expanded(
          flex: 23,
          child: Text(Intr().xianxiayonghu,style: TextStyle(fontSize: 13.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
        ),
        Expanded(
          flex: 23,
          child: Text(Intr().xiaxiancunkuan,style: TextStyle(fontSize: 13.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
        ),
        Expanded(
          flex: 23,
          child: Text(Intr().zhuanquhongli,style: TextStyle(fontSize: 13.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
        ),
      ],
    ));
    childs.add(SizedBox(height: 10.h,),);

    list.forEach((element) {
      if(element is SpreadPromosDataList){
        childs.add(buildPromotionItem(element));
      }else if(element is SpreadUserEntity){
        childs.add(buildUserItem(element));
      }
    });

    return Column(children: childs,);
  }


  Widget buildPromotionItem(SpreadPromosDataList item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(height: 1.h,color: ColorX.color_10_949,),
        Container(
          height: 40.h,
          child: Row(
            children: [
              Expanded(
                flex: 30,
                child: Text(DateUtil.formatDateMs(item.addTime.em() * 1000),style: TextStyle(fontSize: 13.sp,color: ColorX.text0917(),fontWeight: FontWeight.w500),overflow: TextOverflow.ellipsis,),
              ),
              Expanded(
                flex: 23,
                child: Text(item.username.em(),
                  style: TextStyle(fontSize: 13.sp,color: ColorX.text0917(),fontWeight: FontWeight.w500,),overflow: TextOverflow.ellipsis,),
              ),
              Expanded(
                flex: 23,
                child: Text(item.saveMoney.em(),style: TextStyle(fontSize: 13.sp,color: ColorX.text0917(),fontWeight: FontWeight.w500),overflow: TextOverflow.ellipsis,),
              ),
              Expanded(
                flex: 23,
                child: Text(item.spreadPromos.em(),style: TextStyle(fontSize: 13.sp,color: ColorX.text0917(),fontWeight: FontWeight.w500),overflow: TextOverflow.ellipsis,),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildUserItem(SpreadUserEntity item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(height: 1.h,color: ColorX.color_10_949,),
        Container(
          height: 40.h,
          child: Row(
            children: [
              Expanded(
                flex: 30,
                child: Text(DateUtil.formatDateMs(item.addtime.em() * 1000),style: TextStyle(fontSize: 13.sp,color: ColorX.text0917(),fontWeight: FontWeight.w500),overflow: TextOverflow.ellipsis,),
              ),
              Expanded(
                flex: 23,
                child: Text(item.username.em(),
                  style: TextStyle(fontSize: 13.sp,color: ColorX.text0917(),fontWeight: FontWeight.w500,),overflow: TextOverflow.ellipsis,),
              ),
              Expanded(
                flex: 23,
                child: Text("",style: TextStyle(fontSize: 13.sp,color: ColorX.text0917(),fontWeight: FontWeight.w500),overflow: TextOverflow.ellipsis,),
              ),
              Expanded(
                flex: 23,
                child: Text(item.avatar.em(),style: TextStyle(fontSize: 13.sp,color: ColorX.text0917(),fontWeight: FontWeight.w500),overflow: TextOverflow.ellipsis,),
              ),
            ],
          ),
        ),
      ],
    );
  }

}