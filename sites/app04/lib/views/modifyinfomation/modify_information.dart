import 'package:aone_common/common.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fortune_wheel/fortune_wheel.dart';
import 'package:get/get.dart';
import '../../app_service.dart';
import '../../theme/color_schema.dart';
import '../../theme/theme_scaffold.dart';
import 'controllers/modify_information_controller.dart';

class ModifyInformationPage extends GetView<ModifyInformationController> {
  const ModifyInformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ModifyInformationController());
    return GetBuilder<ModifyInformationController>(
      builder: (_) {
        return ThemeScaffold(
          appBar: AppBar(
              title: const Text(
                "基本信息修改",
                style: TextStyle(fontSize: 16, color: Color(0xFFFFFFFF)),
              ),
              centerTitle: true,
              leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Image(
                  width: 25,
                  height: 25,
                  image: AssetImage(
                    'assets/images/home/person_back.png',
                  ),
                ),
              ),
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: AppTheme.primaryGradient,
                ),
              )),
          hideBack: true,
          title: 'activity'.tr,
          body: SingleChildScrollView(
              child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _contentItem("QQ", controller.inputControllerQQ,"请输入QQ号码",TextInputType.phone),
                        _contentItem("微信", controller.inputControllerWeChat,"请输入微信号码",null),
                        //hintStr
                        Obx(() => _contentItem( "手机号码", controller.inputControllerPhone,"请输入手机号码",null,showServer: controller.safePhone.isNotEmpty,showInputFiled: controller.safePhone.isEmpty,content: controller.safePhone,detString:'电话号码' )),
                        _buildLastSecurityInformation(),
                        Obx(() => _contentItem( "安全答案", controller.inputControllerSafeAnswer,"答案介于2-10个字符之间",null,showServer: true,showInputFiled: false,content: controller.safeAnswer)),
                        Obx(() =>_contentItem( "答案提示", controller.inputControllerSafeTip,"提示介于2-10个字符之间",null,showServer: true,showInputFiled: false,content: controller.safeTips)),
                        _confirmButton(),
                      ],
                    ),
                  ))),
        );
      },
    );
  }

  Widget _buildLastSecurityInformation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "安全问题",
              style: TextStyle(fontSize: 14.sp, color: const Color(0xFF000000)),
            ),
            
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Stack(
          children: [
            Obx(
                  () => Container(
                height: 44.h,
                width: ScreenUtil().screenWidth,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(6), //边角为30
                  ),
                  border: Border.all(color: stringToColor('EBEBEB'), width: 1),
                ),
                child: controller.safeQuestion.value.isEmpty ? SizedBox() : Container(margin:EdgeInsets.only(left: 8),child: Align(alignment:Alignment.centerLeft,child: Text(controller.safeQuestion.string,))),
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

  Widget _contentItem(String title,TextEditingController textEditingController,String? hintStr,TextInputType? type,{bool showServer=false,bool showInputFiled = true, RxString? content, String? detString}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 14.sp, color: const Color(0xFF000000),fontWeight: FontWeight.w400),
            ),
            // showServer ? _buildBeizhu("请联系") : SizedBox(),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        if(showInputFiled) 
       TextField(
          controller: textEditingController,
          keyboardType: type,
          decoration:  InputDecoration(
              contentPadding: EdgeInsets.only(top: 12.w,left:9.w,bottom: 15.w,right: 7.w),
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
            hintStyle: TextStyle(color:const Color(0xFFCCCCCC),fontWeight: FontWeight.w400,fontSize: 14.sp),
          ),
        ),

        if (showServer)
          Container(
          height: 44.h,
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
        showServer ? _buildBeizhu("如需更改${detString ?? ''}请联系") :const SizedBox(),

      ],
    );
  }

  Widget _confirmButton() {
    return Container(
      height: 36.h,
      margin: EdgeInsets.only(bottom: 15.h, top: 30),
      width: ScreenUtil().screenWidth,
      decoration:  BoxDecoration(
          gradient: AppTheme.primaryGradient,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: TextButton(
        onPressed: () async {
          await controller.postData();
        },
        child: Text(
          '保存'.tr,
          style: const TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

}
