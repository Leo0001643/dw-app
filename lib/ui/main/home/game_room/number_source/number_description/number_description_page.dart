import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';

import 'number_description_logic.dart';

class NumberDescriptionPage extends StatefulWidget {
  const NumberDescriptionPage({Key? key}) : super(key: key);

  @override
  State<NumberDescriptionPage> createState() => _NumberDescriptionPageState();
}

class _NumberDescriptionPageState extends State<NumberDescriptionPage> {
  final logic = Get.find<NumberDescriptionLogic>();
  final state = Get.find<NumberDescriptionLogic>().state;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: ColorX.color_f7f8fb,
            margin: EdgeInsets.only(top: 10.h),
            padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
            width: 1.sw,
            alignment: Alignment.center,
            child: Text(Intr().bitebipc28quhaojizhi,style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
          ),
          buildDescItem(Intr().zhuahaoyuan,Intr().zhuahaoyuan_jieshao),
          buildDescItem(Intr().sha256zhuanhua,Intr().sha256zhuanhua_jieshao),
          buildDescItem(Intr().shijinzhizhuanhua,Intr().shijinzhizhuanhua_jieshao),
          buildDescItem(Intr().shengchengzuihzhonghaoma,Intr().shengchengzuihzhonghaoma_jieshao),
          SizedBox(height: 10.h,),
        ],
      ),
    );
  }

  Widget buildDescItem(String title, String desc) {
    return Column(
      children: [
        SizedBox(height: 15.h,),
        Row(
          children: [
            Image.asset(ImageX.icon_tiitle_ext),
            SizedBox(width: 12.w,),
            Text(title,style: TextStyle(fontSize: 16.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15.w,vertical: 8.h),
          child: Text(desc,style: TextStyle(fontSize: 16.sp,color: ColorX.color_091722,height: 1.7),),
        ),
      ],
    );
  }


}




