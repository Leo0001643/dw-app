
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';

class GameBrandBottomDialog extends StatefulWidget{

  @override
  State<StatefulWidget> createState() =>StateGameBrandBottomDialog();

}

class StateGameBrandBottomDialog extends State<GameBrandBottomDialog>{

  var current = (-1).obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorX.cardBg5(),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r),topRight: Radius.circular(20.r)),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Text(Intr().xuanzhe,style: TextStyle(fontSize: 16.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                    padding: EdgeInsets.only(right: 15.w),
                  child: WidgetUtils().buildElevatedButton(Intr().confirm, 50.w, 26.h,textSize: 12.sp,
                      bg:ColorX.color_fc243b,onPressed: (){
                        Navigator.pop(context);
                      }),
                ),
              ),
            ],
          ),
          buildAllBrand(0),
          buildBrandItem(1),
          buildBrandItem(2),
          buildBrandItem(3),
          buildBrandItem(4),
        ],
      ),
    );
  }

  Widget buildAllBrand(int i) {
    return Column(
      children: [
        InkWell(
          onTap: ()=> current.value = i,
          child: Obx(() {
            return Container(
              height: 57.h,
              alignment: Alignment.center,
              color: current.value == i ? Colors.black12 : ColorX.cardBg(),
              child: Text(Intr().quanbuyouxi,style: TextStyle(fontSize: 16.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
            );
          }),
        ),
        Divider(color: ColorX.color_10_949,height: 1.h,indent: 10.w,endIndent: 10.w,),
      ],
    );
  }

  Widget buildBrandItem(int i) {
    return Column(
      children: [
        InkWell(
          onTap: ()=> current.value = i,
          child: Obx(() {
            return Container(
              height: 57.h,
              color: current.value == i ? Colors.black12 : ColorX.cardBg(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(Constants.test_image,width: 15.r,),
                  SizedBox(width: 5.w,),
                  Text("AG电子",style: TextStyle(fontSize: 12.sp,color: ColorX.text5862()),),
                ],
              ),
            );
          }),
        ),
        Divider(color: ColorX.color_10_949,height: 1.h,indent: 10.w,endIndent: 10.w,),
      ],
    );
  }

  

}


