import 'package:aone_common/common.dart';
import 'package:app10/theme/color_schema.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

class PersonRecordDetailDialog extends Dialog {
  final ReportItems item;

  const PersonRecordDetailDialog({required this.item, Key? key})
      : super(key: key);

  //  onTap: () => {clickListener?.onConfirm(), Navigator.of(context).pop()},

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 310.r,
        // height: 390,
        padding: const EdgeInsets.only(bottom: 15),
        decoration: const BoxDecoration(color: AppTheme.onPrimary),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 40,
              alignment: Alignment.center,
              color: const Color(0xfff4f4f4),
              child: Text(
                "账单详情",
                style: TextStyle(
                    color: stringToColor('000000'),
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                padding: EdgeInsets.only(left: 15.r, right: 15.r, bottom: 6.r),
                child: Row(
                  children: [
                    Text("user.center.ordernum".tr,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xff0B213B),
                            fontSize: 12)),
                    Container(
                      constraints: BoxConstraints(maxWidth: 195.r),
                      child: Text(item.ordernumber ?? "",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Color(0xff4B4B4B),
                              fontSize: 12)),
                    ),
                    GestureDetector(
                      onTap: () {
                        Clipboard.setData(
                            ClipboardData(text: item.ordernumber));
                        SmartDialog.showToast('user.center.success.copy'.tr);
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 10.r),
                        child: Image.asset(
                          'assets/images/user/copy.png',
                          width: 13.r,
                          height: 13.r,
                        ),
                      ),
                    ),
                  ],
                )),
            Container(
                padding: EdgeInsets.only(left: 15.r, right: 15.r, bottom: 6.r),
                child: Row(
                  children: [
                    Text("交易时间：",
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xff0B213B),
                            fontSize: 12)),
                    Text(timeStampIntToSecond(item.jyTime ?? 0),
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xff4B4B4B),
                            fontSize: 12))
                  ],
                )),
            Container(
                padding: EdgeInsets.only(left: 15.r, right: 15.r, bottom: 6.r),
                child: Row(
                  children: [
                    Text("user.center.account.name".tr,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xff0B213B),
                            fontSize: 12)),
                    Text(item.userName ?? "",
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xff4B4B4B),
                            fontSize: 12))
                  ],
                )),
            Container(
                padding: EdgeInsets.only(left: 15.r, right: 15.r, bottom: 6.r),
                child: Row(
                  children: [
                    Text("user.center.report.jine".tr,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xff0B213B),
                            fontSize: 12)),
                    Text(decimalString(item.jyhTotal ?? "0.00"),
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xffFF0000),
                            fontSize: 12))
                  ],
                )),
            Container(
                padding: EdgeInsets.only(left: 15.r, right: 15.r, bottom: 6.r),
                child: Row(
                  children: [
                    Text("平台名称：",
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xff0B213B),
                            fontSize: 12)),
                    Text(item.ptName ?? "",
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xffFF0000),
                            fontSize: 12))
                  ],
                )),
            Container(
                padding: EdgeInsets.only(left: 15.r, right: 15.r, bottom: 6.r),
                child: Row(
                  children: [
                    Text("交易后洗码量：",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xff0B213B),
                            fontSize: 12)),
                    Text(decimalString(item.jyhXml ?? "0.00"),
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xffFF0000),
                            fontSize: 12))
                  ],
                )),
            Container(
                padding: EdgeInsets.only(left: 15.r, right: 15.r, bottom: 6.r),
                child: Row(
                  children: [
                    Text("影响洗码量：",
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xff0B213B),
                            fontSize: 12)),
                    Text(decimalString(item.xml ?? "0.00"),
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xffFF0000),
                            fontSize: 12))
                  ],
                )),
            Container(
                padding: EdgeInsets.only(left: 15.r, right: 15.r, bottom: 6.r),
                child: Row(
                  children: [
                    Text("订单类型：",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xff0B213B),
                            fontSize: 12)),
                    Text(
                      getReportStatuString(item.type ?? 0),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: (item.type == 2 || item.type == 4)
                            ? const Color(0xff228F21)
                            : (item.type == 12
                                ? const Color(0xfff24942)
                                : (item.type == 14
                                    ? const Color(0xffea9c37)
                                    : const Color(0xff228F21))),
                      ),
                    )
                  ],
                )),
            Container(
                padding: EdgeInsets.only(left: 15.r, right: 15.r, bottom: 6.r),
                child: Row(
                  children: [
                    Text("游戏平台剩余金额：",
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xff0B213B),
                            fontSize: 12)),
                    Text(
                      decimalString(
                          item.ptTotal == "-888888.0000" ? "--" : item.ptTotal),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: (item.type == 2 || item.type == 4)
                            ? const Color(0xff228F21)
                            : (item.type == 12
                                ? const Color(0xfff24942)
                                : (item.type == 14
                                    ? const Color(0xffea9c37)
                                    : const Color(0xff228F21))),
                      ),
                    )
                  ],
                )),
            Container(
                padding: EdgeInsets.only(left: 15.r, right: 15.r, bottom: 6.r),
                child: Row(
                  children: [
                    const Text('详细信息：',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xff0B213B),
                            fontSize: 12)),
                    Container(
                      constraints: const BoxConstraints(maxWidth: 210),
                      child: Text(item.info ?? "",
                          maxLines: 15,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0xff4B4B4B),
                              fontSize: 12)),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
