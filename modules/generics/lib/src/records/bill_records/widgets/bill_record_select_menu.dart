import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generics/src/records/bill_records/bill_records_controller.dart';
import 'package:get/get.dart';

import 'record_button.dart';

class BillRecordSelectMenu extends StatelessWidget {
  const BillRecordSelectMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BillRecordsController>(
      builder: (ctrl) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            ctrl.isTypeShow = !ctrl.isTypeShow;
          },
          child: Container(
            color: Colors.black.withOpacity(0.5),
            alignment: Alignment.topCenter,
            child: GestureDetector(
              onTap: null,
              child: Container(
                height: 142.r,
                padding: EdgeInsets.fromLTRB(19.r, 2.r, 19.r, 0),
                color: Colors.white,
                child: Wrap(
                  spacing: 11.r,
                  runAlignment: WrapAlignment.start,
                  runSpacing: 15.r,
                  children: getCommonReportListData.mapIndexed((e, index) {
                    return RecordMenuButton(
                      title: e.name,
                      width: 76.r,
                      height: 30.r,
                      isSelected: ctrl.selectTypeIndex == index,
                      onTap: () {
                        if (index != ctrl.selectTypeIndex) {
                          ctrl.billRecordSelectMenuResult(index);
                        }
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
