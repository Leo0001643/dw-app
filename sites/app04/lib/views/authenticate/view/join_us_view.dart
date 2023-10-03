import 'package:aone_common/common.dart';
import 'package:aone_common/controllers/register/register_form_fields.dart';
import 'package:aone_widget/picker/pickers.dart';
import 'package:aone_widget/picker/style/default_style.dart';
import 'package:app04/theme/theme_scaffold.dart';
import 'package:app04/views/authenticate/controller/join_us_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../config/site_config.dart';
import '../../../theme/color_schema.dart';
import '../../../widget/form/theme_text_input.dart';
import '../../activities/widgets/show_html_dialog.dart';

class JoinUsView extends GetView<JoinUsController> {
  const JoinUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<JoinUsController>(builder: (_) {
      return ThemeScaffold(
        title: '加入我们',
        elevation: 0,
        body: Container(
          margin: const EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0),
          color: Colors.white,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
                left: 12.r,
                right: 12.r,
                top: 10.r,
                bottom: context.mediaQueryViewPadding.bottom + 12.r),
            child: Obx(() {
              return FormBuilder(
                key: controller.state.regFormKey,
                child: Column(
                  children: <Widget>[
                    ...controller.formFields.map(
                      (e) {
                        if (e.fieldType == FieldType.select) {
                          return ThemeTextInput(
                            label: e.label.tr,
                            hintText: e.remarks.tr,
                            name: e.key,
                            labelWidth: 80.r,
                            isRequired: e.required,
                            isReadOnly: true,
                            labelAlignment: Alignment.centerRight,
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  _onClickItem(
                                      context,
                                      e.key == 'bankname'
                                          ? controller.state.bankList
                                          : controller.state.questionList,
                                      e);
                                },
                                child: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Color.fromRGBO(204, 204, 204, 1),
                                )),
                          );
                        }

                        if (e.fieldType == FieldType.checkbox) {
                          return _builfAgreement();
                        }
                        return ThemeTextInput(
                          name: e.key,
                          label: e.label.tr,
                          isRequired: e.required,
                          hintText: e.remarks.tr,
                          labelWidth: 80.r,
                          labelAlignment: AppRuntimeConfig.siteTag == 'h18'
                              ? Alignment.centerRight
                              : Alignment.centerRight,
                        );
                      },
                    ).toList(),
                    // _builfAgreement(),
                    _buildButtonView(),
                  ],
                ),
              );
            }),
          ),
        ),
      );
    });
  }

  void _onClickItem(BuildContext context, var data, RegisterFormField formfield,
      {String? label}) {
    Pickers.showSinglePicker(
      context,
      data: data,
      pickerStyle: DefaultPickerStyle(),
      suffix: label,
      onConfirm: (p, position) {
        JoinUsController.to.onSelectClose(p, formfield);
      },
    );
  }

  _item(String title, String placeholder, String key) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          textDirection: TextDirection.ltr,
          style: TextStyle(
              color: stringToColor('0b213b'),
              fontSize: 14,
              fontWeight: FontWeight.bold),
        ),
        Container(
          height: 40,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image:
                      AssetImage('assets/images/user/join_ustext_ground.png'),
                  fit: BoxFit.fill)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(
                      left: 10, top: 0, bottom: 10, right: 10),
                  hintText: placeholder,
                  border: InputBorder.none,
                ),
              )),
            ],
          ),
        ),
      ],
    );
  }

  _builfAgreement() {
    return Container(
      margin: const EdgeInsets.only(top: 25, left: 12, right: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              controller.clickAgreement();
            },
            child: controller.selAgreementState
                ? SvgPicture.asset(
                    "assets/images/common/agreement_sel.svg",
                    color: AppTheme.primary,
                  )
                : SvgPicture.asset(
                    "assets/images/common/agreement_unsel.svg",
                  ),
          ),
          const SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () => {
              Get.dialog(ShowHtmlDialog(
                title: '用户协议',
                showContent: controller.state.agreement,
              ))
            },
            child: Text(
              " 相关条款和隐私协议 ",
              style: TextStyle(color: stringToColor('757575')),
            ),
          )
        ],
      ),
    );
  }

  _buildButtonView() {
    return Container(
      margin:  EdgeInsets.only(top: 30, left: 20.r, right: 20.r),
      height: 36.h,
      width: ScreenUtil().screenWidth,
      decoration: BoxDecoration(
          gradient: AppTheme.primaryGradient,
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: TextButton(
        onPressed: () {
          controller.handleSubmit();
        },
        child: const Text(
          '提交申请',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
