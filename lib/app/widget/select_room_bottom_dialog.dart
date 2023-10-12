
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';

class SelectRoomBottomDialog extends StatefulWidget{

  @override
  State<StatefulWidget> createState() =>StateSelectRoomBottomDialog();

}

class StateSelectRoomBottomDialog extends State<SelectRoomBottomDialog>{

  var current = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r),topRight: Radius.circular(20.r)),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Text("切换房间",style: TextStyle(fontSize: 16.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                    padding: EdgeInsets.only(right: 15.w),
                  child: WidgetUtils().buildElevatedButton("确定", 50.w, 26.h,textSize: 12.sp,onPressed: (){}),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h,),
          buildCategoryItem("比特币1分28","00:00:29",0,1,2),
          buildCategoryItem("台湾宾果28","00:00:29",3,4,5),
          buildCategoryItem("加拿大28","00:00:29",6,7,8),
        ],
      ),
    );
  }

  Widget buildCategoryItem(String name, String time,int i,int j,int h) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.5.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name,style: TextStyle(fontSize: 15.sp,color: ColorX.color_091722),),
              Text(time,style: TextStyle(fontSize: 15.sp,color: ColorX.color_091722),),
            ],
          ),
        ),
        SizedBox(height: 10.h,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.5.w),
          child: Row(
            children: [
              Expanded(
                child: Obx(() {
                  return InkWell(
                    onTap: ()=> current.value = i,
                    child: buildRoomItem("普通房",current.value == i),
                  );
                }),
              ),
              SizedBox(width: 10.w,),
              Expanded(
                child: Obx(() {
                  return InkWell(
                    onTap: ()=> current.value = j,
                    child: buildRoomItem("高级房", current.value == j),
                  );
                }),
              ),
              SizedBox(width: 10.w,),
              Expanded(
                child: Obx(() {
                  return InkWell(
                    onTap: ()=> current.value = h,
                    child: buildRoomItem("贵宾房", current.value == h),
                  );
                }),
              ),
            ],
          ),
        ),
        SizedBox(height: 27.h,),
      ],
    );
  }

  Widget buildRoomItem(String name, bool select) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: select ? ColorX.color_fc243b : ColorX.color_e8e8e8,width: 1.w),
            borderRadius: BorderRadius.circular(8.r),
          ),
          padding: EdgeInsets.symmetric(vertical: 9.h),
          alignment: Alignment.center,
          child: Text(name,style: TextStyle(fontSize: 16.sp,color: select?ColorX.color_fc243b:ColorX.color_091722),),
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


