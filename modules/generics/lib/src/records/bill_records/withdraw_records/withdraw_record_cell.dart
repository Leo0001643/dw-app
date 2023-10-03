import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/bill_record_base_cell.dart';
import 'withdraw_record_detail_dialog.dart';

///提现列表view
class WithdrawRecordCell extends BillRecordBaseCell {
  final WidthdrawItem record;
  const WithdrawRecordCell(this.record, {Key? key}) : super(key: key);

  @override
  get num {
    return record.ordernumber;
  }

  @override
  get middleTitle {
    return getCommonWithdrawCardType(record.tx_card_type);
  }

  @override
  get middleValue {
    return record.txTotal == null ? "" : decimalString(record.txTotal);
  }

  @override
  get bottomTitle {
    return timeStampIntToSecond(record.addTime ?? 0);
  }

  @override
  get bottomValue {
    return getCommonWithdrawStatus(record.state).statusName;
  }

  @override
  get statusColor {
    return getCommonWithdrawStatus(record.state).textColor;
  }

  @override
  onTap() {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return WithdrawRecordDetailDialog(
            record: record, statusColor: statusColor, status: bottomValue);
      },
    );
  }
}
