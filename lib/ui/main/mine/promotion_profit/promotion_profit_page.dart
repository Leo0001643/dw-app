import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/drawer_scaffold.dart';
import 'package:leisure_games/app/widget/lc_segment_tabs.dart';
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
    return DrawerScaffold(
      scaffoldKey: state.scaffoldKey,
      appBar: WidgetUtils().buildAppBar(Intr().tuiguangzhuanqian,msg: true,drawer:true,scaffoldKey: state.scaffoldKey),
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
                      return Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(10.r),
                        child: Image.memory(state.qrLinkData.value,width: 150.w,fit: BoxFit.fill,),
                      );
                    }),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: ()=> logic.saveQrLink(),
                            child: Container(
                              width: 132.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                color: ColorX.cardBg(),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              alignment: Alignment.center,
                              child: Text(Intr().baocuntupian,style: TextStyle(fontSize: 14.sp,color: ColorX.textBlack()),),
                            ),
                          ),
                          SizedBox(height: 15.h,),
                          InkWell(
                            onTap: ()=>WidgetUtils().clickCopy(state.userLink.value),
                            child: Container(
                              width: 132.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                color: ColorX.cardBg(),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              alignment: Alignment.center,
                              child: Text(Intr().fuzhilianjie,style: TextStyle(fontSize: 14.sp,color: ColorX.textBlack()),),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // color: ColorX.cardBg(),
                margin: EdgeInsets.only(top: 10.h),
                width: 1.sw,
                child: LCSegmentTabs(
                  length: state.tabs.length,
                  tabController: _tabController,
                  height: 45.h,
                  border: Border.all(color: Colors.transparent),
                  tabBarColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorPadding: EdgeInsets.only(top: 38.h,left: 60.w,right: 60.w,bottom: 3.h),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.r),
                    color: ColorX.text5862(),
                  ),
                  labelPadding: EdgeInsets.zero,
                  labelColor: ColorX.text5862(),
                  unselectedLabelColor: ColorX.text5d6(),
                  // width: 0.55.sw,
                  tabs: state.tabs.map((e) => Container(
                    height: 45,
                    alignment: Alignment.center,
                    child: Text(e,style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600),),
                  ),).toList(),
                ),
              ),
              Container(
                decoration: BoxDecoration(color: ColorX.cardBg(),borderRadius: BorderRadius.circular(12.r),),
                padding: EdgeInsets.all(15.r),
                height: 0.3.sh,
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
    if(isEmpty(list)){
      return Container(
        alignment: Alignment.center,
        child: WidgetUtils().buildImage(ImageX.icon_empty, 170.r, 170.r),
      );
    }
    if(list.first is SpreadUserEntity){///会员列表
      return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,childAspectRatio: 4),
          itemCount: list.em(),
          itemBuilder: (content,index){
            var item = list[index] as SpreadUserEntity;
            return Container(
              alignment: Alignment.center,
              child: Text(item.username.em(),style: TextStyle(fontSize: 13.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600)),
            );
          });
    } else {///推广红利部分
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
        }
      });
      return Column(children: childs,);
    }
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

  // Widget buildUserItem(SpreadUserEntity item) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Divider(height: 1.h,color: ColorX.color_10_949,),
  //       Container(
  //         height: 40.h,
  //         child: Row(
  //           children: [
  //             Expanded(
  //               flex: 30,
  //               child: Text(DateUtil.formatDateMs(item.addtime.em() * 1000),style: TextStyle(fontSize: 13.sp,color: ColorX.text0917(),fontWeight: FontWeight.w500),overflow: TextOverflow.ellipsis,),
  //             ),
  //             Expanded(
  //               flex: 23,
  //               child: Text(item.username.em(),
  //                 style: TextStyle(fontSize: 13.sp,color: ColorX.text0917(),fontWeight: FontWeight.w500,),overflow: TextOverflow.ellipsis,),
  //             ),
  //             Expanded(
  //               flex: 23,
  //               child: Text("",style: TextStyle(fontSize: 13.sp,color: ColorX.text0917(),fontWeight: FontWeight.w500),overflow: TextOverflow.ellipsis,),
  //             ),
  //             Expanded(
  //               flex: 23,
  //               child: Text(item.avatar.em(),style: TextStyle(fontSize: 13.sp,color: ColorX.text0917(),fontWeight: FontWeight.w500),overflow: TextOverflow.ellipsis,),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }

}