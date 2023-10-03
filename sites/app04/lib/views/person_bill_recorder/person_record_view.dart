import 'package:aone_common/common.dart';
import 'package:aone_widget/picker/style/default_style.dart';
import 'package:aone_widget/picker/time_picker/model/date_type.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:aone_widget/picker/pickers.dart';

import '../../theme/color_schema.dart';
import '../../theme/theme_scaffold.dart';
import '../../widget/no_data.dart';
import 'person_record_detail_dialog.dart';
import 'controllers/person_record_controller.dart';

class PersonRecordView extends GetView<PersonRecordController> {
  const PersonRecordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PersonRecordController>(
      builder: (_) {
        return ThemeScaffold(
          hideBack: true,
          title: "账单",
          backgroundColor: const Color(0xfff8f9fb),
          // body: Stack(
          //   children: [
          //     Positioned(
          //       top: 0,
          //       left: 0,
          //       right: 0,
          //       bottom: 12.r,
          //       child: RefreshIndicator(
          //         //圆圈进度颜色
          //         color: Colors.blue,
          //         //下拉停止的距离
          //         displacement: 44.0,
          //         //背景颜色
          //         backgroundColor: Colors.grey[200],
          //         onRefresh: _refresh,
          //         child: ListView(
          //           shrinkWrap: true,
          //           controller: controller.scrollController,
          //           padding: const EdgeInsets.only(right: 0, left: 0),
          //           children: [_contentView(_, context)],
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          body: RefreshIndicator(
            //圆圈进度颜色
            color: AppTheme.primary,
            //下拉停止的距离
            displacement: 44.0,
            //背景颜色
            backgroundColor: Colors.grey[200],
            onRefresh: _refresh,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    controller: controller.scrollController,
                    // padding: const EdgeInsets.only(right: 0, left: 0),
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
    await Future.delayed(Duration(seconds: 1), () {
      PersonRecordController controller = PersonRecordController.to;
      controller.onRefresh();
    });
  }

  Widget _contentView(PersonRecordController controller, BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            alignment: Alignment.centerLeft,
            decoration: const BoxDecoration(
              color: AppTheme.backgroundColor,
            ),
            height: 56.w,
            child: getDateWidget(controller, context)),
        SizedBox(height: 15.w),
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
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const SizedBox(
            height: 100,
          ),
          const NoData(title: "暂无账单记录")
        ],
      ));
    }
    return _list;
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
              color: Color(0xffffffff),
              border: Border(
                  top: BorderSide(width: 1, color: Color(0xffEBEBEB)),
                  bottom: BorderSide(width: 1, color: Color(0xffEBEBEB)))),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '订单号：${element.ordernumber ?? ''}',
                      style: TextStyle(
                          color: stringToColor('0b213b'),
                          fontSize: 12.w,
                          fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () {
                        Clipboard.setData(
                            ClipboardData(text: element.ordernumber));
                        SmartDialog.showToast('user.center.success.copy'.tr);
                      },
                      child: Container(
                        width: 47,
                        height: 22,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: const Color(0xFFF0BE5C),
                        ),
                        child: const Text(
                          '复制',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
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
                        const Text(
                          '交易时间',
                          style:
                              TextStyle(color: Color(0xff666666), fontSize: 12),
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        Text(
                          '${timeStampIntToSecond(element.jyTime ?? 0)}',
                          style: const TextStyle(
                              color: Color(0xff000000),
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
                        const Text(
                          '交易金额',
                          style:
                              TextStyle(color: Color(0xff666666), fontSize: 12),
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        Text(
                          '${decimalString(element.total ?? "0.00")}',
                          style: const TextStyle(
                              color: Color(0xff000000),
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
                          '平台名称',
                          style:
                              TextStyle(color: Color(0xff666666), fontSize: 12),
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        AutoSizeText(
                          '${element.ptName ?? ""}',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                          maxLines: 1,
                          minFontSize: 9,
                        )
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
                        const Text(
                          '状态',
                          style:
                              TextStyle(color: Color(0xff666666), fontSize: 12),
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        AutoSizeText(
                          '${getReportStatuString(element.type ?? 15)}',
                          style: TextStyle(
                            fontSize: 12,
                            color: (element.type == 2 || element.type == 4)
                                ? const Color(0xff228F21)
                                : (element.type == 12
                                    ? const Color(0xfff24942)
                                    : (element.type == 14
                                        ? const Color(0xffea9c37)
                                        : const Color(0xff228F21))),
                          ),
                          maxLines: 1,
                          minFontSize: 9,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 2, top: 4),
                    child: Image.asset(
                      'assets/images/user/next_arrow.png',
                      width: 12.r,
                      height: 12.r,
                    ),
                  )
                ],
              ),
              /*
              Container(
                margin: const EdgeInsets.only(top: 2),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '交易后金额：',
                      style: TextStyle(
                          color: stringToColor('0b213b'),
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 11,
                    ),
                    Text(
                      '${decimalString(element.jyhTotal ?? "0.00")}',
                      style: TextStyle(
                          color: stringToColor('0b213b', 0.7),
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )*/
            ],
          ),
        ));
  }

  //类型按钮
  Widget _menuBtn(
      String title, bool isSelect, double width, VoidCallback callback) {
    return Container(
      margin: EdgeInsets.only(left: width),
      width: 68.r,
      height: 25.r,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color:
              isSelect ? stringToColor('3276f5') : stringToColor('3f9afc', 0.1),
          borderRadius: BorderRadius.circular(12.5),
          border: Border.all(width: 1, color: stringToColor('3276f5'))),
      child: GestureDetector(
          onTap: callback,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: isSelect ? Colors.white : stringToColor('3276f5'),
            ),
          )),
    );
  }

  Widget getDateWidget(
      PersonRecordController controller, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              controller.setReportIndex(0);
              _didClickSelectedBank();
            },
            child: Container(
              height: 26.w,
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                color: AppTheme.backgroundColor,
                border:
                    Border.all(width: .5, color: AppTheme.undeer_line_color),
              ),
              child: Row(
                children: [
                  Text(controller.reportCurStr),
                  SizedBox(width: 8.w),
                  SvgPicture.asset(
                    'assets/images/activity/signin_show_down.svg',
                    width: 10.w,
                    fit: BoxFit.fitWidth,
                    color: const Color(0xffcccccc),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 8.w),
          getTimeWidget(controller, controller.startReportTime, context, () {
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
          }),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text("到",
                style: TextStyle(
                  fontSize: 14.w,
                  color: const Color(0xff5A5A5A),
                )),
          ),
          getTimeWidget(controller, controller.endReportTime, context, () {
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
          }),
          GestureDetector(
            onTap: () {
              controller.onRefresh();
            },
            child: Container(
              height: 26.w,
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              margin: EdgeInsets.only(left: 10.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: AppTheme.primaryGradient,
              ),
              child: Text(
                "搜索",
                style:
                    TextStyle(color: AppTheme.backgroundColor, fontSize: 14.w),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getTimeWidget(PersonRecordController controller, String dateStr,
      BuildContext context, VoidCallback callback) {
    return Expanded(
      child: Container(
          height: 26.w,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.w),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            color: AppTheme.backgroundColor,
            border: Border.all(width: .5, color: AppTheme.undeer_line_color),
          ),
          child: GestureDetector(
            onTap: callback,
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/user/user_clock.png',
                  width: 12.w,
                  height: 12.w,
                ),
                SizedBox(
                  width: 4.w,
                ),
                Expanded(
                  child: Text(
                    dateStr,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppTheme.filterTextColor,
                    ),
                    maxLines: 1,
                  ),
                )
              ],
            ),
          )),
    );
  }

  void _didClickSelectedBank() {
    PersonRecordController controller = PersonRecordController.to;
    showCupertinoModalPopup<void>(
        context: Get.context!,
        builder: (BuildContext context) {
          return Container(
            height: 375.w,
            color: AppTheme.backgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 56.w,
                  decoration: const BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: Color(0xff5a5a5a))),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Text(
                            '取消',
                            style: TextStyle(
                              color: AppTheme.primary,
                              fontSize: 18.w,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                          List<SelectEntity> list = getReportListData();
                          controller.setReportCurValue(
                              list[controller.reportIndex].value ?? "",
                              list[controller.reportIndex].name ?? "");
                          controller.onRefresh();
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Text(
                            '确认',
                            style: TextStyle(
                              color: AppTheme.primary,
                              fontSize: 18.w,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.w),
                    child: Column(
                      children: [
                        _buildNumberGridList(getReportListData()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Column _buildNumberGridList(List<SelectEntity> list) {
    List<Widget> listWidget0 = [];
    List<Widget> listWidget = [];
    List<Widget> listWidget1 = [];
    List<Widget> listWidget2 = [];
    List<SelectEntity> list0 = RxList();
    List<SelectEntity> list = RxList();
    List<SelectEntity> list1 = RxList();
    List<SelectEntity> list2 = RxList();
    SelectEntity entity1 =
        SelectEntity(name: "user.center.report.0".tr, value: "");
    list0.add(entity1);
    SelectEntity entity2 =
        SelectEntity(name: "user.center.report.1".tr, value: "1");
    SelectEntity entity3 =
        SelectEntity(name: "user.center.report.2".tr, value: "2");
    SelectEntity entity4 =
        SelectEntity(name: "user.center.report.3".tr, value: "3");
    SelectEntity entity5 =
        SelectEntity(name: "user.center.report.4".tr, value: "4");
    SelectEntity entity6 =
        SelectEntity(name: "user.center.report.5".tr, value: "5");
    SelectEntity entity7 =
        SelectEntity(name: "user.center.report.6".tr, value: "6");

    SelectEntity entity8 =
        SelectEntity(name: "user.center.report.11".tr, value: "11");
    SelectEntity entity9 =
        SelectEntity(name: "user.center.report.12".tr, value: "12");
    SelectEntity entity10 =
        SelectEntity(name: "user.center.report.13".tr, value: "13");
    // SelectEntity entity11 =
    // SelectEntity(name: "user.center.report.14".tr, value: "14");
    list.add(entity2);
    list.add(entity3);
    list.add(entity4);
    list.add(entity5);
    list1.add(entity6);
    list1.add(entity7);
    list2.add(entity8);
    list2.add(entity9);
    list2.add(entity10);
    // list2.add(entity11);

    listWidget0.add(_gridNumbersItem(entity1.name ?? "", 0));
    for (int i = 0; i < list.length; i++) {
      SelectEntity subMap = list[i];
      listWidget.add(_gridNumbersItem(subMap.name ?? "", i + 1));
    }

    for (int i = 0; i < list1.length; i++) {
      SelectEntity subMap = list1[i];
      listWidget1.add(_gridNumbersItem(subMap.name ?? "", i + 5));
    }

    for (int i = 0; i < list2.length; i++) {
      SelectEntity subMap = list2[i];
      listWidget2.add(_gridNumbersItem(subMap.name ?? "", i + 7));
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: listWidget0),
        SizedBox(height: 15.w),
        Text(
          "入款：",
          style: TextStyle(
            fontSize: 16.w,
            color: const Color(0xff5a5a5a),
          ),
        ),
        SizedBox(height: 10.w),
        Row(children: listWidget),
        SizedBox(height: 10.w),
        Row(children: listWidget1),
        SizedBox(height: 15.w),
        Text(
          "出款：",
          style: TextStyle(
            fontSize: 16.w,
            color: const Color(0xff5a5a5a),
          ),
        ),
        SizedBox(height: 10.w),
        Row(children: listWidget2),
      ],
    );
  }

  Widget _gridNumbersItem(String title, int index) {
    return GetBuilder<PersonRecordController>(
      builder: (_) {
        return GestureDetector(
          onTap: () {
            _.setReportIndex(index);
          },
          child: Container(
            height: 30.w,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            margin: EdgeInsets.only(right: 8.w),
            decoration: BoxDecoration(
              color: _.reportIndex == index ? AppTheme.primary : Colors.white,
              border: Border.all(width: .5, color: AppTheme.undeer_line_color),
              borderRadius: BorderRadius.circular(5),
            ),
            // margin: const EdgeInsets.only(bottom: 5),
            child: Text(
              title,
              style: TextStyle(
                color: _.reportIndex == index
                    ? AppTheme.onPrimary
                    : const Color(0xff858585),
                fontSize: 14.w,
              ),
            ),
          ),
        );
      },
    );
  }
}
