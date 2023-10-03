import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecordToolBar extends StatelessWidget {
  final String? filterValue;
  final bool? hasFilter;
  final double? filterWidth;
  final VoidCallback? selectedTap;

  final String startDate;
  final String endDate;
  final VoidCallback? startDateTap;
  final VoidCallback? endDateTap;
  final VoidCallback? researchTap;
  const RecordToolBar({
    Key? key,
    this.filterValue,
    this.hasFilter,
    this.filterWidth,
    this.selectedTap,
    required this.startDate,
    required this.endDate,
    required this.startDateTap,
    required this.endDateTap,
    required this.researchTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.r,
      decoration: BoxDecoration(color: Colors.red, boxShadow: [
        BoxShadow(
            color: Colors.red,
            spreadRadius: 0,
            blurRadius: 8,
            offset: const Offset(0, 4)),
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (hasFilter == true)
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  if (selectedTap != null) {
                    selectedTap!();
                  }
                },
                child: Container(
                  height: 30.r,
                  // width: filterWidth ?? 50.r,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    // borderRadius: const BorderRadius.all(
                    //     Radius.circular(AppTheme.filterBorderRadius)),
                    // border: Border.all(width: 1, color: AppTheme.borderColor),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        filterValue ?? '类型',
                        style: TextStyle(
                          fontSize: 14.sp,
                          // color: filterValue != null
                          //     ? AppTheme.subTextColor
                          //     : AppTheme.hintColor
                        ),
                      ),
                      SizedBox(
                        width: 4.r,
                      ),
                      Container(
                        width: 11.r,
                        height: 6.r,
                        child: Image.asset(
                          'assets/images/common/gray_arrow_down.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          if (hasFilter == true)
            SizedBox(
              width: 1.r,
            ),
          // Expanded(
          //   flex: 1,
          //   child: RecordTimeWidget(
          //       onTap: startDateTap!,
          //       // title: startDate,
          //       // title: startDate == "" ? "开始时间" : startDate,
          //       title: "开始时间"),
          // ),
          SizedBox(
            width: 5.r,
          ),
          // const Text("至",
          //     style: TextStyle(fontSize: 13, color: AppTheme.primary)),
          SizedBox(
            width: 5.r,
          ),
          // Expanded(
          //   flex: 1,
          //   child: RecordTimeWidget(
          //     onTap: endDateTap!,
          //     // title: endDate,
          //     // title: endDate == "" ? "结束时间" : endDate,
          //     title: "结束时间",
          //   ),
          // ),
          // SizedBox(
          //   width: 10.r,
          // ),
          // RecordSearchButton(() {
          //   researchTap!();
          // })
        ],
      ),
    );
  }
}
