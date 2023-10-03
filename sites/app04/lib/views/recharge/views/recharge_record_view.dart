import 'package:aone_common/common.dart';
import 'package:aone_widget/picker/time_picker/model/date_type.dart';
import 'package:app04/views/recharge/controller/recharge_record_controller.dart';
import 'package:app04/widget/no_data.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import 'package:aone_widget/picker/pickers.dart';

import '../../../theme/theme_scaffold.dart';


class RechargeRecordView extends GetView<RechargeRecordController> {
  const RechargeRecordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RechargeRecordController>(
      builder: (_) {
        return ThemeScaffold(
          title: '充值记录',
          body: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: ScreenUtil().setHeight(46) + 12.r,
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
                        top: 13, right: 0, left: 0, bottom: 13),
                    children: [_contentView(_, context)],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.only(
                    top: 12.r,
                    left: 15.r,
                    right: 15.r,
                    bottom: context.mediaQueryViewPadding.bottom + 12.r,
                  ),
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        stringToColor('42a0fe'),
                        stringToColor('2f72f5')
                      ],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '合计:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${decimalString(_.moneyTotal)}元",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )
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
        Container(
            margin: EdgeInsets.only(
              left: 8.r,
              right: 8.r,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 14),
            height: 56.w,
            decoration: BoxDecoration(
                color: stringToColor('f2f5f8'),
                borderRadius: BorderRadius.circular(8)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getDateWidget(controller, context)
              ],
            )),
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
    if (controller.rechageList != null && controller.rechageList.length > 0) {
      for (int i = 0; i < controller.rechageList.length; i++) {
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
          const NoData(title: "暂无充值记录")
        ],
      ));
    }
    return _list;
  }

  //cell
  Widget _contentCell(BuildContext context, int index) {
    Items element = controller.rechageList[index];
    return InkWell(
        onTap: () {

        },
        child: Container(
          margin: EdgeInsets.only(top: 0, left: 8.r, bottom: 7.5, right: 8.r),
          padding: const EdgeInsets.all(13),
          decoration: BoxDecoration(
              color: stringToColor('f2f5f8'),
              borderRadius: BorderRadius.circular(8)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '订单号：${element.ordernumber}',
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
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                stringToColor('42a0fe'),
                                stringToColor('2f72f5')
                              ])),
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
              Container(
                margin: const EdgeInsets.only(top: 9),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '充值时间：',
                      style: TextStyle(
                          color: stringToColor('0b213b'),
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 11,
                    ),
                    Text(
                      '${timeStampIntToSecond(element.addTime ?? 0)}',
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
                    Text(
                      '充值金额：',
                      style: TextStyle(
                          color: stringToColor('0b213b'),
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 11,
                    ),
                    Text(
                      '${element.payTotal == null ? "" : decimalString(element.payTotal)}',
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
                    Text(
                      '充值类型：',
                      style: TextStyle(
                          color: stringToColor('0b213b'),
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 11,
                    ),
                    Text(
                      '${getTypeString(element.type ?? 3)}',
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
                    Text(
                      '充值状态：',
                      style: TextStyle(
                          color: stringToColor('0b213b'),
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 11,
                    ),
                    Container(
                      width: 40,
                      height: 16,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: element.state == 2?[
                                stringToColor('F4B8C2'),
                                stringToColor('E22044')
                              ]:( element.state == 3
                                  ? [
                                      stringToColor('93E78C'),
                                      stringToColor('1C8D48')
                                    ]
                                  : [
                                      stringToColor('42a0fe'),
                                      stringToColor('2f72f5')
                                    ]))),
                      child: Text(
                        '${getRechargeStatuString(element.state ?? 2)}',
                        style: TextStyle(
                            color: stringToColor('ffffff'),
                            fontSize: 9,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
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
      width: 74,
      height: 25,
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
      RechargeRecordController controller, BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            const SizedBox(
              width: 80,
            ),
            Container(
              width: 180,
              height: 1,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    stringToColor('F2F5F8'),
                    stringToColor('5B9BFA'),
                    stringToColor('F2F5F8'),
                  ],
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getTimeWidget(controller, controller.startRechargeTime, context,
                  () {
                Pickers.showDatePicker(
                  context,
                  title: "请选择开始日期",
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
                width: 60,
                alignment: Alignment.center,
                child: const Text("至",
                    style: TextStyle(fontSize: 13, color: Color(0xff3276F5))),
              ),
              getTimeWidget(controller, controller.endRechargeTime, context,
                  () {
                Pickers.showDatePicker(
                  context,
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
              })
            ],
          ),
        )
      ],
    );
  }

  Widget getTimeWidget(RechargeRecordController controller, String dateStr,
      BuildContext context, VoidCallback callback) {
    return Container(
        width: 120.r,
        height: 25.r,
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 12, right: 10, top: 2, bottom: 2),
        //边框设置
        decoration: BoxDecoration(
          color: const Color(0x1A3F9AFC),
          //设置四周圆角 角度
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          //设置四周边框
          border: Border.all(width: 1, color: const Color(0xff2F73F5)),
        ),
        child: GestureDetector(
          onTap: callback,
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/user/user_clock.png',
                width: 18,
                height: 18,
              ),
              Text(dateStr,
                  style:
                      const TextStyle(fontSize: 12.6, color: Color(0xff3276F5)))
            ],
          ),
        ));
  }
}
