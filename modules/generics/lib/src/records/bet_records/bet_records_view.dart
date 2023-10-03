import 'package:aone_common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../cashier/card_manager_new/widget/no_data.dart';
import '../../cashier/utils/theme_scaffold.dart';
import '../../cashier/withdraw_new/widget/page_loading.dart';
import '../../common_widgets/gen_no_data.dart';
import '../../common_widgets/gen_page_loading.dart';
import '../../common_widgets/gen_theme_scaffold.dart';
import '../bill_records/widgets/record_button.dart';
import '../bill_records/widgets/record_select_date_menu.dart';
import 'bet_records_controller.dart';
import 'widgets/bet_drop_cell.dart';
import 'widgets/bet_record_detail_cell.dart';
import 'widgets/bet_record_select_menu.dart';
import 'widgets/bet_total_menu.dart';

class BetRecordsView extends GetView<BetRecordsController> {
  const BetRecordsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BetRecordsController>(
      builder: (_) {
        return WillPopScope(
          onWillPop: () async {
            ///如果是在分类页面返回，先返回的总览页面
            if (!controller.isZonglanDetailMenuShow) {
              controller.isZonglanDetailMenuShow = true;
              controller.onRefresh();
              return false;
            } else {
              // Get.back();
              return true;
            }
          },
          child: GenThemeScaffold(
            backgroundColor: AoneAppTheme.appTheme.recordBgColor,
            onBack: () {
              ///如果是在分类页面返回，先返回的总览页面
              if (!controller.isZonglanDetailMenuShow) {
                controller.isZonglanDetailMenuShow = true;
                controller.onRefresh();
              } else {
                Get.back();
              }
            },
            title: '游戏投注记录',
            body: Stack(
              children: [
                ///投注类型（子类型+总览/明细）选择+日期选择
                Positioned(
                    left: 0,
                    top: 0,
                    right: 0,
                    height: 55.r,
                    child: _toolBarView(context)),

                ///账单列表
                Positioned(
                  left: 0,
                  right: 0,
                  top: 55.r,
                  bottom: 0,
                  child: RefreshIndicator(
                      // color: AppTheme.primary,
                      displacement: 44.0,
                      backgroundColor: Colors.grey[200],
                      onRefresh: _refresh,
                      child: Obx(() {
                        List<Widget> list = [];

                        if (controller.pageState == PageState.loading) {
                          if (controller.isZonglanDetailMenuShow) {
                            if (controller.isZonglanStatus &&
                                controller.betZonglanList.isEmpty) {
                              list.add(_pageLoading());
                              return _contentView(list);
                            }
                            if (controller.isZonglanStatus == false &&
                                controller.betDetailLists.isEmpty) {
                              list.add(_pageLoading());
                              return _contentView(list);
                            }
                          } else {
                            if (controller.betDetailLists.isEmpty) {
                              list.add(_pageLoading());
                              return _contentView(list);
                            }
                          }
                          if (controller.betZonglanList.isEmpty) {}
                        } else if (controller.pageState == PageState.empty) {
                          list.add(_noDataView());
                          return _contentView(list);
                        }

                        if (controller.isZonglanDetailMenuShow) {
                          if (controller.isZonglanStatus) {
                            list = _zonglanListData(context);
                            return _contentView(list);
                          } else {
                            list = _detailListData();
                            return _contentView(list,
                                scrollController:
                                    controller.detailScrollController);
                          }
                        } else {
                          list = _detailListData();
                          return _contentView(list,
                              scrollController:
                                  controller.detailScrollController);
                        }
                      })),
                ),

                ///账单类型选择详情
                Positioned(
                    left: 0,
                    right: 0,
                    top: 54.r,
                    bottom: 0,
                    child: Obx(() {
                      return Offstage(
                          offstage: !controller.isTypeShow,
                          child: const BetRecordSelectMenu());
                    })),

                ///日期选择详情
                Positioned(
                    left: 0,
                    right: 0,
                    top: 54.r,
                    bottom: 0,
                    child: Obx(() {
                      return Offstage(
                          offstage: !controller.isDateShow,
                          child: RecordSelectDateMenu(
                            selectedIndex: controller.selectDateIndex,
                            startDate: controller.startTime,
                            endDate: controller.endTime,
                            onDismiss: () {
                              controller.isDateShow = false;
                            },
                            onDateIndexChange: (index) {
                              controller.selectDateIndex = index;
                              if (index != 4) {
                                Future.delayed(
                                    const Duration(milliseconds: 400), () {
                                  controller.isDateShow = false;
                                });
                              }
                              controller.onRefresh();
                            },
                            dateConfirm: (List values) {
                              controller.confirmDateList(
                                  values.first, values.last);
                            },
                          ));
                    })),
              ],
            ),
          ),
        );
      },
    );
  }

  _contentView(List children, {ScrollController? scrollController}) {
    return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        controller: scrollController,
        children: [
          BetTotalMenu(controller.totalBet, controller.totalValidBet,
              controller.totalBetWin),
          ...children
        ]);
  }

  _toolBarView(BuildContext context) {
    return Obx(() {
      return Container(
        height: 60.r,
        padding: EdgeInsets.symmetric(horizontal: 19.r),
        margin: const EdgeInsets.only(top: 1),
        decoration: BoxDecoration(
          color: (controller.isTypeShow | controller.isDateShow)
              ? AoneAppTheme.appTheme.recordCardColor
              : AoneAppTheme.appTheme.recordBgColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ///总览或者明细 按钮
            if (controller.isZonglanDetailMenuShow)
              Padding(
                padding: EdgeInsets.only(right: 10.r),
                child: RecordArrowButton(
                  title: controller.isZonglanStatus ? '总览' : '明细',
                  isHasNotArrow: true,
                  onTap: () {
                    controller.isZonglanStatus = !controller.isZonglanStatus;
                    controller.onRefresh();
                  },
                ),
              ),

            ///游戏分类 按钮
            if (!controller.isZonglanDetailMenuShow)
              Padding(
                padding: EdgeInsets.only(right: 10.r),
                child: RecordArrowButton(
                  title: controller.betTypeName,
                  isOpen: !controller.isTypeShow,
                  onTap: () {
                    controller.isDateShow = false;
                    controller.isTypeShow = !controller.isTypeShow;
                  },
                ),
              ),

            ///选择日期
            RecordArrowButton(
              title: controller.getDateString(),
              isOpen: !controller.isDateShow,
              onTap: () {
                controller.isTypeShow = false;
                controller.isDateShow = !controller.isDateShow;
              },
            ),
          ],
        ),
      );
    });
  }

  _noDataView() {
    return SizedBox(height: 400.h, child: const GenNoData(title: "暂无投注记录"));
  }

  _pageLoading() {
    return Padding(
      padding: EdgeInsets.only(top: 200.h),
      child: const GenPageLoading(),
    );
  }

  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 1), () {
      BetRecordsController controller = BetRecordsController.to;
      controller.onRefresh();
    });
  }

  ///总览数据
  List<Widget> _zonglanListData(BuildContext context) {
    BetRecordsController controller = BetRecordsController.to;
    List<Widget> list = [];
    list.add(const BetDropCellTitle());
    for (var element in controller.betZonglanList) {
      list.add(BetDropCell(element));
    }
    return list;
  }

  ///明细数据
  _detailListData() {
    List<Widget> list = [];
    controller.betDetailLists.forEach((element) {
      list.add(BetRecordDetailCell(
        element,
        isSubGame: !controller.isZonglanDetailMenuShow,
      ));
    });
    return list;
  }
}
