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
          top: 90,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Container(
                height: 346.h,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/images/activity/activity_task_green_dialog_bg.png',
                  ),
                )),
                child: Column(
                  children: [
                    SizedBox(
                      height: 58.w,
                    ),
                    Expanded(child: child),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              GestureDetector(
                onTap: () => Get.back(),
                child: SizedBox(
                  height: 40.h,
                  width: 40.w,
                  child: Image.asset(
                    'assets/images/activity/activity_task_green_dialog_close.png',
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          left: 30,
          right: 30,
          top: -10.h,
          child: Container(
              height: 130.h,
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/activity/activity_task_green_dialog_title.png',
                ),
              )),
              child: Padding(
                padding: const EdgeInsets.only(top: 60),
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
          child: Text(
            title,
            style: const TextStyle(fontSize: 24, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
