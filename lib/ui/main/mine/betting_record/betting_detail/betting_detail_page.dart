import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/bean/bet_detail_item_entity.dart';
import 'package:leisure_games/ui/bean/bet_detail_item_entity.dart' as B;
import 'package:leisure_games/ui/bean/bet_record_group_entity.dart'  as L;

import 'package:leisure_games/ui/main/ends_drawer_view.dart';

import '../../../../bean/bet_record_group_entity.dart';
import 'betting_detail_logic.dart';

//投注详情
class BettingDetailPage extends StatefulWidget {
  const BettingDetailPage({Key? key}) : super(key: key);

  @override
  State<BettingDetailPage> createState() => _BettingDetailPageState();
}

class _BettingDetailPageState extends State<BettingDetailPage> {
  final logic = Get.find<BettingDetailLogic>();
  final state = Get.find<BettingDetailLogic>().state;

  @override
  void initState() {
    state.betRecordGroupRecord.value=BetRecordGroupRecord.fromJson(jsonDecode(Get.arguments["data"]??""));
    state.title.value= state.betRecordGroupRecord.value.title??"";
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<BettingDetailLogic>();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: state.scaffoldMineKey,
      appBar: WidgetUtils().buildAppBar(Intr().touzhujilu,msg: true,bgColor: ColorX.appBarBg(),drawer:true,drawEnd:(){
        state.scaffoldMineKey.currentState?.openEndDrawer();
      }),
      endDrawer: EndsDrawerView(),
      backgroundColor: ColorX.pageBg(),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h,),
            Container(
              color: ColorX.cardBg2(),
              padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
              child: Row(
                children: [
                  Expanded(
                    child: Text(Intr().youxipingtai,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1()),),
                    flex: 40,
                  ),
                  Expanded(
                    child: Text(Intr().bishu,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1()),),
                    flex: 30,
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(Intr().touzhue,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1()),),
                    ),
                    flex: 30,
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(Intr().shuying,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1()),),
                    ),
                    flex: 30,
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(Intr().youxiaotouzhu,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1()),),
                    ),
                    flex: 30,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(() {
                return ListView.separated(
                  itemBuilder: (context,index){
                    if(unEmpty(state.record.value.record)){
                      var item = state.record.value.record![index];
                      if((index + 1) < state.record.value.record.em()){
                        return buildBettingItem(state.record.value.record?[index + 1]);
                      } else {
                        return Column(
                          children: [
                            buildBettingItem(state.record.value.record?[index]),
                            Divider(height: 1.h,color: ColorX.color_10_949,indent: 10.w,endIndent: 10.w,),
                            buildTotalFooter(state.record.value)
                          ],
                        );
                      }
                    } else {
                      return Container();
                    }

                  },
                  separatorBuilder: (context,index){
                    return Divider(height: 1.h,color: ColorX.color_10_949,indent: 10.w,endIndent: 10.w,);
                  },
                  itemCount: state.record.value.record.em(),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTotalFooter(BetDetailItemEntity? group) {
    return InkWell(
      onTap:(){
        // if(num.parse(item.validamount??"0")>0){
        //   item.title=item.time;
        //   Get.toNamed(Routes.betting_detail,arguments: {"data":jsonEncode(item.toJson())});
        // }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 13.h),
        child: Row(
          children: [
            Expanded(
              flex: 40,
              child: Text("总计",style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),),),
            ),
            Expanded(
              flex: 30,
              child: Text("${state?.betCount}",
                style: TextStyle(fontSize: 14.sp, color: ColorX.color_fc243b,),),
            ),
            Expanded(
              flex: 30,
              child: Text("${state?.betamount??0}",
                style: TextStyle(fontSize: 14.sp, color: ColorX.color_fc243b,),),
            ),
            Expanded(
              flex: 30,
              child: Text("${((state?.winlose.value.em()??0) >= 0) ? "+" : ""}${state?.winlose.value.em()}",
                style: TextStyle(fontSize: 14.sp,color: ((state?.winlose.value.em()??0) >= 0) ? ColorX.color_23a81d : ColorX.color_fc243b,),),
            ),
            Expanded(
              flex: 30,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text("${state?.validamount??0}",style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),),),
              ),
            ),
          ],
        ),
      ),
    );
  }



  Widget buildBettingItem(BetDetailItemEntity? item) {
    // var result = index%2 == 1;
    return InkWell(
      onTap:(){
        // if(num.parse(item.validamount??"0")>0){
        //   item.title=item.time;
        //   Get.toNamed(Routes.betting_detail,arguments: {"data":jsonEncode(item.toJson())});
        // }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 13.h),
        child: Row(
          children: [
            Expanded(
              flex: 40,
              child: Text(item?.gameKindName??"",style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),),),
            ),
            Expanded(
              flex: 30,
              child: Text("${item?.betCount}",
                style: TextStyle(fontSize: 14.sp, color: ColorX.color_fc243b,),),
            ),
            Expanded(
              flex: 30,
              child: Text("${item?.betamount??0}",
                style: TextStyle(fontSize: 14.sp, color: ColorX.color_fc243b,),),
            ),
            Expanded(
              flex: 30,
              child: Text("${((item?.winlose.em()??0) >= 0) ? "+" : ""}${item?.winlose.em()}",
                style: TextStyle(fontSize: 14.sp,color: ((item?.winlose.em()??0) >= 0) ? ColorX.color_23a81d : ColorX.color_fc243b,),),
            ),
            Expanded(
              flex: 30,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text("${item?.validamount??0}",style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),),),
              ),
            ),
          ],
        ),
      ),
    );
  }




}