import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../data/recharge_theme.dart';

class ThemeCard extends StatelessWidget {
  final Widget? extra;
  final Widget? child;
  final String? title;
  final EdgeInsetsGeometry? margin;
  final bool transparent;
  final TextStyle? textStyle;
  const ThemeCard(
      {Key? key,
      this.extra,
      this.child,
      this.title,
      this.margin,
      this.transparent = false,
      this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.only(bottom: 20.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: textStyle == null
                ? EdgeInsets.symmetric(horizontal: 12.r)
                : EdgeInsets.symmetric(horizontal: 0.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                if (title != null)
                  Text(
                    title!,
                    style: textStyle ??
                        TextStyle(
                          fontSize: 13.sp,
                          color: RechargeTheme().mainTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                extra ?? const SizedBox.shrink(),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 4.r),
            decoration: BoxDecoration(
              color: transparent
                  ? Colors.transparent
                  : RechargeTheme().cardBackgroundColor,
              borderRadius: BorderRadius.circular(8.r),
              boxShadow: [
                if (!transparent)
                  const BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0),
                    blurRadius: 5,
                  ),
              ],
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}
