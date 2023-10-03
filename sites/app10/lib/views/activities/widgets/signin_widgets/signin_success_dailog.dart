import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../theme/color_schema.dart';

class SigninSuccessDailog extends StatelessWidget {
  SininBackEntivity siginBackEntivity;
  String? isReissueSinin;
  SigninSuccessDailog(
      {Key? key, required this.siginBackEntivity, this.isReissueSinin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isReissueSinin.toString() == '3') {
      return _buildReissueSininWidget();
    } else {
      return _buildSigninWidget();
    }
  }

  _buildSigninWidget() {
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        height: 275.r,
        width: 375.r,
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/activity/sign_dialog2.png"),
              fit: BoxFit.fill,
            ),
            color: Colors.transparent),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 165.r,
              left: 0,
              right: 0,
              child: Container(
                  width: Get.width - 60.r,
                  alignment: Alignment.center,
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xffFFC069), Color(0xFFFF9900)],
                        tileMode: TileMode.mirror,
                      ).createShader(bounds);
                    },
                    blendMode: BlendMode.srcATop,
                    child: Center(
                      child: Text(
                        isReissueSinin.toString() == '1'
                            ? '恭喜您，连续签到 ${siginBackEntivity.lxCount}天！'
                            : '恭喜您，今日签到成功！',
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w600),
                      ),
                    ),
                  )),
            ),
            Positioned(
              bottom: 28.r,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  isReissueSinin.toString() == '1'
                      ? '额外获得奖励 ¥ ${decimalString(siginBackEntivity.extraMoney, 2)}'
                      : '今日签到获得 ¥ ${decimalString(siginBackEntivity.qiandaoMoney, 2)}',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.r,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 6.r),
        child: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Image.asset(
            'assets/images/activity/activity_dialog_close.png',
            width: 30.r,
            height: 30.r,
          ),
        ),
      ),
    ]));
  }

  //补签
  _buildReissueSininWidget() {
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        height: 275.r,
        width: 375.r,
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/activity/sign_dialog2.png"),
              fit: BoxFit.fill,
            ),
            color: Colors.transparent),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 165.r,
              left: 0,
              right: 0,
              child: Container(
                  width: Get.width - 60.r,
                  alignment: Alignment.center,
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xffFFC069), Color(0xFFFF9900)],
                        tileMode: TileMode.mirror,
                      ).createShader(bounds);
                    },
                    blendMode: BlendMode.srcATop,
                    child: Center(
                      child: Text(
                        '恭喜您，补签成功！',
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w600),
                      ),
                    ),
                  )),
            ),
            Positioned(
                bottom: 20.r,
                left: 130.r,
                right: 130.r,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 34.r,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppTheme.primaryOne,
                        borderRadius: BorderRadius.circular(17.r)),
                    child: Center(
                      child: Text(
                        '好的',
                        style: TextStyle(color: Colors.white, fontSize: 13.sp),
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 6.r),
        child: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Image.asset(
            'assets/images/activity/activity_dialog_close.png',
            width: 30.r,
            height: 30.r,
          ),
        ),
      ),
    ]));
  }
}
