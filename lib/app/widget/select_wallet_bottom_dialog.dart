
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';

///
///切换钱包
class SelectWalletBottomDialog extends StatefulWidget{

  @override
  State<StatefulWidget> createState() =>StateSelectWalletBottomDialog();

}

class StateSelectWalletBottomDialog extends State<SelectWalletBottomDialog>{

  var current = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorX.cardBg5(),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r),topRight: Radius.circular(20.r)),
      ),
      child: Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Text(Intr().qiehuanquanjuqianbao,
                style: TextStyle(fontSize: 16.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 8.h),
            child: InkWell(
              onTap: ()=> current.value = 0,
              child: Obx(() {
                return buildWalletItem(Intr().wallet_cny, "${Intr().yue_} ¥8,888", current.value == 0);
              }),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 8.h),
            child: InkWell(
              onTap: ()=> current.value = 1,
              child: Obx(() {
                return buildWalletItem(Intr().wallet_usdt, "${Intr().yue_} ¥8,888", current.value == 1);
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildWalletItem(String name,String amount, bool select) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: select ? ColorX.color_fc243b : ColorX.color_e8e8e8,width: 1.w),
            borderRadius: BorderRadius.circular(8.r),
          ),
          padding: EdgeInsets.symmetric(vertical: 9.h,horizontal: 15.w),
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,style: TextStyle(fontSize: 16.sp,color: select?ColorX.color_fc243b:ColorX.text0917()),),
              Text(amount,style: TextStyle(fontSize: 12.sp,color: ColorX.text586()),),
            ],
          ),
        ),
        Visibility(
          visible: select,
          child: Positioned(
            right: 0,top: 0,
            child: Image.asset(ImageX.icon_choose),
          ),
        ),
      ],
    );
  }
  

}


