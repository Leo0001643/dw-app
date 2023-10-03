import 'package:aone_common/common.dart';
import 'package:aone_widget/aone_widget.dart';
import 'package:app04/env.dart';
import 'package:app04/theme/color_schema.dart';
import 'package:app04/views/user/recharge_online/widget/amount_input.dart';
import 'package:app04/views/user/recharge_transfer/controllers/recharge_transfer_controller.dart';
import 'package:app04/views/user/recharge_transfer/widget/charge_cell_input.dart';
import 'package:app04/widget/form/card_cell_input.dart';
import 'package:app04/widget/misc/theme_card_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../../theme/theme_scaffold.dart';
import '../../../widget/misc/theme_button.dart';
import '../../../widget/misc/theme_card.dart';
import '../start_recharge/controller/recharge_controller.dart';

class RechargeTransferView extends GetView<RechargeTransferController> {
  const RechargeTransferView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeScaffold(
      title: controller.category.classname,
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
                "线上支付 > ${controller.category.classname}",
                style: const TextStyle(
                    fontSize: 14,
                    color: AppTheme.onBackground,
                    fontWeight: FontWeight.w700),
              ),
              ..._formLayout(),
              // Container(
              //   margin: EdgeInsets.only(bottom: 10.r),
              //   child: const Text("提示：数字货币存款不支持QQ浏览器和UC浏览器，建议更换浏览器或软件，谢谢",style: TextStyle(fontSize: 14,color: Color(0xFFFF0000)),),
              // ),

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
                          decoration: BoxDecoration(
                              color: AppTheme.primary,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.r))),
                          child: Text(
                            '确认充值',
                            style: TextStyle(
                              color: AppTheme.backgroundColor,
                              fontSize: 14.sp,
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
                          decoration: BoxDecoration(
                              color: AppTheme.cardUnSelectColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.r))),
                          child: Text(
                            '上一步',
                            style: TextStyle(
                              color: AppTheme.undeer_line_color1,
                              fontSize: 14.sp,
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

  _payTitle() {
    return Obx(() {
      String data = controller.category.classname ?? "";
      if (controller.category == null) {
        return const SizedBox.shrink();
      }

      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
        child: Text(
          "线上支付 > ${controller.category.classname}",
          style: TextStyle(
              fontSize: 14,
              color: AppTheme.onBackground,
              fontWeight: FontWeight.w700),
        ),
      );
    });
  }

  List<Widget> _formLayout() {
    final symbol = GlobalService.to.state.siteHeaders.currencySymbol;
    printInfo(info: "controller.category.type  ${controller.category.type}");
    if (controller.category.type == 1) {
      return [
        _amount(
          "1,请输入转账金额(单位/${GlobalService.to.state.siteHeaders.currencySymbol ?? ""})",
        ),
        const ChargeCellInput(
          name: 'cunkuanren',
          label: '2、请输入存款人姓名',
          hintText: '请填写存款人真实姓名，可加快到账时间',
        ),
        if (controller.currentProduct.bankname != '0')
          ThemeCard(
              textStyle: const TextStyle(),
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
                            color: AppTheme.rechargeCardColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.r))),
                        child: Text(
                          controller.currentProduct.bankname ?? "",
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: AppTheme.hiltGoldTextColor),
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
            margin: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("3、请扫描以下二维码"),
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
                    color: AppTheme.neutral,
                  ),
                ),
                TextSpan(
                  text: 'USDT教程',
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: AppTheme.blueColor,
                  ),
                  recognizer: controller.tapGestureRecognizer
                    ..onTap = () {
                      //打开USDT教程
                      Get.toNamed(Routes.webPage,
                          arguments: WebData(
                              "${Env().envConfig.appDomain}#/USDTdetail?page_type=flutter",
                              'USDT充值教程'));
                    },
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
              style: TextStyle(color: Colors.black, fontSize: 14.sp),
            ),
            SizedBox(
              height: 10.r,
            ),
            Obx(
              () => Text(
                '转入    ' + controller.subTotalUSDT,
                style: AppTheme.regularStyle.copyWith(color: Colors.black),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10.r,
        ),
        Text(
          '充值信息',
          style: TextStyle(color: Colors.black, fontSize: 14.sp),
        ),
        Container(
          margin: EdgeInsets.only(top: 10.r),
          width: double.infinity,
          height: 1.r,
          color: AppTheme.normalTextColor,
        ),
        _cryptoInfoCard(),
        const ChargeCellInput(
          name: 'order',
          label: '交易备注',
          hintText: '备注可加快到账审核时间(区块链ID后五位)',
        ),
        Container(
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
              color: AppTheme.cardUnSelectColor,
              borderRadius: BorderRadius.circular(5.r)),
          child: Text(
            "注意：请下载火币交易所，使用USDT-ERC20提笔地址，进行扫码或复制转账，错误的提币地址会导致资金丢失，在支付前请认真阅读该提示，若由此造成资金丢失，恕不负责！",
            style: TextStyle(fontSize: 12.sp, color: AppTheme.shareYellow),
          ),
        )
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
                    style: AppTheme.header.copyWith(color: Colors.black),
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
                                color: AppTheme.onBackground,
                              ),
                            ),
                            TextSpan(
                              text: ' $minute:$second',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppTheme.danger,
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
                                  color: AppTheme.onBackground,
                                ),
                              ),
                              TextSpan(
                                text: controller.subTotalUSDT,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppTheme.danger,
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
                  Text(
                    "钱包地址",
                    style: AppTheme.regularStyleWithNotBold
                        .copyWith(color: Colors.black),
                  ),
                  SizedBox(
                    height: 5.r,
                  ),
                  Text(
                    controller.currentProduct.qburl ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTheme.regularStyleWithNotBold
                        .copyWith(color: Colors.black),
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
                        color: AppTheme.blackBtn,
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Text(
                        "复制",
                        style: TextStyle(
                          color: Colors.white,
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
        style: TextStyle(fontSize: 14.sp, color: AppTheme.underLineColor2),
      ),
      HtmlRenderer(
        data: controller.currentProduct.qtBeizhu!,
      ),
    ]);
  }

  Widget _promotion() {
    var tmp = controller.promoRate * 100;
    if (tmp <= 0) return const SizedBox.shrink();
    // if (tmp <= 0) return const SizedBox.shrink();
    return Obx(() {
      final offer = (double.tryParse(controller.amount) ?? 0) * (tmp / 100);
      final symbol = GlobalService.to.state.siteHeaders.currencySymbol;
      return ThemeCard(
        title: '优惠活动',
        child: Padding(
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
      );
    });
  }

  Widget _USDTTips() {
    return Container(
      padding: EdgeInsets.all(10.r),
      margin: EdgeInsets.symmetric(vertical: 15.r),
      decoration: BoxDecoration(
          color: AppTheme.cardUnSelectColor,
          borderRadius: BorderRadius.circular(5.r)),
      child: Text(
        "提示：数字货币存款不支持QQ浏览器和UC浏览器，建议更换浏览器或软件，谢谢",
        style: TextStyle(fontSize: 12.sp, color: AppTheme.shareYellow),
      ),
    );
  }

  Widget _amount(String? title) {
    return FormBuilderField(
      name: 'money',
      builder: (FormFieldState<dynamic> field) {
        return AmountInput(
          title: title,
          textMargin: const EdgeInsets.symmetric(horizontal: 0),
          onTextChange: (value) => {
            field.didChange(value),
            controller.amount = value!,
          },
          showMoney: controller.currentProduct.showMoney!,
        );
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
              style:
                  TextStyle(fontSize: 12.sp, color: AppTheme.normalTextColor),
            ),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.start,
              style:
                  TextStyle(fontSize: 12.sp, color: AppTheme.normalTextColor),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 3.r),
            decoration: BoxDecoration(
                color: AppTheme.goldTextColor,
                borderRadius: BorderRadius.all(Radius.circular(18.r))),
            child: Text(
              label.contains("卡号") ? "  复制卡号  " : "  复制  ",
              style: TextStyle(fontSize: 12.sp),
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
