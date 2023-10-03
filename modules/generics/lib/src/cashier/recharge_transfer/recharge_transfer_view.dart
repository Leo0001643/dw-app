import 'package:aone_common/common.dart';
import 'package:aone_widget/aone_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:generics/generics.dart';
import 'package:generics/src/cashier/recharge_online/widget/amount_input.dart';
import 'package:generics/src/cashier/recharge_transfer/controllers/recharge_transfer_controller.dart';
import 'package:generics/src/cashier/widgets/recharge_scaffold.dart';
import 'package:generics/src/cashier/widgets/theme_card.dart';
import 'package:generics/src/cashier/widgets/theme_card_cell.dart';
import 'package:get/get.dart';
import 'package:flutter_html/flutter_html.dart';

import 'widget/charge_cell_input.dart';

class RechargeTransferView extends GetView<RechargeTransferController> {
  RechargeTransferView({Key? key}) : super(key: key);
  final RechargeTheme _theme = RechargeTheme();

  @override
  Widget build(BuildContext context) {
    return RechargeScaffold(
      title: controller.category.classname,
      backgroundColor: _theme.backgroundColor,
      // backgroundColor: Colors.red,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
            top: 15.r,
            left: 12.r,
            right: 12.r,
            bottom: (30.r + context.mediaQueryViewPadding.bottom)),
        child: FormBuilder(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "转账汇款 > ${controller.category.classname}",
                style: TextStyle(
                    fontSize: 14,
                    color: _theme.mainTextColor,
                    fontWeight: FontWeight.w700),
              ),
              ..._formLayout(),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 35.r),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await controller.onSubmit();
                          if (controller.category.type == 2) {}
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 36.r,
                          width: double.infinity,
                          decoration: _theme.normalButtonDecoration,
                          child: Text(
                            '确认充值',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: _theme.normalButtonTextColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.r,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 36.r,
                          decoration: _theme.lightButtonDecoration,
                          child: Text(
                            '上一步',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: _theme.lightButtonTextColor,
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _formLayout() {
    final symbol = GlobalService.to.state.siteHeaders.currencySymbol;
    RechargeTheme _theme = RechargeTheme();
    printInfo(info: "controller.category.type  ${controller.category.type}");
    if (controller.category.type == 1) {
      String title =
          controller.currentProduct.isShowInputMoney == true ? '请输入' : '请选择';
      return [
        _amount(
          "1、$title转账金额(单位/${GlobalService.to.state.siteHeaders.currencySymbol ?? ""})",
        ),
        const ChargeCellInput(
          name: 'cunkuanren',
          label: '2、请输入存款人姓名',
          hintText: '请填写存款人真实姓名，可加快到账时间',
        ),
        if (controller.currentProduct.bankname != '0')
          ThemeCard(
              textStyle: TextStyle(color: _theme.subTextColor),
              title: '3、银行汇款请转到以下账号',
              child: Padding(
                  padding: EdgeInsets.all(10.r),
                  child: Column(
                    children: [
                      Container(
                        height: 36.r,
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 9.r),
                        decoration: BoxDecoration(
                            color: RechargeTheme().bankCardHeaderBackground,
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.r))),
                        child: Text(
                          controller.currentProduct.bankname ?? "",
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: RechargeTheme().dangerColor1),
                        ),
                      ),
                      SizedBox(
                        height: 10.r,
                      ),
                      _payeeCell(
                        '银行卡号',
                        controller.currentProduct.card!,
                      ),
                      _payeeCell(
                        '开户支行',
                        controller.currentProduct.zhihang!,
                      ),
                      _payeeCell(
                        '收款人',
                        controller.currentProduct.userTruename!,
                        false,
                      ),
                    ],
                  ))),
        SizedBox(
          height: 15.r,
        ),
        if ((GetUtils.isURL(controller.currentProduct.img ?? '')))
          Container(
            // margin: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "3、请扫描以下二维码",
                  style: TextStyle(color: RechargeTheme().subTextColor),
                ),
                GestureDetector(
                    onLongPress: () => RechargeController.to
                        .saveImg(controller.currentProduct.img!),
                    child: Container(
                      width: double.infinity,
                      height: 300.r,
                      alignment: Alignment.center,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: 200.r,
                        height: 300.r,
                        child: Image.network(
                          controller.currentProduct.img ?? '',
                          fit: BoxFit.fill,
                        ),
                      ),
                    )),
              ],
            ),
          ),
        _promotion(),
        SizedBox(
          height: 20.r,
        ),
        _remarks(),
      ];
    } else {
      return [
        _USDTTips(),
        _amount('存款金额'),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '充值过程如有疑问，请点击查看',
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: _theme.transferTipsTextColor ?? _theme.neutralColor1,
                  ),
                ),
                TextSpan(
                  text: 'USDT教程详情',
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: _theme.usdtJiaochengColor,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = _theme.onUSDTHelpTap,
                ),
              ],
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '汇率:   1USDT = ${controller.currentProduct.huilv}$symbol',
              style: TextStyle(color: _theme.mainTextColor, fontSize: 14.sp),
            ),
            SizedBox(
              height: 10.r,
            ),
            Obx(
              () => Text(
                '转入    ' + controller.subTotalUSDT ?? '0',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: _theme.mainTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10.r,
        ),
        Text(
          '充值信息',
          style: TextStyle(color: _theme.mainTextColor, fontSize: 14.sp),
        ),
        Container(
          margin: EdgeInsets.only(top: 10.r),
          width: double.infinity,
          height: 1.r,
          color: RechargeTheme().neutralColor2,
        ),
        _cryptoInfoCard(),
        const ChargeCellInput(
          name: 'order',
          label: '交易备注',
          // hintText: '备注可加快到账审核时间(区块链ID后五位)',
          hintText: '备注可方便客服快速审核',
        ),
        _promotion(
            titleStyle: TextStyle(fontSize: 14.sp, color: _theme.subTextColor)),
      ];
    }
  }

  //USDT地址   可变选项
  Widget _cryptoInfoCard() {
    final symbol = GlobalService.to.state.siteHeaders.currencySymbol;
    return Container(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.r),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 12.r, right: 10.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "充值金额$symbol" + controller.amount,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: RechargeTheme().mainTextColor,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  SizedBox(
                    height: 10.r,
                  ),
                  Countdown(
                    minute: 15,
                    controller: controller.countdownController,
                    builder: (_, minute, second) {
                      return Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '剩余时间:',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: _theme.mainTextColor,
                              ),
                            ),
                            TextSpan(
                              text: ' $minute:$second',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: RechargeTheme().dangerColor,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    completeBuilder: (_) => const Text(''),
                  ),
                  SizedBox(
                    height: 5.r,
                  ),
                  GestureDetector(
                    onTap: () {
                      Clipboard.setData(
                        ClipboardData(text: controller.subTotalUSDT),
                      );
                      SmartDialog.showToast('复制成功');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '请转入  ',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: _theme.mainTextColor,
                                ),
                              ),
                              TextSpan(
                                text: controller.subTotalUSDT,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: _theme.dangerColor,
                                ),
                              ),
                              TextSpan(
                                text: '  USDT',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: _theme.mainTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Image.asset(
                            'assets/images/recharge/copy.png',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.r,
                  ),
                  GestureDetector(
                    onLongPress: () => RechargeController.to
                        .saveImg(controller.currentProduct.img!),
                    child: Container(
                      margin: const EdgeInsets.only(top: 5),
                      width: 110.r,
                      height: 110.r,
                      child: Image.network(
                        controller.currentProduct.img ?? '',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.r,
                  ),
                  Text("钱包地址",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: _theme.mainTextColor,
                      )),
                  SizedBox(
                    height: 5.r,
                  ),
                  Text(
                    controller.currentProduct.qburl ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: _theme.mainTextColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Clipboard.setData(
                        ClipboardData(text: controller.currentProduct.qburl),
                      );
                      SmartDialog.showToast('复制成功');
                    },
                    child: Container(
                      width: Get.width,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 10.r),
                      margin: EdgeInsets.symmetric(
                          horizontal: 12.r, vertical: 10.r),
                      decoration: BoxDecoration(
                        color: _theme.neutralColor1,
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Text(
                        "复制",
                        style: TextStyle(
                          color: _theme.onPrimary,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            // Expanded(
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.stretch,
            //     children: [
            //       ThemeCardCell(
            //         withDivider: true,
            //         small: true,
            //         onTap: () {
            //           Clipboard.setData(
            //             ClipboardData(text: controller.currentProduct.qburl),
            //           );
            //           SmartDialog.showToast('复制成功');
            //         },
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text(
            //               '钱包地址',
            //               maxLines: 1,
            //               overflow: TextOverflow.ellipsis,
            //               style: AppTheme.header4,
            //             ),
            //             Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Flexible(
            //                   child: Text(
            //                     controller.currentProduct.qburl ?? '',
            //                     maxLines: 1,
            //                     overflow: TextOverflow.ellipsis,
            //                     style: AppTheme.p3,
            //                   ),
            //                 ),
            //                 Padding(
            //                   padding: const EdgeInsets.only(left: 8),
            //                   child: Image.asset(
            //                     'assets/images/recharge/copy.png',
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ],
            //         ),
            //       ),
            //       ThemeCardCell(
            //         withDivider: true,
            //         small: true,
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text(
            //               '汇率',
            //               style: AppTheme.header4,
            //             ),
            //             Text(
            //               '1USDT = $symbol${controller.currentProduct.huilv}',
            //               style: AppTheme.p3,
            //             )
            //           ],
            //         ),
            //       ),
            //       ThemeCardCell(
            //         withDivider: true,
            //         small: true,
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text(
            //               '转入USDT',
            //               style: AppTheme.header4,
            //             ),
            //             Obx(
            //               () => Text(
            //                 controller.subTotalUSDT,
            //                 style: AppTheme.p3,
            //               ),
            //             )
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  Widget _remarks() {
    final data = controller.currentProduct.qtBeizhu;
    if (data == null || data == '' || data == '0') {
      return const SizedBox.shrink();
    }
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "备注",
        style: TextStyle(fontSize: 14.sp, color: RechargeTheme().subTextColor),
      ),
      HtmlRenderer(
        data: controller.currentProduct.qtBeizhu.toString(),
        style: {
          'p': Style(
            color: RechargeTheme().subTextColor,
          ),
        },
      ),
    ]);
  }

  Widget _promotion({TextStyle? titleStyle}) {
    var tmp = controller.promoRate * 100;
    printInfo(info: "RechargeTransferView.promoRate: $tmp");

    if (tmp <= 0) return const SizedBox.shrink();
    return Obx(() {
      final offer = (double.tryParse(controller.amount) ?? 0) * (tmp / 100);
      final symbol = GlobalService.to.state.siteHeaders.currencySymbol;

      List list = [
        '参与活动(优惠系数:${decimalString(tmp.toString()) + '%'},赠送金额:${'$symbol' + decimalString(offer)})',
      ];

      final Widget promotionWidget;
      if (RechargeTheme().isPromotionCanSelect == true) {
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
                      color: RechargeTheme().onPrimary,
                      borderRadius: BorderRadius.all(Radius.circular(6.r)),
                      border: Border.all(
                          color: RechargeTheme().borderColor!, width: 1)),
                  child: Row(
                    children: [
                      Text(
                        list[controller.promotionIndex],
                        style:
                            TextStyle(fontSize: 11.sp, color: _theme.hintColor),
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
                        border: Border.all(
                            width: 1, color: RechargeTheme().borderColor!)),
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
                                style: TextStyle(fontSize: 11.sp),
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
          // margin: EdgeInsets.symmetric(horizontal: 12.r),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          '优惠活动',
          style: titleStyle ??
              TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: _theme.subTextColor),
        ),
        SizedBox(
          height: 10.r,
        ),
        promotionWidget
      ]));
    });
  }

  // Widget _promotion() {
  //   var tmp = controller.promoRate * 100;
  //   if (tmp <= 0) return const SizedBox.shrink();
  //   // if (tmp <= 0) return const SizedBox.shrink();
  //   return Obx(() {
  //     final offer = (double.tryParse(controller.amount) ?? 0) * (tmp / 100);
  //     final symbol = GlobalService.to.state.siteHeaders.currencySymbol;
  //     return ThemeCard(
  //       title: '优惠活动',
  //       child: Padding(
  //         padding: EdgeInsets.all(12.r),
  //         child: RichText(
  //           textAlign: TextAlign.start,
  //           text: TextSpan(
  //             text: 'participation.activities.2'.tr,
  //             style: TextStyle(
  //               fontSize: 11.sp,
  //               color: _theme.primary,
  //               fontWeight: FontWeight.bold,
  //             ),
  //             children: [
  //               TextSpan(
  //                 text: decimalString(tmp.toString()) + '% ',
  //                 style: TextStyle(
  //                   fontSize: 11.sp,
  //                   color: _theme.dangerColor,
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               ),
  //               const TextSpan(text: '赠送金额: '),
  //               TextSpan(
  //                 text: '$symbol' + decimalString(offer),
  //                 style: TextStyle(
  //                   fontSize: 11.sp,
  //                   color: _theme.successColor,
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     );
  //   });
  // }

  Widget _USDTTips() {
    return Container(
      padding: EdgeInsets.all(10.r),
      margin: EdgeInsets.symmetric(vertical: 15.r),
      decoration: BoxDecoration(
          color: RechargeTheme().channelUnSelectedColor,
          borderRadius: BorderRadius.circular(5.r)),
      child: Text(
        "提示：数字货币存款不支持QQ浏览器和UC浏览器，建议更换浏览器或软件，谢谢",
        style: TextStyle(fontSize: 12.sp, color: RechargeTheme().tipsNoColor),
      ),
    );
  }

  Widget _amount(String? title) {
    return FormBuilderField(
      name: 'money',
      builder: (FormFieldState<dynamic> field) {
        bool isShowInputMoney = controller.currentProduct.isShowInputMoney;
        //如果没有快捷金额，必须手动输入金额
        if (controller.currentProduct.showMoney == null ||
            controller.currentProduct.showMoney!.isEmpty) {
          isShowInputMoney = true;
        }
        return AmountInput(
            title: title,
            textMargin: const EdgeInsets.symmetric(horizontal: 0),
            hint:
                '请输入金额（${controller.currentProduct.paymin}元 - ${controller.currentProduct.paymax}元）',
            onTextChange: (value) => {
                  field.didChange(value),
                  controller.amount = value!,
                },
            showMoney: controller.currentProduct.showMoney ?? [],
            isShowInputMoney: isShowInputMoney);
      },
    );
  }

  Widget _payeeCell(String label, String value, [bool? divider]) {
    return ThemeCardCell(
      onTap: () {
        Clipboard.setData(
          ClipboardData(
            text: value,
          ),
        );
        SmartDialog.showToast(
          'user.center.success.copy'.tr,
        );
      },
      child: Row(
        children: [
          SizedBox(
            width: 80.r,
            child: Text(
              label + ':',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 12.sp, color: _theme.remarkColor),
            ),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 12.sp, color: _theme.remarkColor),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 3.r),
            decoration: BoxDecoration(
                // color: ColorSchema.goldTextColor,
                color: _theme.bankCopyBtnBg ?? _theme.channelSelectedColor,
                borderRadius: BorderRadius.all(Radius.circular(18.r))),
            child: Text(
              label.contains("卡号") ? "  复制卡号  " : "  复制  ",
              style: TextStyle(
                  fontSize: 12.sp,
                  color: _theme.bankCopyBtnTitleColor ?? Colors.black),
            ),
          )
          // Icon(
          //   Icons.copy_rounded,
          //   color: AppTheme.header3.color,
          //   size: 16.r,
          // ),
        ],
      ),
    );
  }
}
