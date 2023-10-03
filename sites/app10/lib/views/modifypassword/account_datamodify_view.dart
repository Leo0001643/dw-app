import 'package:app10/app_service.dart';
import 'package:app10/theme/color_schema.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../theme/theme_scaffold.dart';
import 'controllers/account_datamodify_controller.dart';

/// qq、微信，可以修改
/// 手机号、安全问题、回答、提示，都不可以修改（联系客服）

class AccountDataModifyView extends GetView<AccountDataModifyController> {
  const AccountDataModifyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountDataModifyController>(
      builder: (_) {
        return ThemeScaffold(
          appBar: AppBar(
            title: Text(
              _.title,
              style: TextStyle(
                fontSize: 18.w,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            backgroundColor: const Color(0xff0C0C0C),
          ),
          backgroundColor: const Color(0xfff3f4f5),
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildContentView(_),
                // if (controller.isModifyPhone == true) _tipsView(),
                _footButton(),
              ],
            ),
          ),
        );
      },
    );
  }

  _buildContentView(AccountDataModifyController _) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(_.label,
              style: TextStyle(
                color: const Color(0xFF171717),
                fontSize: 16.w,
              )),
          SizedBox(height: 10.w),
          Container(
            height: 44.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.white,
            ),
            child: TextField(
              controller: controller.inputController,
              enabled: controller.isCanModify,
              decoration: InputDecoration(
                  hintText: _.hintText,
                  border: InputBorder.none,
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
                  hintStyle: TextStyle(
                      color: const Color(0xFFC2C2C2),
                      fontWeight: FontWeight.w400,
                      fontSize: 14.w),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.w)),
            ),
          )
        ],
      ),
    );
  }

  _tipsView() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Text(
        '如需更改请联系在线客服',
        style: TextStyle(fontSize: 14, color: AppTheme.primary),
      ),
    );
  }

  _footButton() {
    return Container(
      height: 44.w,
      margin: EdgeInsets.symmetric(horizontal: 55.w).copyWith(top: 25.w),
      decoration: const BoxDecoration(
          color: Color(0xffC19E52),
          borderRadius: BorderRadius.all(Radius.circular(22))),
      child: TextButton(
        onPressed: () async {
          if (controller.isCanModify) {
            await controller.postData();
          } else {
            AppService.to.toCustomerService();
          }
        },
        child: Text(
          controller.isCanModify ? '确认修改' : '联系客服',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.w,
          ),
        ),
      ),
    );
  }
}
