import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../theme/color_schema.dart';

class PersonRecordDetailDialog extends Dialog {
  final ReportItems item;

  const PersonRecordDetailDialog({required this.item, Key? key})
      : super(key: key);

  //  onTap: () => {clickListener?.onConfirm(), Navigator.of(context).pop()},

  @override
  Widget build(BuildContext context) {
    final TextStyle style = TextStyle(
        fontSize: 12.sp, color: Colors.black, fontWeight: FontWeight.w500);
    return Center(
      child: SizedBox(
        width: 330.r,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(color: AppTheme.onPrimary),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: 330.r,
                    height: 38.r,
                    color: AppTheme.recordTitleBg,
                    alignment: Alignment.center,
                    child: Text(
                      "账单详情",
                      style: TextStyle(
                          color: stringToColor('000000'),
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  ...[
                    _DataItem(
                      name: 'user.center.ordernum'.tr,
                      value: item.ordernumber ?? "",
                      canCopy: true,
                    ),
                    _DataItem(
                      name: '交易时间：',
                      value: timeStampIntToSecond(item.jyTime ?? 0),
                    ),
                    _DataItem(
                      name: 'user.center.account.name'.tr,
                      value: item.userName ?? "",
                    ),
                    _DataItem(
                      name: "user.center.report.jine".tr,
                      value: decimalString(item.jyhTotal ?? "0.00"),
                      valueColor: const Color(0xffFF0000),
                    ),
                    _DataItem(
                      name: "平台名称：",
                      value: item.ptName ?? "",
                      valueColor: const Color(0xffFF0000),
                    ),
                    _DataItem(
                      name: "交易后洗码量：",
                      value: decimalString(item.jyhXml ?? "0.00"),
                      valueColor: const Color(0xffFF0000),
                    ),
                    _DataItem(
                      name: "影响洗码量：",
                      value: decimalString(item.xml ?? "0.00"),
                      valueColor: const Color(0xffFF0000),
                    ),
                    _DataItem(
                      name: "订单类型：",
                      value: getReportStatusStringWith14(
                          item.type ?? 0, item.ptName),
                      valueColor: (item.type == 2 || item.type == 4)
                          ? const Color(0xff228F21)
                          : (item.type == 12
                              ? const Color(0xfff24942)
                              : (item.type == 14
                                  ? const Color(0xffea9c37)
                                  : const Color(0xff228F21))),
                    ),
                    _DataItem(
                      name: "游戏平台剩余金额：",
                      value: decimalString(
                          item.ptTotal == "-888888.0000" ? "--" : item.ptTotal),
                    ),
                    _DataItem(
                      name: "详细信息：",
                      value: item.info ?? "--",
                    ),
                  ]
                      .mapIndexed(
                          (e, index) => _DetailItem(item: e, index: index))
                      .toList(),
                  SizedBox(
                    height: 22.r,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DataItem {
  final String name;
  final String value;
  final bool canCopy;
  final Color valueColor;

  const _DataItem({
    required this.name,
    required this.value,
    this.canCopy = false,
    this.valueColor = Colors.black,
  });
}

class _DetailItem extends StatelessWidget {
  final _DataItem item;
  final int index;

  const _DetailItem({
    Key? key,
    required this.item,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppTheme.cellDivider, width: 0.5.r),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 15.r, vertical: 8.r),
      child: Row(
        children: [
          Text(
            item.name,
            style: TextStyle(
              color: const Color(0xff0B213B),
              fontSize: 12.sp,
            ),
          ),
          Expanded(
            child: Text(
              item.value,
              style: TextStyle(
                fontSize: 12.sp,
                color: item.valueColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          if (item.canCopy) ...[
            SizedBox(width: 15.r),
            InkWell(
              onTap: () {
                Clipboard.setData(ClipboardData(text: item.value));
                SmartDialog.showToast('user.center.success.copy'.tr);
              },
              child: Container(
                width: 35.r,
                height: 18.r,
                margin: const EdgeInsets.only(left: 10, right: 10, bottom: 2),
                padding: const EdgeInsets.only(bottom: 2),
                alignment: Alignment.topCenter,
                decoration: const BoxDecoration(
                  color: AppTheme.blueColor,
                  borderRadius: BorderRadius.all(Radius.circular(3.0)),
                ),
                child: Center(
                  child: Text('user.center.copy'.tr,
                      style: const TextStyle(
                          color: AppTheme.onPrimary, fontSize: 10)),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
