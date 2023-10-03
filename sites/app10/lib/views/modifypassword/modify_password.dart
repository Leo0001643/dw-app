import 'package:aone_common/common.dart';
import 'package:app10/theme/color_schema.dart';
import 'package:app10/theme/theme_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

import '../../app_service.dart';
import 'controllers/password_modify_controller.dart';

class ModifyPasswordPage extends GetView<PasswordModifyController> {
  const ModifyPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PasswordModifyController>(
      builder: (_) {
        return ThemeScaffold(
          appBar: AppBar(
            title: Text(
              controller.title,
              style: TextStyle(
                fontSize: 18.w,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),
          backgroundColor: const Color(0xfff3f4f5),
          body: SafeArea(
            minimum: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              children: <Widget>[
                ..._.pwList.mapIndexed((item, index) {
                  Tuple2 p = _.pwList[index];
                  return Container(
                    margin: EdgeInsets.only(top: 15.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          p.item1,
                          style: TextStyle(
                            fontSize: 14.w,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 10.w),
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
                            onChanged: (text) {
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
                              contentPadding: EdgeInsets.only(
                                  top: 12.w,
                                  left: 10.w,
                                  bottom: 12.w,
                                  right: 10.w),
                              fillColor: Colors.white,
                              enabledBorder: const OutlineInputBorder(
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
                              hintStyle: TextStyle(
                                  color: const Color(0xFFC2C2C2),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.w),
                              suffixIcon: _passwordIcon(index),
                            ),
                          );
                        })
                      ],
                    ),
                  );
                }).toList(),
                _buildDetView(),
                _confirmButton(context),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget? _passwordIcon(int index) {
    if (index == 0) {
      if (controller.firstIconVisible) {
        return IconButton(
          icon: controller.firstInputVisible ? closeEyesIcon() : openEyesIcon(),
          onPressed: () {
            controller.firstInputVisible = !controller.firstInputVisible;
          },
        );
      }
      return null;
    } else if (index == 1) {
      if (controller.secondIconVisible) {
        return IconButton(
          icon:
              controller.secondInputVisible ? closeEyesIcon() : openEyesIcon(),
          onPressed: () {
            controller.secondInputVisible = !controller.secondInputVisible;
          },
        );
      }
      return null;
    } else {
      if (controller.thirdIconVisible) {
        return IconButton(
          icon: controller.thirdInputVisible ? closeEyesIcon() : openEyesIcon(),
          onPressed: () {
            controller.thirdInputVisible = !controller.thirdInputVisible;
          },
        );
      }
      return null;
    }
  }

  _buildDetView() {
    return Container(
      margin: EdgeInsets.only(top: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            "备注:".tr,
            style: TextStyle(
              fontSize: 14.w,
              color: const Color(0xff363636),
            ),
          ),
          SizedBox(height: 5.w),
          Row(
            children: <Widget>[
              Text(
                controller.remark,
                style: TextStyle(
                  fontSize: 12.w,
                  color: const Color(0xFFb1b1b1),
                ),
              ),
              GestureDetector(
                onTap: () {
                  AppService.to.toCustomerService();
                },
                child: Text(
                  '在线客服'.tr,
                  style: TextStyle(
                    fontSize: 12.w,
                    color: Colors.red,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _confirmButton(BuildContext context) {
    return Container(
      height: 44.w,
      margin: EdgeInsets.symmetric(horizontal: 55.w).copyWith(top: 25.w),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: Color(0xffC19E52),
          borderRadius: BorderRadius.all(Radius.circular(22))),
      child: TextButton(
        onPressed: () {
          controller.sumit();
        },
        child:  Text(
          '确认修改',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.w,
          ),
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
