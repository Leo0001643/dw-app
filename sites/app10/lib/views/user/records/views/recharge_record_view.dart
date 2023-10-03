import 'package:aone_common/common.dart';
import 'package:aone_widget/picker/pickers.dart';
import 'package:aone_widget/picker/style/default_style.dart';
import 'package:aone_widget/picker/time_picker/model/date_type.dart';
import 'package:app10/views/user/records/controllers/recharge_record_controller.dart';
import 'package:app10/views/user/records/views/recharge_record_detail_dialog.dart';
import 'package:app10/views/user/records/widgets/recharge_record_cell.dart';
import 'package:app10/views/user/records/widgets/record_tool_bar.dart';
import 'package:app10/widget/no_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../theme/color_schema.dart';
import '../../../../theme/theme_scaffold.dart';

class RechargeRecordView extends GetView<RechargeRecordController> {
  const RechargeRecordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RechargeRecordController>(
      builder: (_) {
        return ThemeScaffold(
          title: '充值记录',
          backgroundColor: const Color(0xfff8f9fb),
          body: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: ScreenUtil().setHeight(46) + 12.r,
                child: RefreshIndicator(
                  //圆圈进度颜色
                  color: Colors.green,
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
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: context.mediaQueryViewPadding.bottom + 40,
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
      RechargeRecordController controller, BuildContext context) {
    return Column(
      children: [
        _toolBarView(context),
        SizedBox(
          height: 15.r,
        ),
        Column(
          children: _listViewData(context),
        )
      ],
    );
  }

  List<Widget> _listViewData(BuildContext context) {
    RechargeRecordController controller = RechargeRecordController.to;

    List<Widget> _list = [];
    if (controller.rechageList.isNotEmpty) {
      for (int i = 0; i < controller.rechageList.length; i++) {
        Items record = controller.rechageList[i];
        _list.add(RechargeRecordCell(record, () {
          showDialog(
            context: context,
            builder: (context) {
              return RechargeRecordDetailDialog(item: record);
            },
          );
        }));
      }
    }

    if (_list.isEmpty) {
      _list.add(Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const SizedBox(
            height: 100,
          ),
          const NoData(title: "暂无充值记录")
        ],
      ));
    }
    return _list;
  }

  _toolBarView(BuildContext context) {
    return RecordToolBar(
        hasFilter: false,
        startDate: controller.startRechargeTime,
        endDate: controller.endRechargeTime,
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
              print(startDate);
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
              print(111111);
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
          controller.rechargeCurPage = 1;
          controller.getRechageList(true);
        });
  }
}
