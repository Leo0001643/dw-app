import 'package:aone_common/common.dart';
import 'package:aone_common/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../../tool/space_util.dart';

class BillRecordBaseCell extends StatelessWidget {
  const BillRecordBaseCell({Key? key}) : super(key: key);

  get num {}

  get middleTitle {}

  get middleValue {}

  get bottomTitle {}

  get bottomValue {}

  get statusColor {
    // return (record.type == 2 || record.type == 4)
    //     ? const Color(0xff228F21)
    //     : (record.type == 12
    //         ? const Color(0xfff24942)
    //         : (record.type == 14
    //             ? const Color(0xff666666)
    //             : const Color(0xff228F21)));
  }

  // get dialogStatusValue {
  //   if (record.type == 5 || record.type == 13) {
  //     return getReportStatuString(record.type ?? 15);
  //   }
  //   return bottomValue;
  // }

  onTap() {
    // showDialog(
    //     context: Get.context!,
    //     builder: (context) {
    //       return BillRecordDetailDialog(
    //           record: record,
    //           statusColor: statusColor,
    //           status: dialogStatusValue);
    //     });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        height: 110.r,
        margin: EdgeInsets.fromLTRB(9.r, 0, 9.r, 10.r),
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12.r)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _titleView(),
            Divider(
              color: const Color(0xFFEDEDED),
              thickness: 1.r,
            ),
            _middleView(),
            heightSpace(8.r),
            _bottomView(),
          ],
        ),
      ),
    );
  }

  _titleView() {
    return Row(
      children: [
        Image.asset(
          'assets/images/records/money.png',
          width: 20.r,
          height: 20.r,
        ),
        widthSpace(5.r),
        Container(
            constraints: BoxConstraints(maxWidth: 280.r),
            child: Text(
              '订单编号 ${orderNumberFormatter(num)}'.composing,
              maxLines: 1,
              softWrap: false,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 15.sp,
                  color: AoneAppTheme.appTheme.recordsSubTextColor,
                  fontWeight: FontWeight.w500),
            )),
        const Spacer(),
        GestureDetector(
          onTap: () {
            Clipboard.setData(ClipboardData(text: num));
            SmartDialog.showToast('user.center.success.copy'.tr);
          },
          child: Image.asset(
            'assets/images/records/copy.png',
            width: 20.r,
            height: 20.r,
          ),
        ),
      ],
    );
  }

  _middleView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          middleTitle ?? '',
          style: TextStyle(fontSize: 12.sp, color: Color(0xFF969696)),
        ),
        RichText(
          text: TextSpan(
            text: GlobalService.to.state.siteHeaders.currencySymbol,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            children: [
              TextSpan(
                  text: doubleStringSubstringInter(middleValue),
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: const Color(0xFF969696),
                      fontWeight: FontWeight.bold)),
              TextSpan(
                  text: doubleStringSubstringDecimal(middleValue),
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xFF969696),
                  )),
            ],
          ),
        ),
      ],
    );
  }

  _bottomView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          bottomTitle,
          style: TextStyle(
            fontSize: 12.sp,
            color: AoneAppTheme.appTheme.recordsSubTextColor,
          ),
        ),
        Text(
          bottomValue,
          style: TextStyle(
            fontSize: 12.sp,
            color: statusColor,
          ),
        ),
      ],
    );
  }
}
