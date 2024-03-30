
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/res/colorx.dart';

class FocusContainer extends StatefulWidget {
  final Widget? child;
  final double? width;
  final EdgeInsetsGeometry? padding;
  FocusContainer({super.key,this.child,this.width,this.padding});

  @override
  State<StatefulWidget> createState() => StateFocusContainer();
}

class StateFocusContainer extends State<FocusContainer>{

  var hasFocus = false.obs;

  @override
  Widget build(BuildContext context) {
    return FocusableActionDetector(
      onFocusChange: (value){
        hasFocus.value = value;
      },
      child: Obx(() {
        return Container(
          width: widget.width,
          padding: widget.padding,
          decoration: BoxDecoration(
            color: ColorX.cardBg3(),
            borderRadius: BorderRadius.circular(10.r),
            border: hasFocus.value ? Border.all(color: ColorX.textBlack(), width: 1.w)
                :null,
          ),
          child: widget.child,
        );
      }),
    );
  }

}
