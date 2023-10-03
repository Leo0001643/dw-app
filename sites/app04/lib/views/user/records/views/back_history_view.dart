import 'package:aone_widget/picker/pickers.dart';
import 'package:aone_widget/picker/style/default_style.dart';
import 'package:app04/theme/color_schema.dart';
import 'package:app04/views/user/records/controllers/back_history_controller.dart';
import 'package:aone_common/common.dart';
import 'package:aone_widget/picker/time_picker/model/date_type.dart';
import 'package:app04/views/user/records/controllers/recharge_record_controller.dart';
import 'package:app04/views/user/records/views/backwater_history_detail_dialog.dart';
import 'package:app04/widget/no_data.dart';
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
    return GetBuilder<BackHistoryController>(
      builder: (_) {
        return ThemeScaffold(
          title: '返水记录',
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
                        _didClickSelectedState();
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
            ],
          ),
        );

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
                      Container(
                        padding: EdgeInsets.only(left: 10.w),
                        alignment: Alignment.centerLeft,
                        width: MediaQuery.of(context).size.width / 2,
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
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        getHeadWidget(context),
        Padding(
          padding: EdgeInsets.only(top: 15.w, left: 12.w),
          child: Text("返水记录",
              style: TextStyle(
                fontSize: 14.w,
                color: const Color(0xff000000),
              )),
        ),
        Container(
          margin: EdgeInsets.only(top: 10.w, bottom: 5.w),
          child: getDateWidget(controller, context),
        ),
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
        children: const [
          SizedBox(
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
          margin: EdgeInsets.only(top: 0, left: 0, bottom: 15.w, right: 0),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.w)
              .copyWith(right: 0),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      '订单号：${element.ordernumber ?? ""}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.w,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Clipboard.setData(
                          ClipboardData(text: element.ordernumber));
                      SmartDialog.showToast('user.center.success.copy'.tr);
                    },
                    child: Container(
                      width: 60.w,
                      height: 26.w,
                      margin: EdgeInsets.only(right: 12.w),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        gradient: AppTheme.btnGradient,
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
              SizedBox(height: 15.w),
              Row(
                children: [
                  Container(
                    width: 116.w,
                    height: 47.w,
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    decoration: const BoxDecoration(
                      color: Color(0xffF3F4F5),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '返水时间',
                          style: TextStyle(
                            color: const Color(0xff858585),
                            fontSize: 12.w,
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          timeStampIntToSecond(element.upTime ?? 0),
                          style: TextStyle(
                            color: const Color(0xff000000),
                            fontSize: 12.w,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 47.w,
                      margin: EdgeInsets.only(left: 2.w),
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      decoration: const BoxDecoration(
                        color: Color(0xffF3F4F5),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '总投注额',
                            style: TextStyle(
                              color: const Color(0xff858585),
                              fontSize: 12.w,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            '￥${element.betSum == null ? "" : decimalString(element.betSum)}',
                            style: TextStyle(
                              color: const Color(0xff000000),
                              fontSize: 12.w,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 47.w,
                      margin: EdgeInsets.only(left: 2.w),
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      decoration: const BoxDecoration(
                        color: Color(0xffF3F4F5),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '返水金额',
                            style: TextStyle(
                              color: const Color(0xff858585),
                              fontSize: 12.w,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            '￥${element.userFsTotal == null ? "" : decimalString(element.userFsTotal)}',
                            style: TextStyle(
                              color: const Color(0xff000000),
                              fontSize: 12.w,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 47.w,
                      margin: EdgeInsets.only(left: 2.w),
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      decoration: const BoxDecoration(
                        color: Color(0xffF3F4F5),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '返水比例',
                            style: TextStyle(
                              color: const Color(0xff858585),
                              fontSize: 12.w,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            '10.00%',
                            style: TextStyle(
                              color: const Color(0xff000000),
                              fontSize: 12.w,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 47.w,
                      margin: EdgeInsets.only(left: 2.w),
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      decoration: const BoxDecoration(
                        color: Color(0xffF3F4F5),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '返水状态',
                            style: TextStyle(
                              color: const Color(0xff858585),
                              fontSize: 12.w,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            getBackStatuString(
                              element.state ?? 8,
                            ),
                            style: TextStyle(
                              fontSize: 12.w,
                              fontWeight: FontWeight.w700,
                              color: getBackStatusColor(element.state!),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 4.w, right: 12.w),
                    child: Image.asset(
                      'assets/images/user/next_arrow.png',
                      width: 10.w,
                      height: 10.w,
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

  Widget getDateWidget(BackHistoryController controller, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        children: [
          getTimeWidget(controller, controller.startBackTime, context, () {
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
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Text("到",
                style: TextStyle(
                  fontSize: 14.w,
                  color: const Color(0xff5A5A5A),
                )),
          ),
          getTimeWidget(controller, controller.endBackTime, context, () {
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
              controller.backCurPage = 1;
              controller.getBackwaterList(true);
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

  Widget getTimeWidget(BackHistoryController controller, String dateStr,
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

  Widget getHeadWidget(BuildContext context) {
    BackHistoryController controller = BackHistoryController.to;
    return Container(
      height: 56.w,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.w),
      decoration: BoxDecoration(
        color: AppTheme.backgroundColor,
        border: Border.all(width: .5, color: AppTheme.undeer_line_color),
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Image.asset(
                  "assets/images/user/rebate_green_label.png",
                  height: 16.w,
                  width: 16.w,
                ),
                SizedBox(width: 5.w),
                const Text("已领取:",
                    style: TextStyle(fontSize: 14, color: Color(0xff666666))),
                Text("￥${decimalString(controller.hasGetMoney)}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: AppTheme.greenTextColor))
              ],
            ),
          ),
          SizedBox(width: 15.w),
          Expanded(
            child: Row(children: [
              Image.asset(
                "assets/images/user/rebate_gold_label.png",
                height: 16.w,
                width: 16.w,
              ),
              SizedBox(width: 5.w),
              const Text("未领取:",
                  style: TextStyle(fontSize: 14, color: Color(0xff666666))),
              Text("￥${decimalString(controller.unGetMoney)}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: AppTheme.goldTextColor))
            ]),
          ),
          SizedBox(width: 15.w),
          InkWell(
            onTap: () {
              controller.collectRebate();
            },
            child: Container(
                width: 58.w,
                height: 26.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    gradient: AppTheme.btnGradient),
                child: const Text(
                  "领取",
                  style: TextStyle(
                    fontSize: 14,
                    color: AppTheme.blackTextColor,
                  ),
                )),
          )
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
