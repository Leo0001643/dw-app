import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../tab/controllers/main_tabbar_controller.dart';
import '../../../../theme/color_schema.dart';
import '../../controllers/signin_everyday_controller.dart';

class SigninNotSatisfied extends StatelessWidget {
  SininBackEntivity siginBackEntivity;
  bool isReissue;
  SigninNotSatisfied(
      {Key? key, required this.siginBackEntivity, required this.isReissue})
      : super(key: key);
  final logicVc = SigninEverydayController.to;

  @override
  Widget build(BuildContext context) {
    // print('传过来的值');
    // print(siginBackEntivity.czDiff);
    // print(siginBackEntivity.dmlDiff);
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 350.r,
          height: 339.r,
          decoration: const BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              'assets/images/activity/sign/sign_dialog1.png',
            ),
          )),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 160.r,
              ),
              Center(
                child: Text(
                  isReissue ? '补签条件提醒' : '未到达签到条件提醒',
                  style: TextStyle(
                      color: const Color(0xFFF7EBC9),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 35.r,
              ),
              Text(
                isReissue ? '您好，本次补签还需完成' : '您好，本次签到还需完成',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.r,
                ),
              ),
              SizedBox(
                height: 10.r,
              ),
              Container(
                margin: EdgeInsets.only(left: 45.r, right: 45.r),
                child: Column(
                  children: <Widget>[
                    if (double.parse(siginBackEntivity.czDiff.toString()) > 0)
                      _rowItem('需充值 ${siginBackEntivity.czDiff} 元', '去充值', () {
                        Get.back();
                        Get.toNamed(Routes.recharge);
                      }),
                    SizedBox(
                      height: 10.r,
                    ),
                    if (double.parse(siginBackEntivity.dmlDiff.toString()) > 0)
                      _rowItem('需打码 ${siginBackEntivity.dmlDiff} 元', '去打码', () {
                        Get.back();
                        if (logicVc.back_Type == '1') {
                          Get.back();
                        } else {
                          Get.close(2);
                          MainTabbarController.to.selectIndex = 0;
                          MainTabbarController.to.pageController.jumpTo(0);
                        }
                        // Get.ffutil();
                        // Get.toNamed(Routes.home);
                      })
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

  _rowItem(String content, String buttonTitle, Function() action) {
    return GestureDetector(
      onTap: action,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: ,
        children: <Widget>[
          Text(
            content,
            style: TextStyle(color: Colors.black, fontSize: 16.sp),
          ),
          const Spacer(),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 12.5.r, right: 12.5.r),
            height: 32.r,
            width: 94.r,
            decoration: BoxDecoration(
                color: Colors.teal,
                gradient: const LinearGradient(
                    colors: [Color(0xFF000000), Color(0xFF3F3F3F)]),
                borderRadius: BorderRadius.circular(16.r)),
            child: Text(
              buttonTitle,
              style: TextStyle(color: Colors.white, fontSize: 13.sp),
            ),
          )
        ],
      ),
    );
  }
}
