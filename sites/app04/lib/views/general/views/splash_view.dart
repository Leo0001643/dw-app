import 'package:aone_common/services/network/network_service.dart';
import 'package:app04/views/general/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../config/site_config.dart';
import 'loading.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    final network = NetworkService.to;
    return Stack(children: <Widget>[
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/images/common/splash_${AppRuntimeConfig.siteTag}.jpg',
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
        bottom: 120.w,
        child: const SplashLoading(),
      ),
      Positioned(
          //方法二
          right: 20,
          top: Get.mediaQuery.padding.top + 20,
          child: InkWell(
              onTap: () {
                SplashController.to.toCustomerService();
              },
              child: Image.asset(
                "assets/images/common/${AppRuntimeConfig.siteTag}_kefu.png",
                width: 27.5.r,
                height: 27.5.r,
                // fit: BoxFit.fill,
              ))),
    ]);
  }
}

// 'assets/images/common/h09_splash.jpg',
