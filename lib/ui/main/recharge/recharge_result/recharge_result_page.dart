import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';

import 'recharge_result_logic.dart';
///
///充值结果
///author: Soushin
///2023/10/15 12:09
///
class RechargeResultPage extends StatefulWidget {
  const RechargeResultPage({Key? key}) : super(key: key);

  @override
  State<RechargeResultPage> createState() => _RechargeResultPageState();
}

class _RechargeResultPageState extends State<RechargeResultPage> {
  final logic = Get.find<RechargeResultLogic>();
  final state = Get.find<RechargeResultLogic>().state;

  @override
  void dispose() {
    Get.delete<RechargeResultLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildAppBar("充值",msg: true),
      backgroundColor: ColorX.color_f7f8fb,
      body: Column(
        children: [
          Container(
            height: 115.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(ImageX.icon_select,width: 24.r,height: 24.r,),
                SizedBox(height: 5.r,),
                Text("提交成功",style: TextStyle(fontSize: 20.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
                SizedBox(height: 5.r,),
                Text("请3分钟后刷新本页,查询进度",style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d),),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10.r)),
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            padding: EdgeInsets.all(15.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("充值详情",style: TextStyle(fontSize: 16.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
                SizedBox(height: 15.h,),
                buildInfoItem("充值姓名","xxx"),
                SizedBox(height: 15.h,),
                buildInfoItem("订单编号","947957829459679390"),
                SizedBox(height: 15.h,),
                buildInfoItem("提交时间","2023-07-05  11:45:10"),
                SizedBox(height: 15.h,),
                buildInfoItem("充值金额","¥500"),
              ],
            ),
          ),
          SizedBox(height: 20.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WidgetUtils().buildElevatedButton("刷新", 150.w, 40.h,bg: Colors.white,textColor:ColorX.color_091722,onPressed: (){}),
              SizedBox(width: 20.w,),
              WidgetUtils().buildElevatedButton("完成", 150.w, 40.h,bg: ColorX.color_fc243b,onPressed: (){
                Get.back();
              }),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildInfoItem(String key, String value) {
    return Row(
      children: [
        Text(key,style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d),),
        SizedBox(width: 10.w,),
        Text(value,style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722),),
      ],
    );
  }
}