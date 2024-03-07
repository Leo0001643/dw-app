

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/bean/check_point_entity.dart';
import 'package:leisure_games/ui/main/home/sign_in/sign_in_logic.dart';

///确认注单
class SignSuccessDialog extends StatefulWidget{

  final SignInLogic logic;
  final CheckPointEntity check;
  const SignSuccessDialog(this.logic, this.check,{super.key});

  @override
  State<StatefulWidget> createState() =>StateConfirmBetDialog();
}

class StateConfirmBetDialog extends State<SignSuccessDialog> with SingleTickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImageX.point,width: 126.r,height: 126.r,fit: BoxFit.fill,),
          SizedBox(height: 10.h,),
          Text(Intr().qiandaochenggong,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 28.sp,color: Colors.white),),
          SizedBox(height: 20.h,),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(Intr().yiqiandao,style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w900,color: Colors.white),),
              SizedBox(width: 10.w,),
              Text("${widget.check.chekNum.em()}",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w900,color: Colors.white),),
            ],
          ),
          Text.rich(TextSpan(
              children: [
                TextSpan(text: Intr().bencijiangli,style: TextStyle(fontSize: 18.sp,color: Colors.white,),),
                TextSpan(text: "${widget.check.point}",style: TextStyle(fontSize: 18.sp,color: ColorX.color_fc243b,),),
                TextSpan(text: Intr().jifen,style: TextStyle(fontSize: 18.sp,color: Colors.white,),),
              ]
          )),
          SizedBox(height: 20.h,),

          Text("${Intr().benyueleijiqiandao}${widget.check.chekNum.em()}${Intr().jiajifen}${widget.check.pointTotal}${Intr().jifen}",
            style: TextStyle(fontSize: 14.sp,color: Colors.white,),),
          Text.rich(TextSpan(
              children: [
                TextSpan(text: Intr().zaiqiandao,style: TextStyle(fontSize: 18.sp,color: Colors.white,),),
                TextSpan(text: "${widget.check.nextCheckNum.em()}",style: TextStyle(fontSize: 18.sp,color: ColorX.color_fc243b,),),
                TextSpan(text: Intr().kehuode,style: TextStyle(fontSize: 18.sp,color: Colors.white,),),
                TextSpan(text: "${widget.check.nextPoint.em()}",style: TextStyle(fontSize: 18.sp,color: ColorX.color_fc243b,),),
                TextSpan(text: Intr().jifen,style: TextStyle(fontSize: 18.sp,color: Colors.white,),),
              ]
          )),
          SizedBox(height: 25.h,),
          WidgetUtils().buildElevatedButton(Intr().confirm, 233.w, 48.h, bg: ColorX.color_fc9824,onPressed: (){
            Navigator.of(context).pop();
          }),
        ],
      ),
    );
  }




}



