

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';

class EmptyDataWidget extends StatelessWidget{

  var width = 150.0;
  var height = 150.0;

  EmptyDataWidget({required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      child: Text(Intr().no_more, style: TextStyle(fontSize: 15.sp,color: ColorX.color_333333),),
    );
  }

}


