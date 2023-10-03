import 'package:aone_common/common.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../app_service.dart';
import '../../../tab/controllers/main_tabbar_controller.dart';
import '../../../theme/color_schema.dart';
import '../../../widget/misc/theme_button.dart';
import '../controllers/tack_center_controller.dart';
import 'progress_bar.dart';
import 'progress_detail_dialog.dart';

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
        clipBehavior: Clip.none,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/activity/task_center_ground.png',
            ),
            fit: BoxFit.fill,
          ),
        ),
        padding: EdgeInsets.all(
          10.r,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              right: 5.r,
              child: Container(
                padding: EdgeInsets.only(
                  left: 14.h,
                  right: 14.h,
                  bottom: 4.h,
                  top: 6.h,
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/images/activity/task_center_ground_${state.labelColor.name.toString()}.png',
                  ),
                )),
                child: Center(
                  child: Text(
                    state.labelText.tr,
                    textAlign: TextAlign.center,
                    textWidthBasis: TextWidthBasis.parent,
                    style: TextStyle(
                      color: getColor(state.labelColor),
                      fontSize: 11,
                      height: 1.2,
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _gameImage(),
                      Container(
                        width: 120.w,
                        margin: EdgeInsets.only(left: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _cardTitle(),
                            Text(
                              item.taskTitle,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                if (item.state != 0)
                  Container(
                    height: 25.r,
                    color: Colors.transparent,
                    child: TaskProgressBar(
                      percent: item.progressDetail.taskProgress.percent! / 100,
                      total: item.progressDetail.taskProgress.deposit ??
                          item.progressDetail.taskProgress.dml ??
                          item.progressDetail.taskProgress.profit ??
                          item.progressDetail.taskProgress.fs,
                      finish: item.progressDetail.taskProgress.depositFinish ??
                          item.progressDetail.taskProgress.dmlFinish ??
                          item.progressDetail.taskProgress.profitFinish ??
                          item.progressDetail.taskProgress.fsFinish,
                    ),
                  ),
                Container(
                  padding: const EdgeInsets.only(left: 8, top: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: '奖励金额：',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.sp,
                            )),
                        TextSpan(
                            text:
                                '$symbol${NumberFormat('###.##').format(double.tryParse(item.award) ?? 0.0)}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.sp,
                            ))
                      ])),
                      const SizedBox(
                        width: 10,
                      ),
                      _button(),
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

  Widget _button() {
    if (state.labelColor == LabelColor.gray) {
      return Align(
        alignment: Alignment.bottomRight,
        child: ThemeButton.neutral(
          gradient: const LinearGradient(colors: [
            Color(0xFFC19E52),
            Color(0xFFC19E52),
          ]),
          width: 80.r,
          height: 25.r,
          radius: 10,
          onTap: () {
            state.btnEvent?.call();
          },
          child: Text(
            state.buttonText.tr,
            textAlign: TextAlign.center,
            textHeightBehavior: const TextHeightBehavior(
              leadingDistribution: TextLeadingDistribution.even,
            ),
            style: TextStyle(fontSize: 10.sp, color: Colors.white),
          ),
        ),
      );
    }
    return Align(
      alignment: Alignment.bottomRight,
      child: ThemeButton(
        width: 80.r,
        height: 25.r,
        radius: 5,
        gradient: const LinearGradient(colors: [
          Color(0xFFC19E52),
          Color(0xFFC19E52),
        ]),
        backgroundColor: const Color(0xFFFFD053),
        onTap: () {
          state.btnEvent?.call();
        },
        child: Text(
          state.buttonText.tr,
          textAlign: TextAlign.center,
          textHeightBehavior: const TextHeightBehavior(
            leadingDistribution: TextLeadingDistribution.even,
          ),
          style: TextStyle(fontSize: 10.sp, color: Colors.white),
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
        color: Colors.white,
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _gameImage() {
    final ctrl = TackCenterController.to;
    return Obx(() {
      if (item.gameTag == '0') {
        return Image.asset(
          'assets/images/activity/task_center/${ctrl.activeType}_logo.png',
          width: 46.r,
          height: 46.r,
          fit: BoxFit.fill,
        );
      }
      return Container(
        width: 46.r,
        height: 46.r,
        clipBehavior: Clip.antiAlias,
        padding: EdgeInsets.all(2.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23.r),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(250, 225, 150, 1),
              Color.fromRGBO(244, 194, 92, 1),
            ],
          ),
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
