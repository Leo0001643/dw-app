import 'dart:core';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/drawer_scaffold.dart';
import 'package:leisure_games/ui/bean/bet_detail_item_child_entity.dart'  as T;
import 'package:leisure_games/ui/main/ends_drawer_view.dart';

import 'betting_detail_child_logic.dart';

//投注详情
class BettingDetailChildPage extends StatefulWidget {
  const BettingDetailChildPage({Key? key}) : super(key: key);

  @override
  State<BettingDetailChildPage> createState() => _BettingDetailChildPageState();
}

class _BettingDetailChildPageState extends State<BettingDetailChildPage> {
  final logic = Get.find<BettingDetailChildLogic>();
  final state = Get.find<BettingDetailChildLogic>().state;
  @override
  void initState() {

    setState(() {
    });
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<BettingDetailChildLogic>();
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
            Expanded(
              child: Obx(() {
                return ListView.separated(
                  itemBuilder: (context,index){
                    return buildBettingItem(state.record.value.record![index]);
                  },
                  separatorBuilder: (context,index){
                    return Divider(height: 0.h,color: Colors.transparent,indent: 10.w,endIndent: 10.w,);
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

  Widget buildBettingItem(T.Record item) {
    // var result = index%2 == 1;
    var date = DateUtil.formatDateMs((num.parse(item.betTime??"0").toInt()).em() ,isUtc: true,format: Intr().nianyueri);

    return InkWell(
      onTap:(){
       
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal:12.w,vertical: 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color(0xFFF7F8FB)
        ),
        padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 13.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Text(date,style: TextStyle(color: Colors.grey,fontSize: 12.sp),),
                Text("${((item.winlose.em()??0) >= 0) ? "+" : ""}${DataUtils.formatMoney(item.winlose)}",
                  style: TextStyle(fontSize: 14.sp,color: ((item.winlose.em()??0) >= 0) ? ColorX.color_23a81d : ColorX.color_fc243b,),),
              ],
            ),
            SizedBox(height: 12.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(Intr().dixqi([item.qishu ?? '']),style: TextStyle(color: Colors.grey,fontSize: 12.sp),),
              ],
            ),
            SizedBox(height: 12.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
               Wrap(
                 children: [ Text(item.gameName.em(),style: TextStyle(color: Colors.red,fontSize: 12.sp),),
                   Text(item.txt1.em(),style: TextStyle(color: Colors.grey,fontSize: 12.sp),),
                   Text("@",style: TextStyle(color: Colors.grey,fontSize: 12.sp),),
                   Text("${item.odds.em()} ${item.odds2.em()}",style: TextStyle(color: Colors.red,fontSize: 12.sp),),
                 ],
               )
              ],
            ),
            SizedBox(height: 12.h,),
            Row(
              children: [
                Wrap(
                  children: [ Text(Intr().youxiaotouzhu,style: TextStyle(color: Colors.grey,fontSize: 12.sp),),
                    Text("${item.validamount}",style: TextStyle(color: Colors.grey,fontSize: 12.sp),),
                  ],
                ),
                Wrap(
                  children: [
                    Text(Intr().touzhue,style: TextStyle(color: Colors.grey,fontSize: 12.sp),),
                    Text("${item.betamount}",style: TextStyle(color: Colors.grey,fontSize: 12.sp),),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }




}