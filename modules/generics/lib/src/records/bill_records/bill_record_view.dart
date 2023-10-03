import 'package:aone_common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generics/src/records/bill_records/bill_records_controller.dart';
import 'package:get/get.dart';
import '../../common_widgets/gen_no_data.dart';
import '../../common_widgets/gen_page_loading.dart';
import '../../common_widgets/gen_theme_scaffold.dart';
import 'recharge_records/recharge_record_cell.dart';
import 'widgets/bill_record_cell.dart';
import 'widgets/bill_record_select_menu.dart';
import 'widgets/record_button.dart';
import 'widgets/record_select_date_menu.dart';
import 'withdraw_records/withdraw_record_cell.dart';

class BillRecordsView extends GetView<BillRecordsController> {
  const BillRecordsView({Key? key}) : super(key: key);

  double get bottomPadding {
    return Get.context?.mediaQueryViewPadding.bottom ?? 0;
  }

  double get bottomTotalHeight {
    return bottomPadding > 0 ? 40.r + bottomPadding : 50.r;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BillRecordsController>(
      builder: (_) {
        return GenThemeScaffold(
          hideBack: true,
          title: "资金记录",
          backgroundColor: AoneAppTheme.appTheme.recordBgColor ??
              AoneAppTheme.appTheme.backgroundColor,
          body: Stack(
            children: [
              ///账单类型选择+日期选择
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
                bottom: bottomTotalHeight,
                child: RefreshIndicator(
                    // color: AppTheme.primary,
                    displacement: 44.0,
                    // backgroundColor: Colors.grey[200],
                    onRefresh: _refresh,
                    child: Obx(() {
                      if (controller.pageState == PageState.loading) {
                        if (_getRecordsList.isEmpty) {
                          return const GenPageLoading();
                        }
                      } else if (_getRecordsList.isEmpty) {
                        return _noDataView();
                      }

                      return Column(
                        children: [
                          Expanded(
                            child: _getRecordsList.isEmpty
                                ? _noDataView()
                                : ListView(
                                    physics:
                                        const AlwaysScrollableScrollPhysics(),
                                    controller: controller.scrollController,
                                    children: _listViewData()),
                          ),
                        ],
                      );
                    })),
              ),

              ///底部总计
              Positioned(
                  left: 0,
                  right: 0,
                  height: bottomTotalHeight,
                  bottom: 0,
                  child: _bottomTotalView()),

              ///账单类型选择详情
              Positioned(
                  left: 0,
                  right: 0,
                  top: 54.r,
                  bottom: 0,
                  child: Obx(() {
                    return Offstage(
                        offstage: !controller.isTypeShow,
                        child: const BillRecordSelectMenu());
                  })),

              ///账单日期选择详情
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
                          startDate: controller.startReportTime,
                          endDate: controller.endReportTime,
                          onDismiss: () {
                            controller.isDateShow = false;
                          },
                          onDateIndexChange: (index) {
                            controller.selectDateIndex = index;
                            if (index != 4) {
                              Future.delayed(const Duration(milliseconds: 400),
                                  () {
                                controller.isDateShow = false;
                              });
                            }
                            controller.onRefresh();
                          },
                          dateConfirm: (List values) {
                            controller.confirmDate(values.first, values.last);
                          },
                        ));
                  })),
            ],
          ),
        );
      },
    );
  }

  get _getRecordsList {
    if (controller.selectTypeIndex == 0) {
      return controller.rechargeRecordsList;
    } else if (controller.selectTypeIndex == 1) {
      return controller.withdrawRecordsList;
    } else {
      return controller.billRecordsList;
    }
  }

  _noDataView() {
    return Column(
      children: const [
        SizedBox(
          height: 100,
        ),
        GenNoData(title: "暂无账单记录")
      ],
    );
  }

  // 刷新
  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 1), () {
      BillRecordsController controller = BillRecordsController.to;
      controller.onRefresh();
    });
  }

  List<Widget> _listViewData() {
    List<Widget> list = [];
    if (_getRecordsList.isNotEmpty) {
      for (int i = 0; i < _getRecordsList.length; i++) {
        final item = _getRecordsList[i];

        final Widget cell;
        if (controller.selectTypeIndex == 0) {
          cell = RechargeRecordCell(item);
        } else if (controller.selectTypeIndex == 1) {
          cell = WithdrawRecordCell(item);
        } else {
          cell = BillRecordCell(
            item,
          );
        }
        list.add(cell);
      }
    }
    return list;
  }

  get itemTitleColor {
    return const Color(0xFFCCCCCC);
  }

  get itemContentColor {
    return Colors.white;
  }

  get itemBgColor {
    return const Color(0xFF3C4661);
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
            ///资金类别
            Padding(
              padding: EdgeInsets.only(right: 10.r),
              child: RecordArrowButton(
                title: controller.reportCurStr,
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

  _bottomTotalView() {
    final money = decimalString(controller.moneyTotal);
    String fushuString = '';
    double moneyDouble = double.tryParse(money) ?? 0;
    if (moneyDouble > 0) {
      fushuString = controller.fushuSymbol;
    }

    return Container(
      padding: EdgeInsets.fromLTRB(19.r, 0, 19.r, bottomPadding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r), topRight: Radius.circular(12.r)),
          gradient: AoneAppTheme.appTheme.recordsBottomTotalGradient),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '总计',
            style: TextStyle(
                fontSize: 15.sp,
                color: AoneAppTheme.appTheme.recordsBottomTotalTextColor ??
                    Color(0xff888888)),
          ),

          RichText(
            text: TextSpan(
              text: GlobalService.to.state.siteHeaders.currencySymbol,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AoneAppTheme.appTheme.recordsBottomTotalMoneyTextColor ??
                    const Color(0xffB62027),
              ),
              children: [
                TextSpan(
                    text: fushuString + doubleStringSubstringInter(money),
                    style: TextStyle(
                        fontSize: 18.sp,
                        // color: const Color(0xffB62027),
                        fontWeight: FontWeight.bold)),

                ///特殊扣款 额度转换 是负数
                TextSpan(
                    text: doubleStringSubstringDecimal(money),
                    style: TextStyle(
                      fontSize: 14.sp,
                      // color: const Color(0xffB62027),
                    )),
              ],
            ),
          ),

          // Text(
          //   controller.moneyTotal,
          //   style: TextStyle(fontSize: 20.sp, color: Color(0xffB62027)),
          // ),
        ],
      ),
    );
  }
}
