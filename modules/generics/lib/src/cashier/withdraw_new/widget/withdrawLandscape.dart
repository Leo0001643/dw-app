import 'dart:math';

import 'package:aone_common/common.dart';
import 'package:aone_common/controllers/mine/card_management_new/card_management_state.dart';
import 'package:aone_common/controllers/withdrawal_new/withdrawal_logic_new.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:generics/src/cashier/card_manager_new/controllers/card_manager_landscape_controller.dart';
import 'package:generics/src/cashier/withdraw_new/controller/withdraw_landscape_controller.dart';
import 'package:generics/src/cashier/withdraw_new/widget/page_loading.dart';
import 'package:get/get.dart';

// import '../../../app_services.dart';
// import '../../../config/site_config.dart';
// import '../../../theme/color_schema.dart';
// import '../../../utils/layout_utils.dart';
import '../../../../generics.dart';
import '../../card_manager_new/widget/card_form.dart';
import '../../card_manager_new/widget/theme_button.dart';
import '../../card_manager_new/widget/theme_dropdown.dart';
import '../../card_manager_new/widget/theme_text_input.dart';
import 'card_form_withdraw.dart';

class WithdrawLandScape extends StatefulWidget {
  const WithdrawLandScape({Key? key}) : super(key: key);

  @override
  State<WithdrawLandScape> createState() => _WithdrawLandScapeState();
}

class _WithdrawLandScapeState extends State<WithdrawLandScape> {
  @override
  Widget build(BuildContext context) {
    print("111111222");
    Get.put(WithdrawalLogicNew());
    Get.put(WithdrawLandscapeController());
    Get.put(CardManagerLandScapeController());
    return Center(
      child: SingleChildScrollView(
        child: Obx(() {
          var state = WithdrawalLogicNew.to.state;
          var logic = WithdrawalLogicNew.to;
          if (logic.pageState == PageState.loading) {
            return const PageLoading();
          }
          // if (state.needEntity.qktrue == true &&
          //     state.needEntity.regPhone == true &&
          //     state.needEntity.regMobilecode == true &&
          //     state.needEntity.bankCard == true) {
          //   return card();
          // } else {
          //   return const BankCardWithdrawPage();
          // }
          return card();
        }),
      ),
    );
  }

  Widget card() {
    return Row(
      children: [
        Expanded(child: card_left()),
        SizedBox(
          width: 10.r,
        ),
        card_right()
      ],
    );
  }

  Widget card_left() {
    var state = WithdrawLandscapeController.to.state;
    var ctr = WithdrawalLogicNew.to;
    return Container(
      padding: EdgeInsets.all(5.r),
      margin: EdgeInsets.all(0.r),
      color: const Color(0xff141318),
      child: SizedBox(
        // margin: EdgeInsets.only(left: 0, right: 10),
        width: 296.r - 30.r,
        height: 306.r - 20.r,
        child: FormBuilder(
          key: state.withdrawFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              _withdrawType(),
              ThemeDropDown<String>(
                name: 'bank',
                label: 'withdrawal.bank.card.number'.tr,
                hintText: 'withdrawal.select.bank'.tr,
                isExpanded: true,
                dropdownList: state.mbankList
                    .map(
                      (element) => DropdownMenuItem<String>(
                        value: '${element.id}',
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 90.r,
                              child: Text(
                                element.type == 1
                                    ? element.bankname!
                                    : element.bankkaihu!,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                '(${element.bankcard!.substring(
                                  element.bankcard!.length - 4,
                                )})',
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                    .toList(),
                onChange: (val){
                  final target =
                  state.mbankList.firstWhere((element) => '${element.id}' == val);
                  if (target.bankname != null) {
                    state.withdrawFormKey.currentState?.save();
                    state.selectedBankValue = target.bankname!;
                    state.bankInfo = target;
                  }
                },
              ),
              // if (showWithdrawFixedMoney())
              //   Container(
              //     margin: EdgeInsets.only(left: 70.r),
              //     child: ValueListenableBuilder(
              //         valueListenable: state.currentValueAmount,
              //         builder: (_, value, __) {
              //           return Wrap(
              //             runSpacing: 10.r,
              //             spacing: 10.r,
              //             children: state.numbers.map(
              //               (e) {
              //                 return GestureDetector(
              //                   onTap: () {
              //                     print('点击');
              //                     // print(value);
              //                     setState(() {
              //                       state.currentValueAmount.value =
              //                           e.toString();
              //                     });
              //                     state.withdrawFormKey.currentState!.fields['money']!
              //                         .didChange(e.toString());
              //                   },
              //                   child: Container(
              //                     padding: EdgeInsets.symmetric(vertical: 5.r),
              //                     decoration: BoxDecoration(
              //                       borderRadius: BorderRadius.circular(5.r),
              //                       gradient: value == e.toString()
              //                           ? const LinearGradient(
              //                         colors: [
              //                           Color.fromRGBO(247, 229, 181, 1),
              //                           Color.fromRGBO(181, 149, 105, 1),
              //                         ],
              //                         begin: Alignment.topCenter,
              //                         end: Alignment.bottomCenter,
              //                         stops: [0.0, 0.715],
              //                       )
              //                           : null,
              //                       color: value != e.toString()
              //                           ? const Color.fromRGBO(7, 6, 7, 1)
              //                           : null,
              //                     ),
              //                     width: 50.r,
              //                     child: Text(
              //                       e.toString(),
              //                       textAlign: TextAlign.center,
              //                     ),
              //                   ),
              //                 );
              //               },
              //             ).toList(),
              //           );
              //           // });
              //         }),
              //   ),
              SizedBox(
                height: 5.r,
              ),
              ThemeTextInput(
                label: 'withdrawal.amount'.tr,
                name: 'money',
                hintText: 'withdrawal.hint.money'.tr,
                onChange: (val) {
                  setState(() {
                    state.currentValueAmount.value = val ?? '0';
                  });
                },
              ),
              exchange_rate(),
              SizedBox(
                height: 5.r,
              ),
              ThemeTextInput(
                label: 'withdrawal.password'.tr,
                name: 'password',
                hintText: 'withdrawal.hint.password'.tr,
                obscureText: true,
              ),
              SizedBox(
                height: 20.r,
              ),
              ThemeButton(
                onPressed: () async {
                  var state = WithdrawLandscapeController.to.state;
                  state.withdrawFormKey.currentState!.save();
                  int min = UserService.to.state.userBank.minTotal!;
                  if ((int.tryParse(state.currentValueAmount.value) ?? 0) <
                      min) {
                    SmartDialog.showToast('最小提款金额为$min');
                    return;
                  }
                  try {
                    SmartDialog.showLoading();
                    await WithdrawLandscapeController.to.tixian();
                  } catch (err) {
                    print(err);
                  }
                  SmartDialog.dismiss(status: SmartStatus.loading);
                },
                btnText: 'withdrawal.confirm'.tr,
              ),
              SizedBox(
                height: 15.r,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget exchange_rate() {
    var state = WithdrawalLogicNew.to.state;
    final userService = UserService.to;

    if (WithdrawLandscapeController.to.activeTypeIndex == 2) {
      return Obx(() {
        return Row(
          children: [
            SizedBox(
              width: 40.r,
            ),
            Text(
              '汇率: 1 CNY = ${decimalString('${1 / double.parse(userService.state.userBank.huilv.toString())}', 4)} USDT',
              style: TextStyle(color: const Color(0xffD2A96F), fontSize: 9.sp),
            ),
            Text(
              '您将收到 ${decimalString(((double.tryParse(state.currentValueAmount.value) ?? 0) / double.parse(userService.state.userBank.huilv!)).toString(), 2)} USDT',
              style: TextStyle(color: const Color(0xffD2A96F), fontSize: 9.sp),
            ),
          ],
        );
      });
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget card_right() {
    return Container(
      padding: EdgeInsets.all(5.r),
      margin: EdgeInsets.all(0.r),
      color: const Color(0xff141318),
      child: SizedBox(
        width: 231.r,
        height: 306.r - 20.r,
        child: Column(
          children: [
            _balance(),
            _bankInfo(),
          ],
        ),
      ),
    );
  }

  Widget address() {
    var state = WithdrawalLogicNew.to.state;
    final userService = UserService.to;
    return Obx(() {
      if (state.bankInfo.id != null) {
        return Row(
          children: [
            Text(
                state.bankInfo.type == 1
                    ? state.bankInfo.bankname!
                    : state.bankInfo.bankkaihu!,
                style:
                    TextStyle(color: const Color(0xffffffff), fontSize: 10.sp)),
            Text(
                '(${state.bankInfo.bankcard!.substring(
                  state.bankInfo.bankcard!.length - 4,
                )})',
                style:
                    TextStyle(color: const Color(0xffffffff), fontSize: 10.sp)),
          ],
        );
      } else {
        return Text('');
      }
    });
  }

  Widget withdrawal_status() {
    var state = WithdrawalLogicNew.to.state;
    final userService = UserService.to;
    // userService.state.userBank.txIstrue = false;
    if (userService.state.userBank.txIstrue!) {
      if (userService.state.xml > 0) {
        return RichText(
          text: TextSpan(
            text: '洗码量还差',
            style: TextStyle(color: Color(0xffffffff), fontSize: 10.sp),
            children: [
              TextSpan(
                text: userService.state.xml.toString(),
                style:
                    TextStyle(color: const Color(0xffD85454), fontSize: 10.sp),
              ),
              TextSpan(
                text: '可提现',
                style: TextStyle(color: Color(0xffffffff), fontSize: 10.sp),
              ),
            ],
          ),
        );
      } else if (userService.state.userBank.txSCount! > 0 &&
          userService.state.xml == 0) {
        return Text(
          '可免费提现',
          style: TextStyle(color: const Color(0xff228F21), fontSize: 10.sp),
        );
      } else {
        return Text(
          '超过免费提现次数,\n洗码量不足时,\n都将收取提现手续费。',
          style: TextStyle(color: const Color(0xffD85454), fontSize: 8.sp),
        );
      }
    } else {
      return Text(
        '暂时不能提现请联系客服',
        style: TextStyle(color: const Color(0xffffffff), fontSize: 10.sp),
      );
    }
  }

  Widget _withdrawType() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 10),
              const Text("提现方式",style: TextStyle(fontSize: 13),),
              _typeButton("银行卡", (ScreenUtil().screenWidth - 40) / 3.0,
                  WithdrawLandscapeController.to.activeTypeIndex == 0 ? true : false,
                      () {
                        WithdrawLandscapeController.to.state.withdrawFormKey.currentState?.reset();
                        WithdrawLandscapeController.to.activeTypeIndex = 0;
                        WithdrawLandscapeController.to.getMList();
                        WithdrawLandscapeController.to.state.bankInfo = BankInfos();
                  }),
              _typeButton("电子钱包", (ScreenUtil().screenWidth - 40) / 3.0,
                  WithdrawLandscapeController.to.activeTypeIndex == 1 ? true : false,
                      () {
                        WithdrawLandscapeController.to.state.withdrawFormKey.currentState?.reset();
                        WithdrawLandscapeController.to.activeTypeIndex = 1;
                        WithdrawLandscapeController.to.getMList();
                        WithdrawLandscapeController.to.state.bankInfo = BankInfos();
                  }),
              _typeButton("虚拟币", (ScreenUtil().screenWidth - 40) / 3.0,
                  WithdrawLandscapeController.to.activeTypeIndex == 2 ? true : false,
                      () {
                        WithdrawLandscapeController.to.state.withdrawFormKey.currentState?.reset();
                        WithdrawLandscapeController.to.activeTypeIndex = 2;
                        WithdrawLandscapeController.to.getMList();
                        WithdrawLandscapeController.to.state.bankInfo = BankInfos();
                  }),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _typeButton(String text, double width, bool isActive, VoidCallback onTap) {
    // return Container(
    //   width: width,
    //   height: 36.r,
    //   decoration: isActive ? WithdrawTheme().normalButtonDecoration : WithdrawTheme().lightButtonDecoration,
    //   child: ElevatedButton(
    //     onPressed: onTap,
    //     style: ElevatedButton.styleFrom(
    //       primary: Colors.transparent,
    //       shadowColor: Colors.transparent,
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(
    //           5.r,
    //         ),
    //       ),
    //     ),
    //     child: Text(text,
    //       style: isActive ? TextStyle(color: Color(0xFFFFFFFF)) : TextStyle(color: Color(0xff282828)),
    //     ),
    //   ),
    // );
    return ThemeButton(
      width: 60.w,
      onPressed: onTap,
      btnText: text,
      color:isActive ?const LinearGradient(
        colors: [
          Color.fromRGBO(247, 229, 181, 1),
          Color.fromRGBO(181, 149, 105, 1),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.0, 0.715],
      ): const LinearGradient(
        colors: [
          Color.fromRGBO(227, 222, 204, 1),
          Color.fromRGBO(144, 132, 115, 1),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }

  Widget _balance() {
    final currencySymbol = GlobalService.to.state.siteHeaders.currencySymbol;
    final _userState = UserService.to.state;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.r, horizontal: 0.r),
      height: 78.r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() {
                return RichText(
                  text: TextSpan(
                    text: '账户余额: ',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: const Color(0xFFeef1f8),
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text:
                        '$currencySymbol${decimalString(UserService.to.state.balance)}',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: AoneAppTheme.appTheme.withDrawalBalanceColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              }),
              RichText(
                text: TextSpan(
                  text: '洗码量还需: ',
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: const Color(0xFFeef1f8),
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(
                      text: WithdrawLandscapeController.to.state.userInfo.xml == null ?
                      "--" : WithdrawLandscapeController.to.state.userInfo.xml.toString(),
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: const Color.fromRGBO(11, 33, 59, 0.7),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: '今日免费提现次数: ',
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: const Color(0xFFeef1f8),
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(
                      text: WithdrawLandscapeController.to
                          .getWithdrawFreeNum(_userState.userBank.txSCount!),
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AoneAppTheme.appTheme.withDrawalBalanceColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          ThemeButton(
            width: 50.w,
              radius: 18,
              btnText: "刷新",
              onPressed: (){
                WithdrawLandscapeController.to.reloadMoney();
              }
              ),
        ],
      ),
    );
  }
  Widget _bankInfo(){
    TextStyle textStyle = const TextStyle(
      fontSize: 13,
      color: Color(0xFFffffff),
    );
    return Obx((){
          print( WithdrawLandscapeController.to.state.bankInfo.type);
          return Container(
            child: Column(
              children: [
                Container(
                  child: WithdrawLandscapeController.to.state.bankInfo.type == 1 ?
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xFF282828),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          child: Row(
                            children: [
                              Text("银行名称:", style: textStyle),
                              Text(WithdrawLandscapeController.to.state.bankInfo.bankname ?? "", style: textStyle),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          child: Row(
                            children: [
                              Text("开户行:", style: textStyle),
                              Text(WithdrawLandscapeController.to.state.bankInfo.bankkaihu ?? "", style: textStyle),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          child: Row(
                            children: [
                              Text("开户姓名:", style: textStyle),
                              Text(UserService.to.state.trueName ?? "", style: textStyle),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          child: Row(
                            children: [
                              Text("银行账户:", style: textStyle),
                              Text(WithdrawLandscapeController.to.state.bankInfo.bankcard ?? "", style: textStyle),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ) :
                  WithdrawLandscapeController.to.state.bankInfo.type == 2 ?
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xFF282828),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          child: Row(
                            children: [
                              Text("地址协议:", style: textStyle),
                              Text(WithdrawLandscapeController.to.state.bankInfo.bankkaihu ?? "", style: textStyle),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          child: Row(
                            children: [
                              Text("钱包地址:", style: textStyle),
                              Text(WithdrawLandscapeController.to.state.bankInfo.bankcard ?? "", style: textStyle),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ) :
                  WithdrawLandscapeController.to.state.bankInfo.type == 4 ?
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xFF282828),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          child: Row(
                            children: [
                              Text("账号类型:", style: textStyle),
                              Text(WithdrawLandscapeController.to.state.bankInfo.bankkaihu ?? "", style: textStyle),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          child: Row(
                            children: [
                              Text("钱包地址:", style: textStyle),
                              Text(WithdrawLandscapeController.to.state.bankInfo.bankcard ?? "", style: textStyle),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ) :
                  const SizedBox(height: 5),
                ),
                WithdrawLandscapeController.to.state.mbankList.value.isEmpty ?
                GestureDetector(
                  onTap: () {
                    final _ctrl = CardManagerLandScapeController.to;
                    _ctrl.isDialog = true;
                    _ctrl.currentItem = null;
                    _ctrl.state.formType = CardFormType.add;
                    _ctrl.headerSelIndex = WithdrawLandscapeController.to.activeTypeIndex;
                    print("index is ${WithdrawLandscapeController.to.activeTypeIndex}");
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return Center(
                          child: Container(
                            width: 400.w,
                            margin: const EdgeInsets.all(10),
                            padding:const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              // gradient:WithdrawTheme().cardBgGradient,
                              image:const DecorationImage(
                                  alignment: Alignment.centerRight,
                                  image: AssetImage('assets/images/landscape/main_bg.png',package: 'generics'),
                                  fit: BoxFit.fill),
                            ),
                            child:Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("新增账户",style: TextStyle(color: Color(0xffDDBC90)),),
                                    GestureDetector(
                                      onTap: (){
                                        Get.back();
                                      },
                                      child:const Icon(Icons.close,color: Color(0xffDDBC90),),
                                    )
                                  ],
                                ),
                                const BankCardPage()
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    width: ScreenUtil().screenWidth,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    decoration: BoxDecoration(
                      color: const Color(0xFF000000),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 1, color: Color(0xffDDBC90)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.add_circle, color: Color(0xffDDBC90)),
                        const Text("新增账户", style: TextStyle(color: Color(0xffDDBC90))),
                      ],
                    ),
                  ),
                ) : SizedBox(width: 5,)
              ],
            ),
          );
        }
    );
  }
}
