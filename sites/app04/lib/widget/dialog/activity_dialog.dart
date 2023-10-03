import 'package:aone_common/utils/colors.dart';
import 'package:app04/config/site_config.dart';
import 'package:app04/theme/color_schema.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ActivityDialog extends StatelessWidget {
  final Widget? child;
  final String? title;

  const ActivityDialog({
    Key? key,
    this.child,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Get.back();
        },
        child: Stack(
          children: [
            Center(
              child: Container(
                height: 403.r,
                width: 311.r,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(

                          ///TODU 需要ui 修改下图片
                          'assets/images/activity/${isSiteTagH09 ? 'h09_signin_activities_that_bg.png' : 'h18_signin_activities_that_bg.png'}'),
                      // 'assets/images/activity/h09_signin_activities_that_bg.png'),
                      fit: BoxFit.fill),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _title(),
                    Expanded(child: child ?? const SizedBox.shrink()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Container(
      height: 70.r,
      child: Center(
        child: Text(
          title ?? '标题',
          style: AppTheme.header,
        ),
      ),
    );
  }

  Widget _close() {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Image.asset(
        'assets/images/activity/h09_activity_task_dialog_close.png',
        height: 40.r,
        width: 40.r,
      ),
    );
  }
}
