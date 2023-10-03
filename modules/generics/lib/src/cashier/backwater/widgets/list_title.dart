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

class ListTitle extends StatelessWidget {
  const ListTitle({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final BetBackwaterController controller;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BetBackwaterController>(
        init: controller,
        builder: (controller) {
          List<LadderItems> dateList = controller.items ?? [];
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.w),
            scrollDirection: Axis.horizontal,
            child: Wrap(
              direction: Axis.horizontal,
              spacing: 8.w,
              children: dateList
                  .mapIndexed(
                    (e, i) => InkWell(
                      splashColor: Colors.transparent,
                      splashFactory: NoSplash.splashFactory,
                      onTap: () {
                        controller.setSelectIndex(i);
                      },
                      child: Container(
                        width: 64.w,
                        height: 36.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          gradient: i == controller.selectIndex
                              ? AoneAppTheme
                                      .appTheme.fsTitleSelectedBgGradient ??
                                  const LinearGradient(colors: [
                                    Color(0xff30652B),
                                    Color(0xff5A976C)
                                  ])
                              : AoneAppTheme
                                      .appTheme.fsTitleUnSelectedBgGradient ??
                                  const LinearGradient(colors: [
                                    Color(0xff000000),
                                    Color(0xff000000),
                                  ]),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6)),
                          border: i == controller.selectIndex
                              ? null
                              : Border.all(
                                  width: 1.r,
                                  color: AoneAppTheme
                                          .appTheme.fsTitleBorderColor ??
                                      const Color(0xff356B33),
                                ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              controller.getIconString(dateList[i].label ?? "",
                                  i == controller.selectIndex),
                              color: i == controller.selectIndex
                                  ? AoneAppTheme
                                          .appTheme.fsTitleSelectedColor ??
                                      const Color(0xff2B1D0E)
                                  : AoneAppTheme
                                          .appTheme.fsTitleUnSelectedColor ??
                                      const Color(0xffFFE1BE),
                              width: 18.w,
                              height: 18.w,
                              package: 'generics',
                            ),
                            SizedBox(width: 2.w),
                            Text(
                              dateList[i].label ?? "",
                              style: TextStyle(
                                fontSize: 14.w,
                                color: i == controller.selectIndex
                                    ? AoneAppTheme
                                            .appTheme.fsTitleSelectedColor ??
                                        const Color(0xff2B1D0E)
                                    : AoneAppTheme
                                            .appTheme.fsTitleUnSelectedColor ??
                                        const Color(0xffFFE1BE),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          );
        });
  }
}
