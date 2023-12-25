
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';

class LoadGameDialog{

  AlertDialog create(BuildContext context,String title,){
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      backgroundColor: ColorX.cardBg5(),
      titlePadding: EdgeInsets.only(top: 10.h,bottom: 10.h),
      contentPadding: EdgeInsets.all(15.r),
      title: Stack(
        children: [
          Center(
            child: Text(title,style: TextStyle(color: ColorX.textBlack(),fontSize: 18.sp,fontWeight: FontWeight.w700),),
          ),
          Positioned(
            top: 0,right: 10.w,
            child: InkWell(
              onTap: ()=> Navigator.pop(context),
              child: Image.asset(ImageX.icon_close_dialog,width: 20.r,height: 20.r,fit: BoxFit.fill,),
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            children: [
              Column(
                children: [
                  InkWell(
                    onTap: ()=> Navigator.pop(context,true),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorX.color_5583e7,width: 2.r),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      padding: EdgeInsets.all(8.r),
                      child: Row(
                        children: [
                          Expanded(child: Text(Intr().yingyongneijiazai,style: TextStyle(fontSize: 14.sp,color: ColorX.textBlack(),),)),
                          Text(Intr().xuanzhe,style: TextStyle(fontSize: 14.sp,color: ColorX.textBlack()),),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  InkWell(
                    onTap: ()=> Navigator.pop(context,false),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorX.color_5583e7,width: 2.r),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      padding: EdgeInsets.all(8.r),
                      child: Row(
                        children: [
                          Expanded(child: Text(Intr().liulanqidakai,style: TextStyle(fontSize: 14.sp,color: ColorX.textBlack(),),),),
                          Text(Intr().xuanzhe,style: TextStyle(fontSize: 14.sp,color: ColorX.textBlack()),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      actionsPadding: EdgeInsets.zero,
    );
  }


}




