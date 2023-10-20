
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';

class UnbrokenNumberBtnDialog extends StatefulWidget{

  @override
  State<StatefulWidget> createState() =>StateUnbrokenNumberBtnDialog();

}

class StateUnbrokenNumberBtnDialog extends State<UnbrokenNumberBtnDialog>{

  var current = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r),topRight: Radius.circular(20.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: ()=> Navigator.of(context).pop(),
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.w,top: 15.h),
                    child: Text("取消",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w600,color: ColorX.color_58698d),),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Text("完整号源展示",style: TextStyle(fontSize: 16.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                    padding: EdgeInsets.only(right: 15.w),
                  child: WidgetUtils().buildElevatedButton("确定", 50.w, 26.h,textSize: 12.sp,
                      bg:ColorX.color_fc243b,onPressed: (){}),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h,),
          Center(
            child: Text("期号 202306161225\n抓取时间: 2023 - 06 - 16 08:25:02",style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d,height: 1.5),
              textAlign: TextAlign.center,),
          ),
          SizedBox(height: 10.h,),
          buildNumberItem("1","6cce4fc7e14b54ce50999d89a8e841730b69276cce4fc7e14b54ce50999d89a8e841730b6927"),
          buildNumberItem("2","6cce4fc7e14b54ce50999d89a8e841730b69276cce4fc7e14b54ce50999d89a8e841730b6927"),
          buildNumberItem("3","6cce4fc7e14b54ce50999d89a8e841730b69276cce4fc7e14b54ce50999d89a8e841730b6927"),
          Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: Text("说明:点击单条号源可以复制哦",style: TextStyle(fontSize: 14.sp,color: ColorX.color_58698d),),
          ),
          SizedBox(height: 20.h,),
        ],
      ),
    );
  }

  Widget buildNumberItem(String num,String code) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${num}.",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722),),
          Expanded(
            child: InkWell(
              onTap: (){
                WidgetUtils().clickCopy(code);
              },
              child: Text(code,
                style: TextStyle(fontSize: 14.sp,color: ColorX.color_5583e7,fontWeight: FontWeight.w600,),),
            ),
          ),
        ],
      ),
    );
  }


}


