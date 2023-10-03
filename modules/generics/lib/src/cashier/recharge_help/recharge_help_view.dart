import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generics/generics.dart';
import 'package:generics/src/cashier/recharge_help/controllers/recharge_help_controller.dart';
import 'package:generics/src/cashier/recharge_online/widget/help_detail.dart';
import 'package:generics/src/cashier/widgets/recharge_scaffold.dart';
import 'package:generics/src/cashier/widgets/theme_card_cell.dart';
import 'package:get/get.dart';

class RechargeHelpView extends GetView<RechargeHelpController> {
  RechargeHelpView({Key? key}) : super(key: key);

  final RechargeTheme _theme = RechargeTheme();

  @override
  Widget build(BuildContext context) {
    return RechargeScaffold(
      title: '充值教程',
      backgroundColor: _theme.jiiaochengPageBg ?? _theme.backgroundColor,
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
                    color: _theme.helpItemBackgroundColor,
                    child: Padding(
                      padding: EdgeInsets.only(left: 15.r, right: 17.5.r),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            element.title!,
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: _theme.helpItemTextColor ??
                                    _theme.subTextColor,
                                fontWeight: FontWeight.normal),
                          ),
                          if (_theme.isShowQuestionIcon == true)
                            Image(
                              width: 9,
                              height: 12,
                              color: _theme.helpItemTextColor ??
                                  _theme.subTextColor,
                              image: const AssetImage(
                                  'assets/images/recharge_arrow_right.png',
                                  package: 'generics'),
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
