import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gesture_password_widget/widget/gesture_password_widget.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/drawer_scaffold.dart';

import '../../../../../app/res/imagex.dart';
import '../../../../../app/utils/dialog_utils.dart';
import 'set_simple_pwd_logic.dart';

class SetSimplePwdPage2 extends StatefulWidget {
  const SetSimplePwdPage2({Key? key}) : super(key: key);

  @override
  State<SetSimplePwdPage2> createState() => _SetSimplePwdPageState();
}

class _SetSimplePwdPageState extends State<SetSimplePwdPage2> {
  final logic = Get.find<SetSimplePwdLogic>();
  final state = Get.find<SetSimplePwdLogic>().state;
  // late TextEditingController _pwdController;
  late FocusNode _pinFocusNode;
  List<int> _points = [];

  var firstGesture = 0; //第一次绘制的手势
  var isRed = false; //错误显示用红色

  @override
  void initState() {
    // _pwdController = TextEditingController();
    _pinFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    // _pwdController.dispose();
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
    return DrawerScaffold(
      scaffoldKey: state.scaffoldKey,
      appBar: WidgetUtils().buildAppBar(Intr().shezhijianyimima,
          msg: true, bgColor: ColorX.appBarBg(),scaffoldKey: state.scaffoldKey),
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
                fontSize: 16.sp,
                color: isRed ? Colors.red : ColorX.appTextBg(),
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
              answer: _points,
              onComplete: (data) {
                setState(() {
                  //第二次绘制
                  if (firstGesture >= 1) {
                    if (data.length < 4) {
                      isRed = true;
                      state.gesturetext.value = Intr().huizhisige;
                      return;
                    } else {
                      //第二次确定 绘制确定成功
                      if (_points.toString() == data.toString()) {
                        showToast(Intr().caozuochenggong);
                        Get.back(result: data.toString());
                      } else {
                        isRed = true;
                        state.gesturetext.value = Intr().huizhibuyiyang;
                      }
                    }
                  } else {
                    if (data.length < 4) {
                      isRed = true;
                      state.gesturetext.value = Intr().huizhisige;
                      return;
                    } else {
                      isRed = false;
                      //第一次绘制成功了
                      firstGesture++;
                      _points = data.map((int? value) => value ?? 0).toList();
                      state.gesturetext.value = Intr().zaicihuizhi;
                    }
                  }
                });
              },
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          InkWell(
              child: Text(
                Intr().chonxinshezhi,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: ColorX.icon586(),
                ),
              ),
              onTap: () {
                if(firstGesture!=0){
                  DialogUtils().showGetureDialog(context).then((value) {
                    if (value == true) {
                      state.gesturetext.value = Intr().huizhijiesuo;
                      firstGesture=0;
                      isRed=false;
                    }
                  });
                }
              })
        ],
      ),
    );
  }
}

class ErrorCircleLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 66.r,
      height: 66.r,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red.withOpacity(0.05), // 5% 不透明度
      ),
      child: Center(
        child: Container(
          width: 24.r,
          height: 24.r,
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
      width: 66.r,
      height: 66.r,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFFF8216).withOpacity(0.05), // 5% 不透明度
      ),
      child: Center(
        child: Container(
          width: 24.r,
          height: 24.r,
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
      width: 66.r,
      height: 66.r,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xffF5F5F5), // 5% 不透明度
      ),
    );
  }
}
