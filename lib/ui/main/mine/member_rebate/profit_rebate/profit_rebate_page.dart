import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';

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
      appBar: WidgetUtils().buildAppBar("盈利返水",msg: true,bgColor: Colors.white),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Container(
              color: ColorX.color_f7f8fb,
              padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("其他游戏 ( 07-07 至 07-07 )",style: TextStyle(fontSize: 16.sp,color: ColorX.color_0d192d,fontWeight: FontWeight.w500,),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("总计",style: TextStyle(fontSize: 16.sp,color: ColorX.color_0d192d,fontWeight: FontWeight.w500,),),
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
                    flex: 23,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("日期",style: TextStyle(fontSize: 14.sp,color: ColorX.color_0d192d,fontWeight: FontWeight.w500),),
                    ),
                  ),
                  Expanded(
                    flex: 18,
                    child: Center(
                      child: Text("有效投注",style: TextStyle(fontSize: 14.sp,color: ColorX.color_0d192d,fontWeight: FontWeight.w500),),
                    ),
                  ),
                  Expanded(
                    flex: 18,
                    child: Center(
                      child: Text("输赢",style: TextStyle(fontSize: 14.sp,color: ColorX.color_0d192d,fontWeight: FontWeight.w500),),
                    ),
                  ),
                  Expanded(
                    flex: 18,
                    child: Center(
                      child: Text("回水",style: TextStyle(fontSize: 14.sp,color: ColorX.color_0d192d,fontWeight: FontWeight.w500),),
                    ),
                  ),
                  Expanded(
                    flex: 23,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text("组合占比率",style: TextStyle(fontSize: 14.sp,color: ColorX.color_0d192d,fontWeight: FontWeight.w500),),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context,index){
                  return buildProfitItem();
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


  ///负盈利
  Widget buildProfitItem() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 13.h),
      child: Row(
        children: [
          Expanded(
            flex: 23,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("2023-07-07",style: TextStyle(fontSize: 14.sp,color: ColorX.color_0d192d,),),
            ),
          ),
          Expanded(
            flex: 18,
            child: Center(
              child: Text("72.7600",style: TextStyle(fontSize: 14.sp,color: ColorX.color_0d192d,),),
            ),
          ),
          Expanded(
            flex: 18,
            child: Center(
              child: Text("37.2400",style: TextStyle(fontSize: 14.sp,color: ColorX.color_fc243b,),),
            ),
          ),
          Expanded(
            flex: 18,
            child: Center(
              child: Text("37.2400",style: TextStyle(fontSize: 14.sp,color: ColorX.color_23a81d,),),
            ),
          ),
          Expanded(
            flex: 23,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text("0.00000",style: TextStyle(fontSize: 14.sp,color: ColorX.color_0d192d,),),
            ),
          ),
        ],
      ),
    );
  }



}