import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/animation/gf_animation.dart';
import 'package:getwidget/types/gf_animation_type.dart';

import '../../../theme/color_schema.dart';
import '../controllers/home_page_controller.dart';

class HomeInfo extends StatefulWidget {
  const HomeInfo({Key? key}) : super(key: key);

  @override
  State<HomeInfo> createState() => _HomeInfoState();
}

class _HomeInfoState extends State<HomeInfo> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          mainAxisSize: MainAxisSize.min,
          children: authGuardValue<List<Widget> Function()>(
            regular: loginWidget,
            visitor: unloginWidget,
          )(),
        ));
  }

  List<Widget> loginWidget() {
    return [
      Container(
          alignment: Alignment.centerLeft,
          width: double.infinity,
          height: 25.w,
          margin: EdgeInsets.symmetric(horizontal: 12.w),
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          decoration: const BoxDecoration(
              color: Color(0XFF504D4D),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          child: Text(
            "您好，${UserService.to.state.userName}",
            style: TextStyle(fontSize: 10.sp, color: const Color(0Xffc6c5c5)),
          )),
      Container(
          alignment: Alignment.centerLeft,
          width: double.infinity,
          height: 67.w,
          margin: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: const BoxDecoration(
              color: Color(0XFF2B2B2B),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          child: Row(
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  HomePageController.to.reloadMoney();
                },
                child: SizedBox(
                  width: 141,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text("账户余额",
                                style: TextStyle(
                                    fontSize: 14, color: AppTheme.onPrimary)),
                            const Padding(padding: EdgeInsets.only(left: 10)),
                            GFAnimation(
                              turnsAnimation: HomePageController.to.animation,
                              controller:
                                  HomePageController.to.animationController,
                              type: GFAnimationType.rotateTransition,
                              alignment: Alignment.center,
                              child: Image.asset(
                                "assets/images/home/refresh.png",
                                width: 15,
                                height: 15,
                              ),
                            ),
                          ],
                        ),
                        Text("¥${decimalString(UserService.to.state.balance)}",
                            style:  TextStyle(
                                fontSize: 14,
                                color: AppTheme.primary,
                                height: 1.4)),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 1,
                height: double.infinity,
                color: const Color(0XFF504D4D),
                margin: const EdgeInsets.symmetric(vertical: 9),
              ),
              Expanded(
                  child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  // HomePageController.to.menuClick(0);
                },
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/home/cunkuan.png",
                        width: 25,
                        height: 25,
                      ),
                      const Text("存款",
                          style: TextStyle(
                              fontSize: 14, color: AppTheme.onPrimary)),
                    ],
                  ),
                ),
              )),
              Expanded(
                  child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  HomePageController.to.menuClick(1);
                },
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/home/qukuan.png",
                        width: 25,
                        height: 25,
                      ),
                      const Text("取款",
                          style: TextStyle(
                              fontSize: 14, color: AppTheme.onPrimary)),
                    ],
                  ),
                ),
              )),
              Expanded(
                  child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  // HomePageController.to.menuClick(2);
                },
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/home/zhanneixin.png",
                        width: 25,
                        height: 25,
                      ),
                      const Text("站内信",
                          style: TextStyle(
                              fontSize: 14, color: AppTheme.onPrimary)),
                    ],
                  ),
                ),
              )),
            ],
          ))
    ];
  }

  List<Widget> unloginWidget() {
    return [
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          HomePageController.to.loginClick();
        },
        child: Container(
            alignment: Alignment.centerLeft,
            width: double.infinity,
            height: 25.w,
            margin: EdgeInsets.symmetric(horizontal: 12.w),
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            decoration: const BoxDecoration(
                color: Color(0XFF504D4D),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Text(
              "您好，请登入",
              style: TextStyle(fontSize: 10.sp, color: const Color(0Xffc6c5c5)),
            )),
      ),
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          HomePageController.to.loginClick();
        },
        child: Container(
            alignment: Alignment.centerLeft,
            width: double.infinity,
            height: 67.w,
            margin: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: const BoxDecoration(
                color: Color(0XFF2B2B2B),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: Row(
              children: [
                SizedBox(
                  width: 141,
                  child: Center(
                    child: Container(
                      width: 81,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6)),
                          border:
                              Border.all(color: AppTheme.primary, width: 2)),
                      child:  Center(
                        child: Text(
                          "登入查看",
                          style:
                              TextStyle(fontSize: 14, color: AppTheme.primary),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 1,
                  height: double.infinity,
                  color: const Color(0XFF504D4D),
                  margin: const EdgeInsets.symmetric(vertical: 9),
                ),
                Expanded(
                    child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/home/cunkuan.png",
                        width: 25,
                        height: 25,
                      ),
                      const Text("存款",
                          style: TextStyle(
                              fontSize: 14, color: AppTheme.onPrimary)),
                    ],
                  ),
                )),
                Expanded(
                    child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/home/qukuan.png",
                        width: 25,
                        height: 25,
                      ),
                      const Text("取款",
                          style: TextStyle(
                              fontSize: 14, color: AppTheme.onPrimary)),
                    ],
                  ),
                )),
                Expanded(
                    child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/home/zhanneixin.png",
                        width: 25,
                        height: 25,
                      ),
                      const Text("站内信",
                          style: TextStyle(
                              fontSize: 14, color: AppTheme.onPrimary)),
                    ],
                  ),
                )),
              ],
            )),
      )
    ];
  }
}
