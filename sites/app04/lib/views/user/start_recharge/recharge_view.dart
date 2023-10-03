import 'package:aone_common/common.dart';
import 'package:app04/tab/controllers/main_tabbar_controller.dart';
import 'package:app04/theme/background_wrapper.dart';
import 'package:app04/theme/color_schema.dart';
import 'package:app04/theme/theme_scaffold.dart';
import 'package:app04/views/general/controllers/home_page_controller.dart';
import 'package:app04/widget/misc/page_loading.dart';
import 'package:app04/widget/no_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'controller/recharge_controller.dart';

class RechargeView extends GetView<RechargeController> {
  const RechargeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=>RechargeController());
    printInfo(
        info:
            "controller.pageState  ${controller.pageState.toString()}   controller.payCategoryList.isEmpty  ${controller.payCategoryList.isEmpty}");
    return BackgroundWrapper(
      child: ThemeScaffold(
        appBar: AppBar(
            title: const Text(
              "充值",
              style: TextStyle(fontSize: 16, color: Color(0xFFFFFFFF)),
            ),
            centerTitle: true,
            // leading: GestureDetector(
            //   onTap: () {
            //     MainTabbarController.to.jumpToPage(4);
            //   },
            //   child: const Image(
            //     width: 25,
            //     height: 25,
            //     image: AssetImage(
            //       'assets/images/home/person_back.png',
            //     ),
            //   ),
            // ),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: AppTheme.primaryGradient,
              ),
            )),
        hideBack: true,
        title: 'activity'.tr,
        body: Container(
          color: AppTheme.normalBgColor,
          padding: EdgeInsets.only(bottom: 15.w),
          child: Obx(
            () {
              if (controller.pageState == PageState.loading) {
                return const PageLoading();
              } else if (controller.pageState == PageState.empty ||
                  controller.payCategoryList.isEmpty) {
                return const NoData(title: '暂时无法充值，请联系客服');
              }
              return SingleChildScrollView(
                padding: EdgeInsets.only(
                    bottom: context.mediaQueryViewPadding.bottom),
                child: Column(
                  children: [
                    _RechargeChannelCard(
                      title: '线上支付',
                      items: controller.state.xsItems,
                      onTap: controller.onNavigate,
                      type: 1,
                      emptyTitle: "暂不支持线上支付",
                    ),
                    _RechargeChannelCard(
                      title: '转账汇款',
                      items: controller.state.xxItems,
                      onTap: controller.onNavigate,
                      type: 2,
                      emptyTitle: "暂不支持转账汇款支付",
                    ),
                    _RechargeChannelCard(
                      title: 'VIP充值',
                      items: controller.state.vipItems,
                      onTap: controller.onNavigate,
                      emptyTitle: "暂不支持VIP账户支付",
                      type: 3,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _RechargeChannelCard extends StatelessWidget {
  final String emptyTitle;
  final String title;
  final int type;
  final List<BasePayCategory> items;
  final void Function(BasePayCategory) onTap;

  const _RechargeChannelCard({
    Key? key,
    required this.title,
    required this.items,
    required this.onTap,
    required this.type,
    required this.emptyTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 139.w),
      margin: EdgeInsets.only(left: 12.w, right: 12.w, top: 15.w),
      decoration: const BoxDecoration(
        color: AppTheme.backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 40.w,
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 14.w,
                        color: const Color(0xff5A5A5A),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    type != 3
                        ? GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.rechargeTutorial,
                                  arguments: type);
                            },
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 18.w,
                                  height: 18.w,
                                  child: Image.asset(
                                    'assets/images/user/icon_recharge_aaa.png',
                                    color: const Color(0xff5A5A5A),
                                  ),
                                ),
                                SizedBox(
                                  width: 12.w,
                                ),
                                Text(
                                  "教程",
                                  style: TextStyle(
                                    fontSize: 14.w,
                                    color: const Color(0xff5A5A5A),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ))
                        : const SizedBox(),
                  ],
                ),
              ),
              Container(
                height: 1.r,
                color: AppTheme.underLineColor,
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 16.w),
            alignment: Alignment.center,
            child: items.isEmpty
                ? Container(
                    height: 98.w,
                    alignment: Alignment.center,
                    child: Text(
                      emptyTitle,
                      style: TextStyle(
                        color: const Color(0xffCCCCCC),
                        fontSize: 14.w,
                      ),
                    ),
                  )
                : Container(
                    // margin: EdgeInsets.symmetric(horizontal: 14.w),
                    alignment: Alignment.centerLeft,
                    child: LayoutBuilder(builder: (context, constraints) {
                      return Wrap(
                        spacing: 5.w,
                        runSpacing: 10.w,
                        children: items.map((e) => _channelCells(e)).toList(),
                      );
                    }),
                    // child: ListView.builder(
                    //   shrinkWrap: true,
                    //   scrollDirection: Axis.horizontal,
                    //   itemBuilder: (context, index) {
                    //     return _channelCells(items[index]); //通知信息
                    //   },
                    //   itemCount: items.length,
                    // ),
                  ),
          )
        ],
      ),
    );
  }

  // List<Widget> _buildNumberGridList() {
  //   List<Widget> listWidget = [];
  //   items.map((e) => {listWidget.add(_channelCells(e))});
  //   return listWidget;
  // }

  // @override
  // Widget build(BuildContext context) {
  //   c Padding(
  //     padding: EdgeInsets.only(bottom: 20.r),
  //     child: ThemeCard(
  //       title: title,
  //       extra: GestureDetector(
  //         onTap: () {
  //           Get.toNamed(Routes.rechargeTutorial);
  //         },
  //         child: Image.asset(
  //           'assets/images/recharge/question.png',
  //         ),
  //       ),
  //       child: Column(
  //         children: _channelCells(),
  //       ),
  //     ),
  //   );

  Widget _channelCells(BasePayCategory e) {
    printInfo(info: "jett---->e  ${e.tag} e${e.classname}");
    return GestureDetector(
      onTap: () => onTap(e),
      child: Container(
        width: 77.w,
        height: 66.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppTheme.cardBackColor,
            borderRadius: BorderRadius.circular(5.r),
            border: Border.all(width: 1.r, color: AppTheme.undeer_line_color),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.23),
                blurRadius: 0.0.r,
                spreadRadius: 0.2,
                offset: const Offset(0, 2),
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 30.r,
                height: 30.r,
                child: SvgPicture.network(
                  e.classimg ?? "",
                  width: 30.r,
                  height: 30.r,
                  fit: BoxFit.contain,
                )),
            Text(
              e.classname ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 10.sp,
                color: const Color.fromRGBO(11, 33, 59, 0.7),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
    // color: stringToColor('0b213b', 0.1),
  }

  buildList() {
    return Container(
      margin: EdgeInsets.only(top: 17.5.r),
      width: 238,
      height: 28,
      decoration: BoxDecoration(
          color: stringToColor('3785f9', 0.1),
          // color: Colors.red,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(width: 1.r, color: Colors.white),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 30.r,
              spreadRadius: 1.r,
            )
          ]),
    );
  }
}
