// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../theme/color_schema.dart';
import 'discount_controller.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class DiscountApplyShow extends StatelessWidget {
  final controller = Get.put(DiscountController());
  // final int activityid;
  final ActivityInfo? activityInfo;
  DiscountApplyShow({Key? key, this.activityInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.activityid = activityInfo?.id ?? 0;
    List<dynamic> _list = jsonDecode(activityInfo!.dataJson!);
    controller.activityApplyEntity = ActivityApplyEntity.fromJson(_list[0]);

    return Column(
      children: <Widget>[
        Expanded(
            child: Container(
                margin: const EdgeInsets.only(
                    top: 17.5, left: 15, bottom: 12, right: 15),
                child: FormBuilder(
                  key: controller.regFormKey,
                  child: ListView(
                    children: _buildListView(),
                  ),
                ))),
        Container(
            width: 80,
            height: 36,
            margin: const EdgeInsets.only(
                top: 0, left: 24, bottom: 12.5, right: 24),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AoneAppTheme.appTheme.activityDialogButtonBgColor),
            child: TextButton(
              onPressed: () {
                controller.postData.call();
              },
              child: Text(
                'sure'.tr,
                style: TextStyle(
                    color: AoneAppTheme.appTheme.activityDialogButtonTextColor),
              ),
            )),
      ],
      // ),
    );
  }

  _buildListView() {
    print(controller.activityApplyEntity?.jztime);
    var _list = controller.activityApplyEntity?.extArgs as List;
    List<Widget> _returnList = [];
    for (int i = 0; i < _list.length; i++) {
      ExtArgsEntity entity = _list[i];
      _returnList.add(_buildItem(
          entity.extShowName!, entity.extShowDesc!, entity.isrequired == 1,
          input: controller.inputList[i]));
    }

    _returnList.add(_builedSelBox(_list[3]));
    return _returnList;
  }

  _buildItem(String title, String hintText, bool isRequrid,
      {TextEditingController? input}) {
    if (input == controller.timeTF) {
      controller.timeIsRequired = isRequrid;
    }
    return Container(
      margin: const EdgeInsets.only(bottom: 12.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text.rich(TextSpan(children: [
            isRequrid
                ? TextSpan(
                    text: '* ',
                    style: TextStyle(
                        color: Color.fromRGBO(255, 0, 0, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  )
                : TextSpan(),
            TextSpan(
              text: title,
              style: TextStyle(
                  color: AoneAppTheme.appTheme.activityDialogSubTitleTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            )
          ])),
          const SizedBox(
            height: 12.5,
          ),
          input == controller.timeTF
              ? FormBuilderTextField(
                  readOnly: true,
                  onTap: () {
                    DatePicker.showDateTimePicker(Get.context!,
                        // 是否展示顶部操作按钮
                        showTitleActions: true,
                        // change事件
                        onChanged: (date) {
                      print('change $date');
                    },
                        // 确定事件
                        onConfirm: (date) {
                      print('confirm $date');
                      var str = timeStampIntToSecondWithFormat(
                          (date.millisecondsSinceEpoch),
                          format: 'yyyy/MM/dd HH:mm:ss');
                      controller.setTime(str);
                      // mController.confirmBetEnd("$date");
                    },
                        // 当前时间
                        currentTime: DateTime.now(),
                        // 语言
                        locale: LocaleType.zh);
                  },
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: title + 'mustFill'.tr),
                  ]),
                  controller: input,
                  name: '',
                  autofocus: false,
                  style: TextStyle(
                    color:
                        AoneAppTheme.appTheme.activityDialogSubTitleTextColor,
                    fontSize: 12,
                  ),
                  onSubmitted: (text) {
                    // FocusScope.of(Get.context!).requestFocus(FocusNode());
                  },
                  maxLines: 1,
                  maxLength: 20,
                  // controller: input,
                  // enabled: input != null,
                  // obscureText: input == controller.passwordTF,
                  decoration: InputDecoration(
                    // labelText: contenMap['content'],
                    counterText: '',
                    // 此处控制最大字符是否显示
                    contentPadding:
                        const EdgeInsets.only(left: 10, top: 0, bottom: 0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppTheme.primary,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppTheme.primary,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppTheme.primary,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppTheme.primary,
                      ),
                    ),
                    hintText: hintText,
                    hintStyle: TextStyle(
                        color:
                            AoneAppTheme.appTheme.activityDialogHintTextColor,
                        fontSize: 12),
                    // border: InputBorder.none,
                  ),
                )
              : FormBuilderTextField(
                  // readOnly: true,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: title + 'mustFill'.tr),
                  ]),
                  controller: input,
                  name: '',
                  autofocus: false,
                  style: TextStyle(
                    color:
                        AoneAppTheme.appTheme.activityDialogSubTitleTextColor,
                    fontSize: 12,
                  ),
                  onSubmitted: (text) {
                    // FocusScope.of(Get.context!).requestFocus(FocusNode());
                  },
                  maxLines: 1,
                  maxLength: 20,
                  // controller: input,
                  // enabled: input != null,
                  // obscureText: input == controller.passwordTF,
                  decoration: InputDecoration(
                    // labelText: contenMap['content'],
                    counterText: '',
                    // 此处控制最大字符是否显示
                    contentPadding:
                        const EdgeInsets.only(left: 10, top: 0, bottom: 0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppTheme.primary,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppTheme.primary,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppTheme.primary,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppTheme.primary,
                      ),
                    ),
                    hintText: hintText,
                    hintStyle: TextStyle(
                        color:
                            AoneAppTheme.appTheme.activityDialogHintTextColor,
                        fontSize: 12),
                    // border: InputBorder.none,
                  ),
                  cursorColor: AppTheme.primary,
                ),
        ],
      ),
    );
  }

  _builedSelBox(ExtArgsEntity entit) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // ignore: prefer_const_literals_to_create_immutables
          Text.rich(TextSpan(children: [
            // const TextSpan(
            //   text: '* ',
            //   style: TextStyle(
            //       color: Color.fromRGBO(255, 0, 0, 1),
            //       fontSize: 14,
            //       fontWeight: FontWeight.bold),
            // ),
            TextSpan(
              text: entit.extShowDesc,
              style: TextStyle(
                  color: AoneAppTheme.appTheme.activityDialogSubTitleTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            )
          ])),
          const SizedBox(width: 10),

          GestureDetector(
              onTap: () {
                controller.selectBox();
              },
              child: Obx(
                () => Container(
                  width: 18,
                  height: 18,
                  margin: EdgeInsets.only(top: 2.5),
                  child: Image.asset(
                    controller.selectTag.value == '1'
                        ? 'assets/images/login/login_save_pas_checked.png'
                        : 'assets/images/login/login_save_pas_uncheck.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
