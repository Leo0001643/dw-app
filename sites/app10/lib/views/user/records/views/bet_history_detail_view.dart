import 'package:aone_common/common.dart';
import 'package:aone_common/data/model/entities/record/record_detail_entity.dart';
import 'package:aone_widget/picker/pickers.dart';
import 'package:aone_widget/picker/style/default_style.dart';
import 'package:aone_widget/picker/time_picker/model/date_type.dart';
import 'package:app10/views/user/records/controllers/bet_history_detail_controller.dart';
import 'package:app10/views/user/records/views/bet_history_detail_dialog.dart';
import 'package:app10/widget/no_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../../../theme/color_schema.dart';
import '../../../../theme/theme_scaffold.dart';
import '../widgets/record_tool_bar.dart';

class BetHistoryDetailView extends GetView<BetHistoryDetailController> {
  const BetHistoryDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BetHistoryDetailController>(
      builder: (_) {
        return ThemeScaffold(
          title: '${_.title}',
          body: RefreshIndicator(
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
              padding:
                  const EdgeInsets.only(top: 0, right: 0, left: 0, bottom: 13),
              children: [_contentView(_, context)],
            ),
          ),
        );
      },
    );
  }

  // 刷新
  Future<void> _refresh() async {
    await Future.delayed(Duration(seconds: 1), () {
      BetHistoryDetailController controller = BetHistoryDetailController.to;
      controller.onRefresh();
    });
  }

  Widget _contentView(
      BetHistoryDetailController controller, BuildContext context) {
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
        startDate: controller.startBetTime,
        endDate: controller.endBetTime,
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
              controller.confirmYhStart(startDate);
            },
          );
        },
        endDateTap: () {
          Pickers.showDatePicker(
            context,
            pickerStyle: RaisedPickerStyle(color: AppTheme.primary),
            title: "请选择截止日期",
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
          controller.getBetDetailRecordList(true);
        });
  }

  List<Widget> _listViewData(BuildContext context) {
    BetHistoryDetailController controller = BetHistoryDetailController.to;

    List<Widget> _list = [];
    if (controller.betDetailList != null &&
        controller.betDetailList.length > 0) {
      for (int i = 0; i < controller.betDetailList.length; i++) {
        _list.add(_contentCell(context, i));
      }
    }

    if (_list.isEmpty) {
      _list.add(Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          NoData(title: "暂无投注记录")
        ],
      ));
    }
    return _list;
  }

  //cell
  Widget _contentCell(BuildContext context, int index) {
    DetailBets element = controller.betDetailList[index];
    return InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return BetHistoryDetailDialog(item: element);
            },
          );
        },
        child: Container(
          margin: EdgeInsets.only(top: 8.r, left: 8.r, right: 8.r),
          padding: EdgeInsets.all(13.r),
          decoration: BoxDecoration(
              color: stringToColor('f2f5f8'),
              borderRadius: BorderRadius.circular(8.r)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '订单号: ',
                    style: TextStyle(
                        color: stringToColor('0b213b'),
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    constraints: BoxConstraints(maxWidth: 235.r),
                    child: Text(
                      element.bet_id ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: stringToColor('0b213b'),
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: element.bet_id));
                      SmartDialog.showToast('user.center.success.copy'.tr);
                    },
                    child: Container(
                      width: 47,
                      height: 22,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        color: AppTheme.buttonBg,
                        boxShadow: const [
                          BoxShadow(
                              color: AppTheme.warning,
                              offset: Offset(0, 2),
                              blurRadius: 0,
                              spreadRadius: 0),
                        ],
                      ),
                      child: Text(
                        '复制',
                        style: TextStyle(
                            color: AppTheme.primary,
                            fontSize: 12,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 9),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      constraints: const BoxConstraints(minWidth: 80),
                      child: Text(
                        '总投注额：',
                        style: TextStyle(
                            color: stringToColor('0b213b'),
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    // const SizedBox(
                    //   width: 11,
                    // ),
                    Text(
                      '${decimalString(element.betSum)}',
                      style: TextStyle(
                          color: stringToColor('0b213b', 0.7),
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 2),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      constraints: const BoxConstraints(minWidth: 80),
                      child: Text(
                        '实际输赢：',
                        style: TextStyle(
                            color: stringToColor('0b213b'),
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    // const SizedBox(
                    //   width: 11,
                    // ),
                    Text(
                      '${decimalString(element.betWin ?? "0")}',
                      style: TextStyle(
                          color: stringToColor('ff0000'),
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 2),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      constraints: const BoxConstraints(minWidth: 80),
                      child: Text(
                        '状态：',
                        style: TextStyle(
                            color: stringToColor('0b213b'),
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      getBetStatuString(element.bet_state ?? 0),
                      style: TextStyle(
                        fontSize: 13,
                        color: statusColor(element.bet_state ?? 0),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Color statusColor(int state) {
    if (state == 1) {
      return AppTheme.danger;
    } else if (state == 2) {
      return const Color(0xFF22924C);
    }
    return AppTheme.primary;
  }
}
