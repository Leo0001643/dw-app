import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../fortune_wheel.dart';
import '../utils/utils.dart';
import 'package:aone_common/common.dart';

class BoardManual extends StatelessWidget {
  const BoardManual({Key? key}) : super(key: key);

  static final redStyle = TextStyle(
    color: ColorSchema.red,
    fontSize: 12.sp,
    height: 1.25,
  );

  static final primaryStyle = TextStyle(
    color: ColorSchema.primary,
    fontSize: 12.sp,
  );

  @override
  Widget build(BuildContext context) {
    final info = FortuneWheelService.to.actInfo;
    final startTime = timeStampIntToString(
      info!.stime!,
      format: 'yyyy-MM-dd HH:mm:ss',
    );
    final endTime = timeStampIntToString(
      info.etime!,
      format: 'yyyy-MM-dd HH:mm:ss',
    );
    return Container(
      margin: EdgeInsets.only(bottom: 10.r, top: 5.r),
      padding: EdgeInsets.all(7.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          ..._orderedList([
            'fortuneWheel.manual.actTime'.tr +
                startTime +
                'fortuneWheel.to'.tr +
                endTime +
                ';',
            'fortuneWheel.manual.target'.tr,
            'fortuneWheel.manual.mode'.tr,
          ]),
          Expanded(
            child: Center(
              child: Text(
                'fortuneWheel.manual.terms'.tr,
                style: redStyle,
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _orderedList(List<String> list) {
    List<Widget> arr = [];
    list.asMap().forEach(
          (index, value) => arr.add(
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${index + 1}. ', style: redStyle),
                Expanded(
                    child: Text(
                  value,
                  style: primaryStyle,
                )),
              ],
            ),
          ),
        );

    return arr;
  }
}
