import 'package:aone_common/common.dart';
import 'package:app10/theme/color_schema.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

class WithdrawRecordCell extends StatelessWidget {
  final WidthdrawItem record;
  final GestureTapCallback onTap;

  WithdrawRecordCell(
    this.record,
    this.onTap, {
    Key? key,
  }) : super(key: key);

  TextStyle titleStyle = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: AppTheme.blackTextColor);
  TextStyle subTitleStyle = TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: AppTheme.blackTextColor);

  double titleNoWidth = 80.r;

  @override
  Widget build(BuildContext context) {
    // return _oldCell();
    return vCell();
  }

  Widget vCell() {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 12.r),
          margin: EdgeInsets.symmetric(horizontal: 12.r),
          decoration: BoxDecoration(
              color: AppTheme.onPrimary,
              border: Border.all(width: 1, color: AppTheme.borderColor),
              borderRadius: BorderRadius.circular(5.r)),
          child: Column(
            children: [
              _titleRow(),
              SizedBox(
                height: 12.r,
              ),
              _subTitleRow(
                '申请时间',
                timeStampIntToSecond(record.addTime ?? 0),
              ),
              SizedBox(
                height: 5.r,
              ),
              _subTitleRow('提现金额',
                  record.txTotal == null ? "" : decimalString(record.txTotal),
                  rightStyle: subTitleStyle.copyWith(
                      color: AppTheme.danger, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 5.r,
              ),
              _subTitleRow('手续费用',
                  record.txSxf == null ? "" : decimalString(record.txSxf),
                  rightStyle: subTitleStyle.copyWith(
                      color: AppTheme.danger, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 5.r,
              ),
              Row(
                children: [
                  SizedBox(
                      width: titleNoWidth,
                      child: Text(
                        '提现状态',
                        style: subTitleStyle,
                      )),
                  Text(
                    getWithdrawStatuString(record.state ?? 2),
                    style: TextStyle(
                        color: statusColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 3.r,
              ),
            ],
          )),
    );
  }

  get statusColor {
    return record.state == 6
        ? const Color(0xFFDE3759)
        : (record.state == 3 || record.state == 5)
            ? const Color(0xFF67D06E)
            : (record.state == 2)
                ? const Color(0xFFE61C16)
                : const Color(0xFF42a0fe);
  }

  Widget _titleRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
            width: titleNoWidth,
            child: Text(
              '订单编号：',
              style: titleStyle,
            )),
        Text(record.ordernumber ?? '',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            )),
        SizedBox(
          width: 10.r,
        ),
        GestureDetector(
          onTap: () {
            Clipboard.setData(ClipboardData(text: record.ordernumber));
            SmartDialog.showToast('user.center.success.copy'.tr);
          },
          child: Image.asset(
            'assets/images/user/copy.png',
            width: 13.r,
            height: 13.r,
          ),
        ),
        const Spacer(),
        Image.asset(
          'assets/images/common/arrow_right_black.png',
          width: 18.r,
          height: 18.r,
        ),
      ],
    );
  }

  Widget _subTitleRow(String left, String right, {TextStyle? rightStyle}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
            width: titleNoWidth,
            child: Text(
              left,
              style: subTitleStyle,
            )),
        Text(right, style: rightStyle ?? subTitleStyle),
      ],
    );
  }

  //老版的，横向布局
  //cell
  Widget _oldCell() {
    // WidthdrawItem element = controller.widthdrawItemList[index];
    return InkWell(
      // onTap: () {
      //   showDialog(
      //     context: context,
      //     builder: (context) {
      //       return WidthdrawHistoryDetailDialog(item: element);
      //     },
      //   );
      // },
      child: Container(
        margin: const EdgeInsets.only(top: 8, left: 8, right: 8),
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
            color: stringToColor('f2f5f8'),
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '订单号： ${record.ordernumber}',
                  style: TextStyle(
                      color: stringToColor('0b213b'),
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 47,
                  height: 22,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            stringToColor('42a0fe'),
                            stringToColor('2f72f5')
                          ])),
                  child: const Text(
                    '复制',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 9),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '申请时间：',
                    style: TextStyle(
                        color: stringToColor('0b213b'),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 11,
                  ),
                  Text(
                    '${timeStampIntToSecond(record.addTime ?? 0)}',
                    style: TextStyle(
                        color: stringToColor('0b213b', 0.7),
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '提现金额：',
                    style: TextStyle(
                        color: stringToColor('0b213b'),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 11,
                  ),
                  Text(
                    '${record.txTotal == null ? "" : decimalString(record.txTotal)}',
                    style: TextStyle(
                        color: stringToColor('ff0000'),
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '手续费用：',
                    style: TextStyle(
                        color: stringToColor('0b213b'),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 11,
                  ),
                  Text(
                    '${record.txSxf == null ? "" : decimalString(record.txSxf)}',
                    style: TextStyle(
                        color: stringToColor('ff0000', 0.7),
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '提现状态：',
                    style: TextStyle(
                        color: stringToColor('0b213b'),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 11,
                  ),
                  Container(
                    width: record.state == 1 ? 45 : 45,
                    height: 16,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: record.state == 6
                                ? [
                                    stringToColor('F9A4B2'),
                                    stringToColor('DE3759')
                                  ]
                                : (record.state == 3 || record.state == 5)
                                    ? [
                                        stringToColor('93E78C'),
                                        stringToColor('1C8D48')
                                      ]
                                    : (record.state == 2)
                                        ? [
                                            // Color(0xffFF0000),
                                            stringToColor('ffFF0000'),
                                            stringToColor('ffFF0000')
                                          ]
                                        : [
                                            stringToColor('42a0fe'),
                                            stringToColor('2f72f5')
                                          ])),
                    child: Text(
                      '${getWithdrawStatuString(record.state ?? 2)}',
                      style: TextStyle(
                          color: stringToColor('ffffff'),
                          fontSize: 9,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
