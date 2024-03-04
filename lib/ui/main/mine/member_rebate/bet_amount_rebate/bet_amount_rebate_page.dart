import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/drawer_scaffold.dart';
import 'package:leisure_games/ui/bean/day_return_water_details_entity.dart';

import 'bet_amount_rebate_logic.dart';

///投注量返水
class BetAmountRebatePage extends StatefulWidget {
  const BetAmountRebatePage({Key? key}) : super(key: key);

  @override
  State<BetAmountRebatePage> createState() => _BetAmountRebatePageState();
}

class _BetAmountRebatePageState extends State<BetAmountRebatePage> {
  final logic = Get.find<BetAmountRebateLogic>();
  final state = Get.find<BetAmountRebateLogic>().state;


  @override
  void dispose() {
    Get.delete<BetAmountRebateLogic>();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      scaffoldKey: state.scaffoldKey,
      appBar: WidgetUtils().buildAppBar(Intr().touzhuliangfanshui,msg: true,
          bgColor: ColorX.appBarBg(),scaffoldKey: state.scaffoldKey),
      backgroundColor: ColorX.pageBg(),
      body: Container(
        child: Column(
          children: [
            Container(
              color: ColorX.cardBg3(),
              padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
              child: Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${state.params.value.details?.gameName.em()}（${state.params.value.beginDateStr()} - ${state.params.value.endDateStr()}）",
                      style: TextStyle(fontSize: 16.sp,color: ColorX.text0d1(),fontWeight: FontWeight.w500,),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(Intr().zongji,style: TextStyle(fontSize: 16.sp,color: ColorX.text0d1(),fontWeight: FontWeight.w500,),),
                        Text("¥${state.params.value.details?.lossMoneyBonus.em()}",style: TextStyle(fontSize: 16.sp,color: ColorX.color_fc243b,fontWeight: FontWeight.w500,),),
                      ],
                    ),
                  ],
                );
              }),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
              child: Row(
                children: [
                  Expanded(
                    flex: 33,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(Intr().riqi,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),fontWeight: FontWeight.w500),),
                    ),
                  ),
                  Expanded(
                    flex: 33,
                    child: Center(
                      child: Text(Intr().youxiaotouzhu,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),fontWeight: FontWeight.w500),),
                    ),
                  ),
                  Expanded(
                    flex: 33,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(Intr().huishui,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),fontWeight: FontWeight.w500),),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(() {
                return ListView.separated(
                  itemBuilder: (context,index){
                    var item = state.record.value.record![index];
                    return buildBetAmountItem(item);
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


  ///投注量
  Widget buildBetAmountItem(DayReturnWaterDetailsRecord item) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 13.h),
      child: Row(
        children: [
          Expanded(
            flex: 33,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(item.date.em(),style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),),),
            ),
          ),
          Expanded(
            flex: 33,
            child: Center(
              child: Text(item.validBetMoney.em(),style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),),),
            ),
          ),
          Expanded(
            flex: 33,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(item.lossMoneyBonus.em(),style: TextStyle(fontSize: 14.sp,color: ColorX.color_23a81d,),),
            ),
          ),
        ],
      ),
    );
  }





}