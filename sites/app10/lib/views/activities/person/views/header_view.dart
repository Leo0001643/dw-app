import 'package:aone_common/common.dart';
import 'package:aone_common/services/user/user_service.dart';
import 'package:app10/theme/color_schema.dart';
import 'package:app10/widget/misc/dj_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../theme/theme_gradient_text.dart';
import '../../../user/user_center/controller/user_controller.dart';

class PersonHeader extends StatelessWidget {
  const PersonHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = UserController.to;
    final userState = UserService.to.state;

    return Container(
        color: AppTheme.userBgColor,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  controller.headerListClick(0);
                },
                child: SizedBox(
                  height: 65.r,
                  width: Get.width - 24,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 50.r,
                        height: 50.r,
                        child: Image.asset(
                          'assets/images/user/default_headerImg.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        userState.isTrial ? "试玩账号" : userState.userName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: AppTheme.userMainTextColor,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: AppTheme.userMainTextColor,
                        size: 14.r,
                      ),
                      const Spacer(),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          controller.headerListClick(1);
                        },
                        child: Container(
                          alignment: Alignment.topRight,
                          height: 50.r,
                          padding: EdgeInsets.only(left: 10.r, right: 4.r),
                          child: Row(
                            children: [
                              Image.asset(
                                  'assets/images/user/center/user_sign.png'),
                              SizedBox(
                                width: 5.r,
                              ),
                              ShaderMask(
                                shaderCallback: (Rect bounds) {
                                  return const LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xffF5DEA5),
                                      Color(0xFFC5A556)
                                    ],
                                    tileMode: TileMode.mirror,
                                  ).createShader(bounds);
                                },
                                blendMode: BlendMode.srcATop,
                                child: Center(
                                  child: Text(
                                    '签到',
                                    style: TextStyle(fontSize: 14.sp),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 2.r,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.r,
          ),
          Container(
            // width: Get.width - 24,
            height: 76.r,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                image: const DecorationImage(
                    image:
                        AssetImage('assets/images/user/center/header_bg.png'))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 16.r,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "账户余额(元):",
                      style: TextStyle(
                        color: AppTheme.userSubTextColor,
                        fontSize: 14.sp,
                      ),
                    ),
                    Row(
                      children: [
                        Obx(
                          () => Text(
                            authGuardValue(
                              regular: decimalString(userState.balance),
                              visitor: '未登录',
                            ),
                            style: TextStyle(
                              color: AppTheme.userSubTextColor,
                              fontSize: 18.r,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              controller.reloadMoney();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.r, vertical: 5.r),
                              child: RotationTransition(
                                alignment: Alignment.center,
                                turns: controller.animationController!,
                                child: DjImage.asset(
                                  'assets/images/user/center/refresh.png',
                                  fit: BoxFit.fill,
                                  // fit: BoxFit.fill,
                                ),
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                _item('recharge.png', '充值', 2),
                _item('withdraw.png', '提现', 3),
                _item('record.png', '账单', 4),
              ],
            ),
          ),
        ]));
  }

  _item(String imgName, String title, index) {
    return InkWell(
      onTap: () {
        UserController.to.headerListClick(index);
      },
      child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/user/center/$imgName'),
              SizedBox(
                height: 4.r,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 12.sp, color: AppTheme.userMainTextColor),
              )
            ],
          )),
    );
  }
}
