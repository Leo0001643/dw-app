import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/controller/wallet_controller.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/bean/change_main_page_event.dart';
import 'package:lifecycle/lifecycle.dart';

import 'mine_logic.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StateMinePage();
}

class StateMinePage extends State<MinePage> with LifecycleAware, LifecycleMixin {
  final logic = Get.find<MineLogic>();
  final state = Get.find<MineLogic>().state;

  @override
  void onLifecycleEvent(LifecycleEvent event) {
    loggerArray(["生命周期变化了",event]);
    if(event == LifecycleEvent.active){
      logic.loadData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorX.pageBg2(),
        body: Column(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(ImageX.mybgT()),
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
                          InkWell(
                            onTap: () => Get.toNamed(Routes.select_avatar),
                            child: Stack(
                              children: [
                                Obx(() {
                                  return GFAvatar(
                                    backgroundImage: WidgetUtils().buildImageProvider(DataUtils.findAvatar(state.user.value.avatar.em())),
                                    shape: GFAvatarShape.circle,
                                    radius: 25.r,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.white,
                                            width: 2.r),
                                      ),
                                    ),
                                  );
                                }),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child:
                                      Image.asset(ImageX.icon_edit_avatar),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(() {
                                return Text(
                                  state.user.value.username.em(),
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: ColorX.text0917(),
                                      fontFamily: Constants.FONT_STD,
                                      fontWeight: FontWeight.w700),
                                );
                              }),
                              SizedBox(
                                height: 5.h,
                              ),
                              Row(
                                children: [
                                  Obx(() {
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: Colors.redAccent,
                                        borderRadius: BorderRadius.circular(5.r),
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 3.r,),
                                      child: Text(state.user.value.gradeName.em(),style: TextStyle(fontSize: 7.sp,color: Colors.white),),
                                    );
                                  }),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Obx(() {
                                    return Text(
                                      state.user.value.alias.em(),
                                      style: TextStyle(
                                          fontSize: 10.sp,
                                          color: ColorX.text5862()),
                                    );
                                  }),
                                ],
                              ),
                            ],
                          ),
                          Expanded(child: Container()),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "¥${state.bonus.value.bonusTotal.em()}\n${Intr().jiangjin}",
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: ColorX.text5862()),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    "${state.memberPoint.value.point.em()}\n${Intr().jifen}",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: ColorX.text5862(),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          image: DecorationImage(
                            image: AssetImage(ImageX.myCardT()),
                            fit: BoxFit.fill,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 18.h, horizontal: 13.w),
                        margin: EdgeInsets.symmetric(horizontal: 10.w),
                        child: GetBuilder<WalletController>(
                          id: WalletController.wallet_id,
                          builder: (ctl) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () =>
                                      Get.toNamed(Routes.select_currency),
                                  child: Row(
                                    children: [
                                      WidgetUtils().buildImage(ctl.wallet ? ImageX.iconJjGrey() : ImageX.usdtT(), 15.r, 15.r),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Text(
                                        ctl.wallet
                                            ? Intr().wallet_cny
                                            : Intr().wallet_usdt,
                                        style: TextStyle(
                                            fontSize: 13.sp,
                                            color: ColorX.text0917()),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Expanded(child: Container()),
                                      Text(
                                        "${ctl.wallet ? "USDT" : "CNY"}:",
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: ColorX.text5862()),
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
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      Intr().yue_,
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          color: ColorX.text0917(),
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Obx(() {
                                      return Text(
                                        ctl.wallet
                                            ? "¥${logic.state.cnyBal.value.money.em()}"
                                            : "₮${logic.state.usdtBal.value.money.em()}",
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          color: ColorX.text0917(),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      );
                                    }),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    WidgetUtils().buildOutlineButton(
                                        Intr().tixian,
                                        131.w,
                                        45.h,
                                        ColorX.color_dce0e7,
                                        bg: ColorX.cardBg5(),
                                        textColor: ColorX.text0917(),
                                        onPressed: () {
                                      Get.toNamed(Routes.withdraw);
                                    }),
                                    WidgetUtils().buildElevatedButton(
                                        Intr().chongzhi, 131.w, 45.h,
                                        bg: ColorX.color_fc243b,
                                        onPressed: () {
                                      eventBus.fire(ChangeMainPageEvent(2));
                                    }),
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10.r,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: ColorX.cardBg5(),
                    ),
                    padding: EdgeInsets.symmetric(
                        vertical: 18.h, horizontal: 13.w),
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Intr().wodeqianbao,
                          style: TextStyle(
                              fontSize: 15.sp, color: ColorX.text0917()),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            buildCategoryItem(
                                Intr().bibiduihuan, ImageX.iconBbT(), 0),
                            buildCategoryItem(
                                Intr().eduzhuanhuan, ImageX.iconEdzhT(), 1),
                            buildCategoryItem(
                                Intr().zijinmingxi, ImageX.iconZjmxT(), 2),
                            buildCategoryItem(
                                Intr().tixianmima, ImageX.iconJymmT(), 3),
                          ],
                        ),
                        Row(
                          children: [
                            buildCategoryItem(Intr().bangdingyinhangka, ImageX.iconBdYhk(), 4),
                            buildCategoryItem(
                                Intr().bangdingusdt, ImageX.iconBddtT(), 5),
                            buildCategoryItem(
                                Intr().bangdingqitaqianbao, ImageX.bindOtherT(), 21),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.r,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: ColorX.cardBg5(),
                    ),
                    padding: EdgeInsets.symmetric(
                        vertical: 18.h, horizontal: 13.w),
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Intr().wodetouzhu,
                          style: TextStyle(fontSize: 15.sp, color: ColorX.text0917()),
                        ),
                        SizedBox(height: 10.h,),
                        Row(
                          children: [
                            buildCategoryItem(
                                Intr().touzhujilu, ImageX.iconTzjlT(), 6),
                            buildCategoryItem(
                                Intr().jifenjilu, ImageX.iconJfjlT(), 7),
                            buildCategoryItem(
                                Intr().huiyuanfanshui, ImageX.iconFanT(), 8),
                            buildCategoryItem(Intr().hongbaohejiangjin, ImageX.iconHbjjT(), 9),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.r,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: ColorX.cardBg5(),
                    ),
                    padding: EdgeInsets.symmetric(
                        vertical: 18.h, horizontal: 13.w),
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Intr().wodeyinli,
                          style: TextStyle(
                              fontSize: 15.sp, color: ColorX.text0917()),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            buildCategoryItem(Intr().tuiguangzhuanqian,
                                ImageX.iconTuiguangT(), 10),
                            buildCategoryItem(
                                Intr().dailizhuce, ImageX.iconDaiT(), 11),
                            Container(
                              width: 80.w,
                            ),
                            Container(
                              width: 80.w,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.r,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: ColorX.cardBg5(),
                    ),
                    padding: EdgeInsets.symmetric(
                        vertical: 18.h, horizontal: 13.w),
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Intr().qita,
                          style: TextStyle(
                              fontSize: 15.sp, color: ColorX.text0917()),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            buildCategoryItem(Intr().tongyongshezhi, ImageX.iconSettingT(), 12),
                            buildCategoryItem(
                                Intr().bangzhuzhongxin, ImageX.iconBzzxT(), 13),
                            buildCategoryItem(
                                Intr().gaunyuwomen, ImageX.iconGywmT(), 14),
                            Container(
                              width: 80.w,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50.r,
                  ),
                ],
              ),
            )),
          ],
        ));
  }

  Widget buildCategoryItem(String title, String icon, int index) {
    ///绑定其他钱包的图标大了一点，需要特殊处理
    var size = index == 21 ? 20.r:24.r;
    return InkWell(
      onTap: () => logic.clickItem(index),
      child: SizedBox(
        width: 80.w,
        height: 60.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WidgetUtils().buildImage(icon, size, size,fit: BoxFit.contain),
            SizedBox(
              height: 3.h + (24.r - size),
            ),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 11.sp, color: ColorX.text5862(),overflow: TextOverflow.ellipsis,),
                maxLines: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }




}
