import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gesture_password_widget/gesture_password_widget.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/ui/main/mine/setting/set_simple_pwd/set_simple_pwd_page2.dart';

import 'simple_login_logic.dart';

class SimpleLoginPage extends StatefulWidget {
  const SimpleLoginPage({Key? key}) : super(key: key);

  @override
  State<SimpleLoginPage> createState() => _SimpleLoginPageState();
}

class _SimpleLoginPageState extends State<SimpleLoginPage> {
  final logic = Get.find<SimpleLoginLogic>();
  final state = Get.find<SimpleLoginLogic>().state;
  // late TextEditingController _pwdController;
  // late FocusNode _pinFocusNode;
  var isRed = false; //错误显示用红色
  List<int> _points = [];

  // FocusScopeNode? _focusScope;

  @override
  void initState() {
    // _focusScope = FocusScope.of(context);
    // _pwdController = TextEditingController();
    // _pinFocusNode = FocusNode();
    super.initState();
  }


  @override
  void dispose() {
    // _pwdController.dispose();
    // _pinFocusNode.dispose();
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
              identifySize: 80.r,
              minLength: 4,
              normalItem: NormalCircleLayout(),
              selectedItem: SelectedCircleLayout(),
              color: ColorX.appBarBg(),
              answer: _points,
              onComplete: (data) {
                setState(() {
                  if (data.length < 4) {
                    isRed = true;
                    state.gesturetext.value = Intr().huizhisige;
                    return;
                  } else {
                    isRed = false;
                    //第一次绘制成功了
                    _points = data.map((int? value) => value ?? 0).toList();
                    // state.gesturetext.value = Intr().caozuochenggong;
                    logic.login(data.toString());
                  }
                });
              },
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
                  child: Text(Intr().zhanghaomimadenglu,style: TextStyle(fontSize: 15.sp,color: ColorX.text5862()),),
                ),
                InkWell(
                  onTap:()=> DialogUtils().showMessageDialog(context, Intr().chongzhijymmtishi,
                  onCancel: ()=> Navigator.pop(context),onConfirm: (){
                    AppData.setGestureValue("");
                    Navigator.pop(context);
                    Get.offAndToNamed(Routes.login);
                  }),
                  child: Text(Intr().chongzhijymm,style: TextStyle(fontSize: 15.sp,color: ColorX.text5862(),),),
                ),
              ],
            ),
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }

}