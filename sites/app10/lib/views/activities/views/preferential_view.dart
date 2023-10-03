import 'package:aone_common/common.dart';
import 'package:app10/theme/color_schema.dart';
import 'package:app10/theme/theme_scaffold.dart';
import 'package:app10/views/activities/controllers/preferential_controller.dart';
import 'package:app10/widget/no_data.dart';
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
        backgroundColor: Colors.white,
        title: '我的优惠',
        body: Obx(getPageView),
      );
    });
  }

  Widget getPageView() {
    // var state = WelfareCenterLogic.to.state;
    return Column(
      children: [
        getHeadView(),
        if (controller.state.getRewardList.isEmpty)
          Padding(
            padding: EdgeInsets.only(top: 50.h),
            child: NoData(title: 'mine.yh.no.record'.tr),
          )
        else
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 10.r),
              itemCount: controller.state.getRewardList.length,
              itemBuilder: (_, index) {
                var item = controller.state.getRewardList[index];
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
        color: const Color(0xFFEBEBEB),
        borderRadius: BorderRadius.circular((5)),
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
                  "mine.yh.order".tr + getLimitString(item.orderNo ?? '', 25),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.0.sp,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  "mine.yh.type".tr + "${item.activityType}",
                  style: TextStyle(
                    color: Colors.black,
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
                      color: Colors.black,
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
              // width: 65.r,
              // height: 25.r,
              height: 27.r,
              padding: EdgeInsets.symmetric(horizontal: 5.r),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xFFC19E52),
                // gradient: AppTheme.primaryGradient,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                "￥${decimalString(item.award)}",
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
    return itemView;
  }

  Widget getHeadView() {
    // var amount = controller.state.activityAmount;
    return Container(
      margin: EdgeInsets.only(top: 13.r, left: 8.r, right: 8.r),
      padding: EdgeInsets.symmetric(horizontal: 12.r),
      height: 44.r,
      decoration: BoxDecoration(
          color: stringToColor('E6E6E6'),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                // Image.asset(
                //   'assets/images/user/user_money.png',
                //   width: 18,
                //   height: 18,
                // ),
                const Text("待领取奖励",
                    style: TextStyle(fontSize: 14, color: Color(0xff0B213B))),
                Text("￥" + controller.state.activityAmount.toString(),
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFE76F51))),
              ],
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              if (controller.state.activityAmount <= 0) {
                SmartDialog.showToast('暂无优惠领取');
              } else {
                controller.collectReward();
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 6.r, vertical: 3.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: const Color(0xFF94241E),
              ),
              child: Text(
                '一键领取',
                style: TextStyle(fontSize: 12.sp, color: Colors.white),
              ),
            ),
          )
        ],
      ),

      // Column(children: [
      //   Container(
      //     // margin: EdgeInsets.only(left: 1.r, top: 10.r),
      //     alignment: Alignment.topLeft,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         Container(
      //           child: Row(
      //             children: [
      //               // Image.asset(
      //               //   'assets/images/user/user_money.png',
      //               //   width: 18,
      //               //   height: 18,
      //               // ),
      //               const Text("待领取奖励",
      //                   style: TextStyle(
      //                       fontSize: 14, color: Color(0xff0B213B))),
      //               Text("￥" + amount.toString(),
      //                   style: const TextStyle(
      //                     fontSize: 18,
      //                     color: AppTheme.danger,
      //                   )),
      //             ],
      //           ),
      //         ),
      //         ThemeButton(
      //           width: 100.r,
      //           height: 25.r,
      //           backgroundColor: AppTheme.danger,
      //           gradient: null,
      //           radius: 4,
      //           onTap: () {
      //             controller.collectReward();
      //           },
      //           text: "一键领取",
      //         ),
      //       ],
      //     ),
      //   ),
      //   // Container(
      //   //   width: 359.r,
      //   //   padding: const EdgeInsets.only(top: 10),
      //   //   alignment: Alignment.center,
      //   //   child: Text("￥" + amount.toString(),
      //   //       style: const TextStyle(
      //   //         fontWeight: FontWeight.bold,
      //   //         fontSize: 18,
      //   //         color: AppTheme.primary,
      //   //       )),
      //   // )
      // ])
    );

    // return Container(
    //     width: 375.r,
    //     height: 50.r,
    //     margin: EdgeInsets.only(top: 13, left: 15.r, right: 15.r),
    //     padding: EdgeInsets.symmetric(horizontal: 15.r),
    //     child: Column(
    //       children: [
    //         Container(
    //             // margin: const EdgeInsets.only(top: 13, left: 8, right: 8),
    //             // padding: const EdgeInsets.symmetric(
    //             //   horizontal: 14,
    //             // ),
    //             // height: 45,
    //             decoration: BoxDecoration(
    //                 color: stringToColor('f2f5f8'),
    //                 borderRadius: BorderRadius.circular(8)),
    //             child: Column(children: [
    //               Container(
    //                 // margin: EdgeInsets.only(left: 1.r, top: 10.r),
    //                 alignment: Alignment.topLeft,
    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     Container(
    //                       child: Row(
    //                         children: [
    //                           // Image.asset(
    //                           //   'assets/images/user/user_money.png',
    //                           //   width: 18,
    //                           //   height: 18,
    //                           // ),
    //                           const Text("待领取奖励",
    //                               style: TextStyle(
    //                                   fontSize: 14, color: Color(0xff0B213B))),
    //                           Text("￥" + amount.toString(),
    //                               style: const TextStyle(
    //                                 fontSize: 18,
    //                                 color: AppTheme.danger,
    //                               )),
    //                         ],
    //                       ),
    //                     ),
    //                     ThemeButton(
    //                       width: 100.r,
    //                       height: 25.r,
    //                       backgroundColor: AppTheme.danger,
    //                       gradient: null,
    //                       radius: 4,
    //                       onTap: () {
    //                         controller.collectReward();
    //                       },
    //                       text: "一键领取",
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               // Container(
    //               //   width: 359.r,
    //               //   padding: const EdgeInsets.only(top: 10),
    //               //   alignment: Alignment.center,
    //               //   child: Text("￥" + amount.toString(),
    //               //       style: const TextStyle(
    //               //         fontWeight: FontWeight.bold,
    //               //         fontSize: 18,
    //               //         color: AppTheme.primary,
    //               //       )),
    //               // )
    //             ])),
    //       ],
    //     ));
  }
}
