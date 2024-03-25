import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/drawer_scaffold.dart';
import 'package:leisure_games/ui/bean/bet_detail_item_entity.dart';
import 'package:leisure_games/ui/bean/bet_detail_list_entity.dart';
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
    state.originetRecordGroupRecord.value= state.betRecordGroupRecord.value;
    // setState(() {
    // });
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<BettingDetailLogic>();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      scaffoldKey: state.scaffoldKey,
      appBar: WidgetUtils().buildRxAppBar(logic.state.title,msg: true,bgColor: ColorX.appBarBg(),drawer:true,scaffoldKey: state.scaffoldKey),
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
                    flex: 40,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(Intr().youxipingtai,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1()),),
                    ),
                  ),
                  Expanded(
                    flex: 30,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(Intr().bishu,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1()),),
                    ),
                  ),
                  Expanded(
                    flex: 30,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(Intr().touzhue,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1()),),
                    ),
                  ),
                  Expanded(
                    flex: 30,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(Intr().shuying,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1()),),
                    ),
                  ),
                  SizedBox(width: 12.r,),
                  Expanded(
                    flex: 30,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(Intr().youxiaotouzhu,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1()),),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(() {
                return ListView.separated(
                  itemBuilder: (context,index){
                    if(unEmpty(state.record.value.record)){
                      // var item = state.record.value.record![index];
                      if((index + 1) < state.record.value.record.em()){
                        var item = state.record.value.record![index + 1];
                        if(item is BetDetailListRecord){
                          return buildBettingItem(item);
                        } else {
                          return buildBettingItemChild(item);
                        }
                      } else {
                        var item = state.record.value.record![index];
                        return Column(
                          children: [
                            item is BetDetailListRecord ? buildBettingItem(item) : buildBettingItemChild(item),
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

  Widget buildTotalFooter(BetDetailListEntity total) {
    return Container(
      color: Colors.black12,
      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 13.h),
      child: Row(
        children: [
          Expanded(
            flex: 40,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(Intr().zongji,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),),),
            ),
          ),
          Expanded(
            flex: 30,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("${total.betCount}",
                style: TextStyle(fontSize: 14.sp, color: ColorX.color_fc243b,),),
            ),
          ),
          Expanded(
            flex: 30,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(DataUtils.formatMoney(total.betamount),
                style: TextStyle(fontSize: 14.sp, color: ColorX.color_fc243b,),),
            ),
          ),
          Expanded(
            flex: 30,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("${(total.winlose.em() >= 0) ? "+" : ""}${DataUtils.formatMoney(total.winlose)}",
                style: TextStyle(fontSize: 14.sp,color: ((total.winlose.em()) >= 0) ? ColorX.color_23a81d : ColorX.color_fc243b,),),
            ),
          ),
          Expanded(
            flex: 30,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(DataUtils.formatMoney(total.validamount),style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),),),
            ),
          ),
          SizedBox(width: 12.r,)
        ],
      ),
    );
  }



  Widget buildBettingItem(BetDetailListRecord item) {
    // var result = index%2 == 1;
    return InkWell(
      onTap:(){
        if (item.record?.isNotEmpty==true){
          logic.setCurrentBet(item);
        }else{
          Get.toNamed(Routes.betting_detail_child,
              arguments: {"data":jsonEncode(item.toJson()),"origin":jsonEncode(state.originetRecordGroupRecord.value.toJson())});
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 13.h),
        child: Row(
          children: [
            Expanded(
              flex: 40,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(item.gameKindName.em(),style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),),),
              ),
            ),
            Expanded(
              flex: 30,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("${item.betCount}",
                  style: TextStyle(fontSize: 14.sp, color: ColorX.color_fc243b,),),
              ),
            ),
            Expanded(
              flex: 30,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("${item.betAmount??0}",
                  style: TextStyle(fontSize: 14.sp, color: ColorX.color_fc243b,),),
              ),
            ),

            Expanded(
              flex: 30,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("${((item.winlose.em()) >= 0) ? "+" : ""}${DataUtils.formatMoney(item.winlose)}",
                  style: TextStyle(fontSize: 14.sp,color: ((item.winlose.em()??0) >= 0) ? ColorX.color_23a81d : ColorX.color_fc243b,),),
              ),
            ),
            Expanded(
              flex: 30,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(DataUtils.formatMoney(item.validAmount),style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),),),
              ),
            ),
            item.validAmount.em() > 0 ? WidgetUtils().buildImage(ImageX.ic_into_right, 12.r, 12.r) : SizedBox(width: 12.r,),
          ],
        ),
      ),
    );
  }


  Widget buildBettingItemChild(BetDetailListRecordRecord item) {
    // var result = index%2 == 1;
    return InkWell(
      onTap:(){
        // if (item.record?.isNotEmpty==true){
        //   logic.setCurrentBet(item);
        // }else{
          Get.toNamed(Routes.betting_detail_child,
              arguments: {"data":jsonEncode(item.toJson()),"origin":jsonEncode(state.originetRecordGroupRecord.value.toJson())});
        // }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 13.h),
        child: Row(
          children: [
            Expanded(
              flex: 40,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(item.gameKindName.em(),style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),),),
              ),
            ),
            Expanded(
              flex: 30,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("${item.betCount}",
                  style: TextStyle(fontSize: 14.sp, color: ColorX.color_fc243b,),),
              ),
            ),
            Expanded(
              flex: 30,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("${item.betamount??0}",
                  style: TextStyle(fontSize: 14.sp, color: ColorX.color_fc243b,),),
              ),
            ),

            Expanded(
              flex: 30,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("${((item.winlose.em()) >= 0) ? "+" : ""}${DataUtils.formatMoney(item.winlose)}",
                  style: TextStyle(fontSize: 14.sp,color: ((item.winlose.em()??0) >= 0) ? ColorX.color_23a81d : ColorX.color_fc243b,),),
              ),
            ),
            Expanded(
              flex: 30,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(DataUtils.formatMoney(item.validamount),style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),),),
              ),
            ),
            item.validamount.em() > 0 ? WidgetUtils().buildImage(ImageX.ic_into_right, 12.r, 12.r) : SizedBox(width: 12.r,),
          ],
        ),
      ),
    );
  }


}