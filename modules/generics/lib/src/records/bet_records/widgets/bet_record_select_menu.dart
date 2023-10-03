import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../bill_records/widgets/record_button.dart';
import '../bet_records_controller.dart';

class BetRecordSelectMenu extends StatelessWidget {
  const BetRecordSelectMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BetRecordsController>(
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
                height: 110.r,
                padding: EdgeInsets.fromLTRB(19.r, 5.r, 19.r, 0),
                color: Colors.white,
                child: Wrap(
                  spacing: 11.r,
                  runAlignment: WrapAlignment.start,
                  runSpacing: 20.r,
                  children: getCommonGameTypesData.mapIndexed((e, index) {
                    return RecordMenuButton(
                      title: e.name,
                      width: 76.r,
                      height: 30.r,
                      isSelected: ctrl.selectGameTypeIndex == index,
                      onTap: () {
                        if (index != ctrl.selectGameTypeIndex) {
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
