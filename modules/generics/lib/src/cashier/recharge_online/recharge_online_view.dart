import 'package:aone_common/common.dart';
import 'package:aone_widget/aone_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:generics/generics.dart';
import 'package:generics/src/cashier/recharge_online/controllers/recharge_online_controller.dart';
import 'package:generics/src/cashier/start_recharge/controller/recharge_controller.dart';
import 'package:generics/src/cashier/widgets/recharge_scaffold.dart';
import 'package:get/get.dart';

import 'widget/amount_input.dart';

class RechargeOnlineView extends GetView<RechargeOnlineController> {
  const RechargeOnlineView({Key? key}) : super(key: key);

  // static const String unSelectBG = 'assets/images/recharge/unselect_icon.png';
  // static const String selectBG = 'assets/images/recharge/select_icon_1.png';

  @override
  Widget build(BuildContext context) {
    final RechargeTheme _theme = RechargeTheme();

    return WillPopScope(
      onWillPop: () async {
        Get.delete<RechargeOnlineController>();
        return true;
      },
      child: RechargeScaffold(
        title: '线上支付',
        backgroundColor: _theme.backgroundColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.r),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: 15.r,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _payTitle(),
                _payChannel(),
                _amount(),
                _promotion(),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 12.r),
                //   child: _tips(),
                // ),
                Padding(
                  padding: EdgeInsets.only(top: 0.r),
                  child: GestureDetector(
                    onTap: controller.onBeforeSubmit,
                    child: Container(
                      width: double.infinity,
                      height: 36.r,
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(
                          horizontal: 12.r, vertical: 30.r),
                      decoration: RechargeTheme().normalButtonDecoration,
                      child: Text(
                        "确认充值",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: RechargeTheme().normalButtonTextColor,
                        ),
                      ),
                    ),
                  ),
                  // child: ThemeButton(
                  //   block: true,
                  //   onTap: controller.onBeforeSubmit,
                  // ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _payChannel() {
    final RechargeTheme _theme = RechargeTheme();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 12.r, bottom: 10.r),
          child: Text(
            "1、请选择支付通道",
            style: TextStyle(color: RechargeTheme().subTextColor),
          ),
        ),
        Obx(() {
          if (controller.channelList.isEmpty) {
            return const SizedBox.shrink();
          }
          return controller.channelList.isNotEmpty
              ? Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 12.r, vertical: 15.r),
                  constraints: BoxConstraints(maxHeight: 293.r),
                  child: SingleChildScrollView(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: controller.channelList.mapIndexed((item, index) {
                      Color selectCard = controller.activeChannelIndex == index
                          ? _theme.channelSelectedColor!
                          : _theme.channelUnSelectedColor!;

                      return Padding(
                        padding: controller.channelList.length - 1 != index
                            ? EdgeInsets.only(bottom: 10.r)
                            : EdgeInsets.zero,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(5.r),
                          onTap: () => controller.activeChannelIndex = index,
                          child: Ink(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: (item.beizhu == null || item.beizhu!.isEmpty)
                                ? _channelNoBeiZhuView(selectCard, index, item)
                                : _channelBeiZhuView(selectCard, index, item),
                          ),
                        ),
                      );
                    }).toList(),
                  )),
                )
              : Text(
                  '暂无通道可选',
                  style: TextStyle(
                      color: RechargeTheme().mainTextColor, fontSize: 14.sp),
                );
        }),
      ],
    );
  }

  Widget _channelBeiZhuView(
      Color selectCard, int index, OnlineProductChannel item) {
    final _theme = RechargeTheme();
    return IntrinsicHeight(
      child: Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: _theme.channelBackgroundColor,
              borderRadius: BorderRadius.all(
                Radius.circular(5.r),
              ),
              border: Border.all(color: selectCard, width: 1)),
          child: Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: 40.r,
                decoration: BoxDecoration(
                  color: selectCard,
                ),
                child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "${index + 1}",
                      style: TextStyle(color: _theme.primary! ?? Colors.black),
                    ),
                    width: 22.r,
                    height: 22.r,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(11.r),
                      ),
                      border: Border.all(
                          color: _theme.primary! ?? Colors.black, width: 1),
                    )),
              ),
              SizedBox(
                width: 12.r,
              ),
              Container(
                margin: EdgeInsets.only(top: 5.r, bottom: 5.r),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          onlineChannelInfoNumber(item, index + 1),
                          style: TextStyle(
                              fontSize: 14,
                              color: _theme.mainTextColor ?? Colors.black,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "（单笔限额:",
                          style: TextStyle(
                            fontSize: 14,
                            color: _theme.mainTextColor ?? Colors.black,
                          ),
                        ),
                        Text(
                          onlineChannelInfoLimit(item, index + 1),
                          style: TextStyle(
                              fontSize: 14,
                              color: _theme.dangerColor ?? Colors.red,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          " ）",
                          style: TextStyle(
                              fontSize: 14,
                              color: _theme.mainTextColor ?? Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 250.r,
                      child: HtmlWidget(
                        item.beizhu ?? "",
                        renderMode: RenderMode.column,
                        textStyle:
                            TextStyle(fontSize: 12, color: _theme.subTextColor),
                        // HtmlRenderer(
                        //   data: item.beizhu ?? "",
                        //   style: {
                        //     'p': Style(
                        //       color: RechargeTheme().onPrimary,
                        //     ),
                        //   },
                        // ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }

  Widget _channelNoBeiZhuView(
      Color selectCard, int index, OnlineProductChannel item) {
    final _theme = RechargeTheme();
    return Container(
        height: 40.r,
        alignment: Alignment.centerLeft,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: _theme.channelBackgroundColor,
            borderRadius: BorderRadius.all(
              Radius.circular(5.r),
            ),
            border: Border.all(color: selectCard, width: 1)),
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              width: 40.r,
              decoration: BoxDecoration(
                color: selectCard,
              ),
              child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "${index + 1}",
                    style: TextStyle(color: _theme.primary!),
                  ),
                  width: 22.r,
                  height: 22.r,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(11.r),
                    ),
                    border: Border.all(color: _theme.primary!, width: 1),
                  )),
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              onlineChannelInfoNumber(item, index + 1),
              style: TextStyle(
                  fontSize: 14,
                  color: RechargeTheme().mainTextColor ?? Colors.black,
                  fontWeight: FontWeight.w700),
            ),
            Row(
              children: [
                Text(
                  "（单笔限额:",
                  style: TextStyle(fontSize: 14, color: _theme.mainTextColor),
                ),
                Text(
                  onlineChannelInfoLimit(item, index + 1),
                  style: TextStyle(
                      fontSize: 14,
                      color: _theme.dangerColor,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "）",
                  style: TextStyle(fontSize: 14, color: _theme.mainTextColor),
                ),
              ],
            )
            // Text(
            //   onlineChannelInfo(item, index + 1),
            //   maxLines: 1,
            //   overflow: TextOverflow.ellipsis,
            //   style: TextStyle(
            //     fontSize: 11.sp,
            //     color: AppTheme.primary,
            //   ),
            // ),
          ],
        ));
  }

  // Widget _channelNoBeiZhuView(Color selectCard, int index, OnlineProductChannel item) {
  //   final _theme = RechargeTheme();
  //
  //   return Container(
  //       height: 40.r,
  //       alignment: Alignment.centerLeft,
  //       decoration: BoxDecoration(
  //           color: _theme.channelBackgroundColor,
  //           borderRadius: BorderRadius.all(
  //             Radius.circular(5.r),
  //           ),
  //           border: Border.all(color: selectCard, width: 1)),
  //       child: Row(
  //         children: [
  //           Container(
  //             alignment: Alignment.center,
  //             // height: 88.r,
  //             decoration: BoxDecoration(
  //               //         ? selectBG
  //               //         : unSelectBG,
  //               color: selectCard,
  //             ),
  //             child: Container(
  //                 alignment: Alignment.center,
  //                 child: Text(
  //                   "${index + 1}",
  //                   style: TextStyle(color: _theme.primary!),
  //                 ),
  //                 width: 22.r,
  //                 height: 22.r,
  //                 decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.all(
  //                     Radius.circular(11.r),
  //                   ),
  //                   border: Border.all(color: _theme.primary!, width: 1),
  //                 )),
  //           ),
  //           const SizedBox(
  //             width: 12,
  //           ),
  //           Row(
  //             children: [
  //               Text(
  //                 "单笔限额:",
  //                 style: TextStyle(
  //                   fontSize: 14,
  //                   color: _theme.mainTextColor,
  //                 ),
  //               ),
  //               Text(
  //                 onlineChannelInfoLimit(item, index + 1),
  //                 style: TextStyle(fontSize: 14, color: RechargeTheme().dangerColor, fontWeight: FontWeight.w700),
  //               ),
  //             ],
  //           )
  //           // Text(
  //           //   onlineChannelInfo(item, index + 1),
  //           //   maxLines: 1,
  //           //   overflow: TextOverflow.ellipsis,
  //           //   style: TextStyle(
  //           //     fontSize: 11.sp,
  //           //     color: AppTheme.primary,
  //           //   ),
  //           // ),
  //         ],
  //       ));
  // }
  //
  // Widget _channelBeiZhuView(Color selectCard, int index, OnlineProductChannel item) {
  //   final _theme = RechargeTheme();
  //   return IntrinsicHeight(
  //     child: Container(
  //         alignment: Alignment.centerLeft,
  //         decoration: BoxDecoration(
  //             color: _theme.channelBackgroundColor,
  //             // color: selectCard,
  //             borderRadius: BorderRadius.all(
  //               Radius.circular(5.r),
  //             ),
  //             border: Border.all(color: selectCard, width: 1)),
  //         child: Row(
  //           children: [
  //             Container(
  //               alignment: Alignment.center,
  //               width: 40.r,
  //               decoration: BoxDecoration(
  //                 color: selectCard,
  //               ),
  //               child: Container(
  //                   alignment: Alignment.center,
  //                   child: Text(
  //                     "${index + 1}",
  //                     style: TextStyle(color: _theme.primary!),
  //                   ),
  //                   width: 22.r,
  //                   height: 22.r,
  //                   decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.all(
  //                       Radius.circular(11.r),
  //                     ),
  //                     border: Border.all(color: _theme.primary!, width: 1),
  //                   )),
  //             ),
  //
  //             SizedBox(
  //               width: 12.r,
  //             ),
  //             Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Row(
  //                   children: [
  //                     Text(
  //                       onlineChannelInfoNumber(item, index + 1),
  //                       style: TextStyle(fontSize: 14, color: _theme.mainTextColor, fontWeight: FontWeight.w700),
  //                     ),
  //                     Text(
  //                       "    (单笔限额:",
  //                       style: TextStyle(
  //                         fontSize: 14,
  //                         color: _theme.mainTextColor,
  //                       ),
  //                     ),
  //                     Text(
  //                       onlineChannelInfoLimit(item, index + 1),
  //                       style: TextStyle(fontSize: 14, color: RechargeTheme().dangerColor, fontWeight: FontWeight.w700),
  //                     ),
  //                     Text(
  //                       " )",
  //                       style: TextStyle(
  //                         fontSize: 14,
  //                         color: _theme.mainTextColor,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 SizedBox(
  //                   width: 250.r,
  //                   child: HtmlWidget(
  //                     item.beizhu ?? "",
  //                     renderMode: RenderMode.column,
  //                     textStyle: TextStyle(fontSize: 12),
  //
  //                     // HtmlRenderer(
  //                     //   data: item.beizhu ?? "",
  //                     //   style: {
  //                     //     'p': Style(
  //                     //       color: RechargeTheme().onPrimary,
  //                     //     ),
  //                     //   },
  //                     // ),
  //                   ),
  //                 ),
  //               ],
  //             )
  //             // Text(
  //             //   onlineChannelInfo(item, index + 1),
  //             //   maxLines: 1,
  //             //   overflow: TextOverflow.ellipsis,
  //             //   style: TextStyle(
  //             //     fontSize: 11.sp,
  //             //     color: AppTheme.primary,
  //             //   ),
  //             // ),
  //           ],
  //         )),
  //   );
  // }

  Widget _amount() {
    // return AmountInput(
    //     title:
    //         "2,请输入转账金额(单位/${GlobalService.to.state.siteHeaders.currencySymbol ?? ""})",
    //     hint: "请输入充值金额(金额为整数)",
    //     textEditingController: controller.textEditingController,
    //     onTextChange: (val) => controller.amount = val!,
    //     showMoney: controller.currentChannel.showMoney ?? []);

    String title =
        controller.currentChannel.isShowInputMoney == true ? '请输入' : '请选择';
    return Obx(
      () => AmountInput(
          title:
              "2、$title转账金额(单位/${GlobalService.to.state.siteHeaders.currencySymbol ?? ""})",
          hint: "请输入充值金额(金额为整数)",
          textEditingController: controller.textEditingController,
          onTextChange: (val) => controller.amount = val!,
          showMoney: controller.currentChannel.showMoney ?? [],
          //如果没有快捷金额，必须手动输入金额
          isShowInputMoney: (controller.currentChannel.showMoney == null ||
                  controller.currentChannel.showMoney!.isEmpty)
              ? true
              : controller.currentChannel.isShowInputMoney),
    );
  }

  Widget _promotion() {
    printInfo(info: "jett--->${RechargeController.to.state.onlineRate}");
    RechargeTheme _theme = RechargeTheme();
    var tmp = RechargeController.to.state.onlineRate * 100;
    // if (tmp == 0) tmp = 30;
    if (tmp <= 0) return const SizedBox.shrink();
    return Obx(() {
      final offer = (double.tryParse(controller.amount) ?? 0) * (tmp / 100);
      final symbol = GlobalService.to.state.siteHeaders.currencySymbol;

      List list = [
        '参与活动(优惠系数:${decimalString(tmp.toString()) + '%'},赠送金额:${'$symbol' + decimalString(offer)})',
      ];

      final Widget promotionWidget;
      if (_theme.isPromotionCanSelect == true) {
        promotionWidget = Column(
          children: [
            InkWell(
              onTap: () {
                // controller.isPromotionShow = !controller.isPromotionShow;
              },
              child: Container(
                  padding: EdgeInsets.only(
                      left: 10.r, right: 12.r, top: 12.r, bottom: 12.r),
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: _theme.inputFieldColor ?? _theme.onPrimary,
                      borderRadius: BorderRadius.all(Radius.circular(6.r)),
                      border: Border.all(color: _theme.borderColor!, width: 1)),
                  child: Row(
                    children: [
                      Text(
                        list[controller.promotionIndex],
                        style: TextStyle(
                            fontSize: 11.sp,
                            color: _theme.hintColor ?? _theme.subTextColor),
                      ),
                      const Spacer(),
                      // SizedBox(
                      //   width: 8,
                      //   height: 8,
                      //   child: Image.asset(
                      //     'assets/images/arrow_black_down.png',
                      //     package: 'generics',
                      //   ),
                      // ),
                    ],
                  )),
            ),
            controller.isPromotionShow == true
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.r),
                    decoration: BoxDecoration(
                        border:
                            Border.all(width: 1, color: _theme.borderColor!)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.promotionIndex = 0;
                            controller.isPromotionShow = false;
                          },
                          child: Container(
                              height: 30,
                              color: Colors.white,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                list[0],
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    color: _theme.hintColor ??
                                        _theme.mainTextColor),
                              )),
                        ),
                        // GestureDetector(
                        //   onTap: () {
                        //     controller.promotionIndex = 1;
                        //     controller.isPromotionShow = false;
                        //   },
                        //   child: Container(
                        //     height: 30,
                        //     color: Colors.white,
                        //     alignment: Alignment.centerLeft,
                        //     child: Text(
                        //       list[1],
                        //       style: TextStyle(fontSize: 11.sp),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        );
      } else {
        promotionWidget = Container(
          padding:
              EdgeInsets.only(left: 10.r, right: 12.r, top: 12.r, bottom: 12.r),
          width: Get.width,
          decoration: BoxDecoration(
              color: RechargeTheme().onPrimary,
              borderRadius: BorderRadius.all(Radius.circular(6.r)),
              border:
                  Border.all(color: RechargeTheme().borderColor!, width: 1)),
          child: RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              text: 'participation.activities.2'.tr,
              style: TextStyle(
                fontSize: 11.sp,
                color: RechargeTheme().primary,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: decimalString(tmp.toString()) + '% ',
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: RechargeTheme().dangerColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(text: '赠送金额: '),
                TextSpan(
                  text: '$symbol' + decimalString(offer),
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: RechargeTheme().successColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      }

      return Container(
          margin: EdgeInsets.symmetric(horizontal: 12.r),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              '3、优惠活动',
              style: TextStyle(color: RechargeTheme().subTextColor),
            ),
            SizedBox(
              height: 10.r,
            ),
            promotionWidget
          ]));
    });
  }

  _payTitle() {
    return Obx(() {
      String data = controller.currentCategory.classname ?? "";
      if (controller.currentChannel == null) {
        return const SizedBox.shrink();
      }
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
        child: Text(
          "线上支付 > $data",
          style: TextStyle(
              fontSize: 14,
              color: RechargeTheme().mainTextColor,
              fontWeight: FontWeight.w700),
        ),
      );
    });
  }

// _tips() {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(
//         "注意：支付前请认真阅读以下提示，若由此造成资金丢失，恕不负责！",
//         style: TextStyle(fontSize: 12.sp, color: RechargeColors.textRedColor),
//       ),
//       Text(
//         "1.请勿重复扫码，修改金额，手动输入手机号码充值或支付后点击【再来一笔】",
//         style: TextStyle(fontSize: 12.sp, color: RechargeColors.textRedColor),
//       ),
//       Text(
//         "2.微信话费请勿使用支付宝付款。",
//         style: TextStyle(fontSize: 12.sp, color: RechargeColors.textRedColor),
//       ),
//       Text(
//         "3.按照页面提示规定时间内完成付款。",
//         style: TextStyle(fontSize: 12.sp, color: RechargeColors.textRedColor),
//       )
//     ],
//   );
// }
}
