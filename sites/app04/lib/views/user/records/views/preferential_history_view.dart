import 'package:aone_common/common.dart';
import 'package:aone_widget/picker/pickers.dart';
import 'package:aone_widget/picker/style/default_style.dart';
import 'package:aone_widget/picker/time_picker/model/date_type.dart';
import 'package:app04/theme/color_schema.dart';
import 'package:app04/views/user/records/controllers/preferential_history_controller.dart';
import 'package:app04/views/user/records/views/preferential_history_detail_dialog.dart';
import 'package:app04/widget/no_data.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
                    children: [_contentView(_, context)],
                  ),
                ),
              ),
              Container(
                height: 56.w,
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Color(0xffcccccc)),
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      '合计：',
                      style: TextStyle(
                        fontSize: 14.w,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      '${PreferentialHistoryController.to.amount}元',
                      style: TextStyle(
                        fontSize: 14.w,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              )
            ],
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
        Container(
            alignment: Alignment.centerLeft,
            decoration: const BoxDecoration(
              color: AppTheme.backgroundColor,
            ),
            height: 56.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [getDateWidget(controller, context)],
            )),
        SizedBox(height: 15.w),
        Column(
          children: _listViewData(context),
        )
      ],
    );
  }

  List<Widget> _listViewData(BuildContext context) {
    PreferentialHistoryController controller = PreferentialHistoryController.to;

    List<Widget> _list = [];
    if (controller.yhItemList.isNotEmpty) {
      for (int i = 0; i < controller.yhItemList.length; i++) {
        _list.add(_contentCell(context, i));
      }
    }

    if (_list.isEmpty) {
      _list.add(
        Column(
          children: const [
            SizedBox(
              height: 100,
            ),
            NoData(title: "暂无更多优惠记录")
          ],
        ),
      );
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
                    '订单号：${element.ordernumber ?? ""}',
                    style: TextStyle(
                        color: stringToColor('0b213b'),
                        fontSize: 12.w,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
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
      PreferentialHistoryController controller, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        children: [
          getTimeWidget(controller, controller.startYhTime, context, () {
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
          }),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Text("到",
                style: TextStyle(
                  fontSize: 14.w,
                  color: const Color(0xff5A5A5A),
                )),
          ),
          getTimeWidget(controller, controller.endYhTime, context, () {
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
              controller.yhCurPage = 1;
              controller.getYhList(true);
            },
            child: Container(
              height: 26.w,
              padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 15.w),
              margin: EdgeInsets.only(left: 10.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: AppTheme.primaryGradient,
              ),
              child:  Text(
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

  Widget getTimeWidget(PreferentialHistoryController controller, String dateStr,
      BuildContext context, VoidCallback callback) {
    return Expanded(
      child: Container(
          height: 26.w,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            color: AppTheme.backgroundColor,
            border: Border.all(width: .5, color: AppTheme.undeer_line_color),
          ),
          child: GestureDetector(
            onTap: callback,
            child: Row(
              children: [
                Image.asset(
                  'assets/images/user/user_clock.png',
                  width: 12.w,
                  height: 12.w,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  dateStr,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppTheme.filterTextColor,
                  ),
                )
              ],
            ),
          )),
    );
  }
}
