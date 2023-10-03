import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class LightText {
  static build(String text){
    return Text(text,style: TextStyle(color: Colors.white,fontSize: 10.w),);
  }
  static buildColor(String text,Color color){
    return Text(text,style: TextStyle(color: color,fontSize: 10.w),);
  }

  static buildColorFont(String text,Color color,double fontSize){
    return Text(text,style: TextStyle(color: color,fontSize: fontSize.sp),);
  }

  static buildWithFont(String text,double fontSize){
    return Text(text,style: TextStyle(color: Colors.white,fontSize: fontSize.sp),);
  }
  static buildWidth(String text,double widths){
    return Container(
      width: widths.w,
      alignment: Alignment.center,
      child: Text(text,style: TextStyle(color: Colors.white,fontSize: 10.w),maxLines: 1,),
    );
  }

}