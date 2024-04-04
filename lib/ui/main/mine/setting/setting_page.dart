import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/drawer_scaffold.dart';
import 'package:leisure_games/ui/bean/change_main_page_event.dart';
import 'package:leisure_games/ui/bean/login_refresh_event.dart';
import 'package:leisure_games/ui/bean/music_switch_event.dart';

import 'setting_logic.dart';

///通用设置
class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final logic = Get.find<SettingLogic>();
  final state = Get.find<SettingLogic>().state;

  @override
  void dispose() {
    Get.delete<SettingLogic>();
    super.dispose();
  }

  String theme() {
    return AppData.theme() ? Intr().qzb : Intr().kxh;
  }

  String language() {
    switch (AppData.localeIndex()) {
      case 1:
        return Intr().yingyu;
      case 2:
        return Intr().yuenanyu;
      default:
        return Intr().zhongwenjianti;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      scaffoldKey: state.scaffoldKey,
      appBar: WidgetUtils().buildAppBar(Intr().shezhi, msg: true, drawer: true,scaffoldKey: state.scaffoldKey),
      backgroundColor: ColorX.pageBg2(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () => Get.toNamed(Routes.user_info),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: ColorX.cardBg()),
                margin: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h),
                padding:
                    EdgeInsets.symmetric(vertical: 15.h, horizontal: 12.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Intr().gerenziliao,
                      style:
                          TextStyle(fontSize: 12.sp, color: ColorX.text0d1()),
                    ),
                    Image.asset(
                      ImageX.icon_right_grey,
                      color: ColorX.icon586(),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: ColorX.cardBg()),
              margin: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => Get.toNamed(Routes.set_login_pwd),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 15.h, horizontal: 12.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Intr().shezhidenglumima,
                            style: TextStyle(
                                fontSize: 12.sp, color: ColorX.text0d1()),
                          ),
                          Image.asset(
                            ImageX.icon_right_grey,
                            color: ColorX.icon586(),
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: ColorX.color_10_949,
                    height: 1.h,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              Intr().shezhijianyimima,
                              style: TextStyle(
                                  fontSize: 12.sp, color: ColorX.text0d1()),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Image.asset(
                              ImageX.icon_wenhao,
                              color: ColorX.text586(),
                            )
                          ],
                        ),
                        Obx(() {
                          return Switch(
                            thumbColor:
                                MaterialStateColor.resolveWith((states) {
                              // 根据状态返回相应的颜色
                              if (states.contains(MaterialState.selected)) {
                                // Switch 处于激活状态时的颜色
                                return Colors.white;
                              }
                              // Switch 处于非激活状态时的颜色
                              return Colors.white; // 你可以根据需要修改颜色
                            }),
                            onChanged: (value) {
                              if(value){
                                Get.toNamed(Routes.set_simple_pwd)?.then((gestureValue) {
                                  if(unEmpty(gestureValue)){
                                    // AppData.setJymm(value);
                                    //全局设置手势密码
                                    AppData.setGestureValue(gestureValue);
                                    state.jymmToggle.value = value;
                                  }
                                });
                              }else {
                                state.jymmToggle.value = value;
                                AppData.setGestureValue("");
                              }
                            },
                            value: state.jymmToggle.value,
                            inactiveTrackColor: ColorX.text949(),
                            activeTrackColor: ColorX.color_69c25c,
                            activeColor: Colors.white,
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () => Get.toNamed(Routes.select_language),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: ColorX.cardBg()),
                margin: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h),
                padding:
                    EdgeInsets.symmetric(vertical: 15.h, horizontal: 12.w),
                child: Row(
                  children: [
                    Text(Intr().dyy,
                      style: TextStyle(fontSize: 12.sp, color: ColorX.text0d1()),
                    ),
                    Expanded(child: Container()),
                    Text(language(), style: TextStyle(fontSize: 12.sp, color: ColorX.text949()),),
                    Image.asset(ImageX.icon_right_grey, color: ColorX.text586(),)
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: ColorX.cardBg()),
              margin: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Intr().bjyy,
                          style: TextStyle(
                              fontSize: 12.sp, color: ColorX.text0d1()),
                        ),
                        Obx(() {
                          return Switch(
                            thumbColor:
                                MaterialStateColor.resolveWith((states) {
                              // 根据状态返回相应的颜色
                              if (states.contains(MaterialState.selected)) {
                                // Switch 处于激活状态时的颜色
                                return Colors.white;
                              }
                              // Switch 处于非激活状态时的颜色
                              return Colors.white; // 你可以根据需要修改颜色
                            }),
                            onChanged: (value) {
                              AppData.setBgMusic(value);
                              eventBus.fire(MusicSwitchEvent(value));
                              state.bjyyToggle.value = value;
                            },
                            value: state.bjyyToggle.value,
                            inactiveTrackColor: ColorX.text949(),
                            activeTrackColor: ColorX.color_69c25c,
                            activeColor: Colors.white,
                          );
                        }),
                      ],
                    ),
                  ),
                  Divider(
                    color: ColorX.color_10_949,
                    height: 1.h,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Intr().tsy,
                          style: TextStyle(
                              fontSize: 12.sp, color: ColorX.text0d1()),
                        ),
                        Obx(() {
                          return Switch(
                            thumbColor:
                                MaterialStateColor.resolveWith((states) {
                              // 根据状态返回相应的颜色
                              if (states.contains(MaterialState.selected)) {
                                // Switch 处于激活状态时的颜色
                                return Colors.white;
                              }
                              // Switch 处于非激活状态时的颜色
                              return Colors.white; // 你可以根据需要修改颜色
                            }),
                            onChanged: (value) {
                              AppData.setPromptTone(value);
                              state.tsyToggle.value = value;
                            },
                            value: state.tsyToggle.value,
                            inactiveTrackColor: ColorX.text949(),
                            activeTrackColor: ColorX.color_69c25c,
                            activeColor: Colors.white,
                          );
                        })
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: ColorX.cardBg()),
              margin: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => Get.toNamed(Routes.select_theme),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 15.h, horizontal: 12.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Intr().wgys,
                            style: TextStyle(
                                fontSize: 12.sp, color: ColorX.text0d1()),
                          ),
                          Expanded(child: Container()),
                          Text(
                            theme(),
                            style: TextStyle(
                                fontSize: 12.sp, color: ColorX.text949()),
                          ),
                          Image.asset(ImageX.icon_right_grey,
                              color: ColorX.text586())
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: ColorX.color_10_949,
                    height: 1.h,
                  ),
                  InkWell(
                    onTap: () => Get.toNamed(Routes.select_animation),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 12.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Intr().dx,
                            style: TextStyle(
                                fontSize: 12.sp, color: ColorX.text0d1()),
                          ),
                          Expanded(child: Container()),
                          // Text(
                          //   Intr().quankai,
                          //   style: TextStyle(
                          //       fontSize: 12.sp, color: ColorX.text949()),
                          // ),
                          Image.asset(ImageX.icon_right_grey,
                              color: ColorX.text586())
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            WidgetUtils().buildElevatedButton(
                Intr().tuichudenglu, 335.w, 45.h,
                textColor: ColorX.color_fc243b,
                bg: ColorX.cardBg(), onPressed: () {
              DialogUtils().showLogoutDialog(context).then((value) {
                if (value == true) {
                  AppData.clear();

                  ///退出登录需求切换页面到首页
                  eventBus.fire(ChangeMainPageEvent(0));
                  eventBus.fire(LoginRefreshEvent());
                  Get.back();
                }
              });
            }),
          ],
        ),
      ),
    );
  }
}
