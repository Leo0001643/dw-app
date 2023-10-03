import 'package:aone_common/common.dart';
import 'package:aone_widget/picker/pickers.dart';
import 'package:aone_widget/picker/style/default_style.dart';
import 'package:aone_widget/picker/time_picker/model/date_type.dart';
import 'package:app10/theme/color_schema.dart';
import 'package:app10/widget/no_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../theme/theme_scaffold.dart';
import '../controllers/bet_history_controller.dart';
import '../widgets/record_tool_bar.dart';

class BetHistoryView extends GetView<BetHistoryController> {
  const BetHistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BetHistoryController>(
      builder: (_) {
        return ThemeScaffold(
          title: '游戏投注记录',
          body: Stack(
            children: [
              Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: ScreenUtil().setHeight(20),
                  child: RefreshIndicator(
                    //下拉停止的距离
                    displacement: 44.0,
                    backgroundColor: Colors.grey[200],
                    onRefresh: _refresh,
                    child: ListView(
                      shrinkWrap: true,
                      controller: controller.scrollController,
                      padding: const EdgeInsets.only(
                          top: 0, right: 0, left: 0, bottom: 13),
                      children: [
                        Column(
                          children: [
                            _toolBarView(context),
                            SizedBox(
                              height: 10.r,
                            ),
                            Column(
                              children: _listViewData(context),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
            ],
          ),
        );
      },
    );
  }

  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 1), () {
      BetHistoryController controller = BetHistoryController.to;
      controller.onRefresh();
    });
  }

  _toolBarView(BuildContext context) {
    return RecordToolBar(
        hasFilter: true,
        filterValue: controller.selectCurStr,
        filterWidth: 55.r,
        selectedTap: () {
          controller.lastTableIndex = controller.selectTableIndex;
          _didClickSelectedBank();
        },
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
          controller.getBetRecordList(true);
        });
  }

  List<Widget> _listViewData(BuildContext context) {
    BetHistoryController controller = BetHistoryController.to;

    List<Widget> _list = [];

    if (controller.betList != null && controller.betList.length > 0) {
      _list.add(_getTotalView());
      _list.add(_getListView(context));
    }

    if (_list.isEmpty) {
      _list.add(Column(
        children: const [
          SizedBox(
            height: 100,
          ),
          NoData(title: "暂无游戏投注记录")
        ],
      ));
    }
    return _list;
  }

  _getListView(BuildContext context) {
    return Obx(
      () => DataTable(
        headingRowColor:
            MaterialStateColor.resolveWith((states) => AppTheme.borderColor),
        horizontalMargin: 0,
        columnSpacing: 0,
        headingRowHeight: 40,
        dataRowHeight: 40,
        columns: [
          _tableHeader('e01.user.center.bet.type'.tr, context, sIndex: 0),
          _tableHeader('user.center.bet.vaild'.tr, context, sIndex: 1),
          _tableHeader('user.center.total.vaild'.tr, context, sIndex: 2),
          _tableHeader('user.center.earn'.tr, context, sIndex: 3),
        ],
        rows: controller.betList
            .map(
              (element) => DataRow(
                cells: [
                  _tableCell(element.name_cn ?? "", element, context,
                      sIndex: 0),
                  _tableCell(element.betValid ?? "", element, context,
                      sIndex: 1),
                  _tableCell(element.betSum ?? "", element, context, sIndex: 2),
                  _tableCell(element.betWin ?? "", element, context, sIndex: 3),
                ],
              ),
            )
            .toList(),
      ),
    );
  }

  DataColumn _tableHeader(String name, BuildContext context, {int? sIndex}) {
    return DataColumn(
      label: Expanded(
          child: Container(
              width: MediaQuery.of(context).size.width / 4,
              child: Text(
                name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppTheme.normalTextColor,
                ),
              ))),
    );
  }

  DataCell _tableCell(String data, Bets element, BuildContext context,
      {TextStyle? styles, int? sIndex}) {
    int index = controller.betList.indexOf(element);
    return DataCell(
        Center(
            child: Container(
                color:
                    index % 2 == 1 ? AppTheme.borderColor : AppTheme.onPrimary,
                width: MediaQuery.of(context).size.width / 4,
                child: Center(
                    child: Text(
                  data,
                  style: styles ??
                      const TextStyle(color: AppTheme.normalTextColor),
                )))), onTap: () {
      Get.toNamed(Routes.betHistoryDetail, arguments: element);
    });
  }

  Widget _getTotalView() {
    TextStyle style = TextStyle(
      fontSize: 14.sp,
      color: const Color(0xff666666),
    );
    return Container(
        margin: const EdgeInsets.only(top: 4, left: 12, right: 12, bottom: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: AppTheme.filterBorderColor),
          color: AppTheme.filterBgColor,
          borderRadius: const BorderRadius.all(
              Radius.circular(AppTheme.filterBorderRadius)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text("总投注：", style: style),
                Text("${controller.totalBet}", style: style)
              ],
            ),
            Row(
              children: [
                Text("有效投注：", style: style),
                Text("${controller.totalValidBet}", style: style)
              ],
            ),
            Row(
              children: [
                Text("输赢：", style: style),
                Text("${controller.totalBetWin}", style: style)
              ],
            )
          ],
        ));
  }

  Widget getContainerWidget(BuildContext context) {
    List<SelectEntity> dateList = getBetB33SelectList();
    List<Widget> widgetList = [];
    for (int i = 0; i < dateList.length; i++) {
      var myContainer = InkWell(
          onTap: () {
            // toMainPage(context,i);
            controller.setTypeIndex(
                i, dateList[i].type ?? "", dateList[i].name ?? "");
          },
          child: Container(
              height: 25.r,
              width: 62.r,
              alignment: Alignment.topCenter,
              padding:
                  const EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
              //边框设置
              decoration: BoxDecoration(
                color: controller.selectTableIndex == i
                    ? const Color(0xff2F72F4)
                    : const Color(0xffD7E1F1),
                //设置四周圆角 角度
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                //设置四周边框
                border: Border.all(width: 1, color: const Color(0xffD7E1F1)),
              ),
              child: Text(dateList[i].name ?? "",
                  style: TextStyle(
                      fontSize: 12.6,
                      color: controller.selectTableIndex == i
                          ? Color(0xffffffff)
                          : Color(0xff0B213B)))));
      widgetList.add(myContainer);
    }
    return Container(
        width: 375.r,
        padding: const EdgeInsets.only(left: 0, right: 0, top: 18, bottom: 2),
        alignment: Alignment.topLeft,
        child: Container(
            child:
                Wrap(runSpacing: 10.r, spacing: 14.r, children: widgetList)));
  }

  void _didClickSelectedBank() {
    BetHistoryController controller = BetHistoryController.to;

    showCupertinoModalPopup<void>(
        context: Get.context!,
        builder: (BuildContext context) {
          return Container(
            height: ScreenUtil().setHeight(250),
            width: Get.width,
            color: const Color.fromRGBO(235, 241, 250, 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "类型选择",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        decoration: TextDecoration.none),
                  ),
                ),
                Expanded(
                  child: DefaultTextStyle(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: ScreenUtil().setSp(22),
                    ),
                    child: _buildTypePicker(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        width: 80,
                        height: 35,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                            border:
                                Border.all(width: 1, color: AppTheme.primary)),
                        child: Text(
                          '取消',
                          style: TextStyle(
                              color: AppTheme.primary,
                              fontSize: ScreenUtil().setSp(13),
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                        // List<SelectEntity> list = getReportListData();
                        // controller.setReportCurValue(
                        //     list[controller.reportIndex].value ?? "",
                        //     list[controller.reportIndex].name ?? "");
                        if (controller.selectTableIndex == 0) {
                          List<SelectEntity> list = getBetSelectList();
                          controller.setTypeIndex(
                              0, list[0].type ?? "", list[0].name ?? "");
                        }
                        controller.onRefresh();
                      },
                      child: Container(
                        width: 80,
                        height: 35,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppTheme.primary
                            // gradient: const LinearGradient(
                            //   colors: [Color(0xFF14805e), Color(0xFF02c285)],
                            //   begin: Alignment.topCenter,
                            //   end: Alignment.bottomCenter,
                            // )
                            ),
                        child: Text(
                          '确认',
                          style: TextStyle(
                              color: AppTheme.onPrimary,
                              fontSize: ScreenUtil().setSp(13),
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 28,
                )
              ],
            ),
          );
        });
  }

  Widget _buildTypePicker() {
    List<SelectEntity> list = getBetSelectList();
    BetHistoryController controller = BetHistoryController.to;
    FixedExtentScrollController fixedController =
        FixedExtentScrollController(initialItem: controller.selectTableIndex);

    return CupertinoPicker(
      itemExtent: 40,
      scrollController: fixedController,
      onSelectedItemChanged: (index) {
        print('$index');
        controller.setTypeIndex(
            index, list[index].type ?? "", list[index].name ?? "");
      },
      children: list.map((item) {
        return Container(
            alignment: Alignment.center,
            child: Text(
              item.name ?? "",
              textAlign: TextAlign.center,
            ));
      }).toList(),
    );
  }
}
