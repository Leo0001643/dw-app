import 'package:aone_common/common.dart';
import 'package:app04/theme/color_schema.dart';
import 'package:app04/theme/theme_scaffold.dart';
import 'package:app04/views/user/recharge_help/controllers/recharge_help_controller.dart';
import 'package:app04/views/user/recharge_online/widget/help_detail.dart';
import 'package:app04/widget/misc/theme_card.dart';
import 'package:app04/widget/misc/theme_card_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RechargeHelpView extends GetView<RechargeHelpController> {
  const RechargeHelpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeScaffold(
      backgroundColor: AppTheme.undeer_line_color,
      title: '充值教程',
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: 5.r,
        ).copyWith(
          bottom: context.mediaQueryViewPadding.bottom + 15.r,
        ),
        child: Container(
          child: Obx(
            () => Column(
              children: controller.tutorials.mapIndexed((element, index) {
                printInfo(info: "david----->${element.title}");
                return ThemeCardCell(
                  small: false,
                  onTap: () => Get.to(
                    HelpDetailView(
                      title: element.title ?? "",
                      content: element.body!,
                    ),
                  ),
                  child: Container(
                    height: 40.r,
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.only(left: 15.r, right: 17.5.r),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            element.title!,
                            style: AppTheme.header14And66666,
                          ),
                          const Image(
                            width: 9,
                            height: 12,
                            image: AssetImage(
                              'assets/images/user/recharge_arrow_right.png',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
