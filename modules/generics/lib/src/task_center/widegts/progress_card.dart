import 'package:aone_common/common.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../gen_task_center_controller.dart';
import 'progress_bar.dart';
import 'progress_detail_dialog.dart';

class ProgressCard extends StatelessWidget {
  final ProgressCardItem item;
  late final TaskProgressState state;

  ProgressCard({
    Key? key,
    required this.item,
  }) : super(key: key) {
    state = TaskProgressState<GenTaskCenterController>.create(
      item,
      toHome: () {
        EventBus.emit(EventType.onGoHomePage);
      },
      toCustomerService: () {
        EventBus.emit(EventType.onOpenCustomerService);
      },
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
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          height: 1.2,
        ),
      ));
    }

    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
      onTap: () {
        if (state.isShowDetailDialog == true) {
          Get.dialog(
            ProgressDetailDialog(
                detail: item.progressDetail, cycle: item.cycle),
          );
        }
      },
      child: Container(
        width: 284.r - 12.r,
        height: 120.r,
        clipBehavior: Clip.none,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/activity/task_center/task_center_ground.png',
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
              right: 6.r,
              top: 2.r,
              child: Container(
                width: 19.r,
                height: 41.r,
                padding: EdgeInsets.only(top: 3.r),
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/images/activity/task_center/task_center_ground_${state.labelColor.name.toString()}.png',
                  ),
                )),
                child: Text(
                  state.labelText.tr,
                  textAlign: TextAlign.center,
                  textWidthBasis: TextWidthBasis.parent,
                  style: TextStyle(
                    color: AoneAppTheme.appTheme.tcCellRightTopStatusColor,
                    fontSize: 10.sp,
                    height: 1,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/activity/task_center/task_center_banner_bg.png'))),
                  width: 145.r,
                  height: 31.r,
                  // margin: EdgeInsets.only(left: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _cardTitle(),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 2.r,
                          ),
                          Container(
                            constraints: BoxConstraints(maxWidth: 190.r),
                            padding: EdgeInsets.only(left: 6.r),
                            child: Text(
                              item.taskTitle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color:
                                    AoneAppTheme.appTheme.tcCellSubTitleColor,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                          _buildTaskProgressBar(),
                          Container(
                            width: 215.r - 14.r,
                            padding: EdgeInsets.only(left: 6.r),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

  // Color getColor(LabelColor labelColor) {
  //   switch (labelColor) {
  //     case LabelColor.blue:
  //       return Colors.blue;
  //     case LabelColor.gray:
  //       return Colors.grey;
  //     case LabelColor.purple:
  //       return Colors.purple;
  //     case LabelColor.red:
  //       return Colors.red;
  //   }
  // }

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
      child: TaskProgressBar1(
        barWidth: 215.r - 12.r,
        barHeight: 12.r,
        barColor: AoneAppTheme.appTheme.tcCellSliderColor,
        bgColor: AoneAppTheme.appTheme.tcCellSliderBgColor,
        percent: item.progressDetail.taskProgress.percent!,
        titleColor: AoneAppTheme.appTheme.tcCellSliderTitleColor,
        titleColor1: AoneAppTheme.appTheme.tcCellSliderTitleColor1,
      ),
    );
  }

  Widget _button() {
    return Align(
      alignment: Alignment.bottomRight,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          state.btnEvent?.call();
        },
        child: Container(
          width: 75.r,
          height: 21.r,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.5.r),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: state.isNormalButton == true
                    ? [
                        const Color(0xFFF9DD94),
                        const Color(0xFFE1B867),
                      ]
                    : [
                        const Color(0xFFCECECE),
                        const Color(0xFF818181),
                      ],
              )),
          child: Text(
            state.buttonText.tr,
            textAlign: TextAlign.center,
            textHeightBehavior: const TextHeightBehavior(
              leadingDistribution: TextLeadingDistribution.even,
            ),
            style: TextStyle(
                fontSize: 10.sp,
                color:
                    state.isNormalButton == true ? Colors.black : Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _cardTitle() {
    return Container(
      constraints: BoxConstraints(maxWidth: 100.r),
      child: Text(
        item.title,
        maxLines: 1,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: AoneAppTheme.appTheme.tcCellTitleColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _gameImage() {
    final ctrl = GenTaskCenterController.to;
    return Obx(() {
      if (item.gameTag == '0') {
        return Image.asset(
          'assets/images/activity/task_center/${ctrl.activeType}_logo.png',
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
