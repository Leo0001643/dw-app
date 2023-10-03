import 'package:aone_common/common.dart';
import 'package:aone_common/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'bill_record_base_cell.dart';
import 'bill_record_detail_dialog.dart';

class BillRecordCell extends BillRecordBaseCell {
  final ReportItems record;
  const BillRecordCell(this.record, {Key? key}) : super(key: key);

  ////订单编号展示规则：
  //
  // 小于等于16位，展示所有文本
  // 大于16位，展示前10位和后六位字符，中间用...表示
  //
  // 例如：
  // 订单编号：0123456789......2345

  @override
  get num {
    return record.ordernumber ?? '';
  }

  @override
  get middleTitle {
    return record.ptName ?? '';
  }

  @override
  get middleValue {
    return decimalString(record.total ?? "0.00");
  }

  @override
  get bottomTitle {
    return timeStampIntToSecond(record.jyTime ?? 0);
  }

  @override
  get bottomValue {
    String? status = getCommonReportStatusString(record.type ?? 15);
    return status ?? getReportStatuString(record.type ?? 15);
  }

  @override
  get statusColor {
    return (record.type == 2 || record.type == 4)
        ? const Color(0xff228F21)
        : (record.type == 12
            ? const Color(0xfff24942)
            : (record.type == 14
                ? const Color(0xff666666)
                : const Color(0xff228F21)));
  }

  get dialogStatusValue {
    if (record.type == 5 || record.type == 13) {
      return getReportStatuString(record.type ?? 15);
    }
    return bottomValue;
  }

  getCommonReportStatusString(int type) {
    if (type == 3) {
      return '已返水';
    }
    if (type == 5) {
      return '入款成功';
    }

    if (type == 13) {
      return '扣款成功';
    }
    return null;
  }

  @override
  onTap() {
    showDialog(
        context: Get.context!,
        builder: (context) {
          return BillRecordDetailDialog(
              record: record,
              statusColor: statusColor,
              status: dialogStatusValue);
        });
  }
}
