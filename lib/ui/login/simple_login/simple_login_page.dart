import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:pinput/pinput.dart';

import 'simple_login_logic.dart';

class SimpleLoginPage extends StatefulWidget {
  const SimpleLoginPage({Key? key}) : super(key: key);

  @override
  State<SimpleLoginPage> createState() => _SimpleLoginPageState();
}

class _SimpleLoginPageState extends State<SimpleLoginPage> {
  final logic = Get.find<SimpleLoginLogic>();
  final state = Get.find<SimpleLoginLogic>().state;
  late TextEditingController _pwdController;
  late FocusNode _pinFocusNode;

  // FocusScopeNode? _focusScope;

  @override
  void initState() {
    // _focusScope = FocusScope.of(context);
    _pwdController = TextEditingController();
    _pinFocusNode = FocusNode();
    super.initState();
  }


  @override
  void dispose() {
    _pwdController.dispose();
    _pinFocusNode.dispose();
    // _focusScope?.dispose();
    Get.delete<SimpleLoginLogic>();
    super.dispose();
  }

  // @override
  // void didChangeDependencies() {
  //   _focusScope?.requestFocus(_pinFocusNode);
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Intr().login,style: TextStyle(fontSize: 16.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600,),),
        centerTitle: true,
        backgroundColor: ColorX.pageBg(),
        elevation: 0,
        leadingWidth: 0,
        leading: Container(),
        actions: [
          InkWell(
            onTap: ()=>Get.back(),
            child: Image.asset(ImageX.icon_close,color: ColorX.icon586(),),
          ),
        ],
      ),
      backgroundColor: ColorX.pageBg(),
      body: Column(
        children: [
          SizedBox(height: 20.h,),
          Text(Intr().shurujianyimima,style: TextStyle(fontSize: 20.sp,color: ColorX.text0917()),),
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
              onCompleted: (v)=>logic.login(v,_pwdController),
            ),
          ),
          SizedBox(height: 27.h,),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap:()=> Get.toNamed(Routes.login),
                  child: Text("账号密码登录",style: TextStyle(fontSize: 15.sp,color: ColorX.text5862()),),
                ),
                InkWell(
                  onTap:()=> DialogUtils().showMessageDialog(context, "重置简易密码后，将清空您设置的简易密码，请使用用户名密码登录。登录成功后，会自动抹除简易密码。",
                  onCancel: ()=> Navigator.pop(context),onConfirm: (){
                    AppData.setSimplePwd("");
                    Navigator.pop(context);
                    Get.offAndToNamed(Routes.login);
                  }),
                  child: Text("重置简易密码",style: TextStyle(fontSize: 15.sp,color: ColorX.text5862(),),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}