import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gesture_password_widget/widget/gesture_password_widget.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:pinput/pinput.dart';

import '../../../../../app/res/imagex.dart';
import 'set_simple_pwd_logic.dart';

class SetSimplePwdPage2 extends StatefulWidget {
  const SetSimplePwdPage2({Key? key}) : super(key: key);

  @override
  State<SetSimplePwdPage2> createState() => _SetSimplePwdPageState();
}

class _SetSimplePwdPageState extends State<SetSimplePwdPage2> {
  final logic = Get.find<SetSimplePwdLogic>();
  final state = Get.find<SetSimplePwdLogic>().state;
  late TextEditingController _pwdController;
  late FocusNode _pinFocusNode;
  var _points = [0, 1, 2, 4, 7];

  @override
  void initState() {
    _pwdController = TextEditingController();
    _pinFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _pwdController.dispose();
    _pinFocusNode.dispose();
    Get.delete<SetSimplePwdLogic>();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    FocusScope.of(context).requestFocus(_pinFocusNode);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildAppBar(Intr().shezhijianyimima,
          msg: true, bgColor: ColorX.appBarBg()),
      backgroundColor: ColorX.pageBg(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 40.h,
          ),
          Image.asset(
            ImageX.icon_shoushi_bg,
            width: 34.w,
            height: 30.h,
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: 10.h,
          ),
          Obx(() {
            return Text(
              state.gesturetext.value,
              style: TextStyle(
                fontSize: 16.0,
                color: ColorX.appTextBg(),
              ),
            );
          }),
          SizedBox(
            height: 20.h,
          ),
          Center(
            child: GesturePasswordWidget(
              lineColor: const Color(0xffFF8216),
              errorLineColor: const Color(0xffFB2E4E),
              singleLineCount: 3,
              identifySize: 80.0,
              minLength: 4,
              normalItem: NormalCircleLayout(),
              selectedItem: SelectedCircleLayout(),
              color: ColorX.appBarBg(),
              // errorArrowItem: Image.asset(
              //   'images/arrow.png',
              //   width: 20.0,
              //   height: 20.0,
              //   fit: BoxFit.fill,
              //   color: const Color(0xffFB2E4E),
              // ),
              answer: _points,
              onComplete: (data) {
                setState(() {
                  if (_points.toString() == data.toString()) {
                    state.gesturetext.value = data.toString();
                  } else {
                    state.gesturetext.value = "与上一次绘制不一致请重新绘制";
                  }
                });
              },
            ),
          ),
          Text(
            Intr().chonxinshezhi,
            style: TextStyle(
              fontSize: 16.0,
              color: ColorX.icon586(),
            ),
          )
        ],
      ),
    );
  }
}

class ErrorCircleLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 66.0,
      height: 66.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red.withOpacity(0.05), // 5% 不透明度
      ),
      child: Center(
        child: Container(
          width: 24.0,
          height: 24.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red, // 100% 不透明度
          ),
        ),
      ),
    );
  }
}

class SelectedCircleLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 66.0,
      height: 66.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFFF8216).withOpacity(0.05), // 5% 不透明度
      ),
      child: Center(
        child: Container(
          width: 24.0,
          height: 24.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFFF8216), // 100% 不透明度
          ),
        ),
      ),
    );
  }
}

class NormalCircleLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 66.0,
      height: 66.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xffF5F5F5), // 5% 不透明度
      ),
    );
  }
}
