import 'package:aone_common/core/event_bus.dart';
import 'package:aone_common/router/routes.dart';
import 'package:aone_common/services/user/user_service.dart';
import 'package:aone_common/utils/colors.dart';
import 'package:app04/tab/controllers/main_tabbar_controller.dart';
import 'package:app04/theme/image_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:aone_common/controllers/activity/sinin_logic.dart'
    as sinin_logic;
import '../../../../theme/color_schema.dart';
import '../../../../widget/misc/dj_image.dart';
import '../../../user/user_center/controller/user_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PersonHeader extends StatelessWidget {
  const PersonHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = UserController.to;
    final _userState = UserService.to.state;
    var controller = Get.put(UserController());
    // TODO: implement build
    return Container(
        decoration: BoxDecoration(
          gradient: AppTheme.primaryGradient,
        ),
        height: 185.r,
        alignment: Alignment.center,
        child: Column(children: [
          Row(
            children: [
              Container(
                width: 66.r,
                height: 66.r,
                margin: EdgeInsets.only(left: 17.r, top: 2.5.r),
                child: ClipOval(
                  child: Image.asset(
                    "assets/images/home/headimg${controller.app.headerImg}.jpg",
                    width: 60.r,
                    height: 60.r,
                    fit: BoxFit.cover,
                  ),
                ),
                // decoration: BoxDecoration(
                //     borderRadius: BorderRadius.all(Radius.circular(35.r)),
                //     border: Border.all(width: 1.r, color: Colors.white)),
                // child: Container(
                //   width: 65.r,
                //   height: 65.r,
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.circular(10),
                //     child: CachedNetworkImage(
                //         imageUrl:
                //             "https://static.cccrrc.com/static/site-qt/h09_wap/153/img/usertop.png"),
                //   ),
                // )
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "会员账号:",
                          style: TextStyle(
                            color: Color(0x88F8F1F1),
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          _userState.isTrial ? "试玩账号" : _userState.userName,
                          style: const TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: 15),
                        const Text(
                          "洗码量:   ",
                          style: TextStyle(
                            color: Color(0x88F8F1F1),
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          _userState.xml.toString(),
                          style: const TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 11),
                    Obx(() {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "余额:  ",
                            style: TextStyle(
                              color: Color(0x88F8F1F1),
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            double.tryParse(_userState.balance)
                                    ?.toStringAsFixed(2) ??
                                "0",
                            style: const TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            width: 4.r,
                          ),
                          SizedBox(
                            width: 10.r,
                            height: 10.r,
                            child: Image.asset(
                                'assets/images/user/person_icon_money.png'),
                          ),
                          SizedBox(width: 15.w),
                          _userState.getReg
                              ? Expanded(
                                  child: GestureDetector(
                                    onTap: () async {
                                      //每日签到
                                      var sininConfigInfo = await sinin_logic
                                          .getSininConfigInfo();
                                      printInfo(
                                          info:
                                              "------>sininConfigInfo?.trueQd ${sininConfigInfo?.trueQd}");

                                      if (sininConfigInfo?.trueQd == 1) {
                                        Get.toNamed(Routes.signCenter);
                                      } else if (sininConfigInfo?.trueQd == 0) {
                                        EventBus.emit(
                                            EventType.onActivityInvalid);
                                        Get.toNamed(Routes.welfareCenter);
                                      }
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "签到",
                                          style: TextStyle(
                                            color: const Color(0x88F8F1F1),
                                            fontSize: 14.w,
                                          ),
                                        ),
                                        SizedBox(width: 4.w),
                                        Image.asset(
                                          'assets/images/user/ic_sign.png',
                                          width: 15.w,
                                          height: 15.w,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      );
                    })
                  ],
                ),
              )
            ],
          ),
          GestureDetector(
              onTap: () {
                _controller.reloadMoney();
              },
              child: Container(
                margin: EdgeInsets.only(top: 20.h),
                width: 168.r,
                height: 45.r,
                alignment: const Alignment(0, 0),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.3),
                  borderRadius: BorderRadius.all(Radius.circular(45)),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 22,
                    ),
                    Center(
                      child: RotationTransition(
                        //设置动画的旋转中心
                        alignment: Alignment.center,
                        //动画控制器
                        turns: _controller.animationController!,
                        //将要执行动画的子view
                        child: DjImage.asset(
                          'assets/images/user/person_icon_refresh.png',
                          width: 25,
                          height: 25,
                          fit: BoxFit.fill,
                          // fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Image(
                      width: 84.r,
                      height: 30.r,
                      image: AssetImage(
                        'assets/images/user/person_yue_refresh.png',
                      ),
                    ),
                  ],
                ),
              )),
          SizedBox(
            height: 11.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  if (UserService.to.state.isTrial) {
                    SmartDialog.showToast('请登录正式账号');
                    return;
                  }
                  MainTabbarController.to.jumpToPage(2);
                },
                child: const Image(
                  width: 93,
                  height: 31,
                  image: AssetImage(
                    'assets/images/user/person_item_deposity.png',
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (UserService.to.state.isTrial) {
                    SmartDialog.showToast('请登录正式账号');
                    return;
                  }
                  Get.toNamed(Routes.withdraw)?.then((value) {
                    controller.reloadMoney();
                  });
                  ;
                },
                child: const Image(
                  width: 93,
                  height: 31,
                  image: AssetImage(
                    'assets/images/user/person_item_charge.png',
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (UserService.to.state.isTrial) {
                    SmartDialog.showToast('请登录正式账号');
                    return;
                  }
                  Get.toNamed(Routes.personRecord);
                },
                child: const Image(
                  width: 93,
                  height: 31,
                  image: AssetImage(
                    'assets/images/user/person_item_order.png',
                  ),
                ),
              ),
            ],
          )
        ]));
  }
}
