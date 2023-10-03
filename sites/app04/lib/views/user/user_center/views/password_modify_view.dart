import 'package:aone_common/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tuple/tuple.dart';

import '../../../../app_service.dart';
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
              /*
              Container(
                margin: const EdgeInsets.only(top: 20, left: 12, right: 12),
                padding: const EdgeInsets.only(left: 12, right: 0),
                height: 64.0 * _.pwList.length,
                decoration: BoxDecoration(
                  color: stringToColor('f2f5f8'),
                  // color: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListView.separated(
                  padding: const EdgeInsets.all(4),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _.pwList.length,
                  //列表项构造器
                  itemBuilder: (BuildContext context, int index) {
                    Tuple2 p = _.pwList[index];
                    return Row(
                      children: <Widget>[
                        Text(p.item1,
                            style: TextStyle(
                                color: stringToColor('0b213b', 1),
                                fontSize: 14,
                                fontWeight: FontWeight.w600)),
                        Expanded(
                            child: Container(
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          child: TextField(
                            keyboardType: TextInputType.visiblePassword,
                            controller: index == 0
                                ? controller.firstInputController
                                : index == 1
                                    ? controller.secondInputController
                                    : controller.thirdInputController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                  left: 10, top: 10, bottom: 0, right: 0),
                              hintText: p.item2,
                              border: InputBorder.none,
                              fillColor: stringToColor('f2f5f8'),
                              filled: true,
                              enabled: true,
                              suffixIcon: IconButton(
                                icon: index == 0
                                    ? controller.firstInputVisible
                                        ? closeEyesIcon()
                                        : openEyesIcon()
                                    : index == 1
                                        ? controller.secondInputVisible
                                            ? closeEyesIcon()
                                            : openEyesIcon()
                                        : controller.thirdInputVisible
                                            ? closeEyesIcon()
                                            : openEyesIcon(),
                                onPressed: () {
                                  if (index == 0) {
                                    controller.firstInputVisible =
                                        !controller.firstInputVisible;
                                  } else if (index == 1) {
                                    controller.secondInputVisible =
                                        !controller.secondInputVisible;
                                  } else {
                                    controller.thirdInputVisible =
                                        !controller.thirdInputVisible;
                                  }
                                  controller.update();
                                },
                              ),
                            ),
                            obscureText: index == 0
                                ? controller.firstInputVisible
                                : index == 1
                                    ? controller.secondInputVisible
                                    : controller.thirdInputVisible,
                          ),
                        )),
                      ],
                    );
                  },
                  //分割器构造器
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider();
                  },
                ),
              ),
              */
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
            gradient: LinearGradient(
                colors: [stringToColor('429ffe'), stringToColor('2f72f4')])),
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
