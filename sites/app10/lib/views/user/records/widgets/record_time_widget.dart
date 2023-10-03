import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../theme/color_schema.dart';

class RecordTimeWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final GestureTapCallback onTap;
  final String title;
  const RecordTimeWidget(
      {Key? key,
      this.width,
      this.height,
      required this.onTap,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // width: width ?? (Get.width - 20 - 100) / 2,
        height: height ?? 30.r,
        alignment: Alignment.center,
        // padding: const EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
        decoration: BoxDecoration(
          color: AppTheme.onPrimary,
          borderRadius: const BorderRadius.all(
              Radius.circular(AppTheme.filterBorderRadius)),
          border: Border.all(width: 1, color: AppTheme.borderColor),
        ),
        child: GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/user/user_clock.png',
                width: 12.r,
                height: 12.r,
              ),
              SizedBox(
                width: 5.r,
              ),
              Text(title,
                  style: TextStyle(
                      fontSize: 10.sp, color: AppTheme.normalTextColor))
            ],
          ),
        ));
  }
}
