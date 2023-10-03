import 'package:aone_common/common.dart';
import 'package:aone_common/data/model/entities/user/ladder_fs.dart';
import 'package:aone_common/utils/date_time.dart';
import 'package:aone_common/utils/history.dart';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generics/src/cashier/backwater/bet_backwater_detail_page.dart';
import 'package:generics/src/cashier/backwater/bet_backwater_history_controller.dart';
import 'package:generics/src/cashier/backwater/widgets/list_item_backwater.dart';
import 'package:generics/src/cashier/start_recharge/widget/no_data.dart';
import 'package:generics/src/cashier/utils/dj_image.dart';
import 'package:generics/src/cashier/utils/theme_scaffold.dart';
import 'package:get/get.dart';

class ListHeader extends StatelessWidget {
  const ListHeader({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final BetBackwaterController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96.w,
      margin: EdgeInsets.fromLTRB(24.w, 12.w, 24.w, 4.w),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AoneAppTheme.appTheme.fsHeaderCardBgColor ?? Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Text(
                    topTitle,
                    style: TextStyle(
                      color:
                          AoneAppTheme.appTheme.fsPrimaryColor ?? Colors.black,
                      fontSize: 14.w,
                    ),
                  ),
                  Text(
                    topTitleValue,
                    style: TextStyle(
                      color:
                          AoneAppTheme.appTheme.fsPrimaryColor ?? Colors.black,
                      fontSize: 14.w,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    bottomTitle,
                    style: TextStyle(
                      color:
                          AoneAppTheme.appTheme.fsPrimaryColor ?? Colors.black,
                      fontSize: 14.w,
                    ),
                  ),
                  Text(
                    bottomTitleValue,
                    style: TextStyle(
                      color:
                          AoneAppTheme.appTheme.fsPrimaryColor ?? Colors.black,
                      fontSize: 14.w,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (controller.isShowBackWater) ...[
                _buildButton(
                  '一键领取',
                  onTap: () => controller.collectRebate(),
                ),
                SizedBox(height: 8.w),
              ],
              _buildButton(
                '返水记录',
                onTap: () => Get.toNamed(Routes.rebateRecord),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String get topTitle => controller.fsEntity?.fsType == 1
      ? '已返水金额：'
      : controller.fsEntity?.fsType == 2
          ? "总有效投注："
          : "昨日有效投注：";

  String get topTitleValue =>
      "￥ ${controller.fsEntity?.fsType == 1 ? decimalString(controller.hasGetMoney) : controller.fsEntity?.fsType == 2 ? decimalString(controller.fsEntity?.betValidTotal ?? 0) : decimalString(controller.fsEntity?.betValidTotal ?? 0)}";

  String get bottomTitle => controller.fsEntity?.fsType == 1
      ? '待返水金额：'
      : controller.fsEntity?.fsType == 2
          ? "总返水金额："
          : "昨日返水金额：";

  String get bottomTitleValue =>
      '￥ ${controller.fsEntity?.fsType == 1 ? decimalString(controller.unGetMoney) : controller.fsEntity?.fsType == 2 ? decimalString(((double.tryParse(controller.fsEntity?.receive ?? '0.0') ?? 0) + (double.tryParse(controller.fsEntity?.unReceive ?? '0.0') ?? 0))) : decimalString(controller.fsEntity?.receive ?? 0)}';

  InkWell _buildButton(String title, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 32.w,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            gradient: AoneAppTheme.appTheme.fsButtonGradient ??
                const LinearGradient(
                  colors: [Color(0xff30652B), Color(0xff5A976C)],
                ),
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14.w,
              color: AoneAppTheme.appTheme.fsButtonTextColor ?? Colors.white,
            ),
          )),
    );
  }
}
