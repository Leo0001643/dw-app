import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/controller/wallet_controller.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/bean/change_main_page_event.dart';
import 'package:leisure_games/ui/bean/login_refresh_event.dart';
import 'package:leisure_games/ui/bean/login_user_entity.dart';
import 'package:leisure_games/ui/bean/music_switch_event.dart';
import 'package:leisure_games/ui/main/home/home_logic.dart';

class EndsDrawerView extends StatefulWidget {

  GlobalKey<ScaffoldState>? scaffoldKey;

  EndsDrawerView({super.key,this.scaffoldKey});

  @override
  State<StatefulWidget> createState() => StateEndsDrawerView();
}

class StateEndsDrawerView extends State<EndsDrawerView> {
  var musicToggle = AppData.bgMusic().obs;
  var notifyToggle = AppData.promptTone().obs;

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

  String theme() {
    return AppData.theme() ? Intr().qzb : Intr().kxh;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 316.w,
      height: 1.sh,
      color: ColorX.cardBg7(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() {
              var logic = Get.find<HomeLogic>();
              return AppData.isLogin()
                  ? userHeader(logic, logic.state.user.value)
                  : noLoginHeader(logic.state.user.value);
            }),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                Get.toNamed(Routes.select_language);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: ColorX.cardBg5(),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 13.w),
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  children: [
                    WidgetUtils().buildImage(ImageX.languageT(), 18.r, 18.r),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      Intr().dyy,
                      style: TextStyle(fontSize: 14.sp, color: ColorX.text0917()),
                    ),
                    Expanded(child: Container()),
                    Text(language(), style: TextStyle(fontSize: 14.sp, color: ColorX.text949()),),
                    Image.asset(
                      ImageX.ic_into_right,
                      color: ColorX.icon586(),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
              decoration: BoxDecoration(
                color: ColorX.cardBg5(),
                borderRadius: BorderRadius.circular(10.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 13.w),
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        ImageX.icon_bgyy,
                        color: ColorX.icon586(),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        Intr().bjyy,
                        style: TextStyle(
                            fontSize: 14.sp, color: ColorX.text0917()),
                      ),
                      Expanded(child: Container()),
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
                            musicToggle.value = value;
                          },
                          value: musicToggle.value,
                          inactiveTrackColor: ColorX.text949(),
                          activeTrackColor: ColorX.color_69c25c,
                          activeColor: Colors.white,
                        );
                      }),
                    ],
                  ),
                  Divider(
                    color: ColorX.color_10_949,
                    height: 1.h,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Image.asset(
                          ImageX.icon_tsy,
                          color: ColorX.icon586(),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          Intr().tsy,
                          style: TextStyle(
                              fontSize: 14.sp, color: ColorX.text0917()),
                        ),
                        Expanded(child: Container()),
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
                              notifyToggle.value = value == true;
                            },
                            value: notifyToggle.value,
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
            SizedBox(
              height: 8.h,
            ),
            Container(
              decoration: BoxDecoration(
                color: ColorX.cardBg5(),
                borderRadius: BorderRadius.circular(10.r),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 13.w),
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                children: [
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 5.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(ImageX.icon_wg, color: ColorX.icon586()),
                          SizedBox(width: 5.w,),
                          Text(Intr().wgys, style: TextStyle(fontSize: 14.sp, color: ColorX.text0917()),),
                          Expanded(child: Container()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(theme(), style: TextStyle(fontSize: 14.sp, color: ColorX.text949()),),
                              Image.asset(ImageX.ic_into_right, color: ColorX.icon586()),
                            ],
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                      Get.toNamed(Routes.select_theme);
                    },
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Divider(
                    color: ColorX.color_10_949,
                    height: 1.h,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      Get.toNamed(Routes.select_animation);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 5.h),
                      child: Row(
                        children: [
                          Image.asset(ImageX.icon_dx, color: ColorX.icon586()),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            Intr().dx,
                            style: TextStyle(
                                fontSize: 14.sp, color: ColorX.text0917()),
                          ),
                          Expanded(child: Container()),
                          // Text(Intr().qk,style: TextStyle(fontSize: 14.sp,color: ColorX.text949()),),
                          Image.asset(ImageX.ic_into_right,
                              color: ColorX.icon586()),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
              decoration: BoxDecoration(
                color: ColorX.cardBg5(),
                borderRadius: BorderRadius.circular(10.r),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 13.w),
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                children: [
                  InkWell(
                    onTap: () => jumpToPage(Routes.promotion_profit),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 5.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(ImageX.icon_share,
                              color: ColorX.icon586()),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            Intr().fxghy,
                            style: TextStyle(
                                fontSize: 14.sp, color: ColorX.text0917()),
                          ),
                          Expanded(child: Container()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(Intr().ycfx, style: TextStyle(fontSize: 14.sp, color: ColorX.text949()),),
                              Image.asset(ImageX.ic_into_right, color: ColorX.icon586()),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(height: 15.h,),
                  // Divider(color: ColorX.color_10_949,height: 1.h,),
                  // SizedBox(height: 15.h,),
                  // Container(
                  //   margin: EdgeInsets.symmetric(vertical: 5.h),
                  //   child: Row(
                  //     children: [
                  //       Image.asset(ImageX.icon_download,color: ColorX.icon586()),
                  //       SizedBox(width: 5.w,),
                  //       Text(Intr().xzapp,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
                  //       Expanded(child: Container()),
                  //       Text(Intr().lxjbhb,style: TextStyle(fontSize: 14.sp,color: ColorX.text949()),),
                  //       Image.asset(ImageX.ic_into_right,color: ColorX.icon586()),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Visibility(
              visible: AppData.isLogin(),
              child: Container(
                decoration: BoxDecoration(
                  color: ColorX.cardBg5(),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 13.w),
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                child: InkWell(
                  child: Row(
                    children: [
                      Image.asset(ImageX.icon_exist, color: ColorX.icon586()),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        Intr().logout,
                        style: TextStyle(
                            fontSize: 14.sp, color: ColorX.text0917()),
                      ),
                      Expanded(child: Container()),
                      Image.asset(ImageX.ic_into_right,
                          color: ColorX.icon586()),
                    ],
                  ),
                  onTap: () =>
                      DialogUtils().showLogoutDialog(context).then((value) {
                    if (value == true) {
                      AppData.clear();

                      ///退出登录需求切换页面到首页
                      eventBus.fire(ChangeMainPageEvent(0));
                      eventBus.fire(LoginRefreshEvent());
                      Get.back();
                    }
                  }),
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
          ],
        ),
      ),
    );
  }

  Widget noLoginHeader(LoginUserEntity user) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageX.beforeLoginT()),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          Text(
            Intr().hyld,
            style: TextStyle(
                fontSize: 20.sp,
                color: ColorX.text0917(),
                fontWeight: FontWeight.w600),
          ),
          Text(
            Intr().qqzlxd,
            style: TextStyle(fontSize: 14.sp, color: ColorX.text0917()),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              WidgetUtils().buildElevatedButton(Intr().register, 131.w, 45.h,
                  bg: ColorX.cardBg3(),
                  textColor: ColorX.text0917(), onPressed: () {
                Navigator.of(context).pop();
                Get.toNamed(Routes.register);
              }),
              WidgetUtils().buildElevatedButton(Intr().login, 131.w, 45.h,
                  bg: ColorX.color_fc243b, onPressed: () {
                Navigator.of(context).pop();
                WidgetUtils().goLogin();
              }),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }

  Widget userHeader(HomeLogic logic, LoginUserEntity user) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageX.afterLoginT()),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 17.w,
              ),
              GFAvatar(
                backgroundImage: WidgetUtils()
                    .buildImageProvider(DataUtils.findAvatar(user.avatar.em())),
                shape: GFAvatarShape.circle,
                radius: 23.r,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2.r),
                  ),
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.username.em(),
                    style: TextStyle(fontSize: 16.sp, color: ColorX.text0917()),
                  ),
                  Image.asset(ImageX.icon_vip),
                ],
              ),
              Expanded(child: Container()),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    eventBus.fire(ChangeMainPageEvent(4));
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Text(Intr().grzx, style: TextStyle(fontSize: 14.sp, color: ColorX.text5862()),),
                      Image.asset(
                        ImageX.ic_into_right,
                        color: ColorX.icon586(),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            decoration: BoxDecoration(
              color: ColorX.cardBg8(),
              borderRadius: BorderRadius.circular(10.r),
            ),
            padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 13.w),
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            child: GetBuilder<WalletController>(
              id: WalletController.wallet_id,
              builder: (ctl) {
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                        Get.toNamed(Routes.select_currency);
                      },
                      child: buildWalletDefault(logic, ctl),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Text(
                          Intr().yue_,
                          style: TextStyle(
                              fontSize: 11.sp, color: ColorX.text0917()),
                        ),
                        Obx(() {
                          return Text(
                            ctl.wallet
                                ? "¥${logic.state.cnyBal.value.money.em()}"
                                : "₮${logic.state.usdtBal.value.money.em()}",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: ColorX.text0917(),
                              fontWeight: FontWeight.w600,
                            ),
                          );
                        }),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Container(
            decoration: BoxDecoration(
              color: ColorX.cardBg5(),
              borderRadius: BorderRadius.circular(10.r),
            ),
            padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 13.w),
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => Get.toNamed(Routes.quota_conversion),
                    child: Column(
                      children: [
                        WidgetUtils().buildImage(ImageX.iconEdzhT(), 24.r, 24.r),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          Intr().edzh,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 11.sp, color: ColorX.text0917()),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () => Get.toNamed(Routes.betting_details),
                    child: Column(
                      children: [
                        WidgetUtils().buildImage(ImageX.pcT(), 24.r, 24.r),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          Intr().pcxq,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 11.sp, color: ColorX.text0917()),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () => Get.toNamed(Routes.betting_record),
                    child: Column(
                      children: [
                        WidgetUtils().buildImage(ImageX.iconTzjlT(), 24.r, 24.r),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          Intr().tzjl,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 11.sp, color: ColorX.text0917()),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () => Get.toNamed(Routes.setting),
                    child: Column(
                      children: [
                        WidgetUtils().buildImage(ImageX.iconJymmT(), 24.r, 24.r),
                        SizedBox(height: 5.h,),
                        Text(
                          Intr().jymm,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 11.sp, color: ColorX.text0917()),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
        ],
      ),
    );
  }

  void jumpToPage(String page) {
    if (AppData.isLogin()) {
      Get.toNamed(page);
    } else {
      WidgetUtils().goLogin();
    }
  }

  Widget buildWalletDefault(HomeLogic logic, WalletController ctl) {
    return Row(
      children: [
        WidgetUtils().buildImage(ctl.wallet ? ImageX.iconJjGrey() : ImageX.usdtT(), 15.r, 15.r),
        SizedBox(
          width: 3.w,
        ),
        Text(
          ctl.wallet ? Intr().wallet_cny : Intr().wallet_usdt,
          style: TextStyle(fontSize: 11.sp, color: ColorX.text0917()),
        ),
        SizedBox(
          width: 5.w,
        ),
        Expanded(child: Container()),
        Text(
          "${ctl.wallet ? "USDT" : "CNY"}:",
          style: TextStyle(fontSize: 12.sp, color: ColorX.text5862()),
        ),
        Obx(() {
          return Text(
            ctl.wallet
                ? "₮${logic.state.usdtBal.value.money.em()}"
                : "¥${logic.state.cnyBal.value.money.em()}",
            style: TextStyle(
                fontSize: 12.sp,
                color: ColorX.text5862(),
                fontWeight: FontWeight.w600),
          );
        }),
        SizedBox(
          width: 5.w,
        ),
        Image.asset(
          ImageX.icon_right_left,
          color: ColorX.iconBlack(),
          width: 10.w,
        ),
      ],
    );
  }
}
