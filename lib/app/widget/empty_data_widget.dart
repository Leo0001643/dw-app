

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leisure_games/app/res/imagex.dart';

class EmptyDataWidget extends StatelessWidget{

  var iconWidth = 150.0;
  var iconHeight = 150.0;
  String text;

  EmptyDataWidget({required this.iconWidth, required this.iconHeight,this.text = "暂无游戏~"});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(ImageX.icon_empty,width: iconWidth,height: iconHeight,),
        SizedBox(height: 10.h,),
        Text(text, style: TextStyle(fontSize: 13.sp,color: Colors.black54),),
      ],
    );
  }

}


