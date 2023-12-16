

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';

class AccessRouteDialog extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => StateAccessRouteDialog();

}

class StateAccessRouteDialog extends State<AccessRouteDialog>{


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h,),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(Intr().fangwenluxian,style: TextStyle(fontSize: 16.sp,color: ColorX.color_3e3737),),
          ),
          SizedBox(height: 20.h,),
          Container(
            height: 45.h,
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: ColorX.color_10_949,width: 1.r),
            ),
            child: Row(
              children: [
                SizedBox(width: 20.w,),
                Text("2189mm",style: TextStyle(fontSize: 16.sp,color: ColorX.color_3e3737),),
                Expanded(child: Container()),
                Image.asset(ImageX.icon_right_black),
                SizedBox(width: 10.w,),
              ],
            ),
          ),
          SizedBox(height: 12.h,),
          Container(
            height: 45.h,
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: ColorX.color_10_949,width: 1.r),
            ),
            child: Row(
              children: [
                SizedBox(width: 20.w,),
                Text("664mm",style: TextStyle(fontSize: 16.sp,color: ColorX.color_fc243b),),
                Expanded(child: Container()),
                Image.asset(ImageX.icon_right_black),
                SizedBox(width: 10.w,),
              ],
            ),
          ),
          SizedBox(height: 20.h,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: 5.h,
                        color: ColorX.color_60c549,
                      ),
                      SizedBox(height: 7.h,),
                      Text(Intr().kuai,style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d),),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: 5.h,
                        color: ColorX.color_ff9e52,
                      ),
                      SizedBox(height: 7.h,),
                      Text(Intr().yiban,style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d),),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: 5.h,
                        color: ColorX.color_d53849,
                      ),
                      SizedBox(height: 7.h,),
                      Text(Intr().henman,style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d),),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: 5.h,
                        color: ColorX.color_b5b5b5,
                      ),
                      SizedBox(height: 7.h,),
                      Text(Intr().bukeyong,style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d),),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h,),
          Center(
            child: WidgetUtils().buildElevatedButton(Intr().fanhui, 131.w, 40.h, bg: ColorX.color_f7f8fb,
                textColor: ColorX.color_091722,onPressed: (){
                    Navigator.of(context).pop();
                }),
          ),
        ],
      ),
    );
  }





}

