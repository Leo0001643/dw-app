
import 'package:aone_common/common.dart';
import 'package:aone_common/controllers/mine/card_management_new/card_management_logic_new.dart';
import 'package:aone_common/utils/colors.dart';
import 'package:aone_widget/picker/pickers.dart';
import 'package:aone_widget/picker/style/default_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tuple/tuple.dart';

import '../../card_manager_new/controllers/add_bank_controller.dart';
import '../../card_manager_new/controllers/card_manager_logic.dart';

class AddBankForm extends StatelessWidget {
  const AddBankForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CardManagerChildLogic());
    Get.put(AddBankController());
    var state = CardManagerChildLogic.to.state;
    state.isDialog = false;
    state.isEditable = false;
    return  Column(
      children: <Widget>[
        Obx(() {
          return _buildGridView();
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
                  children: _listViewData(),
                ),
              )),
        ),
      ],
    );
  }

  List<Widget> _listViewData() {
    final state = CardManagerChildLogic.to.state;
    List<Widget> _list = [];
    if (state.headerSelIndex == 0) {
      _list.add(_accountTypeSelector());
      if(state.bankType == 1){
        _list.add(_bank());
      }else{
        _list.add(_digtal());
      }
      _list.add(_buildBankView());
    }
    if (state.headerSelIndex > 0) {
      _list.add(_USDT());
      _list.add(_buildTRCView());
    }

    _list.add(_addBankView());
    return _list;
  }

  Widget _accountTypeSelector(){
    var state = CardManagerChildLogic.to.state;
    return GestureDetector(
      onTap: () {
        debugPrint('pop 请选择账户类型');
        List m = [];
        state.cnyTypeList.forEach((element) {
          m.add(element.name);
        });
        if (m.length == 0) {
          SmartDialog.showToast('暂无数据');
          return;
        }
        Pickers.showSinglePicker(
          Get.context!,
          pickerStyle: DefaultPickerStyle(),
          title: "请选择收款账户",
          data: m,
          onConfirm: (value, index) {
            print("$value + $index");
            CardManagerChildLogic.to.state.cnyTypeSelect = state.cnyTypeList[index];
            CardManagerChildLogic.to.state.bankType = index == 0?1:4;//1：银行卡，4：电子钱包
            CardManagerChildLogic.to.state.cny_type.text = state.cnyTypeList[index].name??"";
          },
        );
      },
      child: Container(
          margin: const EdgeInsets.only(left: 8, right: 8),
          padding: const EdgeInsets.only(right: 10, left: 10,bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "账户类型",
                style: TextStyle(
                    color: Color(0xff0B213B),
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: state.cny_type,
                enabled: false,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.arrow_drop_down),
                  hintText: "请选择账户类型",
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

  Widget _bank() {
    var state = CardManagerChildLogic.to.state;
    if(state.true_name.text!=null && state.true_name.text=='0' ){
      state.true_name.text= '';
    }
    debugPrint(state.true_name.text);
    return Container(
      margin: const EdgeInsets.only(left: 8, right: 8),
      padding: const EdgeInsets.only(left: 4, right: 4),
      decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
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
                  const SizedBox(height: 10,),
                  TextField(
                    readOnly: (state.true_name.text.length > 0 && state.true_name.text!='0')? true : false,
                    controller: state.true_name,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintText: "请输入开户姓名",
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
          GestureDetector(
            onTap: () {
              debugPrint('pop 请选择开户银行');
              List m = [];
              state.bankItems.forEach((element) {
                m.add(element.name);
              });
              if (m.length == 0) {
                SmartDialog.showToast('暂无数据');
                return;
              }
              Pickers.showSinglePicker(
                Get.context!,
                pickerStyle: DefaultPickerStyle(),
                title: "请选择收款账户",
                data: m,
                onConfirm: (value, index) {
                  print("$value + $index");
                  CardManagerChildLogic.to.state.bankSelect = index;
                  CardManagerChildLogic.to.state.bankType = 1;
                  CardManagerChildLogic.to.state.bank_name.text = state.bankItems[index].name;
                },
              );
            },
            child: Padding(
                padding: const EdgeInsets.only(right: 10, left: 10,bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "银行",
                      style: TextStyle(
                          color: Color(0xff0B213B),
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10,),
                    TextField(
                      controller: state.bank_name,
                      enabled: false,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.arrow_drop_down),
                        hintText: "请选择开户银行",
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
          ),
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
                  const SizedBox(height: 10,),
                  TextField(
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
                    "开户行名称",
                    style: TextStyle(
                        color: const Color(0xff0B213B),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10,),
                  TextField(
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
      margin: const EdgeInsets.only(left: 8, right: 8),
      padding: const EdgeInsets.only(left: 4, right: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Positioned(
                top: 18.0,
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
                  hintText: "请输入开户姓名",
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
              Positioned(
                top: 18.0,
                child: Text(
                  "钱包地址",
                  style: TextStyle(
                      color: const Color(0xff0B213B),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 5),
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
    // return Container(
    //   margin: EdgeInsets.only(top: 30.r),
    //   child: GestureDetector(
    //     onTap: () {
    //       CardManagerChildLogic.to.postBindingBankDataChild();
    //     },
    //
    //     child: Chip(
    //       padding:
    //       EdgeInsets.only(top: 10.r, left: 80.r, bottom: 10.r, right: 80.r),
    //       backgroundColor: stringToColor('42a0fe'),
    //       label: Text(
    //         'confirm.binding'.tr,
    //         style: TextStyle(color: Colors.white, fontSize: 16.sp),
    //       ),
    //       shape:
    //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
    //     ),
    //   ),
    // );

    return GestureDetector(
      onTap: (){
        CardManagerChildLogic.to.postBindingBankDataChild();
      },
      child:  Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 40,
        decoration: AoneAppTheme.appTheme.withDrawalNormalBntDecoration,
        child: Text("立即取款",style: TextStyle(color: AoneAppTheme.appTheme.normalButtonTextColor)),
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
      margin: EdgeInsets.only(top: 17.5.r),
      width: 238,
      height: 28,
      decoration: BoxDecoration(
          color: stringToColor('3785f9', 0.1),
          // color: Colors.red,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(width: 1.r, color: Colors.white),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 30.r,
              spreadRadius: 1.r,
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _list,
      ),
    );
  }

  _buildGridView() {
    var state = CardManagerChildLogic.to.state;
    print(state.headerList.length);
    List<Widget> _list = [];
    for (int i = 0; i < state.headerList.length; i++) {
      Tuple2 tuple2 = state.headerList[i];
      _list.add(_itemButton(tuple2, i));
    }
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      child: Builder(builder: (context) {
        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: state.headerList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 4.8,
            mainAxisSpacing: 8,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (_, int index) {
            Tuple2 tuple2 = state.headerList[index];
            return _itemButton(tuple2, index);
          },
        );
      }),
    );
  }

  _itemButton(Tuple2 tuple2, int i) {
    var state = CardManagerChildLogic.to.state;
    return Container(
      height: 24,
      decoration: BoxDecoration(
        color:
        state.headerSelIndex == i ? Color(0xff3276f5) : Color(0xfff5f7fa),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(width: 1, color: Color(0xffdddddd)),
      ),
      child: TextButton(
        onPressed: () {
          debugPrint('点击了头部按钮');
          var state = CardManagerChildLogic.to.state;
          state.headerSelIndex = i;
          print(i);
        },
        style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.zero)),
        child: Text(
          tuple2.item1,
          style: TextStyle(
              color: state.headerSelIndex == i
                  ? Color(0xFFffffff)
                  : Color(0xFF000000),
              fontSize: 12,
              fontWeight: FontWeight.w400),
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
    var state = CardManagerChildLogic.to.state;
    return Container(
      margin: EdgeInsets.only(top: 20.r, left: 20.r, right: 20.r),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Text("仅支持",
                  style: TextStyle(
                      color: stringToColor('595959'),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500)
              ),
              Text(state.bankItems2[state.headerSelIndex-1].tag,
                  style: TextStyle(
                      color: stringToColor('4ad134'),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500)
              ),
              Text("地址，请勿输入其他区块链协议地址",
                  style: TextStyle(
                      color: stringToColor('595959'),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500)
              ),
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
    var childState = CardManagerChildLogic.to.state;
    return CupertinoPicker(
      itemExtent: 40,
      onSelectedItemChanged: (value) {
        print('$value');
        CardManagerChildLogic.to.state.bankSelect = value;
        CardManagerLogicNew.to.state.currentType = value;
        CardManagerChildLogic.to.state.bank_name.text = childState.bankItems[value].name;
      },
      children: childState.bankItems.map((data) {
        return Container(
            alignment: Alignment.center,
            child: Text(
              data.name,
              textAlign: TextAlign.center,
            ));
      }).toList(),
    );
  }
}
