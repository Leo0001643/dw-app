import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ThemeButton extends StatelessWidget {
  final double height;
  final String? text;
  final Widget? child;

  final bool block;
  final bool fullWidth;
  final double? width;
  final VoidCallback onTap;

  final double? radius;

  final Gradient? gradient;
  final Color? backgroundColor;
  final BoxDecoration? boxDecoration;
  final Color? textColor;

  const ThemeButton(
      {Key? key,
      this.height = 40,
      this.block = false,
      this.fullWidth = false,
      required this.onTap,
      this.text,
      this.child,
      this.radius,
      this.backgroundColor,
      this.width,
      this.boxDecoration,
      this.textColor})
      : gradient = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff13805E),
            Color(0xff06C285),
          ],
        ),
        super(key: key);

  // const ThemeButton.neutral({
  //   Key? key,
  //   this.height = 40,
  //   this.block = false,
  //   this.fullWidth = false,
  //   required this.onTap,
  //   this.text,
  //   this.child,
  //   this.radius,
  //   this.gradient,
  //   this.width,
  // })  : backgroundColor = const Color.fromRGBO(140, 140, 140, 0.7),
  //       super(key: key);

  double? _setWidth(BuildContext context) {
    if (block) {
      return context.width * 0.88;
    }
    if (fullWidth) {
      return double.infinity;
    }
    return width;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: _setWidth(context),
      decoration: boxDecoration,
      //
      // BoxDecoration(
      //   gradient: gradient,
      //   color: backgroundColor,
      //   borderRadius: BorderRadius.circular((radius ?? 5).r),
      // ),
      child: ElevatedButton(
        onPressed: () {
          onTap.call();
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              (radius ?? 5).r,
            ),
          ),
        ),
        child: child ??
            Text(
              text ?? 'submit'.tr,
              style: TextStyle(fontSize: 12, color: textColor),
            ),
      ),
    );
  }
}
