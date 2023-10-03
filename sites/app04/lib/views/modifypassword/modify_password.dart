import 'package:aone_common/common.dart';
import 'package:app04/theme/theme_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

import '../../app_service.dart';
import '../../theme/color_schema.dart';
import 'controllers/password_modify_controller.dart';

class ModifyPasswordPage extends GetView<PasswordModifyController> {
  const ModifyPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PasswordModifyController>(
      builder: (_) {
        return ThemeScaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
              title: Text(
                controller.title,
                style: const TextStyle(fontSize: 16, color: Color(0xFFFFFFFF)),
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
          body: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 12, right: 12),
                child: ListView.builder(
                  padding: const EdgeInsets.all(4),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _.pwList.length,
                  //列表项构造器
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    Tuple2 p = _.pwList[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(
                          height: 15,
                        ),
                        Text(p.item1,
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: const Color(0xFF000000),
                                fontWeight: FontWeight.w400)),
                        const SizedBox(
                          height: 10,
                        ),
                        Obx(() {
                          return TextField(
                            obscureText: index == 0
                                ? controller.firstInputVisible
                                : index == 1
                                ? controller.secondInputVisible
                                : controller.thirdInputVisible,
                            controller: index == 0
                                ? controller.firstInputController
                                : index == 1
                                ? controller.secondInputController
                                : controller.thirdInputController,
                            onChanged: (text){
                              index == 0
                                  ? controller.firstIconVisible =
                                  text.isNotEmpty
                                  : index == 1
                                  ? controller.secondIconVisible =
                                  text.isNotEmpty
                                  : controller.thirdIconVisible =
                                  text.isNotEmpty;
                            },
                            decoration: InputDecoration(
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
                              hintText: p.item2,
                              hintStyle: TextStyle(color:const Color(0xFFCCCCCC),fontWeight: FontWeight.w400,fontSize: 14.sp),
                              suffixIcon: _passwordIcon(index),
                            ),
                          );
                        })
                      ],
                    );
                  },
                ),
              ),
              _buildDetView(),
              const Spacer(),
              _confirmButton(context),
            ],
          ),
        );
      },
    );
  }
  Widget? _passwordIcon(int index){
    if(index==0){
      if(controller.firstIconVisible){
        return IconButton(
          icon: controller.firstInputVisible ? closeEyesIcon() : openEyesIcon(), onPressed: () {controller.firstInputVisible = !controller.firstInputVisible;},);
      }
      return null;
    }else if(index==1){
      if(controller.secondIconVisible){
        return IconButton(
          icon: controller.secondInputVisible ? closeEyesIcon() : openEyesIcon(), onPressed: () {controller.secondInputVisible = !controller.secondInputVisible;},);
      }
      return null;
    }else{
      if(controller.thirdIconVisible){
        return IconButton(
          icon: controller.thirdInputVisible ? closeEyesIcon() : openEyesIcon(), onPressed: () {controller.thirdInputVisible = !controller.thirdInputVisible;},);
      }
      return null;
    }
  }
  _buildDetView() {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 14, right: 14),
      alignment: Alignment.centerLeft,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "备注:".tr,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.black,
              fontWeight: FontWeight.w700
            ),
          ),
          Row(
            children: <Widget>[
              Text(
                controller.remark,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: const Color(0xFF666666),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('点击了在线客服');
                  AppService.to.toCustomerService();
                },
                child: Text('在线客服'.tr,
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.red,
                        fontWeight: FontWeight.w500)),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _confirmButton(BuildContext context) {
    return Container(
      height: 36.h,
      margin: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 30.h),
      width: MediaQuery.of(context).size.width,
      decoration:  BoxDecoration(
          gradient: AppTheme.primaryGradient,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: TextButton(
        onPressed: () {
          controller.sumit();
        },
        child: const Text(
          '确认修改',
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  Widget openEyesIcon() {
    return Image.asset(
      "assets/images/login/ice_on_ICON.png",
      width: 20.w,
      height: 20.w,
    );
  }

  Widget closeEyesIcon() {
    return Image.asset(
      "assets/images/login/ice_ICON.png",
      width: 20.w,
      height: 20.w,
    );
  }
}
