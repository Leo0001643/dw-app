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
import 'package:generics/src/cashier/data/withdraw_theme.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';
import '../controllers/card_manager_logic.dart';
import '../controllers/add_bank_controller.dart';

class AddBankFormNew extends StatelessWidget {
  const AddBankFormNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CardManagerChildLogic());
    Get.put(AddBankController());
    var state = CardManagerChildLogic.to.state;
    state.isDialog = true;
    // state.isEditable = false;
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

      _list.add(Obx(() {
        // ignore: unrelated_type_equality_checks
        print(
            'xxxx === ${CardManagerChildLogic.to.state.cny_type.text.isNotEmpty}');
        print('xxxx === ${CardManagerChildLogic.to.state.bankType}');
        if ((CardManagerChildLogic.to.state.bankType == 1) |
            (CardManagerChildLogic.to.state.cny_type.text.isNotEmpty)) {
          return _bank();
        }
        return const SizedBox();
      }));
    } else if (state.headerSelIndex == 1) {
      _list.add(_digtalTypeSelector());
      _list.add(_digtal());
      // _list.add(_buildBankView());
    } else if (state.headerSelIndex == 2) {
      _list.add(_usdtTypeSelector());
      _list.add(_USDT());
      // _list.add(_buildTRCView());
    }

    _list.add(_addBankView());
    return _list;
  }

  Widget _bankTypeSelector() {
    var state = CardManagerChildLogic.to.state;
    return _InputText(
      onTap: () {
        final list = state.dialogBankTypeList.map((e) => e.name).toList();
        if (list.isEmpty) {
          SmartDialog.showToast('暂无数据');
          return;
        }
        Pickers.showSinglePicker(
          Get.context!,
          pickerStyle: DefaultPickerStyle(),
          title: "请选择银行卡类型",
          data: list,
          onConfirm: (value, index) {
            print("$value + $index");
            CardManagerChildLogic.to.state.cnyTypeSelect =
                state.dialogBankTypeList[index];
            CardManagerChildLogic.to.state.bankType =
                index == 0 ? 1 : 3; //1：银行卡，4：电子钱包
            CardManagerChildLogic.to.state.cny_type.text =
                state.dialogBankTypeList[index].name ?? "";
          },
        );
      },
      titleText: '银行卡类型',
      controller: state.cny_type,
      hintText: '请选择银行卡类型',
    );
  }

  Widget _digtalTypeSelector() {
    var state = CardManagerChildLogic.to.state;
    return _InputText(
      onTap: () {
        final list = state.bankItems3.map((e) => e.name).toList();
        if (list.isEmpty) {
          SmartDialog.showToast('暂无数据');
          return;
        }
        Pickers.showSinglePicker(
          Get.context!,
          pickerStyle: DefaultPickerStyle(),
          title: "请选择收款账户",
          data: list,
          onConfirm: (value, index) {
            print("$value + $index");
            CardManagerChildLogic.to.state.bankType = 4; //1：银行卡，4：电子钱包
            CardManagerChildLogic.to.state.cnyTypeSelect =
                state.bankItems3[index];
            CardManagerChildLogic.to.state.cny_type.text =
                state.bankItems3[index].name ?? "";
          },
        );
      },
      titleText: '钱包平台',
      controller: state.cny_type,
      hintText: '请选择钱包平台',
    );
  }

  Widget _usdtTypeSelector() {
    var state = CardManagerChildLogic.to.state;
    return _InputText(
      onTap: () {
        List list = state.bankItems2.map((e) => e.name).toList();
        if (list.isEmpty) {
          SmartDialog.showToast('暂无数据');
          return;
        }
        Pickers.showSinglePicker(
          Get.context!,
          pickerStyle: DefaultPickerStyle(),
          title: "请选择虚拟币币种",
          data: list,
          onConfirm: (value, index) {
            print("$value + $index");
            CardManagerChildLogic.to.state.bankType = 2; //1：银行卡，4：电子钱包
            CardManagerChildLogic.to.state.usdtTypeSelect =
                state.bankItems2[index];
            CardManagerChildLogic.to.state.usdt_type.text =
                state.bankItems2[index].name ?? "";
          },
        );
      },
      titleText: '虚拟币币种',
      controller: state.usdt_type,
      hintText: '请选择虚拟币币种',
    );
  }

  Widget _bank() {
    var state = CardManagerChildLogic.to.state;
    if (state.true_name.text != null && state.true_name.text == '0') {
      state.true_name.text = '';
    }
    debugPrint(state.true_name.text);
    return Column(
      children: [
        _InputText(
          onTap: () {
            List m = [];
            state.bankItems.forEach((element) {
              m.add(element.name);
            });
            if (m.isEmpty) {
              SmartDialog.showToast('暂无数据');
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
          },
          titleText: '银行名称',
          controller: state.bank_name,
          hintText: '请选择开户银行',
        ),
        _InputText(
          titleText: '开户行名称',
          controller: state.bank_kaihu,
          hintText: '请输入开户行名称',
        ),
        _InputText(
          titleText: '银行卡号',
          controller: state.bank_card,
          hintText: '请输入银行卡号',
        ),
        _InputText(
          titleText: '开户姓名',
          controller: state.true_name,
          hintText: '请输入开户姓名',
          readOnly:
              (state.true_name.text.isNotEmpty && state.true_name.text != '0'),
        ),
      ],
    );
  }

  Widget _USDT() {
    var state = CardManagerChildLogic.to.state;
    return _InputText(
      titleText: '区块链地址',
      controller: state.usdt_address,
      hintText: '请输入区块链地址',
    );
  }

  Widget _digtal() {
    var state = CardManagerChildLogic.to.state;
    return _InputText(
      titleText: '钱包地址',
      controller: state.digtal_address,
      hintText: '请输入钱包地址',
    );
  }

  Widget _addBankView() {
    return GestureDetector(
      onTap: () {
        CardManagerChildLogic.to.postBindingBankDataChild();
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w).copyWith(top: 24.w),
        alignment: Alignment.center,
        height: 36.w,
        decoration: AoneAppTheme.appTheme.withDrawalNormalBntDecoration,
        child: Text("确认绑定",
            style: TextStyle(color: AoneAppTheme.appTheme.normalButtonTextColor)),
      ),
    );
  }

  _buildGridView() {
    var state = CardManagerChildLogic.to.state;
    print(state.dialogHeaderList.length);
    List<Widget> _list = [];
    for (int i = 0; i < state.dialogHeaderList.length; i++) {
      Tuple2 tuple2 = state.dialogHeaderList[i];
      _list.add(_itemButton(tuple2, i));
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 16.w),
          Text(
            "提现方式:",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15.w,
              color: AoneAppTheme.appTheme.lightButtonTextColor,
            ),
          ),
          SizedBox(height: 10.w),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: state.dialogHeaderList.length,
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 108 / 40,
              crossAxisSpacing: 8,
            ),
            itemBuilder: (_, int index) {
              Tuple2 tuple2 = state.dialogHeaderList[index];
              return _itemButton(tuple2, index);
            },
          )
        ],
      ),
    );
  }

  _itemButton(Tuple2 tuple2, int i) {
    var state = CardManagerChildLogic.to.state;
    return Container(
      decoration: state.headerSelIndex == i
          ? AoneAppTheme.appTheme.withDrawalNormalBntDecoration
          : AoneAppTheme.appTheme.lightButtonDecoration,
      child: TextButton(
        onPressed: () {
          debugPrint('点击了头部按钮');
          var state = CardManagerChildLogic.to.state;
          state.headerSelIndex = i;
          state.cny_type.text = "";
          state.usdt_type.text = "";
          state.digtal_type.text = "";
          // state.cnyTypeSelect = Banks();
        },
        style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.zero)),
        child: Text(
          tuple2.item1,
          style: TextStyle(
              color: state.headerSelIndex == i
                  ? AoneAppTheme.appTheme.normalButtonTextColor
                  : AoneAppTheme.appTheme.lightButtonTextColor,
              fontSize: 15,
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

class _InputText extends StatelessWidget {
  const _InputText({
    Key? key,
    this.onTap,
    required this.titleText,
    required this.controller,
    required this.hintText,
    this.readOnly = false,
  }) : super(key: key);

  final VoidCallback? onTap;
  final String titleText;
  final TextEditingController controller;
  final String hintText;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titleText,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15.w,
                color: AoneAppTheme.appTheme.lightButtonTextColor,
              ),
            ),
            SizedBox(height: 10.w),
            TextField(
              controller: controller,
              enabled: onTap == null,
              readOnly: readOnly,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: AoneAppTheme.appTheme.fieldTextColor,
                fontSize: 15.w,
              ),
              decoration: InputDecoration(
                suffixIcon: onTap == null
                    ? null
                    : const Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: Color(0xff9AA4B4),
                      ),
                hintText: hintText,
                hintStyle:
                    TextStyle(color: const Color(0xff9AA4B4), fontSize: 15.w),
                contentPadding: EdgeInsets.all(10.w),
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  borderSide: const BorderSide(
                    color: Color(0xff9AA4B4),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  borderSide: const BorderSide(
                    color: Color(0xff9AA4B4),
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  borderSide: const BorderSide(
                    color: Color(0xff9AA4B4),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
