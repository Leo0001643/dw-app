import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

/// 信封样式弹窗
class EnvelopeDialog extends StatelessWidget {
  final Widget child;
  final String title;
  final double titleHeight;
  final Offset? titleOffset;

  const EnvelopeDialog({
    Key? key,
    required this.child,
    this.titleOffset,
    this.title = 'title',
    this.titleHeight = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 150.r,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Center(
                child: Container(
                  height: 348.r,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      'assets/images/activity/task_center/dialog_bg.png',
                    ),
                  )),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 75.r,
                      ),
                      Expanded(child: child),
                      SizedBox(
                        height: 25.r,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.r,
              ),
              GestureDetector(
                onTap: () => Get.back(),
                child: SizedBox(
                  height: 40.r,
                  width: 40.r,
                  child: Image.asset(
                    'assets/images/activity/task_center/dialog_close.png',
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          left: 30,
          right: 30,
          top: 45.r,
          child: Center(
              child: Padding(
            padding: EdgeInsets.only(top: 115.r),
            child: _buildTitle(),
          )),
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return SizedBox(
      height: titleHeight.h,
      child: Center(
        child: Transform.translate(
          offset: titleOffset ?? Offset(0, -titleHeight * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/activity/task_center/task_center_line_left.png',
                width: 38.r,
              ),
              SizedBox(
                width: 4.r,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 23.sp,
                    color: AoneAppTheme.appTheme.tcDialogTitleColor),
              ),
              SizedBox(
                width: 4.r,
              ),
              Image.asset(
                'assets/images/activity/task_center/task_center_line_right.png',
                width: 38.r,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
