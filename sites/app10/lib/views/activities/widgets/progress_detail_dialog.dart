import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widget/dialog/envelope/envelope_dialog.dart';
import '../../../widget/dialog/envelope/envelope_field_cell.dart';
import '../../../widget/tool/light_text.dart';
import '../controllers/tack_center_controller.dart';

class ProgressDetailDialog extends StatelessWidget {
  final ProgressDetail detail;
  final int cycle;

  const ProgressDetailDialog({
    Key? key,
    required this.detail,
    required this.cycle,
  }) : super(key: key);

  static final Map<int, String> _map = {
    1: "活动开始后，每日00点重置任务",
    3: "活动开始后，每三天重置任务(第四天的00点)",
    4: "活动开始后，每周一的00点重置任务",
    5: "活动开始后，每双周重置任务(周一00点)",
    6: "活动开始后，每月1号00点重置任务",
    7: "活动开始后，仅派彩一次，此项任务不再重置",
  };

  String get taskInfo {
    return _map[cycle] ?? "活动开始后，指定时间段内派彩一次，此项任务不再重置";
  }

  static final calculateTotal = TackCenterController.to.calculateTotal;
  static final calculateTotalWith = TackCenterController.to.calculateTotalWith;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 90.h),
        width: 330.r,
        child: EnvelopeDialog(
          title: '任务详情',
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 7.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                EnvelopeFieldCell(
                  label: '活动时间',
                  content: timeStampIntToStringPeriod(
                    detail.actStartTime,
                    detail.actEndTime,
                    separator: '-',
                    format: 'yyyy-MM-dd HH:mm',
                  ),
                ),
                EnvelopeFieldCell(
                  label: '派彩时间',
                  content: timeStampIntToStringPeriod(
                    detail.publishStartTime,
                    detail.publishEndTime,
                    separator: '-',
                    format: 'yyyy-MM-dd HH:mm',
                  ),
                ),
                EnvelopeFieldCell(
                  label: '任务说明',
                  content: taskInfo,
                ),
                 if (detail.gameTagName!.isNotEmpty &&
                    detail.gameTagName != "全部")
                  Container(
                    child: LightText.buildColorFont(
                        "【此项任务指定需游戏： ${detail.gameTagName}! 】",
                         Colors.white,
                        10.sp),
                    margin: EdgeInsets.only(left: 1.w, bottom: 10.w),
                  ),
                ..._conditions(),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _conditions() {
    final _progress = detail.taskProgress;
    List<Widget> _list = [];
    var index = 0;
    if (_progress.deposit != null) {
      index++;
      _list.add(EnvelopeFieldCell(
        label: '条件 $index',
        content:
            '充值量达到: ¥${decimalString(_progress.deposit!)} 当前已充值:¥${decimalString(_progress.depositFinish!)}',
        percent:
            calculateTotal(_progress.depositFinish!, _progress.deposit!) / 100,
        percentStr:
            calculateTotalWith(_progress.depositFinish!, _progress.deposit!, 2),
        isprocess: true,
        total: _progress.deposit,
        finish: _progress.depositFinish,
      ));
    }

    if (_progress.dml != null) {
      index++;
      _list.add(_conditionField(
        index,
        '打码量',
        _progress.dml!,
        _progress.dmlFinish!,
      ));
    }

    if (_progress.fs != null) {
      index++;
      _list.add(_conditionField(
        index,
        '返水量',
        _progress.fs!,
        _progress.fsFinish!,
      ));
    }

    if (_progress.profit != null) {
      index++;
      _list.add(_conditionField(
        index,
        '负盈利',
        _progress.profit!,
        _progress.profitFinish!,
      ));
    }

    return _list;
  }

  Widget _conditionField(
      int index, String type, String condition, String finish) {
    return EnvelopeFieldCell(
      label: '条件 $index',
      content:
          '$type达到: ¥${decimalString(condition)} 当前$type:¥${decimalString(finish)} ',
      percent: calculateTotal(finish, condition) / 100,
      percentStr: calculateTotalWith(finish, condition, 2),
      isprocess: true,
      total: condition,
      finish: finish,
    );
  }
}
