
import 'package:app04/theme/color_schema.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeCard extends StatelessWidget {
  final Widget? extra;
  final Widget? child;
  final String? title;
  final EdgeInsetsGeometry? margin;
  final bool transparent;
  final TextStyle? textStyle;
  const ThemeCard({
    Key? key,
    this.extra,
    this.child,
    this.title,
    this.margin,
    this.transparent = false,
    this.textStyle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: margin ?? EdgeInsets.only(bottom: 15.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: textStyle==null?EdgeInsets.symmetric(horizontal: 12.r):EdgeInsets.symmetric(horizontal: 0.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                if (title != null)
                  Text(
                    title!,
                    style: textStyle ?? AppTheme.header2,
                  ),
                extra ?? const SizedBox.shrink(),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 4.r),
            decoration: BoxDecoration(
              color: transparent ? Colors.transparent : AppTheme.cardBg,
              borderRadius: BorderRadius.circular(8.r),
              boxShadow: [
                if (!transparent)
                const BoxShadow(
                  color: AppTheme.shadowColor,
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
