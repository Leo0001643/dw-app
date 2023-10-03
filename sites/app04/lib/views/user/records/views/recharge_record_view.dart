import 'package:aone_common/common.dart';
import 'package:aone_widget/picker/style/default_style.dart';
import 'package:aone_widget/picker/time_picker/model/date_type.dart';
import 'package:app04/views/user/records/controllers/recharge_record_controller.dart';
import 'package:app04/views/user/records/views/recharge_record_detail_dialog.dart';
import 'package:app04/widget/no_data.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import 'package:aone_widget/picker/pickers.dart';

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
          body: Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  //圆圈进度颜色
                  color: AppTheme.primary,
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
              Container(
                height: 56.w,
                padding: EdgeInsets.only(left: 12.w),
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
                      '${decimalString(_.moneyTotal)}元',
                      style: TextStyle(
                        fontSize: 14.w,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        _didClickSelectedBank();
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 10.w),
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width / 2,
                        height: 56.w,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border.symmetric(
                              vertical: BorderSide(
                                  width: 1, color: Color(0xffdededf))),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${controller.selectCurStr}",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 14.sp),
                            ),
                            Icon(
                              Icons.arrow_drop_up_rounded,
                              color: Color(0xff8e8e8e),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // Container(
              //   height: context.mediaQueryViewPadding.bottom + 40,
              //   alignment: Alignment.topCenter,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Container(
              //         padding: EdgeInsets.only(left: 10.w),
              //         alignment: Alignment.centerLeft,
              //         width: MediaQuery.of(context).size.width / 2,
              //         height: context.mediaQueryViewPadding.bottom + 40,
              //         decoration: BoxDecoration(
              //           color: Colors.white,
              //           border:
              //               Border.all(width: 1, color: Color(0xffdededf)),
              //         ),
              //         child: RichText(
              //           textAlign: TextAlign.left,
              //           text: TextSpan(
              //             text: "合计：",
              //             style: TextStyle(
              //                 color: Color(0xff000000),
              //                 fontSize: 14.sp,
              //                 fontWeight: FontWeight.w400),
              //             children: [
              //               TextSpan(
              //                 text: "${decimalString(_.moneyTotal)}",
              //                 style: TextStyle(
              //                   color: Colors.black,
              //                   fontSize: 14.sp,
              //                   fontWeight: FontWeight.bold,
              //                 ),
              //               ),
              //               TextSpan(
              //                 text: "元",
              //                 style: TextStyle(
              //                     color: Colors.black, fontSize: 14.sp),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //       GestureDetector(
              //         onTap: () {
              //           _didClickSelectedBank();
              //         },
              //         child: Container(
              //           padding: EdgeInsets.only(left: 10.w),
              //           alignment: Alignment.center,
              //           width: MediaQuery.of(context).size.width / 2,
              //           height: context.mediaQueryViewPadding.bottom + 40,
              //           decoration: BoxDecoration(
              //             color: Colors.white,
              //             border:
              //                 Border.all(width: 1, color: Color(0xffdededf)),
              //           ),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               Text(
              //                 "${controller.selectCurStr}",
              //                 style: TextStyle(
              //                     color: Colors.black, fontSize: 14.sp),
              //               ),
              //               Icon(
              //                 Icons.arrow_drop_up_rounded,
              //                 color: Color(0xff8e8e8e),
              //               )
              //             ],
              //           ),
              //         ),
              //       )
              //     ],
              //   ),
              // ),
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
            height: 56.w,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              color: AppTheme.backgroundColor,
              border: Border.all(width: .5, color: AppTheme.undeer_line_color),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [getDateWidget(controller, context)],
            )),
        SizedBox(
          height: 15.w,
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
        children: const [
          SizedBox(
            height: 100,
          ),
          NoData(title: "暂无充值记录")
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
          showDialog(
            context: context,
            builder: (context) {
              return RechargeRecordDetailDialog(item: element);
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
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '订单号：${element.ordernumber ?? ''}',
                      style: TextStyle(
                          color: stringToColor('0b213b'),
                          fontSize: 12.w,
                          fontWeight: FontWeight.bold),
                    ),
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
                        const Text(
                          '时间',
                          style:
                              TextStyle(color: Color(0xff000000), fontSize: 12),
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        Text(
                          '${timeStampIntToSecond(element.addTime ?? 0)}',
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
                          '金额',
                          style:
                              TextStyle(color: Color(0xff000000), fontSize: 12),
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        Text(
                          '${element.payTotal == null ? "" : decimalString(element.payTotal)}',
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
                      borderRadius: const BorderRadius.all(Radius.circular(2)),
                      border:
                          Border.all(width: 1, color: const Color(0xffe5e5e5)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          '类型',
                          style:
                              TextStyle(color: Color(0xff000000), fontSize: 12),
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        AutoSizeText(
                          '${getTypeString(element.type ?? 3)}',
                          style: const TextStyle(
                              color: Color(0xff000000),
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
                        const Text(
                          '状态',
                          style:
                              TextStyle(color: Color(0xff000000), fontSize: 12),
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        Container(
                          width: 40,
                          height: 16,
                          alignment: Alignment.center,
                          child: Text(
                            '${getRechargeStatuString(element.state ?? 2)}',
                            style: TextStyle(
                                color:
                                    getRechargeStatuColor(element.state ?? 0),
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        )
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
              )
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        children: [
          getTimeWidget(controller, controller.startRechargeTime, context, () {
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Text("到",
                style: TextStyle(
                  fontSize: 14.w,
                  color: const Color(0xff5A5A5A),
                )),
          ),
          getTimeWidget(controller, controller.endRechargeTime, context, () {
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
              controller.rechargeCurPage = 1;
              controller.getRechageList(true);
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

  Widget getTimeWidget(RechargeRecordController controller, String dateStr,
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

  void _didClickSelectedBank() {
    RechargeRecordController controller = RechargeRecordController.to;
    showCupertinoModalPopup<void>(
        context: Get.context!,
        builder: (BuildContext context) {
          return Container(
            height: ScreenUtil().setHeight(250),
            width: Get.width,
            color: const Color.fromRGBO(235, 241, 250, 1),
            // const Colors//Color.fromARGB(58, 139, 250, 1), //rgba(235, 241, 250, 1)
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "状态选择",
                    style: TextStyle(
                        color: Colors.black,
                        // fontWeight: FontWeight.bold,
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
                        controller.getRechageList(true);
                      },
                      child: Container(
                        width: 136,
                        height: 38,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: AppTheme.primaryGradient),
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
    List<SelectEntity> list = getRechargeListData();
    RechargeRecordController controller = RechargeRecordController.to;
    return CupertinoPicker(
      itemExtent: 40,
      onSelectedItemChanged: (index) {
        print('$index');
        controller.setStateIndex(
            index, list[index].value ?? "", list[index].name ?? "");
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
