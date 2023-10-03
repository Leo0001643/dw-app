import 'package:aone_common/common.dart';
import 'package:app04/app_service.dart';
import 'package:app04/config/site_config.dart';
import 'package:app04/tab/controllers/main_tabbar_controller.dart';
import 'package:app04/views/activities/controllers/tack_center_controller.dart';
import 'package:app04/views/activities/widgets/progress_bar.dart';
import 'package:app04/views/activities/widgets/progress_detail_dialog.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../widget/misc/theme_button.dart';
import 'label_painter.dart';

class ProgressCard extends StatelessWidget {
  final ProgressCardItem item;
  late final TaskProgressState state;

  ProgressCard({
    Key? key,
    required this.item,
  }) : super(key: key) {
    state = TaskProgressState<TackCenterController>.create(
      item,
      toHome: () {
        Get.close(2);
        MainTabbarController.to.selectIndex = 0;
        MainTabbarController.to.pageController.jumpTo(0);
      },
      toCustomerService: AppService.to.toCustomerService,
      toDeposit: () => Get.toNamed(Routes.recharge),
    );
  }

  @override
  Widget build(BuildContext context) {
    final symbol = GlobalService.to.state.siteHeaders.currencySymbol;

    String labelStr = state.labelText.tr;
    List<Widget> listText = [];
    for (int i = 0; i < labelStr.length; i++) {
      listText.add(Text(
        labelStr[i],
        style: TextStyle(
          color: Colors.white,
          fontSize: 11,
          height: 1.2,
        ),
      ));
    }

    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
      onTap: () {
        if (item.state == 0) {
          return;
        }
        Get.dialog(
          ProgressDetailDialog(detail: item.progressDetail, cycle: item.cycle),
        );
      },
      child: Container(
        width: 284.r - 12.r,
        height: 120.r,
        clipBehavior: Clip.none,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/activity/task_center/$siteTagAssets/task_center_ground.png',
            ),
            fit: BoxFit.fill,
          ),
        ),
        padding: EdgeInsets.fromLTRB(
          10.r,
          0.r,
          10.r,
          0.r,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              right: 4.r,
              top: 2.r,
              child: Container(
                width: 24.r,
                height: 52.r,
                padding: EdgeInsets.only(
                  top: 2.h,
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/images/activity/task_center/$siteTagAssets/task_center_ground_${state.labelColor.name.toString()}.png',
                  ),
                )),
                child: CustomPaint(
                  painter: LabelPainter(state.labelColor),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 3.r,
                      right: 3.r,
                      bottom: 3.r,
                    ),
                    child: Center(
                      child: Text(
                        state.labelText.tr,
                        softWrap: true,
                        textAlign: TextAlign.center,
                        textWidthBasis: TextWidthBasis.parent,
                        style: TextStyle(
                          color:
                              AoneAppTheme.appTheme.tcCellRightTopStatusColor,
                          fontSize: 11,
                          height: 1.2,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/activity/task_center/$siteTagAssets/task_center_banner_bg.png'))),
                  width: 145.r,
                  height: 31.r,
                  // margin: EdgeInsets.only(left: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _cardTitle(),
                      // Text(
                      //   item.taskTitle,
                      //   style: TextStyle(
                      //     color: Colors.white,
                      //     fontSize: 10.sp,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 88.r,
                  // color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.r),
                        child: _gameImage(),
                      ),
                      SizedBox(
                        width: 10.r,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 2.r,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 6.r),
                              child: Text(
                                item.taskTitle,
                                style: TextStyle(
                                  color:
                                      AoneAppTheme.appTheme.tcCellSubTitleColor,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                            // Container(
                            //   padding: EdgeInsets.symmetric(vertical: 6.r),
                            //   child: Visibility(
                            //     visible: ![0, 1].contains(item.state),
                            //     child: TaskProgressBar(
                            //       bgColor:
                            //           AoneAppTheme.appTheme.tcCellSliderBgColor,
                            //       barColor:
                            //           AoneAppTheme.appTheme.tcCellSliderColor,
                            //       percent: item.progressDetail.taskProgress
                            //               .percent! /
                            //           100,
                            //     ),
                            //   ),
                            // ),
                            _buildTaskProgressBar(),
                            Container(
                              width: 215.r - 14.r,
                              padding: EdgeInsets.only(left: 6.r),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text.rich(TextSpan(children: [
                                    TextSpan(
                                        text: '奖励金额：',
                                        style: TextStyle(
                                          color: AoneAppTheme
                                              .appTheme.tcCellSubTitleColor,
                                          fontSize: 12.sp,
                                        )),
                                    TextSpan(
                                        text:
                                            '$symbol${NumberFormat('###.##').format(double.tryParse(item.award) ?? 0.0)}',
                                        style: TextStyle(
                                          color: AoneAppTheme
                                              .appTheme.tcCellSubTitleColor,
                                          fontSize: 12.sp,
                                        ))
                                  ])),
                                  if (state.isShowButton == true) _button(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color getColor(LabelColor labelColor) {
    switch (labelColor) {
      case LabelColor.blue:
        return Colors.blue;
      case LabelColor.gray:
        return Colors.grey;
      case LabelColor.purple:
        return Colors.purple;
      case LabelColor.red:
        return Colors.red;
    }
  }

  _buildTaskProgressBar() {
    ///没有参与活动，不需要展示进度条
    ///参与成功，不管进度多少都显示
    // 审核中
    if (state.isShowProcess == false) {
      return SizedBox(
        height: 6.r,
      );
    }
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.r),
      height: 22.5.r,
      width: 215.r - 12.r,
      child: TaskProgressBar(
        barColor: AoneAppTheme.appTheme.tcCellSliderColor,
        bgColor: AoneAppTheme.appTheme.tcCellSliderBgColor,
        percent: item.progressDetail.taskProgress.percent!,
      ),
    );
  }

  Widget _button() {
    return Align(
      alignment: Alignment.bottomRight,
      child: ThemeButton.neutral(
        width: 75.r,
        height: 21.r,
        radius: 10.5.r,
        onTap: () {
          state.btnEvent?.call();
        },
        gradient: state.isNormalButton == true
            ? AoneAppTheme.appTheme.tcCellBottomBtnGradient
            : AoneAppTheme.appTheme.tcCellBottomBtnDisableGradient,
        child: Text(
          state.buttonText.tr,
          textAlign: TextAlign.center,
          textHeightBehavior: const TextHeightBehavior(
            leadingDistribution: TextLeadingDistribution.even,
          ),
          style: TextStyle(
              fontSize: 10.sp,
              color: state.isNormalButton == true
                  ? AoneAppTheme.appTheme.tcCellBottomBtnTitleColor
                  : AoneAppTheme.appTheme.tcCellBottomBtnDisableTitleColor),
        ),
      ),
    );
  }

  Widget _cardTitle() {
    return AutoSizeText(
      item.title,
      maxLines: 1,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: AoneAppTheme.appTheme.tcCellTitleColor,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _gameImage() {
    final ctrl = TackCenterController.to;
    return Obx(() {
      if (item.gameTag == '0') {
        if (isSiteTagH09) {
          return Image.asset(
            'assets/images/activity/task_center/$siteTagAssets/${ctrl.activeType}_logo.png',
            width: 64.r,
            height: 64.r,
            fit: BoxFit.fill,
          );
        }
        return Image.asset(
          'assets/images/activity/task_center/$siteTagAssets/${ctrl.activeType}_logo.png',
          width: 64.r,
          height: 64.r,
          fit: BoxFit.fill,
        );
      }
      return Container(
        width: 64.r,
        height: 64.r,
        clipBehavior: Clip.antiAlias,
        padding: EdgeInsets.all(2.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23.r),
          // gradient: const LinearGradient(
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          //   colors: [
          //     Color(0xFF48C8A0),
          //     Color(0xFF15815F),
          //     Color(0xFFD9D9D9),
          //   ],
          // ),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(30, 30, 30, 1),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: CachedNetworkImage(
            height: 46.r,
            fit: BoxFit.fill,
            imageUrl: ctrl.state.gameImageList
                    .firstWhere((element) => element.gameTag == item.gameTag)
                    .imgCn ??
                '',
            errorWidget: (_, __, ___) => const SizedBox.shrink(),
          ),
        ),
      );
    });
  }
}
