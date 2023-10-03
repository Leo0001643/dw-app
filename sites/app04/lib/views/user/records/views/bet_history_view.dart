import 'package:aone_common/common.dart';
import 'package:aone_widget/picker/style/default_style.dart';
import 'package:aone_widget/picker/time_picker/model/date_type.dart';
import 'package:app04/theme/color_schema.dart';
import 'package:app04/views/user/records/controllers/recharge_record_controller.dart';
import 'package:app04/widget/no_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:aone_widget/picker/pickers.dart';

import '../../../../config/site_config.dart';
import '../../../../theme/theme_scaffold.dart';
import '../controllers/bet_history_controller.dart';

class BetHistoryView extends GetView<BetHistoryController> {
  const BetHistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BetHistoryController>(
      builder: (_) {
        return ThemeScaffold(
          title: '游戏投注记录',
          body: Column(
            children: [
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  height: 56.w,
                  decoration: const BoxDecoration(
                      color: AppTheme.filterBoxBgColor,
                      border: Border(
                        bottom: BorderSide(
                            width: 1, color: AppTheme.filterBoxBorderColor),
                      )),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _menuBtn('${controller.selectCurStr}',
                              controller.selectTimeTableIndex == 0, 0, 0, () {
                            controller.lastTableIndex =
                                controller.selectTableIndex;
                            _didClickSelectedBank();
                          }),
                        ],
                      ),
                      getDateWidget(controller, context),
                      GestureDetector(
                        onTap: () {
                          controller.getBetRecordList(true);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: 0, left: 6),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  AppTheme.filterBorderRadius),
                              gradient: AppTheme.primaryGradient),
                          height: 30.w,
                          child: const Text("搜索",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12)),
                        ),
                      )
                    ],
                  )),
              SizedBox(
                height: 10.r,
              ),
              _getTotalView(),
              Expanded(
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
                    children: _listViewData(context),
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
      BetHistoryController controller = BetHistoryController.to;
      controller.onRefresh();
    });
  }

  List<Widget> _listViewData(BuildContext context) {
    BetHistoryController controller = BetHistoryController.to;

    List<Widget> _list = [];

    if (controller.betList.isNotEmpty) {
      // _list.add(_getTotalView());
      _list.add(_getListView(context));
    }

    if (_list.isEmpty) {
      _list.add(Column(
        children: [
          const SizedBox(
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
            MaterialStateColor.resolveWith((states) => const Color(0xfff0f5fb)),
        horizontalMargin: 0,
        columnSpacing: 0,
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
                color: index % 2 == 1
                    ? const Color(0xfff0f5fb)
                    : const Color(0xffffffff),
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

  //类型按钮
  Widget _menuBtn(String title, bool isSelect, double width, int index,
      VoidCallback callback) {
    return Container(
      margin: EdgeInsets.only(left: width, right: 6, top: 0),
      padding: EdgeInsets.only(bottom: 0),
      height: 30.r,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color:
              isSelect ? stringToColor('ffffff') : stringToColor('ffffff', 0.1),
          borderRadius: BorderRadius.circular(AppTheme.filterBorderRadius),
          border: Border.all(width: 1, color: stringToColor('e5e5e5'))),
      child: GestureDetector(
          onTap: callback,
          child: index == 0
              ? Container(
                  padding: EdgeInsets.only(left: 10.r),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 12,
                          color: isSelect
                              ? stringToColor('8e8e8e')
                              : stringToColor('8e8e8e'),
                        ),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        size: 20.w,
                        color: stringToColor('8e8e8e'),
                      )
                    ],
                  ))
              : Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    color: isSelect
                        ? stringToColor('8e8e8e')
                        : stringToColor('3276f5'),
                  ),
                )),
    );
  }

  Widget getDateWidget(BetHistoryController controller, BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          getTimeWidget(controller, controller.startBetTime, context, () {
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
          }),
          Container(
            width: 20.r,
            alignment: Alignment.center,
            child: const Text("至",
                style:
                    TextStyle(fontSize: 13, color: AppTheme.normalTextColor)),
          ),
          getTimeWidget(controller, controller.endBetTime, context, () {
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
          })
        ],
      ),
    );
  }

  Widget getTimeWidget(BetHistoryController controller, String dateStr,
      BuildContext context, VoidCallback callback) {
    return Container(
        width: (ScreenUtil().screenWidth - 20 - 160) / 2,
        height: 30.r,
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
        //边框设置
        decoration: BoxDecoration(
          color: const Color(0xffffffff),
          //设置四周圆角 角度
          borderRadius: const BorderRadius.all(
              Radius.circular(AppTheme.filterBorderRadius)),
          //设置四周边框
          border: Border.all(width: 1, color: const Color(0xffe5e5e5)),
        ),
        child: GestureDetector(
          onTap: callback,
          child: Row(
            children: [
              Image.asset(
                'assets/images/user/user_clock.png',
                width: 12.r,
                height: 12.r,
              ),
              SizedBox(
                width: 3.r,
              ),
              Text(dateStr,
                  style:
                      const TextStyle(fontSize: 12.6, color: Color(0xff8e8e8e)))
            ],
          ),
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
                        width: 136,
                        height: 38,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: stringToColor('0b213b', 0.3),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '取消',
                          style: TextStyle(
                              color: Colors.white,
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
                        width: 136,
                        height: 38,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: AppRuntimeConfig.siteTag == 'h18'
                                ? LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xff693409),
                                      Color(0xffA98A67),
                                    ],
                                  )
                                : LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xff13805E),
                                      Color(0xff06C285),
                                    ],
                                  )),
                        child: Text(
                          '确认',
                          style: TextStyle(
                              color: Colors.white,
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
