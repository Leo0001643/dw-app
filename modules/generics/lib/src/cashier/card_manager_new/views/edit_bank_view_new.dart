import 'package:aone_common/controllers/mine/card_management_new/card_management_logic_new.dart';
import 'package:aone_widget/picker/pickers.dart';
import 'package:aone_widget/picker/style/default_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';
import 'package:aone_common/common.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../../../generics.dart';
import '../../utils/theme_scaffold.dart';
import '../../widgets/withdraw_scaffold.dart';
import '../controllers/card_manager_logic.dart';
import '../controllers/edit_bank_controller.dart';

class EditBankViewNew extends StatelessWidget {
  Widget build(BuildContext context) {
    Get.put(CardManagerChildLogic());
    Get.put(EditBankController());
    var state = CardManagerChildLogic.to.state;
    return WithdrawScaffold(
      title: '修改账户',
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10.r,
          ),
          FormBuilder(
            key: state.formKey,
            enabled: true,
            child: Expanded(
                child: Obx(
              () => ListView(
                children: _listViewData(),
              ),
            )),
          ),
        ],
      ),
    );
  }

  List<Widget> _listViewData() {
    final state = CardManagerChildLogic.to.state;

    List<Widget> _list = [];
    // _list.add(Container(
    //   margin: EdgeInsets.only(left: 10.r, bottom: 5.r),
    //   child: Text(
    //     '基本信息',
    //     style: TextStyle(
    //         color: Color(0xff0B213B),
    //         fontSize: 14.sp,
    //         fontWeight: FontWeight.bold),
    //   ),
    // ));
    if (state.banks[state.selIndex].type == 1) {
      _list.add(_bank());
      // _list.add(_buildBankView());
    }
    if (state.banks[state.selIndex].type == 2) {
      _list.add(_USDT());
      // _list.add(_buildTRCView());
    }

    if (state.banks[state.selIndex].type == 4) {
      _list.add(_DIGTAL());
      // _list.add(_buildTRCView());
    }

    _list.add(_addBankView());
    // if(state.isEditable){
     
    // }
    return _list;
  }

  Widget _bank() {
    var state = CardManagerChildLogic.to.state;
    debugPrint(state.true_name.text);
    return Container(
      padding: const EdgeInsets.only(left: 14, right: 14),
      decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          const SizedBox(height: 20,),
          Padding(
                padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "银行名称",
                      style: TextStyle(
                          color: Color(0xff0B213B),
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
            GestureDetector(
              onTap: () {

              if (state.isEditable)
              {
              debugPrint('pop 请选择开户银行');
              List m = [];
              state.bankItems.forEach((element) {
                m.add(element.name);
              });
              if (m.isEmpty) {
                // SmartDialog.showToast('暂无数据');
                return;
              }
              Pickers.showSinglePicker(
                Get.context!,
                pickerStyle: DefaultPickerStyle(),
                title: "请选择开户银行",
                data: m,
                onConfirm: (value, index) {
                  print("$value + $index");
                  CardManagerChildLogic.to.state.bankSelect = index;
                  CardManagerChildLogic.to.state.bankType = 1;
                  CardManagerChildLogic.to.state.bank_name.text =
                      state.bankItems[index].name;
                },
              );
              }
              
            },
            child: TextField(
                        controller: state.bank_name,
                        enabled: false,
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.arrow_drop_down),
                          hintText: "请选择开户银行",
                          hintStyle: const TextStyle(
                              color: Color(0xff757576), fontSize: 14),
                          contentPadding: const EdgeInsets.only(
                              left: 10, top: 10, bottom: 10, right: 10),
                          isDense: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.r),
                            borderSide: const BorderSide(
                              color: Color(0xffe5e5e5),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.r),
                            borderSide: const BorderSide(
                              color: Color(0xffe5e5e5),
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.r),
                            borderSide: const BorderSide(
                              color: Color(0xffe5e5e5),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          
          // GestureDetector(
          //   onTap: () {
          //     debugPrint('pop 请选择开户银行');
          //     _didClickSelectedBank();
          //   },
          //   child: Padding(
          //       padding: const EdgeInsets.only(right: 10, left: 10,bottom: 10),
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           const Text(
          //             "银行",
          //             style: TextStyle(
          //                 color: Color(0xff0B213B),
          //                 fontSize: 14,
          //                 fontWeight: FontWeight.bold),
          //           ),
          //           SizedBox(height: 10,),
          //           TextField(
          //             controller: state.bank_name,
          //             enabled: false,
          //             textAlign: TextAlign.start,
          //             decoration: InputDecoration(
          //               suffixIcon: Icon(Icons.arrow_drop_down),
          //               hintText: "请选择开户银行",
          //               hintStyle:const TextStyle(
          //                   color: Color(0xff757576),
          //                   fontSize: 14
          //               ),
          //               contentPadding: const EdgeInsets.only(left: 10,top:10, bottom:10,right:10),
          //               isDense: true,
          //               border:OutlineInputBorder(
          //                 borderRadius: BorderRadius.circular(5.r),
          //                 borderSide:const  BorderSide(
          //                   color: Color(0xffe5e5e5),
          //                 ),
          //               ),
          //               enabledBorder: OutlineInputBorder(
          //                 borderRadius: BorderRadius.circular(5.r),
          //                 borderSide:const  BorderSide(
          //                   color: Color(0xffe5e5e5),
          //                 ),
          //               ),
          //               disabledBorder: OutlineInputBorder(
          //                 borderRadius: BorderRadius.circular(5.r),
          //                 borderSide:const  BorderSide(
          //                   color: Color(0xffe5e5e5),
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ],
          //       )),
          // ),
          Padding(
              padding: const EdgeInsets.only(right: 10, left: 10,bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "开户姓名",
                    style: TextStyle(
                        color: const Color(0xff0B213B),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    readOnly: !state.isEditable,
                    controller: state.true_name,
                    textAlign: TextAlign.start,
                    enabled: false,
                    decoration: InputDecoration(
                      hintText: "请输入持卡人姓名",
                      hintStyle:const TextStyle(
                          color: Color(0xff757576),
                          fontSize: 14
                      ),
                      contentPadding: const EdgeInsets.only(left: 10,top:10, bottom:10,right:10),
                      isDense: true,
                      border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide:const  BorderSide(
                          color: Color(0xffe5e5e5),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide:const  BorderSide(
                          color: Color(0xffe5e5e5),
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide:const  BorderSide(
                          color: Color(0xffe5e5e5),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
          Padding(
              padding: const EdgeInsets.only(right: 10, left: 10,bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "银行卡号",
                    style: TextStyle(
                        color: const Color(0xff0B213B),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    readOnly: !state.isEditable,
                    keyboardType: TextInputType.number,
                    controller: state.bank_card,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintText: "请输入银行卡号",
                      hintStyle:const TextStyle(
                          color: Color(0xff757576),
                          fontSize: 14
                      ),
                      contentPadding: const EdgeInsets.only(left: 10,top:10, bottom:10,right:10),
                      isDense: true,
                      border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide:const  BorderSide(
                          color: Color(0xffe5e5e5),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide:const  BorderSide(
                          color: Color(0xffe5e5e5),
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide:const  BorderSide(
                          color: Color(0xffe5e5e5),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
          Padding(
              padding: const EdgeInsets.only(right: 10, left: 10,bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "开户行",
                    style: TextStyle(
                        color: const Color(0xff0B213B),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    readOnly: !state.isEditable,
                    controller: state.bank_kaihu,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintText: "请输入开户行名称",
                      hintStyle:const TextStyle(
                          color: Color(0xff757576),
                          fontSize: 14
                      ),
                      contentPadding: const EdgeInsets.only(left: 10,top:10, bottom:10,right:10),
                      isDense: true,
                      border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide:const  BorderSide(
                          color: Color(0xffe5e5e5),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide:const  BorderSide(
                          color: Color(0xffe5e5e5),
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide:const  BorderSide(
                          color: Color(0xffe5e5e5),
                        ),
                      ),
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
      padding: const EdgeInsets.only(left: 4, right: 4,top: 5,bottom: 10),
      decoration: const BoxDecoration(
        color:Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(right: 10, left: 10,top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 18),
                    child: Text(
                      "区块链地址",
                      style: TextStyle(
                          color: const Color(0xff0B213B),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    readOnly: !state.isEditable,
                    controller: state.usdt_address,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintText: "请输入区块链地址",
                      hintStyle:const TextStyle(
                          color: Color(0xff757576),
                          fontSize: 14
                      ),
                      contentPadding: const EdgeInsets.only(left: 10,top:10, bottom:10,right:10),
                      isDense: true,
                      border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide:const  BorderSide(
                          color: Color(0xffe5e5e5),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide:const  BorderSide(
                          color: Color(0xffe5e5e5),
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide:const  BorderSide(
                          color: Color(0xffe5e5e5),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
          Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 18),
                    child: Text(
                      "区块链类型",
                      style: TextStyle(
                          color: const Color(0xff0B213B),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    readOnly: !state.isEditable,
                    controller: state.usdt_type,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintText: "请输入区块链类型",
                      hintStyle:const TextStyle(
                          color: Color(0xff757576),
                          fontSize: 14
                      ),
                      contentPadding: const EdgeInsets.only(left: 10,top:10, bottom:10,right:10),
                      isDense: true,
                      border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide:const  BorderSide(
                          color: Color(0xffe5e5e5),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide:const  BorderSide(
                          color: Color(0xffe5e5e5),
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide:const  BorderSide(
                          color: Color(0xffe5e5e5),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ],
      )
    );
  }

  Widget _DIGTAL() {
    var state = CardManagerChildLogic.to.state;
    return Container(
        padding: const EdgeInsets.only(left: 4, right: 4,top: 5,bottom: 10),
        decoration: const BoxDecoration(
          color:Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(right: 10, left: 10,top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 18),
                      child: Text(
                        "电子钱包地址",
                        style: TextStyle(
                            color: const Color(0xff0B213B),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      readOnly: !state.isEditable,
                      controller: state.digtal_address,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        hintText: "请输入电子钱包地址",
                        hintStyle:const TextStyle(
                            color: Color(0xff757576),
                            fontSize: 14
                        ),
                        contentPadding: const EdgeInsets.only(left: 10,top:10, bottom:10,right:10),
                        isDense: true,
                        border:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.r),
                          borderSide:const  BorderSide(
                            color: Color(0xffe5e5e5),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.r),
                          borderSide:const  BorderSide(
                            color: Color(0xffe5e5e5),
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.r),
                          borderSide:const  BorderSide(
                            color: Color(0xffe5e5e5),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            Padding(
                padding: const EdgeInsets.only(right: 10, left: 10,top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 18),
                      child: Text(
                        "电子钱包类型",
                        style: TextStyle(
                            color: const Color(0xff0B213B),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      readOnly: !state.isEditable,
                      controller: state.digtal_type,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        hintText: "请输入电子钱包类型",
                        hintStyle:const TextStyle(
                            color: Color(0xff757576),
                            fontSize: 14
                        ),
                        contentPadding: const EdgeInsets.only(left: 10,top:10, bottom:10,right:10),
                        isDense: true,
                        border:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.r),
                          borderSide:const  BorderSide(
                            color: Color(0xffe5e5e5),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.r),
                          borderSide:const  BorderSide(
                            color: Color(0xffe5e5e5),
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.r),
                          borderSide:const  BorderSide(
                            color: Color(0xffe5e5e5),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        )
    );
  }

  Widget _digtal() {
    var state = CardManagerChildLogic.to.state;
    return Container(
      margin: const EdgeInsets.only(left: 8, right: 8),
      padding: const EdgeInsets.only(left: 4, right: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 18),
                child: Text(
                  "钱包地址",
                  style: TextStyle(
                      color: const Color(0xff0B213B),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 5),
              TextField(
                controller: state.digtal_address,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  hintText: "请输入钱包地址",
                  hintStyle:const TextStyle(
                      color: Color(0xff757576),
                      fontSize: 14
                  ),
                  contentPadding: const EdgeInsets.only(left: 10,top:10, bottom:10,right:10),
                  isDense: true,
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide:const  BorderSide(
                      color: Color(0xffe5e5e5),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide:const  BorderSide(
                      color: Color(0xffe5e5e5),
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide:const  BorderSide(
                      color: Color(0xffe5e5e5),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
  Widget _addBankView() {
    return Container(
      margin: EdgeInsets.only(top: 30.r),
      child: GestureDetector(
        onTap: () {
          if (CardManagerChildLogic.to.state.isEditable)
          {
            final state = CardManagerChildLogic.to.state;
            state.bankType = state.banks[state.selIndex].type;
            CardManagerChildLogic.to.postBindingBankDataChild(isEdit: true);
          }else
          {
            SmartDialog.showToast('暂不支持修改，请联系客服！');
          }
          
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.center,
          height: 40,
          decoration: AoneAppTheme.appTheme.withDrawalNormalBntDecoration,
          child: Text("确认修改",
              style:
              TextStyle(color: AoneAppTheme.appTheme.normalButtonTextColor)),
        ),
      ),
    );
  }

  _buildBankView() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 14, right: 14),
      alignment: Alignment.centerLeft,
      child: Text('*为了您的资金能迅速到账，请确保填写的姓名与银行卡的开户姓名一致。',
          style: TextStyle(
              color: stringToColor('FF334C'),
              fontSize: 12.sp,
              fontWeight: FontWeight.w500)),
    );
  }

  _buildTRCView() {
    return Container(
      margin: EdgeInsets.only(top: 20.r, left: 14.r, right: 14.r),
      alignment: Alignment.centerLeft,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text('e01.bank.add.note'.tr,
                  style: TextStyle(
                      color: stringToColor('595959'),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500)),
              GestureDetector(
                onTap: () {
                  debugPrint('点击了在线客服');
                  // final AppService _app = AppService.to;
                  // _app.toCustomerService();
                },
                child: Text('login.onlineservice'.tr,
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                        fontWeight: FontWeight.w500)),
              )
            ],
          )
        ],
      ),
    );
  }

  void _didClickSelectedBank() {
    var state = CardManagerChildLogic.to.state;
    state.bankSelect = 0;
    showCupertinoModalPopup<void>(
        context: Get.context!,
        builder: (BuildContext context) {
          return Container(
            height: ScreenUtil().setHeight(250),
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
          );
        });
  }

  Widget _buildBankPicker() {
    var state = CardManagerLogicNew.to.state;
    return CupertinoPicker(
      itemExtent: 40,
      onSelectedItemChanged: (value) {
        print('选择了：${state.bankList[value]}');
        print('$value');
        CardManagerChildLogic.to.state.bankSelect = value;
        CardManagerLogicNew.to.state.currentType = value;
        CardManagerChildLogic.to.state.bank_kaihu.text = state.bankList[value];
      },
      children: state.bankList.map((data) {
        return Container(
            alignment: Alignment.center,
            child: Text(
              data,
              textAlign: TextAlign.center,
            ));
      }).toList(),
    );
  }
}

