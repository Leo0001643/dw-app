import 'package:aone_common/common.dart';
import 'package:aone_common/theme/theme_scaffold.dart';
import 'package:aone_widget/picker/pickers.dart';
import 'package:aone_widget/picker/style/default_style.dart';
import 'package:aone_widget/picker/time_picker/model/date_type.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../widgets/record_tool_bar.dart';
import 'person_record_controller.dart';
import 'person_record_detail_dialog.dart';

class PersonRecordView extends GetView<PersonRecordController> {
  const PersonRecordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PersonRecordController>(
      builder: (_) {
        return Scaffold(
          // appBar: ,
          // hideBack: true,
          // title: "账单",
          backgroundColor: Colors.red,
          body: RefreshIndicator(
            color: Colors.red,
            displacement: 44.0,
            backgroundColor: Colors.grey[200],
            onRefresh: _refresh,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    controller: controller.scrollController,
                    children: <Widget>[_contentView(_, context)],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // 刷新
  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 1), () {
      PersonRecordController controller = PersonRecordController.to;
      controller.onRefresh();
    });
  }

  Widget _contentView(PersonRecordController controller, BuildContext context) {
    return Column(
      children: <Widget>[
        _toolBarView(context),
        SizedBox(
          height: 15.r,
        ),
        ..._listViewData(context),
      ],
    );
  }

  List<Widget> _listViewData(BuildContext context) {
    PersonRecordController controller = PersonRecordController.to;

    List<Widget> _list = [];
    if (controller.reportList != null && controller.reportList.isNotEmpty) {
      for (int i = 0; i < controller.reportList.length; i++) {
        _list.add(_contentCell(context, i));
      }
    }

    if (_list.isEmpty) {
      _list.add(Column(
        children: const [
          SizedBox(
            height: 100,
          ),
          // NoData(title: "暂无账单记录")
        ],
      ));
    }
    return _list;
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

  //cell
  Widget _contentCell(BuildContext context, int index) {
    ReportItems element = controller.reportList[index];
    return InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return PersonRecordDetailDialog(item: element);
            },
          );
        },
        child: Container(
          margin: const EdgeInsets.only(top: 0, left: 0, bottom: 7.5, right: 0),
          padding: const EdgeInsets.all(13),
          decoration: const BoxDecoration(
            color: Color(0xff273659),
            // border: Border(
            //     top: BorderSide(width: 1, color: Color(0xffEBEBEB)),
            //     bottom: BorderSide(width: 1, color: Color(0xffEBEBEB)
            //     ))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('订单号： ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold)),
                    Container(
                      constraints: BoxConstraints(maxWidth: 230.r),
                      child: Text(
                        element.ordernumber!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Clipboard.setData(
                            ClipboardData(text: element.ordernumber));
                        SmartDialog.showToast('user.center.success.copy'.tr);
                      },
                      child: Container(
                        width: 47,
                        height: 22,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          color: Color(0xFFF0C59A),
                          boxShadow: const [
                            BoxShadow(
                                // color: AppTheme.warning,
                                offset: Offset(0, 2),
                                blurRadius: 0,
                                spreadRadius: 0),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            '复制',
                            style: TextStyle(
                                color: Color(0xFF79420D),
                                fontSize: 12,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 140,
                    height: 40,
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: itemBgColor,
                      borderRadius: const BorderRadius.all(Radius.circular(2)),
                      // border:
                      //     Border.all(width: 1, color: const Color(0xffe5e5e5)
                      //     ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '交易时间',
                          style: TextStyle(color: itemTitleColor, fontSize: 12),
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        Text(
                          '${timeStampIntToSecond(element.jyTime ?? 0)}',
                          style: TextStyle(
                              color: itemContentColor,
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
                      color: itemBgColor,
                      //设置四周圆角 角度
                      borderRadius: const BorderRadius.all(Radius.circular(2)),
                      //设置四周边框
                      // border:
                      //     Border.all(width: 1, color: const Color(0xffe5e5e5)
                      //     ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '交易金额',
                          style: TextStyle(color: itemTitleColor, fontSize: 12),
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        Text(
                          '${decimalString(element.total ?? "0.00")}',
                          style: TextStyle(
                              color: itemContentColor,
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
                      color: itemBgColor,
                      //设置四周圆角 角度
                      borderRadius: const BorderRadius.all(Radius.circular(2)),
                      //设置四周边框
                      // border:
                      //     Border.all(width: 1, color: const Color(0xffe5e5e5)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '平台名称',
                          style: TextStyle(color: itemTitleColor, fontSize: 12),
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        // AutoSizeText(
                        //   element.ptName ?? "",
                        //   style: TextStyle(
                        //       color: itemContentColor,
                        //       fontSize: 12,
                        //       fontWeight: FontWeight.bold),
                        //   maxLines: 1,
                        //   minFontSize: 9,
                        // )
                      ],
                    ),
                  ),
                  Container(
                    width:
                        (MediaQuery.of(context).size.width - 146 - 15 - 40) / 3,
                    height: 40,
                    margin: const EdgeInsets.only(top: 10, left: 5),
                    decoration: BoxDecoration(
                      color: itemBgColor,
                      //设置四周圆角 角度
                      borderRadius: const BorderRadius.all(Radius.circular(2)),
                      //设置四周边框
                      // border:
                      //     Border.all(width: 1, color: const Color(0xffe5e5e5)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '状态',
                          style: TextStyle(color: itemTitleColor, fontSize: 12),
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        AutoSizeText(
                          element.type == 14
                              ? '--'
                              : getReportStatuString(element.type ?? 15),
                          style: TextStyle(
                            fontSize: 12,
                            color: (element.type == 2 || element.type == 4)
                                ? const Color(0xff228F21)
                                : (element.type == 12
                                    ? const Color(0xfff24942)
                                    : (element.type == 14
                                        ? const Color(0xff666666)
                                        : const Color(0xff228F21))),
                          ),
                          maxLines: 1,
                          minFontSize: 9,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 2, top: 8),
                    child: Image.asset(
                      'assets/images/user/next_arrow.png',
                      width: 12.r,
                      height: 12.r,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }

  _toolBarView(BuildContext context) {
    return RecordToolBar(
        hasFilter: true,
        filterValue: controller.reportCurStr,
        filterWidth: 60.r,
        // filterTextColor: Colors.white,
        // searchBgColor: const Color(0xFFF0C59A),
        // searchTitleColor: const Color(0xFF79420D),
        // menuBgColor: const Color(0xFF1F1F20),
        // borderColor: Colors.white,
        // titleColor: Colors.white,
        selectedTap: () {
          PersonRecordController controller = PersonRecordController.to;
          // showCupertinoModalPopup<void>(
          //     context: Get.context!,
          //     builder: (BuildContext context) {
          //       return RecordPersonPop(
          //         onConfirmTap: () {
          //           List<SelectEntity> list = getReportListData();
          //           controller.setReportCurValue(
          //               list[controller.reportIndex].value ?? "",
          //               list[controller.reportIndex].name ?? "");
          //           controller.onRefresh();
          //         },
          //       );
          //     });
        },
        startDate: controller.startReportTime,
        endDate: controller.endReportTime,
        startDateTap: () {
          Pickers.showDatePicker(
            context,
            title: "请选择开始日期",
            pickerStyle: RaisedPickerStyle(color: Colors.black),
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
            pickerStyle: RaisedPickerStyle(color: Colors.red),
            onConfirm: (p) {
              print(222222);
              int year = p.getSingle(DateType.Year);
              int month = p.getSingle(DateType.Month);
              int date = p.getSingle(DateType.Day);
              String endDate =
                  "${year}${month < 10 ? "-0${month}" : "-${month}"}${date < 10 ? "-0${date}" : "-${date}"}";
              print(endDate);
              controller.confirmRechargeEnd(endDate);
            },
          );
        },
        researchTap: () {
          controller.onRefresh();
        });
  }
}
