import 'package:aone_common/utils/colors.dart';
import 'package:app10/theme/color_schema.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ActivityDialogSureCancel extends StatelessWidget {
  final Widget? child;
  final String? title;
  double? height;
  double? width;
  ActivityDialogSureCancel({
    Key? key,
    this.child,
    this.title,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: this.height ?? 403.r,
          width: this.width ?? 311.r,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'assets/images/activity/signin_activities_that_bg.png'),
                fit: BoxFit.fill),
          ),
          child: Column(
            children: [
              _title(),
              Expanded(child: Center(child: child ?? const SizedBox.shrink())),
            ],
          ),
        ),
      ],
    );
  }

  Widget _title() {
    return Container(
      height: 40.r,
      // color: Colors.tealAccent,
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
        'assets/images/activity/activity_task_green_dialog_close.png',
        height: 40.r,
        width: 40.r,
      ),
    );
  }
}
