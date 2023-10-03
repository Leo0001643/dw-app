import 'package:aone_common/common.dart';
import 'package:app04/views/user/user_center/controller/user_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import '../../../app_service.dart';
import '../../../theme/color_schema.dart';
import '../../../widget/form/theme_text_input.dart';
import '../../../widget/form/theme_text_input_for_register.dart';
import '../controller/forget_password_controller.dart';
import '../controller/login_widget_controller.dart';

class ForgetContactWidget extends StatelessWidget {
  ForgetPasswordController controller;

  ForgetContactWidget(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildDetText(),
        ]);
  }

  buildDetText() {
    return Container(
      width: Get.width,
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 10.r),
      child: RichText(
        text: TextSpan(
            text: '《忘记密码请联系客服更改》',
            style: TextStyle(color: Colors.black, fontSize: 16),
            children: [
              TextSpan(
                text: '在线客服',
                style: TextStyle(color: Colors.red, fontSize: 16),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    AppService.to.toCustomerService();
                  },
              )
            ]),
      ),
    );
  }
}
