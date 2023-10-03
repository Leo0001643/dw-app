import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:generics/generics.dart';
import 'package:generics/src/cashier/utils/dj_image.dart';
import 'package:get/get.dart';

import '../widgets/recharge_scaffold.dart';
import 'widget/no_data.dart';

class RechargeView extends GetView<RechargeController> {
  const RechargeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // printInfo(
    //     info:
    //         "controller.pageState  ${controller.pageState.toString()}   controller.payCategoryList.isEmpty  ${controller.payCategoryList.isEmpty}");
    final RechargeTheme _theme = RechargeTheme();
    Get.lazyPut(() => RechargeController());
    return RechargeScaffold(
      hideBack: true,
      title: '充值',
      backgroundColor: _theme.startPageBg ?? _theme.backgroundColor,
      body: Container(
        color: _theme.startPageBg ?? _theme.backgroundColor,
        child: Obx(
          () {
            if (controller.pageState == PageState.loading) {
              return RechargeTheme().pageLoading!;
            } else if (controller.pageState == PageState.empty ||
                controller.payCategoryList.isEmpty) {
              return NoData(
                  title: '暂时无法充值，请联系客服',
                  img: _theme.noDataImage,
                  style: _theme.noDataStyle);
            }
            var onlineRate = RechargeController.to.state.onlineRate * 100;
            var coefficient = RechargeController.to.state.coefficient * 100;

            List<String> onlineRates = [];
            List<String> coefficients = [];
            if (onlineRate > 0) {
              String temp = decimalString(onlineRate.toString()) + '%';
              onlineRates = ['(入款回馈', temp, ',次次存次次送)'];
            }
            if (coefficient > 0) {
              String temp = decimalString(coefficient.toString()) + '%';
              coefficients = ['(入款回馈', temp, ')'];
            }

            print('onlineRateonlineRate:$onlineRate');
            print('coefficientcoefficientcoefficient:$coefficient');
            print('ad12312ed:$coefficients');

            String siteTag = AppEnv.config.siteTag;
            //客服说这里写死，G系列站点  特殊处理
            if (siteTag == "a02" || "g87,g83,g85,g86".contains(siteTag) ) {
              coefficient = 0.1;
              onlineRate = 0.05;

              if (coefficient > 0) {
                String temp = decimalString(coefficient.toString()) + '%';
                coefficients = ['(入款回馈', temp, ',次次存次次送)'];
              }

              if (onlineRate > 0) {
                String temp = decimalString(onlineRate.toString()) + '%';
                onlineRates = ['(入款回馈', temp, ')'];
              }

              return SingleChildScrollView(
                padding: EdgeInsets.only(
                    bottom: context.mediaQueryViewPadding.bottom),
                child: Column(
                  children: [
                    _RechargeChannelCard(
                      title: '线上存款',
                      subTitles: coefficients,
                      items: controller.state.xxItems,
                      fontWeight: FontWeight.bold,
                      onTap: controller.onNavigate,
                      type: 2,
                    ),
                    _RechargeChannelCard(
                      title: '线上支付',
                      subTitles: onlineRates,
                      items: controller.state.xsItems,
                      fontWeight: FontWeight.bold,
                      onTap: controller.onNavigate,
                      type: 1,
                    ),
                    _RechargeChannelCard(
                      title: 'VIP充值',
                      items: controller.state.vipItems,
                      onTap: controller.onNavigate,
                      fontWeight: FontWeight.bold,
                      type: 3,
                    ),
                  ],
                ),
              );
            }

            final _transfer = _RechargeChannelCard(
              title: '转账汇款',
              subTitles: coefficients,
              items: controller.state.xxItems,
              onTap: controller.onNavigate,
              type: 2,
            );

            final _online = _RechargeChannelCard(
              title: '线上支付',
              subTitles: onlineRates,
              items: controller.state.xsItems,
              onTap: controller.onNavigate,
              type: 1,
            );

            final _vip = _RechargeChannelCard(
              title: 'VIP充值',
              items: controller.state.vipItems,
              onTap: controller.onNavigate,
              type: 3,
            );

            List<Widget> columns = [_transfer, _online, _vip];
            if (_theme.isOnlineFirst == true) {
              columns = [_online, _transfer, _vip];
            }
            return SingleChildScrollView(
              padding:
                  EdgeInsets.only(bottom: context.mediaQueryViewPadding.bottom),
              child: Column(
                children: columns,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _RechargeChannelCard extends StatelessWidget {
  final String title;
  final List<String>? subTitles;
  final FontWeight fontWeight;
  final int type;
  final List<BasePayCategory> items;
  final void Function(BasePayCategory) onTap;

  const _RechargeChannelCard({
    Key? key,
    required this.title,
    this.subTitles,
    this.fontWeight = FontWeight.normal,
    required this.items,
    required this.onTap,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RechargeTheme _theme = RechargeTheme();

    if (_theme.isRechargeListStyle == true) {
      return Container(
        constraints: BoxConstraints(minHeight: 139.w),
        margin: EdgeInsets.only(top: 15.w),
        padding: EdgeInsets.symmetric(horizontal: 15.r),
        decoration: BoxDecoration(
          color: _theme.startPageBg ?? _theme.cardBackgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 40.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14.w,
                      color: _theme.startPageTitleColor ?? _theme.mainTextColor,
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
                                width: 14.w,
                                height: 14.w,
                                child: DjImage.asset(
                                  'assets/images/user/icon_recharge_aaa.png',
                                  color: _theme.startPageTitleColor ??
                                      _theme.mainTextColor,
                                ),
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Text(
                                "教程",
                                style: TextStyle(
                                  fontSize: 14.w,
                                  color: _theme.startPageTitleColor ??
                                      _theme.mainTextColor,
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
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          width: 1,
                          color: _theme.startPageBorderColor ??
                              _theme.borderColor!))),
              child: _styleList(),
            ),
          ],
        ),
      );
    }
    return Container(
      width: Get.width,
      height: _theme.isRechargeItemsMultiRows == true ? null : 143.r,
      margin: EdgeInsets.only(left: 12.w, right: 12.w, top: 15.w),
      decoration: BoxDecoration(
        color: _theme.rechargeCardBgColor,
        border: Border.all(width: 1, color: _theme.borderColor!),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                width: Get.width,
                height: 40.r,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: _theme.mainTextColor,
                          fontWeight: FontWeight.bold),
                    ),
                    if (subTitles?.isNotEmpty == true &&
                        _theme.isShowRechargeDiscount == true)
                      RichText(
                        text: TextSpan(
                          text: subTitles?.first,
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: _theme.mainTextColor,
                              fontWeight: fontWeight),
                          children: [
                            TextSpan(
                              text: subTitles?[1],
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: _theme.dangerColor,
                                  fontWeight: fontWeight),
                            ),
                            TextSpan(
                              text: subTitles?.last,
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: _theme.mainTextColor,
                                  fontWeight: fontWeight),
                            ),
                          ],
                        ),
                      ),
                    const Spacer(),
                    type != 3
                        ? GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.rechargeTutorial,
                                  arguments: type);
                            },
                            child: Row(
                              children: [
                                if (_theme.isShowQuestionIcon == true)
                                  SizedBox(
                                    width: 16.r,
                                    height: 16.r,
                                    child: Image.asset(
                                      'assets/images/recharge_question1.png',
                                      color: _theme.questionIconColor,
                                      package: 'generics',
                                    ),
                                  ),
                                SizedBox(
                                  width: 6.w,
                                ),
                                Text(
                                  "教程",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: _theme.mainTextColor,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ))
                        : const SizedBox(),
                  ],
                ),
              ),
              Container(
                width: Get.width,
                height: 1.r,
                color: _theme.dividerColor,
              ),
            ],
          ),
          _theme.isRechargeListStyle == true
              ? _styleList()
              : Container(
                  height: _theme.isRechargeItemsMultiRows == true ? null : 98.r,
                  padding: EdgeInsets.symmetric(vertical: 16.r),
                  alignment: Alignment.centerLeft,
                  child: _gridView(),
                )
        ],
      ),
    );
  }

  Widget _gridView() {
    RechargeTheme _theme = RechargeTheme();
    if (items.isEmpty) {
      return Container(
          alignment: Alignment.center,
          height: 100,
          child: Text(
            '暂不支持 $title',
            style: _theme.noDataStyle,
          ));
    }
    if (_theme.isRechargeItemsMultiRows == true) {
      return Padding(
        padding: EdgeInsets.only(left: 10.r),
        child: Wrap(
          children: items.map((e) => _channelCells(e)).toList(),
        ),
      );
    } else {
      return Container(
          width: Get.width,
          margin: EdgeInsets.only(left: 10.r, right: 10.r),
          alignment: Alignment.centerLeft,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return _channelCells(items[index]); //通知信息
            },
            itemCount: items.length,
          ));
    }
  }

  Widget _channelCells(BasePayCategory e) {
    printInfo(info: "jett---->e  ${e.tag} e${e.classname}");
    return GestureDetector(
      onTap: () => onTap(e),
      child: Container(
        width: 77.r,
        height: 66.r,
        margin: EdgeInsets.only(right: 5.r, bottom: 2.r),
        alignment: Alignment.center,
        decoration: RechargeTheme().rechargeItemDecoration,
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
              style: TextStyle(
                fontSize: 11.sp,
                color: RechargeTheme().mainTextColor,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
    // color: stringToColor('0b213b', 0.1),
  }

  _styleList() {
    if (items.isEmpty) {
      return Container(
          alignment: Alignment.center,
          height: 100,
          child: Text(
            '暂不支持 $title',
            style: RechargeTheme().noDataStyle,
          ));
    }

    return Column(
      children: items.map((e) => _styleListChannel(e)).toList(),
    );
  }

  Widget _styleListChannel(BasePayCategory e) {
    final RechargeTheme _theme = RechargeTheme();
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        printInfo(info: "jett---->e  ${e.tag} e${e.classname}");
        onTap(e);
      },
      child: Container(
        height: 66.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1,
                    color:
                        _theme.startPageBorderColor ?? _theme.borderColor!))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: 40.r,
                height: 40.r,
                child: SvgPicture.network(
                  e.classimg ?? "",
                  width: 30.r,
                  height: 30.r,
                  fit: BoxFit.contain,
                )),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  e.classname ?? '',
                  style: TextStyle(
                      fontSize: 16,
                      color:
                          _theme.startPageTitleColor ?? _theme.mainTextColor),
                ),
                const SizedBox(
                  height: 4,
                ),
                const Text(
                  '极速充值，无需等待，3秒到账',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios_sharp,
              size: 18.r,
              color: _theme.startPageArrowColor ?? const Color(0xFF808080),
            ),
          ],
        ),
      ),
    );
    // color: stringToColor('0b213b', 0.1),
  }
}
