import 'package:aone_common/common.dart';
import 'package:app10/theme/color_schema.dart';
import 'package:app10/theme/theme_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../app_service.dart';
import 'controllers/modify_information_controller.dart';

class ModifyInformationPage extends GetView<ModifyInformationController> {
  const ModifyInformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ModifyInformationController());
    return GetBuilder<ModifyInformationController>(
      builder: (_) {
        return ThemeScaffold(
          title: '修改基本信息',
          body: SafeArea(
            minimum: EdgeInsets.symmetric(horizontal: 16.w),
            child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Divider(
                      color: Color(0xFFCCCCCC),
                      height: 1,
                      thickness: 1,
                    ),
                    _contentItem("QQ", controller.inputControllerQQ, "请输入QQ号码",
                        TextInputType.phone),
                    _contentItem(
                        "微信", controller.inputControllerWeChat, "请输入微信号码", null),
                    //hintStr
                    Obx(() => _contentItem("手机号码", controller.inputControllerPhone,
                        "您还没绑定手机号码，请联系在线客服", null,
                        showServer: controller.safePhone.isNotEmpty,
                        showInputFiled: controller.safePhone.isEmpty,
                        content: controller.safePhone,
                        detString: '电话号码')),
                    _buildLastSecurityInformation(),
                    Obx(() => _contentItem("安全答案",
                        controller.inputControllerSafeAnswer, "答案介于2-10个字符之间", null,
                        showServer: true,
                        showInputFiled: false,
                        content: controller.safeAnswer)),
                    Obx(() => _contentItem("答案提示", controller.inputControllerSafeTip,
                        "提示介于2-10个字符之间", null,
                        showServer: true,
                        showInputFiled: false,
                        content: controller.safeTips)),
                    _confirmButton(),
                  ],
                )),
          ),
        );
      },
    );
  }

  Widget _buildLastSecurityInformation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.w),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "安全问题",
              style: TextStyle(
                fontSize: 14.w,
                color: const Color(0xFFFFFFFF),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(height: 10.w),
        Stack(
          children: [
            Obx(
                  () => Container(
                height: 44.w,
                width: ScreenUtil().screenWidth,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(6), //边角为30
                  ),
                  border: Border.all(color: stringToColor('EBEBEB'), width: 1),
                ),
                child: controller.safeQuestion.value.isEmpty
                    ? Container(
                    margin: EdgeInsets.only(left: 8),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '请选择安全问题',
                          style: TextStyle(
                              color: const Color(0xFFCCCCCC),
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp),
                        )))
                    : Container(
                    margin: EdgeInsets.only(left: 8),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          controller.safeQuestion.string,
                        ))),
              ),
            ),
            Positioned(
                top: 0,
                bottom: 0,
                right: 15.w,
                child: const Image(
                  width: 10,
                  height: 10,
                  image: AssetImage(
                    'assets/images/login/down_icon.png',
                  ),
                ))
          ],
        ),
        _buildBeizhu("如需更改请联系"),
      ],
    );
  }

  Widget _buildBeizhu(String prefixContent) {
    return Container(
      margin: EdgeInsets.only(top: 5.r),
      child: Row(
        children: [
          Text(
            prefixContent,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF666666),
            ),
          ),
          GestureDetector(
            onTap: () => AppService.to.toCustomerService(),
            child: Text(
              " 在线客服",
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.red,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _contentItem(String title, TextEditingController textEditingController,
      String? hintStr, TextInputType? type,
      {bool showServer = false,
        bool showInputFiled = true,
        RxString? content,
        String? detString}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15.w),
        Text(
          title,
          style: TextStyle(
              fontSize: 14.w,
              color: const Color(0xFFFFFFFF),
              fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 10.w),
        if (showInputFiled)
          TextField(
            controller: textEditingController,
            keyboardType: type,
            style: const TextStyle(color: Color(0xFFFFFFFF)),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                  top: 12.w, left: 9.w, bottom: 15.w, right: 7.w),
              fillColor: const Color(0xFFFFFFFF),
              enabledBorder: const OutlineInputBorder(
                /*边角*/
                borderRadius: BorderRadius.all(
                  Radius.circular(6), //边角为30
                ),
                borderSide: BorderSide(
                  color: Color(0xFFEBEBEB),
                  width: 1, //边线宽度为2
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFEBEBEB),
                    width: 1, //宽度为5
                  )),
              // errorText: "errorText",
              hintText: hintStr,
              hintStyle: TextStyle(
                  color: const Color(0xFFCCCCCC),
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp),
            ),
          ),
        if (showServer)
          Container(
            height: 44.w,
            width: ScreenUtil().screenWidth,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(6), //边角为30
              ),
              border: Border.all(color: stringToColor('EBEBEB'), width: 1),
            ),
            child: (content?.value.isEmpty ?? true)
                ? textEditingController.text.isEmpty
                ? Container(
                margin: EdgeInsets.only(left: 8),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      hintStr!,
                      style: TextStyle(
                          color: const Color(0xFFCCCCCC),
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp),
                    )))
                : Container(
                margin: EdgeInsets.only(left: 8),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      textEditingController.text,
                    )))
                : Container(
                margin: EdgeInsets.only(left: 8),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      content?.value ?? "",
                    ))),
          ),
        showServer
            ? _buildBeizhu("如需更改${detString ?? ''}请联系")
            : const SizedBox(),
      ],
    );
  }

  Widget _confirmButton() {
    return Container(
      height: 40.w,
      margin: EdgeInsets.only(bottom: 25.w, top: 40.w),
      width: ScreenUtil().screenWidth,
      decoration:  const BoxDecoration(
          color: AppTheme.buttonBg,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: TextButton(
        onPressed: () async {
          await controller.postData();
        },
        child: Text(
          '保存'.tr,
          style:  TextStyle(
            color: AppTheme.buttonText,
            fontSize: 14.w,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
