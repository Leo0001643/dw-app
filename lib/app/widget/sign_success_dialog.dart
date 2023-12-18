

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/main/home/sign_in/sign_in_logic.dart';

///确认注单
class SignSuccessDialog extends StatefulWidget{

  final SignInLogic logic;
  SignSuccessDialog(this.logic, {super.key});

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
          Text.rich(TextSpan(
            children: [
              TextSpan(text: Intr().bencijiangli,style: TextStyle(fontSize: 18.sp,color: Colors.white,decoration: TextDecoration.none,),),
              TextSpan(text: " 6 ",style: TextStyle(fontSize: 28.sp,color: Colors.white,decoration: TextDecoration.none,),),
              TextSpan(text: Intr().jifen,style: TextStyle(fontSize: 18.sp,color: Colors.white,decoration: TextDecoration.none,),),
            ]
          )),
          Text(Intr().gongxiwancheng,style: TextStyle(fontSize: 14.sp,color: Colors.white,decoration: TextDecoration.none,),),
          Text(Intr().xiaciqiandao([" +1"," 7 "]),style: TextStyle(fontSize: 14.sp,color: Colors.white,decoration: TextDecoration.none,),),
          SizedBox(height: 25.h,),
          WidgetUtils().buildElevatedButton(Intr().mingtianjixue, 233.w, 48.h, bg: ColorX.color_fc9824,onPressed: (){
            Navigator.of(context).pop();
          }),
        ],
      ),
    );
  }




}



