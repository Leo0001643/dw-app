import 'package:aone_common/router/routes.dart';
import 'package:aone_common/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import '../controllers/game_init_controller.dart';

class GameInitView extends GetView<GameInitController> {
  GameInitView({Key? key}) : super(key: key) {
    printInfo(info: "--------->jett实例化");
  }

  @override
  Widget build(BuildContext context) {
    Get.put(GameInitController());
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            AoneAppTheme.appTheme.gameInitImage ??
                'assets/images/home/game_backgroud.png',
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Obx(
        () => controller.state.isShowErrorTip
            ? Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (controller.state.errorTip.isNotEmpty) ...[
                    Text(
                      controller.state.errorTip,
                      style: TextStyle(fontSize: 14.w, color: Colors.white),
                    ),
                    SizedBox(height: 15.w),
                  ],
                  Container(
                    margin: EdgeInsets.only(bottom: 80.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () => controller.getGameInitInfo(),
                              child: Container(
                                height: 40.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: const Color(0xff488f8d),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.w)),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 12.w),
                                child: Text(
                                  '重新加载',
                                  style: TextStyle(
                                      fontSize: 14.sp, color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(width: 12.w),
                            GestureDetector(
                              onTap: () => Get.until(
                                  (route) => Get.currentRoute == Routes.main),
                              child: Container(
                                height: 40.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: const Color(0xff44566d),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.w)),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 12.w),
                                child: Text(
                                  '返回首页',
                                  style: TextStyle(
                                      fontSize: 14.sp, color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(width: 12.w),
                            GestureDetector(
                              onTap: () {
                                // AppService.to.toCustomerService()
                              },
                              child: Container(
                                height: 40.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: const Color(0xff3562bb),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.w)),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 12.w),
                                child: Text(
                                  '在线客服',
                                  style: TextStyle(
                                      fontSize: 14.sp, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : const SizedBox.shrink(),
      ),
      // Container(
      //   margin: EdgeInsets.only(top: Get.height - 340.r),
      //   height: 340.r,
      //   // color: Colors.red,
      //   child: Column(
      //     // mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       SizedBox(
      //         height: 215.r,
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           SpinKitFadingCircle(
      //             color:AoneAppTheme.appTheme.progressBarColor?? const Color(0xffF0BE5C),
      //             size: 30.sp,
      //           ),
      //         ],
      //       ),
      //       SizedBox(
      //         height: 15.r,
      //       ),
      //       progressWidget()
      //     ],
      //   ),
      // ),
    );
    // },
    // );
  }

  Widget progressWidget() {
    return Container(
      margin: EdgeInsets.only(left: 40.r, right: 40.r),
      child: GFProgressBar(
        padding: const EdgeInsets.only(left: 15, right: 15),
        percentage: 1,
        lineHeight: 7.5,
        alignment: MainAxisAlignment.spaceBetween,
        type: GFProgressType.linear,
        backgroundColor: const Color(0xff444444),
        progressBarColor:
            AoneAppTheme.appTheme.progressBarColor ?? const Color(0xffF0BE5C),
        animation: true,
        animationDuration: 1000,
      ),
    );
  }
}
