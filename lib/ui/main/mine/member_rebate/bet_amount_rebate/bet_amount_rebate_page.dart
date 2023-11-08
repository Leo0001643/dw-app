import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';

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
    return Scaffold(
      appBar: WidgetUtils().buildAppBar(Intr().touzhuliangfanshui,msg: true,bgColor: ColorX.appBarBg()),
      backgroundColor: ColorX.pageBg(),
      body: Container(
        child: Column(
          children: [
            Container(
              color: ColorX.cardBg3(),
              padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(Intr().qitayouxi_(["09-09","09-09"]),style: TextStyle(fontSize: 16.sp,color: ColorX.text0d1(),fontWeight: FontWeight.w500,),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(Intr().zongji,style: TextStyle(fontSize: 16.sp,color: ColorX.text0d1(),fontWeight: FontWeight.w500,),),
                      Text("¥0",style: TextStyle(fontSize: 16.sp,color: ColorX.color_fc243b,fontWeight: FontWeight.w500,),),
                    ],
                  ),
                ],
              ),
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
              child: ListView.separated(
                itemBuilder: (context,index){
                  return buildBetAmountItem();
                },
                separatorBuilder: (context,index){
                  return Divider(height: 1.h,color: ColorX.color_10_949,indent: 10.w,endIndent: 10.w,);
                },
                itemCount: state.record.value.length,
              ),
            ),
          ],
        ),
      ),
    );
  }


  ///投注量
  Widget buildBetAmountItem() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 13.h),
      child: Row(
        children: [
          Expanded(
            flex: 33,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("2023-07-07",style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),),),
            ),
          ),
          Expanded(
            flex: 33,
            child: Center(
              child: Text("72.7600",style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),),),
            ),
          ),
          Expanded(
            flex: 33,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text("0.00000",style: TextStyle(fontSize: 14.sp,color: ColorX.color_23a81d,),),
            ),
          ),
        ],
      ),
    );
  }





}