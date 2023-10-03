import 'package:aone_widget/aone_widget.dart';
import 'package:app04/views/user/recharge_online/widget/amount_input.dart';
import 'package:app04/views/user/start_recharge/controller/recharge_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:aone_common/common.dart';
import '../../../theme/color_schema.dart';
import '../../../theme/theme_scaffold.dart';
import '../../../widget/misc/theme_button.dart';
import '../../../widget/misc/theme_card.dart';
import '../../../widget/tool/light_text.dart';
import 'controllers/recharge_online_controller.dart';

class RechargeOnlineView extends GetView<RechargeOnlineController> {
  const RechargeOnlineView({Key? key}) : super(key: key);

  static const String unSelectBG = 'assets/images/recharge/unselect_icon.png';
  static const String selectBG = 'assets/images/recharge/select_icon_1.png';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.delete<RechargeOnlineController>();
        return true;
      },
      child: ThemeScaffold(
        title: '线上支付',
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.r),
                  child: _tips(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0.r),
                  child: GestureDetector(
                    onTap: controller.onBeforeSubmit,
                    child: Container(
                      width: double.infinity,
                      height: 48.r,
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(
                          horizontal: 12.r, vertical: 30.r),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5.r)),
                          color: AppTheme.rechargeCardColor),
                      child: Text(
                        "确认充值",
                        style: TextStyle(fontSize: 14.sp, color: Colors.black),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 12.r, bottom: 10.r),
          child: const Text("1、请选择支付通道"),
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
                    children: controller.channelList.mapIndexed((item, index) {
                      Color selectCard = controller.activeChannelIndex == index
                          ? AppTheme.rechargeCardColor
                          : AppTheme.cardUnSelectColor;

                      return Padding(
                        padding: controller.channelList.length - 1 != index
                            ? EdgeInsets.only(bottom: 10.r)
                            : EdgeInsets.zero,
                        child: Material(
                          child: InkWell(
                            borderRadius: BorderRadius.circular(5.r),
                            onTap: () => controller.activeChannelIndex = index,
                            child: Ink(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: item.beizhu == null
                                  ? _channelNoBeiZhuView(
                                      selectCard, index, item)
                                  : _channelBeiZhuView(selectCard, index, item),

                              // Container(
                              //     height: 88.r,
                              //     alignment: Alignment.centerLeft,
                              //     decoration: BoxDecoration(
                              //         color: AppTheme.normalBgColor,
                              //         borderRadius: BorderRadius.all(
                              //           Radius.circular(5.r),
                              //         ),
                              //         border: Border.all(
                              //             color: selectCard, width: 1)
                              //         // image: DecorationImage(
                              //         //   image: AssetImage(
                              //         //     controller.activeChannelIndex == index
                              //         //         ? selectBG
                              //         //         : unSelectBG,
                              //         //   ),
                              //         //   fit: BoxFit.fill,
                              //         // ),
                              //         ),
                              //     child: Row(
                              //       children: [
                              //         Container(
                              //           alignment: Alignment.center,
                              //           width: 40.r,
                              //           height: 88.r,
                              //           decoration: BoxDecoration(
                              //             //         ? selectBG
                              //             //         : unSelectBG,
                              //             color: selectCard,
                              //           ),
                              //           child: Container(
                              //               alignment: Alignment.center,
                              //               child: Text("${index + 1}"),
                              //               width: 22.r,
                              //               height: 22.r,
                              //               decoration: BoxDecoration(
                              //                 borderRadius: BorderRadius.all(
                              //                   Radius.circular(11.r),
                              //                 ),
                              //                 border: Border.all(
                              //                     color: Colors.black,
                              //                     width: 1),
                              //               )),
                              //         ),
                              //         const SizedBox(
                              //           width: 12,
                              //         ),
                              //         Column(
                              //           mainAxisAlignment:
                              //               MainAxisAlignment.center,
                              //           crossAxisAlignment:
                              //               CrossAxisAlignment.start,
                              //           children: [
                              //             Row(
                              //               children: [
                              //                 Text(
                              //                   onlineChannelInfoNumber(
                              //                       item, index + 1),
                              //                   style: const TextStyle(
                              //                       fontSize: 14,
                              //                       color:
                              //                           AppTheme.onBackground,
                              //                       fontWeight:
                              //                           FontWeight.w700),
                              //                 ),
                              //                 const Text(
                              //                   "    (单笔限额:",
                              //                   style: TextStyle(
                              //                     fontSize: 14,
                              //                     color: AppTheme.onBackground,
                              //                   ),
                              //                 ),
                              //                 Text(
                              //                   onlineChannelInfoLimit(
                              //                       item, index + 1),
                              //                   style: const TextStyle(
                              //                       fontSize: 14,
                              //                       color: Colors.red,
                              //                       fontWeight:
                              //                           FontWeight.w700),
                              //                 ),
                              //                 const Text(
                              //                   " )",
                              //                   style: TextStyle(
                              //                     fontSize: 14,
                              //                     color: AppTheme.onBackground,
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //             item.beizhu == null
                              //                 ? _channelNoBeiZhuView(
                              //                     selectCard, index, item)
                              //                 : _channelBeiZhuView(
                              //                     selectCard, index, item),
                              //
                              //             // SingleChildScrollView(
                              //             //   child:HtmlRenderer(
                              //             //     data: item.beizhu ?? "",
                              //             //     shrinkWrap: true,
                              //             //   ) ,
                              //             // )
                              //           ],
                              //         )
                              //         // Text(
                              //         //   onlineChannelInfo(item, index + 1),
                              //         //   maxLines: 1,
                              //         //   overflow: TextOverflow.ellipsis,
                              //         //   style: TextStyle(
                              //         //     fontSize: 11.sp,
                              //         //     color: AppTheme.primary,
                              //         //   ),
                              //         // ),
                              //       ],
                              //     )),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  )),
                )
              : Container(
                  child:
                      LightText.buildColorFont('暂无通道可选', Colors.black, 14.sp),
                );
        }),
      ],
    );
  }

  Widget _channelBeiZhuView(
      Color selectCard, int index, OnlineProductChannel item) {
    return IntrinsicHeight(
      child: Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              // color: Colors.green,
              // color: selectCard,
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
                      style: const TextStyle(color: Colors.black),
                    ),
                    width: 22.r,
                    height: 22.r,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(11.r),
                      ),
                      border: Border.all(color: Colors.black, width: 1),
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
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w700),
                        ),
                        const Text(
                          "（单笔限额:",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          onlineChannelInfoLimit(item, index + 1),
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.red,
                              fontWeight: FontWeight.w700),
                        ),
                        const Text(
                          " ）",
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 250.r,
                      child: HtmlWidget(
                        item.beizhu ?? "",
                        renderMode: RenderMode.column,
                        textStyle: const TextStyle(fontSize: 12),
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
    return Container(
        height: 40.r,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
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
                    style: const TextStyle(color: Colors.black),
                  ),
                  width: 22.r,
                  height: 22.r,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(11.r),
                    ),
                    border: Border.all(color: Colors.black, width: 1),
                  )),
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              onlineChannelInfoNumber(item, index + 1),
              style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
            Row(
              children: [
                Text(
                  "（单笔限额:",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                Text(
                  onlineChannelInfoLimit(item, index + 1),
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.red,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "）",
                  style: TextStyle(fontSize: 14, color: Colors.black),
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

  Widget _amount() {
    return Obx(
      () => AmountInput(
        title:
            "2、请输入转账金额(单位/${GlobalService.to.state.siteHeaders.currencySymbol ?? ""})",
        hint: "请输入充值金额(金额为整数)",
        textEditingController: controller.textEditingController,
        onTextChange: (val) => controller.amount = val!,
        showMoney: controller.currentChannel.showMoney ?? [],
      ),
    );
  }

  Widget _promotion() {
    printInfo(info: "jett--->${RechargeController.to.state.onlineRate}");
    var tmp = RechargeController.to.state.onlineRate * 100;
    // if (tmp == 0) tmp = 30;
    if (tmp <= 0) return const SizedBox.shrink();
    return Obx(() {
      final offer = (double.tryParse(controller.amount) ?? 0) * (tmp / 100);
      final symbol = GlobalService.to.state.siteHeaders.currencySymbol;
      return Container(
          margin: EdgeInsets.symmetric(horizontal: 12.r),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              '3、优惠活动',
            ),
            Padding(
              padding: EdgeInsets.all(12.r),
              child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  text: 'participation.activities.2'.tr,
                  style: AppTheme.header3,
                  children: [
                    TextSpan(
                      text: decimalString(tmp.toString()) + '% ',
                      style: AppTheme.header3.copyWith(
                        color: AppTheme.danger,
                      ),
                    ),
                    const TextSpan(text: '赠送金额: '),
                    TextSpan(
                      text: '$symbol' + decimalString(offer),
                      style: AppTheme.header3.copyWith(
                        color: AppTheme.success,
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
              color: AppTheme.onBackground,
              fontWeight: FontWeight.w700),
        ),
      );
    });
  }

  _tips() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "注意：支付前请认真阅读以下提示，若由此造成资金丢失，恕不负责！",
          style: TextStyle(fontSize: 12.sp, color: AppTheme.textRedColor),
        ),
        Text(
          "1.请勿重复扫码，修改金额，手动输入手机号码充值或支付后点击【再来一笔】",
          style: TextStyle(fontSize: 12.sp, color: AppTheme.textRedColor),
        ),
        Text(
          "2.微信话费请勿使用支付宝付款。",
          style: TextStyle(fontSize: 12.sp, color: AppTheme.textRedColor),
        ),
        Text(
          "3.按照页面提示规定时间内完成付款。",
          style: TextStyle(fontSize: 12.sp, color: AppTheme.textRedColor),
        )
      ],
    );
  }
}
