

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/ui/bean/bet_shake_entity.dart';

class LuckyDrawDialog extends StatefulWidget{

  final List<BetShakeEntity> result;
  const LuckyDrawDialog(this.result,{super.key});

  @override
  State<StatefulWidget> createState() =>StateLuckyDrawDialog();

}

class StateLuckyDrawDialog extends State<LuckyDrawDialog> with SingleTickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 180.h,
      width: 195.w,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(ImageX.wins),fit: BoxFit.fill),
        ),
        height: 180.h,
        width: 195.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.result.length == 1 ?buildSingleDraw(widget.result.first):buildMultipleDraw(widget.result),
            SizedBox(height: 15.h,),
            GestureDetector(
              onTap: ()=> Navigator.pop(context,true),
              child: Image.asset(ImageX.close_btn,width: 94.w,height: 28.h,fit: BoxFit.fill,),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSingleDraw(BetShakeEntity shake) {
    return Column(
      children: [
        SizedBox(height: 10.h,),
        Container(
          height: 60.h,
          alignment: Alignment.center,
          child: Text(shake.bonus.em() > 0 ? Intr().gongxininhuode:Intr().zhuninxiacizdj,style: TextStyle(fontSize: 20.sp,color: ColorX.color_fc243b,
              fontWeight: FontWeight.w600,decoration: TextDecoration.none),),
        ),
        Container(color: ColorX.color_fc243b,height: 0.5.h,width: 150.w,),
        SizedBox(height: 10.h,),
        Text(shake.bonus.em() > 0 ? "${Intr().jiangjin}¥${shake.bonus}" : Intr().jiangjinfengfu,
          style: TextStyle(fontSize: 14.sp,color: ColorX.color_fc243b,fontWeight: FontWeight.w600,decoration: TextDecoration.none,),),
      ],
    );
  }

  Widget buildMultipleDraw(List<BetShakeEntity> result) {
    return Container(
      height: 100.h,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.h,),
            ...result.map((e) => buildMultipleItem("${Intr().cishu}${result.indexOf(e) + 1}","${Intr().jiangjin}¥${e.bonus.em()}")),
            // buildMultipleItem("${Intr().cishu}1","${Intr().jiangjin}¥15.8"),
            // buildMultipleItem("${Intr().cishu}2","${Intr().jiangjin}¥15.8"),
            // buildMultipleItem("${Intr().cishu}3","${Intr().jiangjin}¥15.8"),
            // buildMultipleItem("${Intr().cishu}4","${Intr().jiangjin}¥15.8"),
            // buildMultipleItem("${Intr().cishu}5","${Intr().jiangjin}¥15.8"),
          ],
        ),
      ),
    );
  }

  buildMultipleItem(String key, String value) {
    return Text.rich(TextSpan(
        children: [
          TextSpan(text: "$key  ",style: TextStyle(fontSize: 13.sp,color: ColorX.color_0d192d,decoration: TextDecoration.none,),),
          TextSpan(text: value,style: TextStyle(fontSize: 13.sp,color: ColorX.color_fc243b,decoration: TextDecoration.none,),),
        ]
    ));
  }




}