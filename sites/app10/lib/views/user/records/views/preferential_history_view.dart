import 'package:aone_common/common.dart';
import 'package:aone_widget/picker/pickers.dart';
import 'package:aone_widget/picker/style/default_style.dart';
import 'package:aone_widget/picker/time_picker/model/date_type.dart';
import 'package:app10/theme/color_schema.dart';
import 'package:app10/views/user/records/controllers/preferential_history_controller.dart';
import 'package:app10/views/user/records/views/preferential_history_detail_dialog.dart';
import 'package:app10/views/user/records/widgets/record_tool_bar.dart';
import 'package:app10/widget/no_data.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../../../theme/theme_scaffold.dart';

class PreferentialHistoryView extends GetView<PreferentialHistoryController> {
  const PreferentialHistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PreferentialHistoryController>(
      builder: (_) {
        return ThemeScaffold(
          backgroundColor: const Color(0xfff8f9fb),
          hideBack: true,
          title: "优惠记录",
          body: RefreshIndicator(
            color: Colors.blue,
            displacement: 44.0,
            backgroundColor: Colors.grey[200],
            onRefresh: _refresh,
            child: ListView(
              shrinkWrap: true,
              controller: controller.scrollController,
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
      PreferentialHistoryController controller =
          PreferentialHistoryController.to;
      controller.onRefresh();
    });
  }

  Widget _contentView(
      PreferentialHistoryController controller, BuildContext context) {
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

  List<Widget> _listViewData(BuildContext context) {
    PreferentialHistoryController controller = PreferentialHistoryController.to;

    List<Widget> _list = [];
    if (controller.yhItemList != null && controller.yhItemList.length > 0) {
      for (int i = 0; i < controller.yhItemList.length; i++) {
        _list.add(_contentCell(context, i));
      }
    }

    if (_list.isEmpty) {
      _list.add(Column(
        children: const [
          SizedBox(
            height: 100,
          ),
          NoData(title: "暂无更多优惠记录")
        ],
      ));
    }
    return _list;
  }

  //cell
  Widget _contentCell(BuildContext context, int index) {
    YhItem element = controller.yhItemList[index];
    return InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return PreferentialHistoryDetailDialog(item: element);
            },
          );
        },
        child: Container(
          margin: const EdgeInsets.only(top: 8, left: 0, right: 0),
          padding: const EdgeInsets.all(13),
          decoration: BoxDecoration(
              color: Color(0xffffffff), borderRadius: BorderRadius.circular(8)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '订单号: ${getLimitString(element.ordernumber ?? "", 18)}',
                    style: TextStyle(
                        color: stringToColor('0b213b'),
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Clipboard.setData(
                          ClipboardData(text: element.ordernumber ?? ""));
                      SmartDialog.showToast('user.center.success.copy'.tr);
                    },
                    child: Container(
                      width: 47,
                      height: 22,
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
                      child:  Center(
                        child: Text(
                          '复制',
                          style: TextStyle(
                              color: AppTheme.primary,
                              fontSize: 12,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 145,
                    height: 40,
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xfff3f9fc),
                      //设置四周圆角 角度
                      borderRadius: const BorderRadius.all(Radius.circular(2)),
                      //设置四周边框
                      border:
                          Border.all(width: 1, color: const Color(0xffe5e5e5)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '时间',
                          style:
                              TextStyle(color: Color(0xff000000), fontSize: 12),
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        Text(
                          '${timeStampIntToSecond(element.get_time ?? 0)}',
                          style: TextStyle(
                              color: stringToColor('0b213b', 0.7),
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width:
                        (MediaQuery.of(context).size.width - 146 - 15 - 40) / 3,
                    height: 40,
                    margin: const EdgeInsets.only(top: 10, left: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xfff3f9fc),
                      //设置四周圆角 角度
                      borderRadius: const BorderRadius.all(Radius.circular(2)),
                      //设置四周边框
                      border:
                          Border.all(width: 1, color: const Color(0xffe5e5e5)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '金额',
                          style:
                              TextStyle(color: Color(0xff000000), fontSize: 12),
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        Text(
                          '${decimalString(element.yhTotal ?? "0")}',
                          style: TextStyle(
                              color: stringToColor('ff0000'),
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width:
                        (MediaQuery.of(context).size.width - 146 - 15 - 40) / 3,
                    height: 40,
                    margin: const EdgeInsets.only(top: 10, left: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xfff3f9fc),
                      //设置四周圆角 角度
                      borderRadius: const BorderRadius.all(Radius.circular(2)),
                      //设置四周边框
                      border:
                          Border.all(width: 1, color: const Color(0xffe5e5e5)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '优惠类型',
                          style:
                              TextStyle(color: Color(0xff000000), fontSize: 12),
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        AutoSizeText(
                          '${getYhTypeString(element.yh_type ?? 0)}',
                          style: TextStyle(
                              color: stringToColor('0b213b', 0.7),
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                          maxLines: 1,
                          minFontSize: 9,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width:
                        (MediaQuery.of(context).size.width - 146 - 15 - 40) / 3,
                    height: 40,
                    margin: const EdgeInsets.only(top: 10, left: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xfff3f9fc),
                      //设置四周圆角 角度
                      borderRadius: const BorderRadius.all(Radius.circular(2)),
                      //设置四周边框
                      border:
                          Border.all(width: 1, color: const Color(0xffe5e5e5)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '优惠状态',
                          style:
                              TextStyle(color: Color(0xff000000), fontSize: 12),
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        Container(
                          width: 60,
                          height: 16,
                          alignment: Alignment.center,
                          child: AutoSizeText(
                            '${getStatuString(element.state ?? 2)}',
                            minFontSize: 5,
                            maxLines: 1,
                            style: TextStyle(
                                color: getStatusColor(element.state ?? 2),
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  _toolBarView(BuildContext context) {
    return RecordToolBar(
        hasFilter: false,
        startDate: controller.startYhTime,
        endDate: controller.endYhTime,
        startDateTap: () {
          Pickers.showDatePicker(
            context,
            title: "请选择开始日期",
            pickerStyle: RaisedPickerStyle(color: AppTheme.primary),
            onConfirm: (p) {
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
          controller.getYhList();
        });
  }
}
