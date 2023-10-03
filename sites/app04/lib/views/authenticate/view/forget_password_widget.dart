import 'package:aone_common/common.dart';
import 'package:app04/config/site_config.dart';
import 'package:app04/theme/color_schema.dart';
import 'package:app04/theme/theme_scaffold.dart';
import 'package:app04/widget/form/theme_text_input.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../app_service.dart';
import '../../../widget/form/theme_text_input_for_register.dart';
import '../controller/forget_password_controller.dart';
import 'forget_vip_widget.dart';
import 'forget_vip_widget.dart';

class ForgetPasswordWidget extends GetView<ForgetPasswordController> {
  const ForgetPasswordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetPasswordController>(builder: (_) {
      return ThemeScaffold(
        appBar: AppBar(
            title: Text(
              '忘记密码',
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
        backgroundColor: stringToColor('f2f5f8'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: controller.getForgetView(),
          ),
        ),
      );
    });
  }
}
