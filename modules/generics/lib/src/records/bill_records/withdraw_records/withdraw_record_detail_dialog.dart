import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../widgets/record_dialog_wrapper.dart';

///提现弹窗
class WithdrawRecordDetailDialog extends Dialog {
  final WidthdrawItem record;
  final Color? statusColor;
  final String? status;

  const WithdrawRecordDetailDialog(
      {required this.record, this.statusColor, this.status, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RecordDialogWrapper(
      children: [
        RecordDialogRowItem(
            "user.center.ordernum".tr, orderNumberFormatter(record.ordernumber),
            canCopy: true, copyString: record.ordernumber),
        RecordDialogRowItem(
          "状态：",
          status,
          subTitleStyle: TextStyle(fontSize: 14.sp, color: statusColor),
        ),
        RecordDialogRowItem('申请时间：', timeStampIntToSecond(record.addTime ?? 0)),
        RecordDialogRowItem(
          '提现金额：',
          filterRecordNumber(record.txTotal),
        ),
        RecordDialogRowItem('实际出款金额：', record.tx_total_true,
            isNumberType: true),
        RecordDialogRowItem('提现手续费：', record.txSxf, isNumberType: true),
        RecordDialogRowItem('收款银行卡号：', record.bankcard),
        RecordDialogRowItem('收款银行账户姓名：', record.bankusername),
        RecordDialogRowItem('提现类型：', withdrawType),
        RecordDialogRowItem("备注：", record.remarks, isRemark: true),
      ],
    );
  }

  String get withdrawType {
    return record.type == 1 ? '会员申请' : '系统出款';
  }
}
