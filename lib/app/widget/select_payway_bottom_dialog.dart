
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';

///
///选择付款方式
class SelectPaywayBottomDialog extends StatefulWidget{

  @override
  State<StatefulWidget> createState() =>StateSelectPaywayBottomDialog();

}

class StateSelectPaywayBottomDialog extends State<SelectPaywayBottomDialog>{

  var current = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorX.cardBg5(),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r),topRight: Radius.circular(20.r)),
      ),
      height: 300.h,
      child: Column(
        children: [
          Container(
            height: 245.h,
            child: CupertinoPicker(
              itemExtent: 40.h, // 设置单个选项高度
              onSelectedItemChanged: (int index) {
                current = index;
              },
              children: [
                buildPaywayItem("支付宝"),
                buildPaywayItem("微信"),
                buildPaywayItem("云闪付"),
                buildPaywayItem("数字钱包"),
                buildPaywayItem("财付通"),
                buildPaywayItem("e支付"),
                buildPaywayItem("USDT钱包"),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 15.w),
              child: WidgetUtils().buildElevatedButton("提交", 335.w, 50.h,bg: ColorX.color_fc243b,onPressed: (){
                Navigator.of(context).pop(current);
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPaywayItem(String name) {
    return Container(
      height: 40.h,
      alignment: Alignment.center,
      child: Text(name,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
    );
  }

}


