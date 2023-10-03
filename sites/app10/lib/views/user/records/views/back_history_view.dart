import 'dart:ui';

import 'package:aone_common/common.dart';
import 'package:aone_widget/picker/pickers.dart';
import 'package:aone_widget/picker/style/default_style.dart';
import 'package:aone_widget/picker/time_picker/model/date_type.dart';
import 'package:app10/theme/color_schema.dart';
import 'package:app10/views/user/records/controllers/back_history_controller.dart';
import 'package:app10/views/user/records/controllers/recharge_record_controller.dart';
import 'package:app10/views/user/records/views/backwater_history_detail_dialog.dart';
import 'package:app10/views/user/records/widgets/record_tool_bar.dart';
import 'package:app10/widget/no_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../../../theme/theme_scaffold.dart';

class BackHistoryView extends GetView<BackHistoryController> {
  const BackHistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => BackHistoryController());

    return GetBuilder<BackHistoryController>(
      builder: (_) {
        return ThemeScaffold(
          title: '返水记录',
          backgroundColor: AppTheme.normalBgColor,
          body: Stack(
            children: [
              Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: ScreenUtil().setHeight(46),
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
                      children: [_contentView(_, context)],
                    ),
                  )),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: context.mediaQueryViewPadding.bottom + 40,
                  alignment: Alignment.topCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 10.w),
                          alignment: Alignment.centerLeft,
                          // width: MediaQuery.of(context).size.width / 2,
                          height: context.mediaQueryViewPadding.bottom + 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(width: 1, color: Color(0xffdededf)),
                          ),
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
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     _didClickSelectedState();
                      //   },
                      //   child: Container(
                      //     padding: EdgeInsets.only(left: 10.w),
                      //     alignment: Alignment.center,
                      //     width: MediaQuery.of(context).size.width / 2,
                      //     height: context.mediaQueryViewPadding.bottom + 40,
                      //     decoration: BoxDecoration(
                      //       color: Colors.white,
                      //       border:
                      //           Border.all(width: 1, color: Color(0xffdededf)),
                      //     ),
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         Text(
                      //           "${controller.selectCurStr}",
                      //           style: TextStyle(
                      //               color: Colors.black, fontSize: 14.sp),
                      //         ),
                      //         Icon(
                      //           Icons.arrow_drop_up_rounded,
                      //           color: Color(0xff8e8e8e),
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // )
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
    await Future.delayed(const Duration(seconds: 1), () {
      RechargeRecordController controller = RechargeRecordController.to;
      controller.onRefresh();
    });
  }

  Widget _contentView(BackHistoryController controller, BuildContext context) {
    return Column(
      children: [
        getHeadWidget(context),
        _toolBarView(context),
        // Container(
        //     margin: const EdgeInsets.only(top: 13, left: 0, right: 0),
        //     padding: const EdgeInsets.symmetric(horizontal: 0),
        //     height: 50,
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [getDateWidget(controller, context)],
        //     )),
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
    BackHistoryController controller = BackHistoryController.to;

    List<Widget> _list = [];
    if (controller.backItemList != null && controller.backItemList.length > 0) {
      for (int i = 0; i < controller.backItemList.length; i++) {
        _list.add(_contentCell(context, i));
      }
    }

    if (_list.isEmpty) {
      _list.add(Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          NoData(title: "暂无返水记录")
        ],
      ));
    }
    return _list;
  }

  //cell
  Widget _contentCell(BuildContext context, int index) {
    BackwaterItem element = controller.backItemList[index];
    return InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return BackwaterHistoryDetailDialog(item: element);
            },
          );
        },
        child: Container(
          margin: const EdgeInsets.only(top: 8, left: 0, right: 0),
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(width: 0.5, color: Color(0xffe5e5e5)),
              top: BorderSide(width: 0.5, color: Color(0xffe5e5e5)),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '订单号: ${getTenLimitsString(element.ordernumber ?? "")}',
                    style: TextStyle(
                        color: stringToColor('0b213b'),
                        fontSize: 13,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 90,
                    height: 60,
                    margin: const EdgeInsets.only(top: 9),
                    padding: const EdgeInsets.only(top: 5),
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
                          '返水时间',
                          style:
                              TextStyle(color: Color(0xff6e6d6d), fontSize: 12),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          '${timeStampIntToSecond(element.upTime ?? 0)}',
                          style: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: (ScreenUtil().screenWidth - 130) / 4,
                    height: 60,
                    margin: const EdgeInsets.only(top: 9),
                    padding: const EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xfff3f9fc),
                      borderRadius: const BorderRadius.all(Radius.circular(2)),
                      border:
                          Border.all(width: 1, color: const Color(0xffe5e5e5)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '总投注额',
                          style:
                              TextStyle(color: Color(0xff6e6d6d), fontSize: 12),
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        Text(
                          '￥${element.betSum == null ? "" : decimalString(element.betSum)}',
                          style: TextStyle(
                              color: stringToColor('ff0000'),
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: (ScreenUtil().screenWidth - 130) / 4,
                    height: 60,
                    margin: const EdgeInsets.only(top: 9),
                    padding: const EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xfff3f9fc),
                      borderRadius: const BorderRadius.all(Radius.circular(2)),
                      border:
                          Border.all(width: 1, color: const Color(0xffe5e5e5)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '返水金额',
                          style:
                              TextStyle(color: Color(0xff6e6d6d), fontSize: 12),
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        Text(
                          '￥${element.userFsTotal == null ? "" : decimalString(element.userFsTotal)}',
                          style: TextStyle(
                              color: stringToColor('ff0000', 0.7),
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: (ScreenUtil().screenWidth - 130) / 4,
                    height: 60,
                    margin: const EdgeInsets.only(top: 9),
                    padding: const EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xfff3f9fc),
                      borderRadius: const BorderRadius.all(Radius.circular(2)),
                      border:
                          Border.all(width: 1, color: const Color(0xffe5e5e5)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '返水比例',
                          style:
                              TextStyle(color: Color(0xff6e6d6d), fontSize: 12),
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        Text(
                          '${(100 * (double.tryParse(element.user_fs_bl ?? '0.00') ?? 0.00)).toStringAsFixed(2)}%',
                          style: TextStyle(
                              color: stringToColor('0b213b', 0.7),
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: (ScreenUtil().screenWidth - 130) / 4,
                    height: 60,
                    margin: const EdgeInsets.only(top: 9),
                    padding: const EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xfff3f9fc),
                      borderRadius: const BorderRadius.all(Radius.circular(2)),
                      border:
                          Border.all(width: 1, color: const Color(0xffe5e5e5)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '返水状态',
                          style:
                              TextStyle(color: Color(0xff6e6d6d), fontSize: 12),
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        Container(
                          width: 90,
                          height: 18,
                          alignment: Alignment.center,
                          child: Text(
                            '${getBackStatuString(
                              element.state ?? 8,
                            )}',
                            style: TextStyle(
                                fontSize: 10,
                                color: getBackStatusColor(element.state!)),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 0, top: 4),
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

  _toolBarView(BuildContext context) {
    return RecordToolBar(
        hasFilter: false,
        startDate: controller.startBackTime,
        endDate: controller.endBackTime,
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
          controller.getBackwaterList(true);
        });
  }

  Widget getHeadWidget(BuildContext context) {
    BackHistoryController controller = BackHistoryController.to;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.r, horizontal: 5.r),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: ScreenUtil().screenWidth / 2 - 15 - 40,
                  alignment: Alignment.topCenter,
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/user/rebate_green_label.png",
                        height: 16.w,
                        width: 16.w,
                      ),
                      SizedBox(width: 5.w),
                      const Text("已领取:",
                          style: TextStyle(
                              fontSize: 14, color: Color(0xff666666))),
                      Text("￥${decimalString(controller.hasGetMoney)}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: AppTheme.greenTextColor))
                    ],
                  )),
              Container(
                  width: ScreenUtil().screenWidth / 2 - 15 - 40,
                  alignment: Alignment.topCenter,
                  child: Row(children: [
                    Image.asset(
                      "assets/images/user/rebate_gold_label.png",
                      height: 16.w,
                      width: 16.w,
                    ),
                    SizedBox(width: 5.w),
                    const Text("未领取:",
                        style:
                            TextStyle(fontSize: 14, color: Color(0xff666666))),
                    Text("￥${decimalString(controller.unGetMoney)}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: AppTheme.goldTextColor))
                  ])),
              Container(
                  width: 60.r,
                  child: InkWell(
                    onTap: () {
                      controller.collectRebate();
                    },
                    child: Container(
                      width: 60.r,
                      height: 30.r,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 2, bottom: 2),
                      decoration: const BoxDecoration(
                        color: AppTheme.buttonBg,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        boxShadow: [
                          BoxShadow(
                              color: AppTheme.goldTextColor,
                              offset: Offset(0.0, 3.0),
                              blurRadius: 0,
                              spreadRadius: 0)
                        ],
                      ),
                      child: const Text("领取",
                          style: TextStyle(
                              fontSize: 14, color: AppTheme.blackTextColor)),
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }

  void _didClickSelectedState() {
    BackHistoryController controller = BackHistoryController.to;
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
                        controller.getBackwaterList(true);
                      },
                      child: Container(
                        width: 136,
                        height: 38,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: const LinearGradient(
                              colors: [Color(0xFF14805e), Color(0xFF02c285)],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
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
    List<SelectEntity> list = getRebateStateListData();
    BackHistoryController controller = BackHistoryController.to;
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
