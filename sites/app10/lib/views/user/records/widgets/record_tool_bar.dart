import 'package:app10/theme/color_schema.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'record_search_button.dart';
import 'record_time_widget.dart';

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
      height: 56.r,
      padding: EdgeInsets.symmetric(horizontal: 12.r),
      decoration: const BoxDecoration(
        color: AppTheme.onPrimary,
        border: Border(
          top: BorderSide(width: 1, color: AppTheme.borderColor),
          bottom: BorderSide(width: 1, color: AppTheme.borderColor),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (hasFilter == true)
            GestureDetector(
              onTap: () {
                if (selectedTap != null) {
                  selectedTap!();
                }
              },
              child: Container(
                height: 30.r,
                width: filterWidth ?? 50.r,
                decoration: BoxDecoration(
                  color: AppTheme.onPrimary,
                  borderRadius: const BorderRadius.all(
                      Radius.circular(AppTheme.filterBorderRadius)),
                  border: Border.all(width: 1, color: AppTheme.borderColor),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      filterValue ?? '请选择',
                      style: TextStyle(
                          fontSize: 10.sp,
                          color: filterValue != null
                              ? AppTheme.primary
                              : AppTheme.hintColor),
                    ),
                    SizedBox(
                      width: 4.r,
                    ),
                    Image.asset(
                      'assets/images/common/arrow_gray_down.png',
                      width: 8.r,
                      height: 8.r,
                    ),
                  ],
                ),
              ),
            ),
          if (hasFilter == true)
            SizedBox(
              width: 12.r,
            ),
          Expanded(
            flex: 1,
            child: RecordTimeWidget(
              onTap: startDateTap!,
              title: startDate,
            ),
          ),
          SizedBox(
            width: 5.r,
          ),
           Text("至",
              style: TextStyle(fontSize: 13, color: AppTheme.primary)),
          SizedBox(
            width: 5.r,
          ),
          Expanded(
            flex: 1,
            child: RecordTimeWidget(
              onTap: endDateTap!,
              title: endDate,
            ),
          ),
          SizedBox(
            width: 10.r,
          ),
          RecordSearchButton(() {
            researchTap!();
          })
        ],
      ),
    );
  }
}
