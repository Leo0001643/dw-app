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
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/draggable_widget.dart';
import 'package:leisure_games/app/widget/nested_inner_scroll_child.dart';
import 'package:leisure_games/ui/bean/login_user_entity.dart';
import 'package:leisure_games/ui/bean/notice_entity.dart';
import 'package:leisure_games/ui/main/home/game_menu_view.dart';
import 'package:leisure_games/ui/main/home/more_tab_view.dart';
import 'package:marquee/marquee.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app/utils/dialog_utils.dart';
import 'home_logic.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StateHomePage();
}

class StateHomePage extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final logic = Get.find<HomeLogic>();
  final state = Get.find<HomeLogic>().state;

  final NestedInnerScrollCoordinator _coordinator =
      NestedInnerScrollCoordinator(ScrollController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetMaterialController>(
      builder: (ct) {
        return Stack(
          children: [
            CustomScrollView(
              controller: _coordinator.outerController,
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    color: ColorX.pageBg(),
                    child: Column(
                      children: [
                        SizedBox(
                          height: ScreenUtil().statusBarHeight,
                        ),
                        WidgetUtils().buildHomeAppBar(msg: true, drawer: true),
                        Obx(() {
                          if (isEmpty(state.bannerList)) {
                            return Container();
                          }
                          return GFCarousel(
                              autoPlay: true,
                              aspectRatio: 345 / 110,
                              viewportFraction: 1.0,
                              hasPagination: true,
                              passiveIndicator: Colors.white60,
                              activeIndicator: Colors.white,
                              items: state.bannerList.map((e) {
                                return InkWell(
                                  child: Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 20.w),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12.r)),
                                      child: Image.network(
                                        "${e.url}${e.picurl}",
                                        fit: BoxFit.fill,
                                        width: 1000,
                                      ),
                                    ),
                                  ),
                                  onTap: () {},
                                );
                              }).toList());
                        }),
                        SizedBox(
                          height: 9.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  ColorX.color_fff4f2,
                                  ColorX.color_fefff4
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              color: ColorX.cardBg(),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.r)),
                            ),
                            height: 32.h,
                            // padding: EdgeInsets.symmetric(vertical: 12.h),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10.w,
                                ),
                                Image.asset(ImageX.icon_ntf),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Expanded(
                                  child: Obx(() {
                                    if (isEmpty(state.noticeList)) {
                                      return Container();
                                    }
                                    return InkWell(
                                      onTap: () {
                                        WidgetUtils().goMessageCenter();
                                      },
                                      child: Marquee(
                                        text:
                                            buildNoticeString(state.noticeList),
                                        style: TextStyle(
                                            fontSize: 13.sp,
                                            color: ColorX.text0917()),
                                        scrollAxis: Axis.horizontal,
                                        startPadding: 10.w,
                                        blankSpace: 5.w,
                                      ),
                                    );
                                  }),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 8.h),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(child: Obx(() {
                                return AppData.isLogin()
                                    ? userHeader(state.user.value)
                                    : noLoginHeader(state.user.value);
                              })),
                              SizedBox(
                                width: 15.w,
                              ),
                              buildMenuItem(
                                  Intr().charge, ImageX.icChongzhiT(), 0),
                              buildMenuItem(
                                  Intr().tixian, ImageX.icTixianT(), 1),
                              MoreTabView(logic),
                              // buildMenuItem(Intr().zoushi,ImageX.iconTrendT(),3),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          height: 400.h,
                          child: GameMenuView(logic, _coordinator),
                        ),
                        Container(
                          color: ColorX.pageBg(),
                          margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buildActivityItem(
                                  4, ImageX.yhhdT(), Intr().qiandaoyouli),
                              buildActivityItem(
                                  5, ImageX.qdyjT(), Intr().jifenyaojiang),
                              buildActivityItem(
                                  6, ImageX.tjylT(), Intr().qianghongbao),
                            ],
                          ),
                        ),
                        Container(
                          color: ColorX.cardBg(),
                          margin: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 15.w),
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                direction: Axis.horizontal,
                                children: state.labelBtm
                                    .map((e) => buildComInfo(
                                        e, state.labelBtm.last == e))
                                    .toList(),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                Intr().guojizhan2023,
                                style: TextStyle(
                                    fontSize: 10.sp, color: ColorX.text5862()),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            // NestedInnerScrollDemo(),
            //隐藏红包雨
            // Obx(() {
            //   return Visibility(
            //     visible: state.hongbaoVisible.value && state.hongbaoManual.value,
            //     child: DraggableWidget(logic,state.act.value,),
            //   );
            // }),
          ],
        );
      },
    );
  }

  buildMenuItem(String text, String icon, int i) {
    return InkWell(
      onTap: () => logic.clickMenu(context, i),
      child: SizedBox(
        width: 50.w,
        child: Column(
          children: [
            Image.asset(
              icon,
              width: 20.r,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 12.sp, color: ColorX.text0917()),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildComInfo(String title, bool last) {
    return Wrap(
      children: [
        InkWell(
          onTap: () => logic.clickInfo(context, title),
          child: Text(
            title,
            style: TextStyle(fontSize: 12.sp, color: ColorX.text5862()),
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
        last
            ? Container()
            : Text(
                "|",
                style: TextStyle(fontSize: 12.sp, color: ColorX.text5862()),
              ),
        SizedBox(
          width: 5.w,
        ),
      ],
    );
  }

  Widget buildActivityItem(int i, String bg, String tab) {
    return InkWell(
      onTap: () => logic.clickMenu(context, i),
      child: Container(
        width: 85.w,
        height: 77.h,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(bg),
            fit: BoxFit.fill,
          ),
        ),
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 10.h),
        child: Text(
          tab,
          style: TextStyle(fontSize: 16.sp, color: Colors.white),
        ),
      ),
    );
  }

  String buildNoticeString(List<NoticeEntity> value) {
    var builder = StringBuffer();
    value.forEach((element) {
      builder.write("【${element.noteTitle.em()}】：");
      builder.write(element.noteContent.em());
    });
    return builder.toString();
  }

  ///登录后
  Widget userHeader(LoginUserEntity user) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              user.username.em(),
              style: TextStyle(fontSize: 14.sp, color: ColorX.text0917()),
            ),
            SizedBox(
              width: 5.w,
            ),
            Image.asset(ImageX.icon_vip),
            Expanded(
              child: Container(),
            ),
            InkWell(
              onTap: () => logic.loadUserData(jumpNotice: false),
              child: Image.asset(
                ImageX.icShuaxinT(),
                width: 17.r,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            Container(
              height: 10.h,
              width: 1.w,
              color: ColorX.color_091722,
            ),
            SizedBox(
              width: 8.w,
            ),
            InkWell(
              onTap: () => Get.toNamed(Routes.select_currency),
              child: Image.asset(
                ImageX.icQiehuanT(),
                width: 10.r,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
          ],
        ),
        GetBuilder<WalletController>(
          id: WalletController.wallet_id,
          builder: (ctl) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Obx(() {
                    return buildWalletDefault(
                        ctl.wallet
                            ? "¥${state.cnyBal.value.money.em()}"
                            : "₮${state.usdtBal.value.money.em()}",
                        ctl.wallet
                            ? ImageX.icon_rmb_grey
                            : ImageX.icon_ustd2_grey);
                  }),
                ),
                Obx(() {
                  return buildWalletOther(
                      ctl.wallet
                          ? "₮${state.usdtBal.value.money.em()}"
                          : "¥${state.cnyBal.value.money.em()}",
                      ctl.wallet
                          ? ImageX.icon_ustd2_grey
                          : ImageX.icon_rmb_grey);
                }),
              ],
            );
          },
        ),
      ],
    );
  }

  ///未登录
  Widget noLoginHeader(LoginUserEntity user) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        WidgetUtils().buildNoElevatedButton(Intr().login, 78.w, 32.h,
            textSize: 13.sp,
            textColor: ColorX.color_091722,
            showBorder: true,
            bg: Colors.white, onPressed: () {
          WidgetUtils().goLogin();
        }),
        // SizedBox(width: 10.w,),

        WidgetUtils().buildNoElevatedButton(Intr().register, 78.w, 32.h,
            textSize: 13.sp,
            bg: ColorX.color_fe2427,
            onPressed: () => Get.toNamed(Routes.register)),
      ],
    );
  }

  Widget buildWalletDefault(String value, String icon) {
    return Row(
      children: [
        Image.asset(
          icon,
        ), //color: ColorX.icon586(),
        SizedBox(
          width: 3.w,
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14.sp,
            color: ColorX.text0917(),
            overflow: TextOverflow.ellipsis,
          ),
          maxLines: 1,
        ),
      ],
    );
  }

  Widget buildWalletOther(String value, String icon) {
    return Row(
      children: [
        Image.asset(
          icon,
        ),
        SizedBox(
          width: 3.w,
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14.sp,
            color: ColorX.color_58698d,
          ),
          maxLines: 1,
        ),
      ],
    );
  }
}
