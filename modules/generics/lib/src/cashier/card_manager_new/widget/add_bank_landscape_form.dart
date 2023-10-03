import 'package:aone_common/common.dart';
import 'package:aone_common/utils/history.dart';
import 'package:aone_widget/picker/pickers.dart';
import 'package:aone_widget/picker/style/default_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:generics/src/cashier/card_manager_new/widget/theme_dropdown.dart';
import 'package:generics/src/cashier/data/withdraw_theme.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';
import '../widget/theme_button.dart';
import '../controllers/card_manager_logic.dart';
import '../controllers/add_bank_controller.dart';

class AddBankLandscapeForm extends StatelessWidget {
  const AddBankLandscapeForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CardManagerChildLogic());
    Get.put(AddBankController());
    var state = CardManagerChildLogic.to.state;
    state.isDialog = true;
    state.isEditable = false;
    return Column(
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
      _list.add(_bankTypeSelector());
      _list.add(_bank());
      // _list.add(Obx((){
      //   // ignore: unrelated_type_equality_checks
      //   print('xxxx === ${CardManagerChildLogic.to.state.cny_type.text.isNotEmpty}');
      //   print('xxxx === ${CardManagerChildLogic.to.state.bankType}');
      //   if ((CardManagerChildLogic.to.state.bankType == 1) | (CardManagerChildLogic.to.state.cny_type.text.isNotEmpty) )
      //   {
      //     return _bank();
      //   }
      //   return const SizedBox();
      // }) );

    } else if (state.headerSelIndex == 1) {
      _list.add(_digtalTypeSelector());
      _list.add(_digtal());
      // _list.add(_buildBankView());
    } else if (state.headerSelIndex == 2) {
      _list.add(_usdtTypeSelector());
      _list.add(_USDT());
      _list.add(_buildTRCView());
    }

    _list.add(_addBankView());
    return _list;
  }

  Widget _bankTypeSelector() {
    var state = CardManagerChildLogic.to.state;
    return Container(
      width: 200.w,
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 50),
      child: ThemeDropDown<String>(
        labelWidth: 100.w,
        name: "银行卡类型:",
        label: "银行卡类型:",
        hintText: 'reg.hint.bank.name'.tr,
        dropdownList: state.dialogBankTypeList
            .map(
              (element) => DropdownMenuItem<String>(
                value: element.name,
                child: Text(element.name),
              ),
            )
            .toList(),
        onChange: (val) {
          print(val);
          CardManagerChildLogic.to.state.bankType = 1; //1：银行卡，4：电子钱包
          // CardManagerChildLogic.to.state.cnyTypeSelect =
          // state.bankItems3[index];
          // CardManagerChildLogic.to.state.cny_type.text =
          //     state.bankItems3[index].name ?? "";
        },
      ),
    );
  }

  Widget _digtalTypeSelector() {
    var state = CardManagerChildLogic.to.state;
    return Container(
      width: 200.w,
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 50),
      child: ThemeDropDown<String>(
        labelWidth: 100.w,
        name: "钱包平台:",
        label: "钱包平台:",
        hintText: 'reg.hint.bank.name'.tr,
        dropdownList: state.bankItems3
            .map(
              (element) => DropdownMenuItem<String>(
                value: element.names,
                child: Text(element.names),
              ),
            )
            .toList(),
        onChange: (val) {
          print(val);
          // CardManagerChildLogic.to.state.bankType = 4; //1：银行卡，4：电子钱包
          // CardManagerChildLogic.to.state.cnyTypeSelect =
          // state.bankItems3[index];
          // CardManagerChildLogic.to.state.cny_type.text =
          //     state.bankItems3[index].name ?? "";
        },
      ),
    );
  }

  Widget _usdtTypeSelector() {
    var state = CardManagerChildLogic.to.state;
    return Container(
      width: 200.w,
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 50),
      child: ThemeDropDown<String>(
        labelWidth: 100.w,
        name: "虚拟币平台:",
        label: "虚拟币平台:",
        hintText: 'reg.hint.bank.name'.tr,
        dropdownList: state.bankItems2
            .map(
              (element) => DropdownMenuItem<String>(
                value: element.names,
                child: Text(element.names),
              ),
            )
            .toList(),
        onChange: (val) {
          print(val);
          // CardManagerChildLogic.to.state.bankType = 4; //1：银行卡，4：电子钱包
          // CardManagerChildLogic.to.state.cnyTypeSelect =
          // state.bankItems3[index];
          // CardManagerChildLogic.to.state.cny_type.text =
          //     state.bankItems3[index].name ?? "";
        },
      ),
    );
    // return GestureDetector(
    //   onTap: () {
    //     debugPrint('pop 请选择账户类型');
    //     List m = [];
    //     state.bankItems2.forEach((element) {
    //       m.add(element.name);
    //     });
    //     if (m.length == 0) {
    //       SmartDialog.showToast('暂无数据');
    //       return;
    //     }
    //     Pickers.showSinglePicker(
    //       Get.context!,
    //       pickerStyle: DefaultPickerStyle(),
    //       title: "请选择虚拟币币种",
    //       data: m,
    //       onConfirm: (value, index) {
    //         print("$value + $index");
    //         CardManagerChildLogic.to.state.bankType = 2; //1：银行卡，4：电子钱包
    //         CardManagerChildLogic.to.state.usdtTypeSelect =
    //         state.bankItems2[index];
    //         CardManagerChildLogic.to.state.usdt_type.text =
    //             state.bankItems2[index].name ?? "";
    //       },
    //     );
    //   },
    //   child: Container(
    //       margin: const EdgeInsets.only(left: 8, right: 8),
    //       padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           const Text(
    //             "虚拟币币种",
    //             style: TextStyle(
    //                 color: Color(0xff0B213B),
    //                 fontSize: 14,
    //                 fontWeight: FontWeight.bold),
    //           ),
    //           const SizedBox(
    //             height: 10,
    //           ),
    //           TextField(
    //             controller: state.usdt_type,
    //             enabled: false,
    //             textAlign: TextAlign.start,
    //             decoration: InputDecoration(
    //               suffixIcon: const Icon(Icons.arrow_drop_down),
    //               hintText: "请选择虚拟币币种",
    //               hintStyle:
    //               const TextStyle(color: Color(0xff757576), fontSize: 14),
    //               contentPadding: const EdgeInsets.only(
    //                   left: 10, top: 10, bottom: 10, right: 10),
    //               isDense: true,
    //               border: OutlineInputBorder(
    //                 borderRadius: BorderRadius.circular(5.r),
    //                 borderSide: const BorderSide(
    //                   color: Color(0xffe5e5e5),
    //                 ),
    //               ),
    //               enabledBorder: OutlineInputBorder(
    //                 borderRadius: BorderRadius.circular(5.r),
    //                 borderSide: const BorderSide(
    //                   color: Color(0xffe5e5e5),
    //                 ),
    //               ),
    //               disabledBorder: OutlineInputBorder(
    //                 borderRadius: BorderRadius.circular(5.r),
    //                 borderSide: const BorderSide(
    //                   color: Color(0xffe5e5e5),
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ],
    //       )),
    // );
  }

  Widget _bank() {
    var state = CardManagerChildLogic.to.state;
    if (state.true_name.text != null && state.true_name.text == '0') {
      state.true_name.text = '';
    }
    return Container(
      width: 260.w,
      margin: const EdgeInsets.only(left: 8, right: 8),
      padding: const EdgeInsets.only(left: 4, right: 4),
      decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          // GestureDetector(
          //   onTap: () {
          //     debugPrint('pop 请选择开户银行');
          //     List m = [];
          //     state.bankItems.forEach((element) {
          //       m.add(element.name);
          //     });
          //     if (m.length == 0) {
          //       SmartDialog.showToast('暂无数据');
          //       return;
          //     }
          //     Pickers.showSinglePicker(
          //       Get.context!,
          //       pickerStyle: DefaultPickerStyle(),
          //       title: "请选择开户银行",
          //       data: m,
          //       onConfirm: (value, index) {
          //         print("$value + $index");
          //         CardManagerChildLogic.to.state.bankSelect = index;
          //         CardManagerChildLogic.to.state.bankType = 1;
          //         CardManagerChildLogic.to.state.bank_name.text =
          //             state.bankItems[index].name;
          //       },
          //     );
          //   },
          //   child: Padding(
          //       padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
          //       child: Row(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           const Text(
          //             "银行名称",
          //             style: TextStyle(
          //                 color: Color(0xff0B213B),
          //                 fontSize: 14,
          //                 fontWeight: FontWeight.bold),
          //           ),
          //           const SizedBox(
          //             width: 10,
          //           ),
          //           Container(
          //             width: 200.w,
          //             child: TextField(
          //               controller: state.bank_name,
          //               enabled: false,
          //               textAlign: TextAlign.start,
          //               decoration: InputDecoration(
          //                 suffixIcon: const Icon(Icons.arrow_drop_down),
          //                 hintText: "请选择开户银行",
          //                 hintStyle: const TextStyle(
          //                     color: Color(0xff757576), fontSize: 14),
          //                 contentPadding: const EdgeInsets.only(
          //                     left: 10, top: 10, bottom: 10, right: 10),
          //                 isDense: true,
          //                 border: OutlineInputBorder(
          //                   borderRadius: BorderRadius.circular(5.r),
          //                   borderSide: const BorderSide(
          //                     color: Color(0xffe5e5e5),
          //                   ),
          //                 ),
          //                 enabledBorder: OutlineInputBorder(
          //                   borderRadius: BorderRadius.circular(5.r),
          //                   borderSide: const BorderSide(
          //                     color: Color(0xffe5e5e5),
          //                   ),
          //                 ),
          //                 disabledBorder: OutlineInputBorder(
          //                   borderRadius: BorderRadius.circular(5.r),
          //                   borderSide: const BorderSide(
          //                     color: Color(0xffe5e5e5),
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           )
          //         ],
          //       )),
          // ),
          Container(
              width: 200.w,
              padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Text(
                      "开户行名称",
                      style: TextStyle(
                          color: const Color(0xff0B213B),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    width: 120.w,
                  ),
                  Container(
                    width: 200.w,
                    child: TextField(
                      controller: state.bank_kaihu,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        hintText: "请输入开户行名称",
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
                  )
                ],
              )),
          Container(
              width: 200.w,
              padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "银行卡号",
                    style: TextStyle(
                        color: const Color(0xff0B213B),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 200.w,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: state.bank_card,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        hintText: "请输入银行卡号",
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
                  )
                ],
              )),
          Container(
              width: 200.w,
              padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "开户姓名",
                    style: TextStyle(
                        color: const Color(0xff0B213B),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: TextField(
                      readOnly: (state.true_name.text.length > 0 &&
                              state.true_name.text != '0')
                          ? true
                          : false,
                      controller: state.true_name,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        hintText: "请输入开户姓名",
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
                  )
                ],
              )),
        ],
      ),
    );
  }

  Widget _USDT() {
    var state = CardManagerChildLogic.to.state;
    return Container(
      margin: const EdgeInsets.only(left: 8, right: 8, bottom: 20),
      padding: const EdgeInsets.only(left: 4, right: 4),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100.w,
                child: Text(
                  "区块链地址",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: const Color(0xffffffff),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 200.w,
                child: TextField(
                  controller: state.usdt_address,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    hintText: "请输入区块链地址",
                    hintStyle:
                        const TextStyle(color: Color(0xff757576), fontSize: 14),
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
              )
            ],
          )),
    );
  }

  Widget _digtal() {
    var state = CardManagerChildLogic.to.state;
    return Container(
        margin: EdgeInsets.only(left: 8, bottom: 24.r, right: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100.w,
              child: Text(
                "钱包地址",
                textAlign: TextAlign.right,
                style: TextStyle(color: const Color(0xffffffff), fontSize: 12),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              width: 330.w,
              child: TextField(
                controller: state.digtal_address,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  hintText: "请输入钱包地址",
                  hintStyle:
                      const TextStyle(color: Color(0xff757576), fontSize: 14),
                  contentPadding: const EdgeInsets.only(
                      left: 10, top: 5, bottom: 5, right: 10),
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
            )
          ],
        ));
  }

  Widget _addBankView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ThemeButton(
          onPressed: () {
            CardManagerChildLogic.to.postBindingBankDataChild();
          },
          btnText: 'confirm.binding'.tr,
        ),
      ],
    );
  }

  _buildGridView() {
    var state = CardManagerChildLogic.to.state;
    return Container(
        width: 320.w,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: const Text(
                "账户类型:",
                style: TextStyle(fontSize: 12),
              ),
            ),
            SizedBox(width: 10),
            Container(
              width: 260.w,
              child: Builder(builder: (context) {
                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: state.dialogHeaderList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 3.0,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 5,
                  ),
                  itemBuilder: (_, int index) {
                    Tuple2 tuple2 = state.dialogHeaderList[index];
                    return _addButton(tuple2, index);
                  },
                );
              }),
            )
          ],
        ));
  }

  Widget _addButton(Tuple2 tuple2, int i) {
    var state = CardManagerChildLogic.to.state;
    return Center(
      child: ThemeButton(
        onPressed: () {
          state.headerSelIndex = i;
          state.cny_type.text = "";
          state.usdt_type.text = "";
          state.digtal_type.text = "";
        },
        btnText: tuple2.item1,
        color: state.headerSelIndex == i
            ? const LinearGradient(
                colors: [
                  Color.fromRGBO(247, 229, 181, 1),
                  Color.fromRGBO(181, 149, 105, 1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 0.715],
              )
            : const LinearGradient(
                colors: [
                  Color.fromRGBO(227, 222, 204, 1),
                  Color.fromRGBO(144, 132, 115, 1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
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
      margin: EdgeInsets.only(top: 20.r, left: 20.r, right: 20.r, bottom: 20.r),
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
                      fontWeight: FontWeight.w500)),
              Text(state.usdtTypeSelect.name ?? "虚拟币",
                  style: TextStyle(
                      color: stringToColor('4ad134'),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500)),
              Text("地址，请勿输入其他区块链协议地址",
                  style: TextStyle(
                      color: stringToColor('595959'),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500)),
            ],
          )
        ],
      ),
    );
  }
}
