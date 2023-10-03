import 'package:aone_common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../../tool/space_util.dart';
import 'record_button.dart';

class RecordSelectDateMenu extends StatefulWidget {
  final VoidCallback? onDismiss;
  final int selectedIndex;
  String startDate;
  String endDate;

  final ValueChanged<int> onDateIndexChange;
  final ValueChanged<List<String>> dateConfirm;

  RecordSelectDateMenu({
    Key? key,
    this.onDismiss,
    required this.onDateIndexChange,
    required this.selectedIndex,
    required this.dateConfirm,
    required this.startDate,
    required this.endDate,
  }) : super(key: key);

  @override
  State<RecordSelectDateMenu> createState() => _RecordSelectDateMenuState();
}

class _RecordSelectDateMenuState extends State<RecordSelectDateMenu> {
  bool _isStartDateShow = false;
  bool _isEndDateShow = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (widget.onDismiss != null) widget.onDismiss!();
      },
      child: Container(
        color: Colors.black.withOpacity(0.5),
        alignment: Alignment.topCenter,
        child: GestureDetector(
            onTap: null,
            child: Column(
              children: [
                _daysMenuView(),
                if (widget.selectedIndex == 4) _detailDateView()
              ],
            )),
      ),
    );
  }

  _daysMenuView() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 82.r,
        padding: EdgeInsets.fromLTRB(19.r, 0, 19.r, 0),
        color: Colors.white,
        child: Wrap(
          spacing: 11.r,
          runAlignment: WrapAlignment.start,
          runSpacing: 15.r,
          children: recordsDateList.mapIndexed((e, index) {
            return RecordMenuButton(
              title: e,
              width: 76.r,
              height: 30.r,
              isSelected: widget.selectedIndex == index,
              onTap: () {
                if (index != widget.selectedIndex) {
                  widget.onDateIndexChange(index);
                  if (mounted) {
                    setState(() {});
                  }
                }
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  _detailDateView() {
    return Column(
      children: [
        _selectedDateRow('开始时间', widget.startDate, false, () {
          if (mounted) {
            setState(() {
              _isStartDateShow = !_isStartDateShow;
              if (_isStartDateShow) {
                _isEndDateShow = false;
              }
            });
          }
        }),
        if (_isStartDateShow)
          GestureDetector(
            onTap: () {},
            child: Container(
                height: 215.r,
                color: Colors.white,
                child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: stringToDateTime(widget.startDate),
                    minimumDate: yearBeforeNow(10),
                    maximumDate: DateTime.now(),
                    onDateTimeChanged: (DateTime value) {
                      // print('start:$value');
                      setState(() {
                        widget.startDate = _toDateString(value);
                      });
                    })),
          ),
        _selectedDateRow('结束时间', widget.endDate, false, () {
          if (mounted) {
            setState(() {
              _isEndDateShow = !_isEndDateShow;
              if (_isEndDateShow) {
                _isStartDateShow = false;
              }
            });
          }
        }),
        if (_isEndDateShow)
          GestureDetector(
            onTap: () {},
            child: Container(
                height: 215.r,
                color: Colors.white,
                child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: stringToDateTime(widget.endDate),

                    ///最小日期10年前 最大日期现在
                    minimumDate: yearBeforeNow(10),
                    maximumDate: DateTime.now(),
                    onDateTimeChanged: (DateTime value) {
                      print('end:$value');
                      setState(() {
                        widget.endDate = _toDateString(value);
                      });
                    })),
          ),
        SizedBox(
          height: 40.r,
          child: RecordCancelAndDoneWidget(
            onDoneTap: () {
              if (checkDateValid == false) return;
              widget.dateConfirm([widget.startDate, widget.endDate]);
              widget.onDismiss!();
            },
            onCancelTap: () {
              if (widget.onDismiss != null) widget.onDismiss!();
            },
          ),
        )
      ],
    );
  }

  ///检验时间是否合理
  bool get checkDateValid {
    DateTime start = stringToDateTime(widget.startDate);
    DateTime end = stringToDateTime(widget.endDate);
    if (end.isBefore(start)) {
      SmartDialog.showToast('结束时间必须晚于开始时间');
      return false;
    }
    int diff = end.difference(start).inDays;
    if (diff > 30) {
      SmartDialog.showToast('查询时间跨度不能大于30天');
      return false;
    }
    return true;
  }

  _selectedDateRow(
      String title, String date, bool isPickerShow, VoidCallback onTap) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTap();
      },
      child: Container(
        height: 45.r,
        padding: EdgeInsets.symmetric(horizontal: 9.r),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 15.sp, color: Color(0xFF888888)),
            ),
            Spacer(),
            Text(
              date,
              style: TextStyle(fontSize: 15.sp, color: Color(0xFF888888)),
            ),
            widthSpace(10.r),
            Image.asset(
              'assets/images/records/arrow.png',
              width: 6.r,
              height: 10.r,
            )
          ],
        ),
      ),
    );
  }

  _toDateString(DateTime date) {
    return date.toString().substring(0, 10);
  }
}
