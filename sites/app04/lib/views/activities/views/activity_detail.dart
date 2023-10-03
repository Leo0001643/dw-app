import 'package:animations/animations.dart';
import 'package:aone_common/common.dart';
import 'package:aone_widget/aone_widget.dart';
import 'package:app04/theme/theme_scaffold.dart';
import '../widgets/apply_activity_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/color_schema.dart';
import '../controllers/activity_detail_controller.dart';

class ActivityDetail extends GetView<ActivityDetailController> {
  const ActivityDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ActivityDetailController());

    ActivityInfo info = Get.arguments;
    return ThemeScaffold(
      title: info.title,
      floatingActionButton: _applyButton(info),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HtmlRenderer(
              data: info.qtAppContent,
            ),
          ],
        ),
      ),
    );
  }

  Widget? _applyButton(ActivityInfo info) {
    if (info.type != 6) return null;

    return OpenContainer(
      closedShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(100),
        ),
      ),
      closedElevation: 6.0,
      transitionDuration: const Duration(milliseconds: 375),
      closedColor: AppTheme.primary,
      closedBuilder: (context, builder) {
        return FloatingActionButton(
          onPressed: builder,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.create_rounded,
              ),
              Text(
                '申请',
                style: TextStyle(
                  fontSize: 10.sp,
                ),
              ),
            ],
          ),
        );
      },
      openBuilder: (context, builder) {
        return ApplyActivityDialog(activityInfo: info);
      },
    );
  }
}
