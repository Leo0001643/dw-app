import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../theme/color_schema.dart';

class InvalidActivityPopup extends StatelessWidget {
  const InvalidActivityPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Get.back,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Center(
              child: Image.asset(
                'assets/images/activity/${AppTheme.siteTag}_invalid_activity_bg.png',
              ),
            ),
          ),
          Positioned(
            top: AppTheme.activityInvalidPopupTitleHeight,
            bottom: 0,
            child: _title(),
          ),
          Transform.translate(
            offset: Offset(0, 55.r),
            child: Text(
              '活动目前尚未开放',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.sp,
                color: AppTheme.activityInvalidPopupContent,
              ),
            ),
          ),
          Positioned(
            top: 310,
            bottom: 0,
            child: GestureDetector(
                onTap: () => Get.back(),
                child: SizedBox(
                  height: 40.h,
                  width: 40.w,
                  child: Image.asset(
                    'assets/images/activity/${AppTheme.siteTag}_activity_task_dialog_close.png',
                  ),
                )),
          ),
        ],
      ),
    );
  }

  Widget _title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(right: 10.r),
          width: 35.r,
          height: 4.r,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.transparent,
                Colors.transparent,
              ],
            ),
          ),
        ),
        Text(
          '活动通知',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppTheme.activityInvalidPopupTitle,
            fontWeight: FontWeight.w500,
            fontSize: 24.sp,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10.r),
          width: 35.r,
          height: 4.r,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
                Colors.transparent,
                Colors.transparent,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
