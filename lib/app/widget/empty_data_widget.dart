

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';

class EmptyDataWidget extends StatelessWidget{

  var iconWidth = 150.0;
  var iconHeight = 150.0;

  EmptyDataWidget({required this.iconWidth, required this.iconHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: iconWidth,
      height: iconHeight,
      alignment: Alignment.center,
      child: Text(Intr().no_more, style: TextStyle(fontSize: 15.sp,color: ColorX.color_333333),),
    );
  }

}


