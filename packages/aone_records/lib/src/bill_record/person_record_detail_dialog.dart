import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PersonRecordDetailDialog extends Dialog {
  final ReportItems item;

  const PersonRecordDetailDialog({required this.item, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: 330.r,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xff273659),
                    borderRadius: BorderRadius.circular(15.r)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 45.r,
                      alignment: Alignment.center,
                      color: Color(0xff394A71),
                      child: Text(
                        '提现记录详情',
                        style: TextStyle(
                            // color: AppTheme.mainTextColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 8.r,
                    ),
                    _item("user.center.ordernum".tr, item.ordernumber ?? "",
                        canCopy: true, copyString: item.ordernumber ?? ""),
                    _item('交易时间：', timeStampIntToSecond(item.jyTime ?? 0)),
                    _item("user.center.account.name".tr, item.userName ?? ""),
                    _item("user.center.report.jine".tr,
                        decimalString(item.jyhTotal ?? "0.00")),
                    _item(
                      "游戏平台剩余金额：",
                      decimalString(
                          item.ptTotal == "-888888.0000" ? "--" : item.ptTotal),
                    ),
                    _item(
                      "交易后洗码量：",
                      decimalString(item.xml ?? "0.00"),
                    ),
                    _item(
                      "影响洗码量：",
                      decimalString(item.xml ?? "0.00"),
                    ),
                    _item(
                        "订单类型：",
                        getReportStatusStringWith14(
                            item.type ?? 0, item.ptName),
                        subTitleStyle: TextStyle(
                            fontSize: 14.sp,
                            color: typeColor(item.type, isText: true))),
                    _item("详细信息：", item.info ?? "", isRemark: true),
                    SizedBox(
                      height: 8.r,
                    ),
                    // _bottomActions()
                  ],
                ),
              ),
              SizedBox(
                height: 22.r,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(
                  'assets/images/common/dialog_circle_close.png',
                  width: 39.r,
                  height: 40.r,
                ),
              )
            ],
          )),
    );
  }

  _item(String title, String subTitle,
      {TextStyle? subTitleStyle,
      bool? canCopy,
      String? copyString,
      bool? isRemark}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.r, horizontal: 12.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title,
              style: TextStyle(
                fontSize: 14.sp,
                // color: AppTheme.mainTextColor
              )),
          Container(
            constraints: BoxConstraints(
              maxWidth: canCopy == true ? 170.r : 225.r,
            ),
            child: Text(subTitle,
                maxLines: isRemark == true ? 15 : 1,
                overflow: TextOverflow.ellipsis,
                style: subTitleStyle ??
                    TextStyle(
                      fontSize: 14.sp,
                      // color: AppTheme.mainTextColor
                    )),
          ),
          const Spacer(),
          // if (canCopy == true) RecordCopyButton(copyString)
        ],
      ),
    );
  }

  Color typeColor(int? type, {bool? isText}) {
    return Colors.black;
    // return (type == 2 || type == 4)
    //     ? const Color(0xFF3DC070)
    //     : (type == 12
    //         ? const Color(0xFFFFA010)
    //         : (type == 14
    //             ? (isText == true
    //                 ? AppTheme.subTextColor
    //                 : const Color(0xFFCCCCCC))
    //             : const Color(0xFF3DC070)));
  }
}
