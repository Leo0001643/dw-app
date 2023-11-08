import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:pinput/pinput.dart';

import 'set_simple_pwd_logic.dart';

class SetSimplePwdPage extends StatefulWidget {
  const SetSimplePwdPage({Key? key}) : super(key: key);

  @override
  State<SetSimplePwdPage> createState() => _SetSimplePwdPageState();
}

class _SetSimplePwdPageState extends State<SetSimplePwdPage> {
  final logic = Get.find<SetSimplePwdLogic>();
  final state = Get.find<SetSimplePwdLogic>().state;
  late TextEditingController _pwdController;
  late FocusNode _pinFocusNode;

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
      appBar: WidgetUtils().buildAppBar(Intr().shezhijianyimima,msg: true,bgColor: ColorX.appBarBg()),
      backgroundColor: ColorX.pageBg(),
      body: Column(
        children: [
          SizedBox(height: 20.h,),
          Obx(() {
            return Text(state.pwdHint.value,style: TextStyle(fontSize: 20.sp,color: ColorX.text0917()),);
          }),
          SizedBox(height: 20.h,),
          Center(
            child: Pinput(
              defaultPinTheme: PinTheme(
                width: 75.w,
                height: 45.h,
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                textStyle: TextStyle(fontSize: 40.sp,color: Colors.black),
                decoration: BoxDecoration(
                  color: ColorX.cardBg3(),
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              pinContentAlignment: Alignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              focusNode: _pinFocusNode,
              controller: _pwdController,
              obscureText: true,
              showCursor: false,
              closeKeyboardWhenCompleted: false,
              onCompleted: (v){
                if(isEmpty(state.newPwd)){
                  state.newPwd = v;
                  state.pwdHint.value = Intr().querenjianyimima;
                  _pwdController.text = '';
                }else {
                  state.confirmPwd = v;
                  if(state.newPwd == state.confirmPwd){
                    showToast(Intr().shezhichenggong);
                  }else {
                    state.newPwd = '';
                    state.confirmPwd = '';
                    _pwdController.text = '';
                    state.pwdHint.value = Intr().shurujianyimima;
                    showToast(Intr().shuruneirongbuyizhi);
                  }
                }
              },
            ),
          ),
          SizedBox(height: 27.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(Intr().wenxintishi_jianyimima,
              style: TextStyle(fontSize: 13.sp,color: ColorX.text586(),height: 1.8),),
          ),
        ],
      ),
    );
  }


}