import 'package:aone_common/controllers/mine/card_management/card_management_logic.dart';
import 'package:aone_common/utils/colors.dart';
import 'package:app04/app_service.dart';
import 'package:app04/theme/color_schema.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

import '../../../../theme/theme_scaffold.dart';
import '../controllers/card_manager_logic.dart';
import 'search_view.dart';

class AddBankView extends StatelessWidget {
  Widget build(BuildContext context) {
    Get.put(CardManagerLogic());
    Get.put(CardManagerChildLogic());

    var state = CardManagerChildLogic.to.state;
    return ThemeScaffold(
      title: '添加银行卡',
      backgroundColor: const Color(0xfff6f6f6),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Text(
              '卡包类型:',
              style: TextStyle(
                  color: AppTheme.blackTextColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Obx(() {
            return _buildHeaderListView();
          }),
          const SizedBox(
            height: 0,
          ),
          FormBuilder(
            key: state.formKey,
            enabled: true,
            child: Expanded(
                child: Obx(
              () => ListView(
                children: _listViewData(context),
              ),
            )),
          ),
        ],
      ),
    );
  }

  List<Widget> _listViewData(BuildContext context) {
    final state = CardManagerChildLogic.to.state;
    List<Widget> _list = [];
    if (state.selIndex == 0) {
      _list.add(_bank(context));
      _list.add(_buildBankView());
    }
    if (state.selIndex == 1) {
      _list.add(_USDT());
      _list.add(_buildTRCView());
    }

    _list.add(_addBankView());
    return _list;
  }

  Widget _bank(BuildContext context) {
    var state = CardManagerChildLogic.to.state;
    debugPrint(state.true_name.text);
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      padding: const EdgeInsets.only(left: 0, right: 0),
      decoration: BoxDecoration(
          color: stringToColor('f6f6f6'),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(right: 0, left: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      debugPrint('pop 请选择开户银行');
                      _didClickSelectedBank(context);
                    },
                    child: Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // margin: EdgeInsets.only(18.r),
                              child: Text(
                                "银行:",
                                style: TextStyle(
                                    color: AppTheme.blackTextColor,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextField(
                              controller: state.bank_name,
                              enabled: false,
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                suffixIcon: const Icon(Icons.arrow_drop_down),
                                border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: AppTheme.filterBorderColor),
                                    borderRadius: BorderRadius.circular(6)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xFF02C285)),
                                    borderRadius: BorderRadius.circular(6)),
                                hintText: '请选择绑定银行',
                                hintStyle: TextStyle(
                                    color: const Color(0x4C0B213B),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 12),
                                fillColor: Colors.white,
                                filled: true,
                              ),
                            ),
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 15.r,
                  ),
                  SizedBox(
                    child: Text(
                      "开户姓名:",
                      style: TextStyle(
                          color: AppTheme.blackTextColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: state.true_name,
                    readOnly: state.true_name.text.isNotEmpty ? true : false,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: AppTheme.filterBorderColor),
                          borderRadius: BorderRadius.circular(6)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFF02C285)),
                          borderRadius: BorderRadius.circular(6)),
                      hintText: '请输入持卡人姓名',
                      hintStyle: TextStyle(
                          color: const Color(0x4C0B213B),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 12),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ],
              )),
          Padding(
              padding: EdgeInsets.only(top: 15.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Text(
                      "收款机构号",
                      style: TextStyle(
                          color: AppTheme.blackTextColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: state.bank_card,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: AppTheme.filterBorderColor),
                          borderRadius: BorderRadius.circular(6)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFF02C285)),
                          borderRadius: BorderRadius.circular(6)),
                      hintText: '点击以输入',
                      hintStyle: TextStyle(
                          color: const Color(0x4C0B213B),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 12),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ],
              )),
          Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Text(
                      "开户行:",
                      style: TextStyle(
                          color: AppTheme.blackTextColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: state.bank_kaihu,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: AppTheme.filterBorderColor),
                          borderRadius: BorderRadius.circular(6)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFF02C285)),
                          borderRadius: BorderRadius.circular(6)),
                      hintText: '如:北京市xxx支行',
                      hintStyle: TextStyle(
                          color: const Color(0x4C0B213B),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 12),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget _USDT() {
    var state = CardManagerChildLogic.to.state;
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      padding: const EdgeInsets.only(left: 0, right: 0),
      decoration: BoxDecoration(
          color: stringToColor('f2f5f8'),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(right: 10, left: 10, top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 18),
                    child: Text(
                      "区块链地址",
                      style: TextStyle(
                          color: const Color(0xff0B213B),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: state.usdt_address,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0x4C0B213B)),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFF02C285)),
                          borderRadius: BorderRadius.circular(10)),
                      hintText: '请输入区块链地址',
                      hintStyle: TextStyle(
                          color: const Color(0x4C0B213B),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ],
              )),
          Padding(
              padding: const EdgeInsets.only(right: 10, left: 10, top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // margin: const EdgeInsets.only(top: 18),
                    child: Text(
                      "区块链类型",
                      style: TextStyle(
                          color: const Color(0xff0B213B),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: state.usdt_type,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0x4C0B213B)),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFF02C285)),
                          borderRadius: BorderRadius.circular(10)),
                      hintText: '请输入区块链类型',
                      hintStyle: TextStyle(
                          color: const Color(0x4C0B213B),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget _addBankView() {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppTheme.primary, borderRadius: BorderRadius.circular(5.r)),
      margin: EdgeInsets.only(top: 150.r, left: 12.r, right: 12.r),
      padding: EdgeInsets.symmetric(vertical: 10.r),
      child: GestureDetector(
        onTap: () {
          CardManagerChildLogic.to.postBindingBankDataChild();
        },
        child: Text(
          'confirm.binding'.tr,
          style: TextStyle(color: Colors.white, fontSize: 16.sp),
        ),
      ),
    );
  }

  _buildHeaderListView() {
    var state = CardManagerChildLogic.to.state;
    List<Widget> _list = [];
    for (int i = 0; i < state.headerList.length; i++) {
      Tuple2 tuple2 = state.headerList[i];
      _list.add(_itemButton(tuple2, i));
    }
    return Container(
      margin: EdgeInsets.only(left: 17.5.r),
      width: 238,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: _list,
      ),
    );
  }

  _itemButton(Tuple2 tuple2, int i) {
    var state = CardManagerChildLogic.to.state;
    return Container(
      child: TextButton.icon(
        icon: state.selIndex == i
            ? Icon(
                Icons.radio_button_checked,
                color: AppTheme.primary,
              )
            : const Icon(Icons.radio_button_off, color: Color(0xffcccccc)),
        onPressed: () {
          debugPrint('点击了头部按钮');
          var state = CardManagerChildLogic.to.state;
          state.selIndex = i;
          print(i);
        },
        label: Text(
          tuple2.item1,
          style: TextStyle(
              color: state.selIndex == i
                  ? AppTheme.normalTextColor
                  : AppTheme.hintColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  /// 查询数据
  search(String? value) {
    print("搜索的值为：$value");
    if (value!.isNotEmpty) {
      CardManagerChildLogic.to.state.isSearch = true;
      CardManagerChildLogic.to.state.selectBankList.clear();
      CardManagerChildLogic.to.state.bankList.forEach((element) {
        if (element.contains(value)) {
          CardManagerChildLogic.to.state.selectBankList.add(element);
        }
      });
    } else {
      CardManagerChildLogic.to.state.isSearch = false;
    }
  }

  _buildBankView() {
    return Container(
        margin: const EdgeInsets.only(top: 20, left: 14, right: 14),
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Text('备注:如需修改请联系',
                style: TextStyle(
                    color: AppTheme.normalTextColor,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500)),
            GestureDetector(
              onTap: () {
                AppService.to.toCustomerService();
              },
              child: Text('《在线客服》',
                  style: TextStyle(
                      color: AppTheme.primary,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500)),
            )
          ],
        ));
  }

  _buildTRCView() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 10.r, left: 14.r, right: 14.r),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text('e01.bank.add.note'.tr,
                  style: TextStyle(
                      color: stringToColor('595959'),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500)),
              GestureDetector(
                onTap: () {
                  debugPrint('点击了在线客服');
                  // final AppService _app = AppService.to;
                  // _app.toCustomerService();
                  AppService.to.toCustomerService();
                },
                child: Text('login.onlineservice'.tr,
                    style: TextStyle(
                        color: AppTheme.primary,
                        fontSize: 12,
                        fontWeight: FontWeight.w500)),
              )
            ],
          )
        ],
      ),
    );
  }

  void _didClickSelectedBank(BuildContext context) {
    var state = CardManagerChildLogic.to.state;
    state.bankSelect = 0;
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          constraints: BoxConstraints(
            maxHeight: ScreenUtil().setHeight(250),
          ),
          width: Get.width,
          color: const Color.fromRGBO(235, 241, 250, 1),
          // const Colors//Color.fromARGB(58, 139, 250, 1), //rgba(235, 241, 250, 1)
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "银行选择",
                  style: TextStyle(
                      color: Colors.black,
                      // fontWeight: FontWeight.bold,
                      fontSize: 18,
                      decoration: TextDecoration.none),
                ),
              ),
              SearchWidget(
                onEditingComplete: search,
              ),
              Expanded(
                child: DefaultTextStyle(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: ScreenUtil().setSp(22),
                  ),
                  child: _buildBankPicker(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      width: 136,
                      height: 38,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: stringToColor('0b213b', 0.3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '取消',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(13),
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (CardManagerChildLogic.to.state.bankSelect == 0) {
                        CardManagerChildLogic.to.state.bank_name.text =
                            CardManagerChildLogic.to.state.isSearch
                                ? state.selectBankList[0]
                                : state.bankList[0];
                        CardManagerChildLogic.to.setBankValue(
                            CardManagerChildLogic.to.state.isSearch
                                ? state.selectBankList[0]
                                : state.bankList[0]);
                      }
                      Get.back();
                    },
                    child: Container(
                      width: 136,
                      height: 38,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: LinearGradient(colors: [
                            stringToColor('429ffe'),
                            stringToColor('2f72f4')
                          ])),
                      child: Text(
                        '确认',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(13),
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 28,
              )
            ],
          ),
        ),
      ),
    );
    // showModalBottomSheet<void>(
    //     isScrollControlled: true,
    //     context: Get.context!,
    //     builder: (BuildContext context) {
    //       return Container(
    //         constraints: BoxConstraints(
    //           maxHeight: ScreenUtil().setHeight(250),
    //         ),
    //         width: Get.width,
    //         color: const Color.fromRGBO(235, 241, 250, 1),
    //         // const Colors//Color.fromARGB(58, 139, 250, 1), //rgba(235, 241, 250, 1)
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: <Widget>[
    //             const Padding(
    //               padding: EdgeInsets.all(10),
    //               child: Text(
    //                 "银行选择",
    //                 style: TextStyle(
    //                     color: Colors.black,
    //                     // fontWeight: FontWeight.bold,
    //                     fontSize: 18,
    //                     decoration: TextDecoration.none),
    //               ),
    //             ),
    //             SearchWidget(
    //               onEditingComplete: search,
    //             ),
    //             Expanded(
    //               child: DefaultTextStyle(
    //                 style: TextStyle(
    //                   color: Colors.black,
    //                   fontSize: ScreenUtil().setSp(22),
    //                 ),
    //                 child: _buildBankPicker(),
    //               ),
    //             ),
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: <Widget>[
    //                 GestureDetector(
    //                   onTap: () {
    //                     Get.back();
    //                   },
    //                   child: Container(
    //                     width: 136,
    //                     height: 38,
    //                     alignment: Alignment.center,
    //                     decoration: BoxDecoration(
    //                       color: stringToColor('0b213b', 0.3),
    //                       borderRadius: BorderRadius.circular(8),
    //                     ),
    //                     child: Text(
    //                       '取消',
    //                       style: TextStyle(
    //                           color: Colors.white,
    //                           fontSize: ScreenUtil().setSp(13),
    //                           fontWeight: FontWeight.bold,
    //                           decoration: TextDecoration.none),
    //                       textAlign: TextAlign.center,
    //                     ),
    //                   ),
    //                 ),
    //                 const SizedBox(
    //                   width: 40,
    //                 ),
    //                 GestureDetector(
    //                   onTap: () {
    //                     Get.back();
    //                   },
    //                   child: Container(
    //                     width: 136,
    //                     height: 38,
    //                     alignment: Alignment.center,
    //                     decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.circular(8),
    //                         gradient: LinearGradient(colors: [
    //                           stringToColor('429ffe'),
    //                           stringToColor('2f72f4')
    //                         ])),
    //                     child: Text(
    //                       '确认',
    //                       style: TextStyle(
    //                           color: Colors.white,
    //                           fontSize: ScreenUtil().setSp(13),
    //                           fontWeight: FontWeight.bold,
    //                           decoration: TextDecoration.none),
    //                       textAlign: TextAlign.center,
    //                     ),
    //                   ),
    //                 )
    //               ],
    //             ),
    //             const SizedBox(
    //               height: 28,
    //             )
    //           ],
    //         ),
    //       );
    //     });
  }

  Widget _buildBankPicker() {
    var state = CardManagerLogic.to.state;
    return CupertinoPicker(
      itemExtent: 40,
      onSelectedItemChanged: (value) {
        print('选择了：${state.bankList[value]}');
        print('$value');
        CardManagerChildLogic.to.state.bankSelect = value;
        CardManagerChildLogic.to.state.bank_name.text =
            CardManagerChildLogic.to.state.isSearch
                ? state.selectBankList[value]
                : state.bankList[value];
        //ctrl.state.bankFormKey.currentState!.fields['bankname'] = state.bankList[value].;
        CardManagerChildLogic.to.setBankValue(
            CardManagerChildLogic.to.state.isSearch
                ? state.selectBankList[value]
                : state.bankList[value]);
      },
      children: state.isSearch
          ? state.selectBankList.map((data) {
              return Container(
                  alignment: Alignment.center,
                  child: Text(
                    data,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15.r),
                  ));
            }).toList()
          : state.bankList.map((data) {
              return Container(
                  alignment: Alignment.center,
                  child: Text(
                    data,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15.r),
                  ));
            }).toList(),
    );
  }
}
