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
import 'package:leisure_games/ui/bean/bet_detail_list_entity.dart';

import 'betting_detail2_logic.dart';

class BettingDetail2Page extends StatefulWidget {
  @override
  State<BettingDetail2Page> createState() => _BettingDetail2PageState();
}

class _BettingDetail2PageState extends State<BettingDetail2Page> {
  final logic = Get.find<BettingDetail2Logic>();
  final state = Get.find<BettingDetail2Logic>().state;


  @override
  void dispose() {
    Get.delete<BettingDetail2Logic>();
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
                      var item = state.record.value.record![index];
                      if(state.record.value.record!.last != item){
                        return buildBettingItemChild(item);
                      } else {
                        return Column(
                          children: [
                            buildBettingItemChild(item),
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

  Widget buildTotalFooter(BetDetailListRecord total) {
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
              child: Text(DataUtils.formatMoney(total.betAmount),
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
              child: Text(DataUtils.formatMoney(total.validAmount),style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),),),
            ),
          ),
          SizedBox(width: 12.r,)
        ],
      ),
    );
  }


  Widget buildBettingItemChild(BetDetailListRecordRecord item) {
    // var result = index%2 == 1;
    return InkWell(
      onTap:(){
        if(item.gameKind == 56 || item.gameKind == 57 || item.gameKind == 58 || item.gameKind == 59 || item.gameKind == 80002
            || item.gameKind == 80005 || item.gameKind == 80006  || item.gameKind == 80009){
          Get.toNamed(Routes.betting_detail_child,
              arguments: {"data":item.toJson(),"origin":state.originetRecordGroupRecord.value.toJson()});
        } else {
          Get.toNamed(Routes.betting_detail_other,
              arguments: {"data":item.toJson(),"origin":state.originetRecordGroupRecord.value.toJson()});
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