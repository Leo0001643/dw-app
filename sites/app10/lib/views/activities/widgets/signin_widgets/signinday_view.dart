import 'package:aone_common/common.dart';
import 'package:aone_common/controllers/activity/sinin_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class SininDayView extends StatelessWidget {
  final ValueChanged<SevenDay>? changed;
  SevenDay? sevenDay;
  bool? showReissue;
  SininLabelState? labelState;
  SininLabelState? lastDayIsSign;
  SininLabelState? preDayIsSign;
  int? index;
  int? totalCount;
  int? currentIndex;
  RxBool showGiftbox = false.obs;
  SininDayView(
      {Key? key,
      this.changed,
      this.sevenDay,
      this.showReissue,
      this.labelState,
      this.totalCount,
      this.currentIndex,
      this.lastDayIsSign,
      this.preDayIsSign,
      this.index})
      : super(key: key);

  Widget getExtraSalary() {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            '+',
            style: TextStyle(color: Colors.red, fontSize: 10),
          ),
          Text(
            '¥${double.parse(sevenDay!.extraMoney!.toString()).toInt()}',
            style: TextStyle(color: Colors.red, fontSize: 10),
          )
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 60,
        height: 30,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (double.parse(sevenDay!.extraMoney!.toString()) <= 0)
                Container(
                  height: 25.h,
                ),
              Text(
                '¥${double.parse(sevenDay!.qiandaoMoney!.toString()).toInt()}',
                style: TextStyle(color: Colors.red, fontSize: 10),
              ),
              if (double.parse(sevenDay!.extraMoney!.toString()) > 0)
                Container(height: 25.h, child: getExtraSalary()),
              getSingiContent(),
              Text(
                index.toString() + "天",
                // ignore: unrelated_type_equality_checks
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
              GestureDetector(
                onTap: () {
                  print('点击了签到');
                  if (changed != null) {
                    changed!.call(sevenDay!);
                  }
                },
                child: Container(
                  height: 19,
                  width: 45,
                  margin: EdgeInsets.symmetric(horizontal: 2.r, vertical: 2.r),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: labelState!.labelColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    labelState!.labelText,
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              )
            ]),
      ),
    );
  }

  Widget getSingiContent() {
    Container contentColor = Container();
    double extraMoney = double.tryParse(sevenDay?.extraMoney ?? '0') ?? 0;
    if (extraMoney! > 0) {
      contentColor = Container(
        height: 27,
        width: 29,
        child: Image.asset(
          'assets/images/activity/dollar_icon.png',
          fit: BoxFit.fill,
          // width: 10.5,
          // height: 8,
        ),
      );
    } else {
      contentColor = Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: lastDayIsSing(true)
                  ? getColorForSin(labelState?.showType ?? "")
                  : Color(0xFFEAEAEA),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: labelState?.showType == '2'
                      ? Colors.red
                      : Color(0xFFEAEAEA),
                ),
              ]));
    }

    return Container(
      height: 25,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 30,
            child: Center(
              child: Container(
                  height: 4,
                  decoration: BoxDecoration(
                      borderRadius: index == 1
                          ? const BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5))
                          : BorderRadius.zero,
                      color: lastDayIsSing(true)
                          ? getColorForSin(labelState?.showType ?? "")
                          : Color(0xFFEAEAEA),
                      boxShadow: const <BoxShadow>[
                        BoxShadow(
                          color: Colors.red,
                        ),
                      ])),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: 30,
            right: 0,
            child: Center(
              child: Container(
                  height: 4,
                  decoration: BoxDecoration(
                      borderRadius: index == totalCount
                          ? const BorderRadius.only(
                              topRight: Radius.circular(5),
                              bottomRight: Radius.circular(5))
                          : BorderRadius.zero,
                      color: lastDayIsSing(false)
                          ? getColorForSin(labelState?.showType ?? "")
                          : Color(0xFFEAEAEA),
                      boxShadow: const <BoxShadow>[
                        BoxShadow(
                          color: Colors.red,
                        ),
                      ])),
            ),
          ),
          Center(
            child: contentColor,
          ),
        ],
      ),
    );
  }

  bool lastDayIsSing(bool isFirst) {
    if (isFirst && index == 1) {
      return true;
    }
    if (lastDayIsSign == null) {
      return false;
    }
    if (isFirst) {
      return getShowType(preDayIsSign?.showType);
    }
    return getShowType(lastDayIsSign?.showType);
  }

  bool getShowType(String? showType) {
    switch (showType) {
      case '2':
      case '4':
        return true;
      case '1':
      default:
        return false;
    }
  }

  Color getColorForSin(String showType) {
    switch (showType) {
      case '2':
      case '4':
        return Colors.red;
      case '1':
      default:
        return Color(0xFFFFEAEAEA);
    }
  }
}
