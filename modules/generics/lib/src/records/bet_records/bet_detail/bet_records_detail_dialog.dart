import 'package:aone_common/common.dart';
import 'package:aone_common/data/model/entities/record/record_detail_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../bill_records/widgets/record_dialog_wrapper.dart';

///游戏投注记录详情弹窗
class BetRecordDetailDialog extends Dialog {
  final DetailBets record;
  final Color? statusColor;
  final String? status;

  const BetRecordDetailDialog(
      {required this.record, this.statusColor, this.status, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RecordDialogWrapper(
      children: [
        RecordDialogRowItem(
            "user.center.ordernum".tr, orderNumberFormatter(record.bet_id),
            canCopy: true, copyString: record.bet_id),
        RecordDialogRowItem('游戏名称：', record.subName),
        RecordDialogRowItem(
            '投注时间：', timeStampIntToSecond(record.bet_time ?? 0)),
        RecordDialogRowItem('总投注额：', record.betSum2FixString,
            isNumberType: true),
        RecordDialogRowItem('有效投注额：', record.betValid2FixString,
            isNumberType: true),
        RecordDialogRowItem('实际输赢：', record.betWin2FixString,
            isNumberType: true),
        RecordDialogRowItem(
          "状态：",
          status,
          subTitleStyle: TextStyle(fontSize: 14.sp, color: statusColor),
        ),
        RecordDialogRowItem("备注：", '--', isRemark: true),
      ],
    );
  }
}
