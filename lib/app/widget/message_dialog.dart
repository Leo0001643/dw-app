
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';

class MessageDialog{

  AlertDialog create(BuildContext context,String msg,{String? title,String? btnConfirm,String? btnCancel,VoidCallback? onConfirm,VoidCallback? onCancel}){
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      backgroundColor: ColorX.cardBg5(),
      titlePadding: EdgeInsets.only(top: 10.h),
      contentPadding: EdgeInsets.all(15.r),
      title: Center(
        child: Text(title.em(),style: TextStyle(fontSize: 16.sp,color: ColorX.textBlack(),fontWeight: FontWeight.w600,),),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(msg,
              style: TextStyle(fontSize: 15.sp,color: ColorX.text0917()),),
          ),
          Divider(color: ColorX.color_10_949,height: 1.h,),
        ],
      ),
      actionsPadding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 15.h),
      actions: [
        WidgetUtils().buildElevatedButton(btnCancel.em(), 116.w, 40.h,
            bg: ColorX.cardBg3(),textColor: ColorX.text586(),onPressed: onCancel),
        SizedBox(width: 10.w,),
        WidgetUtils().buildElevatedButton(btnConfirm.em(), 116.w, 40.h,
            bg: ColorX.color_fc243b,textColor: ColorX.textBlack(),onPressed: onConfirm)
      ],
    );
  }

}




