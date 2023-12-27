import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/bean/day_return_water_details_entity.dart';

import 'profit_rebate_logic.dart';

///盈利返水
class ProfitRebatePage extends StatefulWidget {
  const ProfitRebatePage({Key? key}) : super(key: key);

  @override
  State<ProfitRebatePage> createState() => _ProfitRebatePageState();
}

class _ProfitRebatePageState extends State<ProfitRebatePage> {
  final logic = Get.find<ProfitRebateLogic>();
  final state = Get.find<ProfitRebateLogic>().state;



  @override
  void dispose() {
    Get.delete<ProfitRebateLogic>();
    super.dispose();
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildAppBar(Intr().yinlifanshui,msg: true,bgColor: ColorX.appBarBg()),
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
                    flex: 23,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(Intr().riqi,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),fontWeight: FontWeight.w500),),
                    ),
                  ),
                  Expanded(
                    flex: 18,
                    child: Center(
                      child: Text(Intr().youxiaotouzhu,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),fontWeight: FontWeight.w500),),
                    ),
                  ),
                  Expanded(
                    flex: 18,
                    child: Center(
                      child: Text(Intr().shuying,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),fontWeight: FontWeight.w500),),
                    ),
                  ),
                  Expanded(
                    flex: 18,
                    child: Center(
                      child: Text(Intr().huishui,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),fontWeight: FontWeight.w500),),
                    ),
                  ),
                  Expanded(
                    flex: 23,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(Intr().zuhezhanbilv,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),fontWeight: FontWeight.w500),),
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
                    return buildProfitItem(item);
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


  ///负盈利
  Widget buildProfitItem(DayReturnWaterDetailsRecord item) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 13.h),
      child: Row(
        children: [
          Expanded(
            flex: 23,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(item.date.em(),
                maxLines: 1,
                style: TextStyle(
                fontSize: 10.sp,color: ColorX.text0d1(),),),
            ),
          ),
          Expanded(
            flex: 18,
            child: Center(
              child: Text(item.validBetMoney.em(),style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),),),
            ),
          ),
          Expanded(
            flex: 18,
            child: Center(
              child: Text("${item.lossMoney.em()}",style: TextStyle(fontSize: 14.sp,color: ColorX.color_fc243b,),),
            ),
          ),
          Expanded(
            flex: 18,
            child: Center(
              child: Text(item.lossMoneyBonus.em(),style: TextStyle(fontSize: 14.sp,color: ColorX.color_23a81d,),),
            ),
          ),
          Expanded(
            flex: 23,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text("${item.combinBetRatio.em()}",style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),),),
            ),
          ),
        ],
      ),
    );
  }







}