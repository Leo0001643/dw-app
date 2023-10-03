import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/getwidget.dart';

import '../../cashier/utils/dj_image.dart';

class HomeTapWidget extends StatelessWidget {
  final bool isHomePage;

  const HomeTapWidget(this.isHomePage, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _tapView();
  }
  
  Widget _tapView() {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 60.w,
                  height: 28.w,
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/home/logo_home.png',
                  ),
                ),
                AuthGuardBuilder(
                  regularBuilder: loginWidget,
                  visitorBuilder: unloginWidget,
                ),
              ],
            )),
      ],
    );
  }

  Widget loginWidget(context) {
    return Container(
      margin: EdgeInsets.only(right: 4.w),
      // width: 80.w,
      height: 28.w,
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/activity/balanceBG.png"),
            fit: BoxFit.contain,
          ),
          color: Colors.transparent),
      child: Row(
        children: [
          GestureDetector(
            child: Row(
              children: [
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  "¥" + decimalString(UserService.to.state.balance),
                  style: TextStyle(color: Colors.blueAccent),
                ),
                SizedBox(
                  width: 10.w,
                ),
                // Center(
                //   child: RotationTransition(
                //     //设置动画的旋转中心
                //     alignment: Alignment.center,
                //     //动画控制器
                //     turns: HomePageController.to.animationController,
                //     //将要执行动画的子view
                //     child: DjImage.asset(
                //       'assets/images/activity/vectorquanquan.png',
                //       width: 11.w,
                //       height: 11.w,
                //       // fit: BoxFit.fill,
                //     ),
                //   ),
                // ),
                // GFAnimation(
                //   turnsAnimation: HomePageController.to.animation,
                //   controller: HomePageController.to.animationController,
                //   type: GFAnimationType.rotateTransition,
                //   alignment: Alignment.center,
                //   child: DjImage.asset(
                //     'assets/images/activity/vectorquanquan.png',
                //     width: 11.w,
                //     height: 11.w,
                //     // fit: BoxFit.fill,
                //   ),
                // ),
              ],
            ),
            onTap: () {
              ///todo
              // HomePageController.to.reloadMoney();
            },
          ),
          SizedBox(
            width: 10.w,
          ),
          GestureDetector(
            child: DjImage.asset(
              'assets/images/home/header.png',
              width: 24.w,
              height: 24.w,
              // fit: BoxFit.fill,
            ),
            onTap: () {
              // if (isHomePage == true) {
              //   MainTabbarController.to.scaffoldKey.currentState!
              //       .openDrawer();
              // } else {
              //   Scaffold.of(context)
              //       .openDrawer();
              // }
            },
          ),
        ],
      ),
    );
  }

  Widget unloginWidget(context) {
    return Row(
      children: [
        SizedBox(
          width: 48.w,
          height: 23.w,
          child: GFButton(
            onPressed: () {
              // HomePageController.to.loginClick();
            },
            child: const Text('登录', style: TextStyle(color: GFColors.WHITE)),
            color: GFColors.PRIMARY,
            shape: GFButtonShape.pills,
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        SizedBox(
          width: 48.w,
          height: 23.w,
          child: GFButton(
            onPressed: () {
              // HomePageController.to.registerClick();
            },
            child: const Text('注册', style: TextStyle(color: GFColors.WHITE)),
            color: GFColors.PRIMARY,
            shape: GFButtonShape.pills,
          ),
        ),
      ],
    );
  }
}
