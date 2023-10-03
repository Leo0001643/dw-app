import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../fortune_wheel.dart';
import '../utils/utils.dart';
import 'package:aone_common/common.dart';

class BoardManualZ01 extends StatelessWidget {
  const BoardManualZ01({Key? key}) : super(key: key);

  static final redStyle = TextStyle(
    color: const Color(0xFFFF0000),
    fontSize: 12.sp,
    height: 1.25
  );

  static final primaryStyle = TextStyle(
    color:const Color(0xFF505050),
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
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ..._orderedList([
                startTime +
                    ' '+
                '至'.tr +
                    ' '+
                endTime +
                ';',
            '达到指定条件即可参与，详情查阅优惠活动说明'.tr,
            '采取转盘抽奖的方式，指针停留区域便为最终奖项，通过不当途径参加本活动的行为，一经发现我司有权终止该客户参加本次活动并取消其获奖资格'.tr,
          ]),
          Expanded(
            child: Center(
              child: Text(
                '抽奖活动最终解释权本站所有'.tr,
                style: redStyle,
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _orderedList(List<String> list) {
    List<String> titles = [
      '活动时间'.tr,
      '活动对象'.tr,
      '抽奖方式'.tr
    ];
    List<Widget> arr = [];
    list.asMap().forEach(
          (index, value) => arr.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
                titles[index],
                style: TextStyle(
                    color: const Color(0xFFf4a417),
                    fontSize: 12.sp,
                    height: 1.25,
                    fontWeight: FontWeight.bold
                )),
            Text(
              value,
              style: primaryStyle,
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );

    return arr;
  }
}
