import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generics/generics.dart';

class ThemeCardCell extends StatelessWidget {
  final VoidCallback? onTap;
  final bool withDivider;
  final Widget? child;
  final bool small;

  const ThemeCardCell({
    Key? key,
    this.onTap,
    this.withDivider = false,
    this.child,
    this.small = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.card,
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.r),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: (small ? 2 : 5).r),
            decoration: BoxDecoration(
              border: withDivider
                  ? Border(
                      bottom: BorderSide(
                        color: RechargeTheme().cellDividerColor!,
                        width: 1,
                      ),
                    )
                  : null,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
