import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

import '../widgets/bill_record_base_cell.dart';
import 'recharge_record_detail_dialog.dart';

///充值列表的view
class RechargeRecordCell extends BillRecordBaseCell {
  final Items rechargeRecord;
  const RechargeRecordCell(this.rechargeRecord, {Key? key}) : super(key: key);

  @override
  get num {
    return rechargeRecord.ordernumber;
  }

  @override
  get middleTitle {
    return getCommonTypeString(rechargeRecord.type ?? 3) ?? '';
  }

  @override
  get middleValue {
    return rechargeRecord.payTotal == null
        ? ""
        : decimalString(rechargeRecord.payTotal);
  }

  @override
  get bottomTitle {
    return timeStampIntToSecond(rechargeRecord.addTime ?? 0);
  }

  @override
  get bottomValue {
    return '支付${getRechargeStatuString(rechargeRecord.state ?? 2)}';
  }

  @override
  get statusColor {
    return getRechargeStatuColor(rechargeRecord.state ?? 0);
  }

  @override
  onTap() {
    Get.dialog(RechargeRecordDetailDialog(
        item: rechargeRecord, statusColor: statusColor, status: bottomValue));
  }
}
