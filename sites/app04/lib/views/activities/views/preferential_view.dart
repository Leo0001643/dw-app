import 'package:aone_common/common.dart';
import 'package:app04/theme/color_schema.dart';
import 'package:app04/theme/theme_scaffold.dart';
import 'package:app04/views/activities/controllers/preferential_controller.dart';
import 'package:app04/widget/no_data.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../../widget/misc/theme_button.dart';

class PreferentialView extends GetView<PreferentialController> {
  const PreferentialView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PreferentialController>(builder: (_) {
      return ThemeScaffold(
        title: '我的优惠',
        body: Obx(getPageView),
      );
    });
  }

  Widget getPageView() {
    var state = WelfareCenterLogic.to.state;
    return Column(
      children: [
        getHeadView(),
        if (state.getRewardList.isEmpty)
          NoData(title: 'mine.yh.no.record'.tr)
        else
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 10.r),
              itemCount: state.getRewardList.length,
              itemBuilder: (_, index) {
                var item = state.getRewardList[index];
                return _getMiddleView(item, index);
              },
            ),
          )
      ],
    );
  }

  Widget _getMiddleView(ActivityRewardList item, int index) {
    Widget itemView = Container(
      // height: 65.r,
      margin: EdgeInsets.all(10.r),
      padding: EdgeInsets.all(7.5.r),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFF2F5F8), width: 1),
        color: const Color(0xFFF2F5F8),
        borderRadius: BorderRadius.circular((4)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Clipboard.setData(ClipboardData(text: item.orderNo));
              SmartDialog.showToast('user.center.success.copy'.tr);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "mine.yh.order".tr + "${item.orderNo}",
                  style: TextStyle(
                    color: const Color(0xff000000),
                    fontSize: 12.0.sp,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  "mine.yh.type".tr + "${item.activityType}",
                  style: TextStyle(
                    color: AppTheme.primary,
                    fontSize: 12.0.sp,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const SizedBox(height: 3),
                if (item.expired != 0)
                  Text(
                    "mine.yh.expirationtime".tr +
                        "${timeStampIntToSecond(item.expired!)}",
                    style: TextStyle(
                      color: AppTheme.primary,
                      fontSize: 12.0.sp,
                    ),
                  ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              controller.collectRewardById(item.id ?? 0);
            },
            child: Container(
              width: 65.r,
              height: 25.r,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: AppTheme.primaryGradient,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "￥${decimalString(item.award)}",
                style: const TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
    return itemView;
  }

  Widget getHeadView() {
    var amount = WelfareCenterLogic.to.state.activityAmount;
    print('待领取  = ${amount}');
    return Container(
      width: 375.r,
      child: Container(
          child: Column(
        children: [
          Container(
              margin: const EdgeInsets.only(top: 13, left: 8, right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 14),
              height: 88,
              decoration: BoxDecoration(
                  color: stringToColor('f2f5f8'),
                  borderRadius: BorderRadius.circular(8)),
              child: Column(children: [
                Container(
                  margin: EdgeInsets.only(left: 1.r, top: 10.r),
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/user/user_money.png',
                              width: 18,
                              height: 18,
                            ),
                            const Text("待领取奖励",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Color(0xff0B213B)))
                          ],
                        ),
                      ),
                      ThemeButton(
                        width: 100.r,
                        height: 25.r,
                        radius: 10,
                        backgroundColor:
                            AoneAppTheme.appTheme.myOfferReceiveBtnColor!,
                        onTap: () {
                          controller.collectReward();
                        },
                        text: "一键领取",
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 359.r,
                  padding: const EdgeInsets.only(top: 10),
                  alignment: Alignment.center,
                  child: Text("￥" + amount.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: AppTheme.primary,
                      )),
                )
              ])),
        ],
      )),
    );
  }
}
