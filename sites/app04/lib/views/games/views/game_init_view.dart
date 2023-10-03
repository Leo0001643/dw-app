import 'package:aone_common/common.dart';
import 'package:app04/theme/color_schema.dart';
import 'package:app04/views/games/controllers/game_init_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../../../app_service.dart';
import '../../../config/site_config.dart';

class GameInitView extends GetView<GameInitController> {
  const GameInitView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(GameInitController());
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/home/${siteTagAssets}_game_back.png',
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
                      style: TextStyle(fontSize: 14.w),
                    ),
                    SizedBox(height: 15.w),
                  ],
                  Container(
                    margin: EdgeInsets.only(bottom: 120.w),
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
                              onTap: () => AppService.to.toCustomerService(),
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
    );
  }

  Widget progressWidget() {
    return Container(
      margin: EdgeInsets.only(left: 40.r, right: 40.r),
      child: GFProgressBar(
        padding: const EdgeInsets.only(left: 15, right: 15),
        percentage: 1,
        lineHeight: 10,
        alignment: MainAxisAlignment.spaceBetween,
        type: GFProgressType.linear,
        backgroundColor: Colors.black26,
        progressBarColor: AppTheme.progressBarColor,
        animation: true,
        animationDuration: 1000,
      ),
    );
  }
}
