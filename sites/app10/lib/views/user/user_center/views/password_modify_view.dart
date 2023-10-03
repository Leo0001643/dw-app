import 'package:aone_common/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tuple/tuple.dart';

import '../../../../app_service.dart';
import '../../../../theme/color_schema.dart';
import '../../../../theme/theme_scaffold.dart';
import '../controller/password_modify_controller.dart';

class PasswordModifyView extends GetView<PasswordModifyController> {
  const PasswordModifyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PasswordModifyController>(
      builder: (_) {
        return ThemeScaffold(
          title: controller.title,
          body: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _buildDetView(),
              _footButton(),
            ],
          ),
        );
      },
    );
  }

  _buildLoginPasswordView() {
    List<Widget> _list = [];
    for (int i = 0; i < controller.pwList.length; i++) {
      Tuple2 tuple2 = controller.pwList[i];
      _list.add(_item(tuple2));
    }
    return Column(
      children: _list,
    );
  }

  Widget _item(Tuple2 tuple2) {
    return Column(
      children: <Widget>[
        Container(
          height: 45,
          child: Row(
            children: <Widget>[
              Text(tuple2.item1,
                  style: TextStyle(
                      color: stringToColor('0b213b', 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w600)),
              const Spacer(),
            ],
          ),
        ),
        Container(
          height: 1,
          color: stringToColor('0b213b', 0.1),
        )
      ],
    );
  }

  _buildDetView() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 14, right: 14),
      alignment: Alignment.centerLeft,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '备注:'.tr,
            style: TextStyle(
                color: stringToColor('595959'),
                fontSize: 12,
                fontWeight: FontWeight.w500),
          ),
          Row(
            children: <Widget>[
              Text('*若忘记密码，或有其他问题请联系'.tr,
                  style: TextStyle(
                      color: stringToColor('595959'),
                      fontSize: 12,
                      fontWeight: FontWeight.w500)),
              GestureDetector(
                onTap: () {
                  print('点击了在线客服');
                  AppService.to.toCustomerService();
                },
                child: Text('在线客服'.tr,
                    style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                        fontWeight: FontWeight.w500)),
              )
            ],
          )
        ],
      ),
    );
  }

  _footButton() {
    return Container(
        margin: const EdgeInsets.only(top: 60),
        width: ScreenUtil().setWidth(244),
        height: 38,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: AppTheme.primaryGradient),
        child: TextButton(
          onPressed: () {
            print('点击了提交');
            controller.sumit();
          },
          child: const Text(
            '提交',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none),
            textAlign: TextAlign.center,
          ),
        ));
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
