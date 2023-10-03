import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../widgets/record_dialog_wrapper.dart';

class BillRecordDetailDialog extends Dialog {
  final ReportItems record;
  final Color? statusColor;
  final String? status;

  const BillRecordDetailDialog(
      {required this.record, this.statusColor, this.status, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RecordDialogWrapper(
      children: [
        RecordDialogRowItem("user.center.ordernum".tr,
            orderNumberFormatter(record.ordernumber).composing,
            canCopy: true, copyString: record.ordernumber),
        RecordDialogRowItem("交易时间：", timeStampIntToSecond(record.jyTime ?? 0)),
        RecordDialogRowItem("交易后金额：", record.jyhTotal, isNumberType: true),
        RecordDialogRowItem(
          "游戏平台剩余金额：",
          gameLastMoney(record.ptTotal),
        ),
        RecordDialogRowItem("交易后洗码量：", record.jyhXml, isNumberType: true),
        RecordDialogRowItem("影响洗码量：", record.xml, isNumberType: true),
        RecordDialogRowItem(
          "订单类型：",
          status,
          subTitleStyle: TextStyle(fontSize: 14.sp, color: statusColor),
        ),
        RecordDialogRowItem(
          "详细信息：",
          record.info ?? '',
          isRemark: true,
        ),
      ],
    );
  }
}
