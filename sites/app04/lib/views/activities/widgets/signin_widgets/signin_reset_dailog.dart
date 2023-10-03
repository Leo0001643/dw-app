import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/signin_everyday_controller.dart';

class SigninReset extends StatelessWidget {
  SigninEverydayController? signinLogic;
  bool? haveResumeLimit;
  SigninReset({Key? key, this.signinLogic, this.haveResumeLimit})
      : super(key: key);
  // const SigninReset({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return haveResumeLimit == true
        ? bulidChoiceResetWidget()
        : buildResetWidget();
  }

  //可选择签到还是重签时
  bulidChoiceResetWidget() {
    final logicVc = SigninEverydayController.to;
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 370.r,
          height: 339.r,
          decoration: const BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              'assets/images/activity/sign/sign_dialog3.png',
            ),
          )),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 175.r,
              ),
              Center(
                child: Text(
                  '您尚有补签${logicVc.sininData?.resumeLimit.toString()}次你现在想去签到吗？\n点击“是”去签到\n点击“重新签到” 去重置签到\n',
                  style: TextStyle(
                    color: const Color(0xFFF7EBC9),
                    fontSize: 15.r,
                  ),
                ),
              ),
              SizedBox(
                height: 20.r,
              ),
              Container(
                margin: EdgeInsets.only(left: 45.r, right: 45.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        // padding: EdgeInsets.only(left: 12.5.r, right: 12.5.r),
                        height: 32.r,
                        width: 94.r,
                        decoration: BoxDecoration(
                            color: Color(0xff3A393C),
                            borderRadius: BorderRadius.circular(16.r)),
                        child: Text(
                          '是',
                          style:
                              TextStyle(color: Colors.white, fontSize: 12.sp),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                        logicVc.postSigninReset();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 32.r,
                        width: 94.r,
                        decoration: BoxDecoration(
                            color: Color(0xff3A393C),
                            borderRadius: BorderRadius.circular(16.r)),
                        child: Text(
                          '重新签到',
                          style:
                              TextStyle(color: Colors.white, fontSize: 12.sp),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.r,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30.r,
        ),
        IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Image.asset(
              'assets/images/activity/sign/sign_dialog_close.png',
              width: 40,
              height: 40,
            ))
      ],
    ));
  }

  //必须重签时
  Widget buildResetWidget() {
    final logicVc = SigninEverydayController.to;
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 370.r,
          height: 339.r,
          decoration: const BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              'assets/images/activity/sign/sign_dialog4.png',
            ),
          )),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 185.r,
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      '重置签到',
                      style: TextStyle(
                        color: const Color(0xFFF7EBC9),
                        fontSize: 15.r,
                      ),
                    ),
                    Text(
                      '连续签到中断，是否重置签到？',
                      style: TextStyle(
                        color: const Color(0xFFF7EBC9),
                        fontSize: 15.r,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 45.r,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        signinLogic?.postSigninReset();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 32.r,
                        width: 94.r,
                        decoration: BoxDecoration(
                            color: const Color(0xFF3A393C),
                            borderRadius: BorderRadius.circular(16.r)),
                        child: Text(
                          '重置',
                          style:
                              TextStyle(color: Colors.white, fontSize: 13.sp),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 32.r,
                        width: 94.r,
                        decoration: BoxDecoration(
                            color: const Color(0xFF3A393C),
                            borderRadius: BorderRadius.circular(16.r)),
                        child: Text(
                          '取消',
                          style:
                              TextStyle(color: Colors.white, fontSize: 13.sp),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.r,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30.r,
        ),
        IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Image.asset(
              'assets/images/activity/sign/sign_dialog_close.png',
              width: 40,
              height: 40,
            ))
      ],
    ));
  }
}
