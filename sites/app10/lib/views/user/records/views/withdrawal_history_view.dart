import 'package:aone_common/common.dart';
import 'package:aone_widget/picker/pickers.dart';
import 'package:aone_widget/picker/style/default_style.dart';
import 'package:aone_widget/picker/time_picker/model/date_type.dart';
import 'package:app10/views/user/records/controllers/recharge_record_controller.dart';
import 'package:app10/views/user/records/controllers/withdrawal_history_controller.dart';
import 'package:app10/views/user/records/views/withdraw_history_detail_dialog.dart';
import 'package:app10/views/user/records/widgets/withdraw_record_cell.dart';
import 'package:app10/widget/no_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../theme/color_schema.dart';
import '../../../../theme/theme_scaffold.dart';
import '../widgets/record_tool_bar.dart';

class WithdrawalHistoryView extends GetView<WithdrawalHistoryController> {
  const WithdrawalHistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WithdrawalHistoryController>(
      builder: (_) {
        return ThemeScaffold(
          title: '提现记录',
          backgroundColor: const Color(0xfff8f9fb),
          body: Stack(
            children: [
              Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: ScreenUtil().setHeight(46),
                  child: RefreshIndicator(
                    //圆圈进度颜色
                    color: Colors.blue,
                    //下拉停止的距离
                    displacement: 44.0,
                    //背景颜色
                    backgroundColor: Colors.grey[200],
                    onRefresh: _refresh,
                    child: ListView(
                      shrinkWrap: true,
                      controller: controller.scrollController,
                      padding: const EdgeInsets.only(
                          top: 0, right: 0, left: 0, bottom: 13),
                      children: [_contentView(_, context)],
                    ),
                  )),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: context.mediaQueryViewPadding.bottom + 40,
                  // width: Get.width,
                  alignment: Alignment.topCenter,
                  decoration: const BoxDecoration(
                      color: AppTheme.onPrimary,
                      border: Border(
                          top: BorderSide(
                              width: 1, color: AppTheme.borderColor))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10.w),
                        alignment: Alignment.centerLeft,
                        // width: MediaQuery.of(context).size.width / 2,
                        height: context.mediaQueryViewPadding.bottom + 40,
                        // decoration: BoxDecoration(
                        //   color: Colors.white,
                        //   border:
                        //       Border.all(width: 1, color: Color(0xffdededf)),
                        // ),
                        child: RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                            text: "合计：",
                            style: TextStyle(
                                color: Color(0xff000000),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400),
                            children: [
                              TextSpan(
                                text: "${decimalString(_.moneyTotal)}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: "元",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     _didClickSelectedBank();
                      //   },
                      //   child: Container(
                      //     padding: EdgeInsets.only(left: 10.w),
                      //     alignment: Alignment.center,
                      //     width: MediaQuery.of(context).size.width / 2,
                      //     height: context.mediaQueryViewPadding.bottom + 40,
                      //     decoration: BoxDecoration(
                      //       color: Colors.white,
                      //       border:
                      //           Border.all(width: 1, color: Color(0xffdededf)),
                      //     ),
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         Text(
                      //           "${controller.selectCurStr}",
                      //           style: TextStyle(
                      //               color: Colors.black, fontSize: 14.sp),
                      //         ),
                      //         Icon(
                      //           Icons.arrow_drop_up_rounded,
                      //           color: Color(0xff8e8e8e),
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // 刷新
  Future<void> _refresh() async {
    await Future.delayed(Duration(seconds: 1), () {
      RechargeRecordController controller = RechargeRecordController.to;
      controller.onRefresh();
    });
  }

  Widget _contentView(
      WithdrawalHistoryController controller, BuildContext context) {
    return Column(
      children: [
        _toolBarView(context),
        const SizedBox(
          height: 10,
        ),
        Column(
          children: _listViewData(context),
        )
      ],
    );
  }

  _toolBarView(BuildContext context) {
    return RecordToolBar(
        hasFilter: false,
        startDate: controller.startWithdrawTime,
        endDate: controller.endWithdrawTime,
        startDateTap: () {
          Pickers.showDatePicker(
            context,
            title: "请选择开始日期",
            pickerStyle: RaisedPickerStyle(color: AppTheme.primary),
            onConfirm: (p) {
              print(111111);
              int year = p.getSingle(DateType.Year);
              int month = p.getSingle(DateType.Month);
              int date = p.getSingle(DateType.Day);
              String startDate = "${year}" +
                  (month < 10 ? "-0${month}" : "-${month}") +
                  (date < 10 ? "-0${date}" : "-${date}");
              controller.confirmRechargeStart(startDate);
            },
          );
        },
        endDateTap: () {
          Pickers.showDatePicker(
            context,
            title: "请选择截止日期",
            pickerStyle: RaisedPickerStyle(color: AppTheme.primary),
            onConfirm: (p) {
              print(222222);
              int year = p.getSingle(DateType.Year);
              int month = p.getSingle(DateType.Month);
              int date = p.getSingle(DateType.Day);
              String startDate = "${year}" +
                  (month < 10 ? "-0${month}" : "-${month}") +
                  (date < 10 ? "-0${date}" : "-${date}");
              print(startDate);
              controller.confirmRechargeEnd(startDate);
            },
          );
        },
        researchTap: () {
          controller.getWithdrawList(true);
        });
  }

  List<Widget> _listViewData(BuildContext context) {
    WithdrawalHistoryController controller = WithdrawalHistoryController.to;

    List<Widget> _list = [];
    if (controller.widthdrawItemList.isNotEmpty) {
      for (int i = 0; i < controller.widthdrawItemList.length; i++) {
        WidthdrawItem record = controller.widthdrawItemList[i];
        _list.add(WithdrawRecordCell(record, () {
          showDialog(
            context: context,
            builder: (context) {
              return WidthdrawHistoryDetailDialog(item: record);
            },
          );
        }));
      }
    }

    if (_list.isEmpty) {
      _list.add(Column(
        children: const [
          SizedBox(
            height: 100,
          ),
          NoData(title: "暂无提现记录")
        ],
      ));
    }
    return _list;
  }
}
