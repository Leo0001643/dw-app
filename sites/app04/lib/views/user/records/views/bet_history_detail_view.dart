import 'package:aone_common/common.dart';
import 'package:aone_common/data/model/entities/record/record_detail_entity.dart';
import 'package:aone_widget/picker/pickers.dart';
import 'package:aone_widget/picker/style/default_style.dart';
import 'package:aone_widget/picker/time_picker/model/date_type.dart';
import 'package:app04/views/user/records/controllers/bet_history_detail_controller.dart';
import 'package:app04/views/user/records/controllers/preferential_history_controller.dart';
import 'package:app04/views/user/records/views/bet_history_detail_dialog.dart';
import 'package:app04/views/user/records/views/preferential_history_detail_dialog.dart';
import 'package:app04/widget/no_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../theme/color_schema.dart';
import '../../../../theme/theme_scaffold.dart';

class BetHistoryDetailView extends GetView<BetHistoryDetailController> {
  const BetHistoryDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BetHistoryDetailController>(
      builder: (_) {
        return ThemeScaffold(
          title:'${_.title}',
          body: RefreshIndicator(
            //圆圈进度颜色
            color: Colors.blue,
            //下拉停止的距离
            displacement: 44.0,
            //背景颜色
            backgroundColor: Colors.grey[200],
            onRefresh: _refresh,
            child: ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              controller: controller.scrollController,
              padding: const EdgeInsets.only(
                  top: 0, right: 0, left: 0, bottom: 13),
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
      BetHistoryDetailController controller = BetHistoryDetailController.to;
      controller.onRefresh();
    });
  }

  Widget _contentView(
      BetHistoryDetailController controller, BuildContext context) {
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.only(top: 0, left: 0, right: 0),
            padding: const EdgeInsets.symmetric(horizontal: 14),
            height: 56,
            decoration: const BoxDecoration(
                color: AppTheme.filterBoxBgColor,
                border: Border(
                  bottom: BorderSide(
                      width: 1, color: AppTheme.filterBoxBorderColor),
                )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getDateWidget(controller, context)
              ],
            )),
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
    BetHistoryDetailController controller = BetHistoryDetailController.to;

    List<Widget> _list = [];
    if (controller.betDetailList != null && controller.betDetailList.length > 0) {
      for (int i = 0; i < controller.betDetailList.length; i++) {
        _list.add(_contentCell(context, i));
      }
    }

    if (_list.isEmpty) {
      _list.add(Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          NoData(title: "暂无投注记录")
        ],
      ));
    }
    return _list;
  }

  //cell
  Widget _contentCell(BuildContext context, int index) {
    DetailBets element = controller.betDetailList[index];
    return InkWell(
        onTap: () {
      showDialog(
        context: context,
        builder: (context) {
          return BetHistoryDetailDialog(item: element);
        },
      );
    },
    child:Container(
      margin: const EdgeInsets.only(top: 8, left: 8, right: 8),
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
                '订单号：${element.bet_id??""}',
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
                   color:const Color(0xFFF0BE5C),
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
          Container(
            margin: const EdgeInsets.only(top: 9),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '总投注额：',
                  style: TextStyle(
                      color: stringToColor('0b213b'),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 11,
                ),
                Text(
                  '${decimalString(element.betSum)}',
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
                  '实际输赢：',
                  style: TextStyle(
                      color: stringToColor('0b213b'),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 11,
                ),
                Text(
                  '${decimalString(element.betWin??"0")}',
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
                  '状态：',
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
                          colors: [
                          stringToColor('8DE389'),
                          stringToColor('22924C')
                          ])),
                  child: Text(
                    '${getBetStatuString(element.bet_state ?? 0)}',
                    style: TextStyle(fontSize: 10,
                      color: const Color(0xffffffff),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }


  Widget getDateWidget(
      BetHistoryDetailController controller, BuildContext context) {
    return Column(
      children: [
         SizedBox(
          height: 15.r,
        ),

        Container(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getTimeWidget(controller, controller.startBetTime, context,
                      () {
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
                        controller.confirmYhStart(startDate);
                      },
                    );
                  }),
              Container(
                width: 30.r,
                alignment: Alignment.center,
                child: Text("至",
                    style: const TextStyle(
                        fontSize: 13, color: Color(0xff000000))),
              ),
              getTimeWidget(controller, controller.endBetTime, context,
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
                  }),
              GestureDetector(
                onTap: (){
                   controller.getBetDetailRecordList(true);
                },
                child: Container(
                  alignment: Alignment.center,
                  margin:const EdgeInsets.only(top: 0,left:8),
                  padding:const EdgeInsets.symmetric(horizontal:10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      gradient:AppTheme.primaryGradient
                  ),
                  height: 30.r,
                  child:const Text("搜索",style: TextStyle(color: Colors.white,fontSize: 12)),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget getTimeWidget(BetHistoryDetailController controller, String dateStr,
      BuildContext context, VoidCallback callback) {
    return Container(
        width: (ScreenUtil().screenWidth - 20 - 100) / 2,
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
                width: 14.r,
                height: 14.r,
              ),
              SizedBox(width: 3.r,),
              Text(dateStr,
                  style:
                  const TextStyle(fontSize: 12.6, color: Color(0xff8e8e8e)))
            ],
          ),
        ));
  }
}
