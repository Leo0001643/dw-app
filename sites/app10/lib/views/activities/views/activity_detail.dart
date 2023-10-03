import 'package:animations/animations.dart';
import 'package:aone_common/common.dart';
import 'package:aone_widget/aone_widget.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import '../../../app_service.dart';
import '../../../theme/theme_scaffold.dart';
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
            Container(
              width: Get.width,
              alignment: Alignment.center,
              child: HtmlRenderer(data: info.qtAppContent,
                shrinkWrap: true,
                onLinkTap: (String? url, RenderContext context,
                    Map<String, String> attributes, element) {
                  if (url != null) {
                    AppService.to.openUrl(url!);
                  }
                },
                style: {
                  'p': Style(
                    color: Colors.white,
                  ),
                  "table": Style(
                    width: Width.auto(),
                    height: Height.auto(),
                    color: Colors.white,
                    // border: Border.all(
                    //     width: 0.5, color: Colors.white)
                  ),
                  "tr": Style(
                      width: Width.auto(),
                      height: Height.auto(),
                      color: Colors.white,
                      border:
                      Border.all(width: 1, color: Colors.white)),
                  "th": Style(
                    width: Width.auto(),
                    height: Height.auto(),
                    color: Colors.white,
                    backgroundColor: Colors.white,
                  ),
                  "td": Style(
                      width: Width.auto(),
                      height: Height.auto(),
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4)),
                },
              ),
            )
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
          onPressed: () {
            if (!UserService.to.state.isRegularUser) {
              SmartDialog.showToast('请登录正式账号');
              return;
            }
            builder();
          },
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
