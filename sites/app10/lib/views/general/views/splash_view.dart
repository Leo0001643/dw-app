import 'package:aone_common/services/network/network_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';
import '../widget/loading.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    final network = NetworkService.to;
    return Stack(children: <Widget>[
      Container(
        decoration: const BoxDecoration(
          color: Color(0xFF121212),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              'assets/images/common/splash_1080_2240_bg.jpg',
            ),
          ),
        ),
        child: SafeArea(
          // child: SizedBox(),
          child: Obx(
            () => Stack(
              alignment: Alignment.bottomCenter,
              children: [
                if (network.networkState != NetworkState.normal)
                  Positioned(
                    bottom: 20.r,
                    child: Column(
                      children: [
                        Text(
                          network.networkState.text,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20.r,
                          ),
                        ),
                      ],
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
      Positioned(
        left: 0,
        right: 0,
        bottom: Get.mediaQuery.padding.top + 20.h,
        child: const SplashLoading(),
      ),
      Positioned(
        left: 20.r,
        right: 20.r,
        top: Get.mediaQuery.padding.top + 20.h,
        child: Image.asset(
          'assets/images/common/splash_1080_2240_content.png',
          fit: BoxFit.contain,
        ),
      ),
      Positioned(
          //方法二
          right: 20,
          top: Get.mediaQuery.padding.top + 20.h,
          child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                SplashController.to.toCustomerService();
              },
              child: Image.asset(
                "assets/images/common/kefu.png",
                width: 44,
                height: 44,
              ))),
    ]);
  }
}
