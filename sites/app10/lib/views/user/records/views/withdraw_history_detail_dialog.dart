import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../../../theme/color_schema.dart';

class WidthdrawHistoryDetailDialog extends Dialog {
  final WidthdrawItem item;

  WidthdrawHistoryDetailDialog({required this.item, Key? key})
      : super(key: key);

  //  onTap: () => {clickListener?.onConfirm(), Navigator.of(context).pop()},

  TextStyle leftTitleStyle = TextStyle(
      overflow: TextOverflow.ellipsis,
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black);

  TextStyle rightTitleStyle = TextStyle(
      overflow: TextOverflow.ellipsis,
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
      color: Colors.black);

  double titleNoWidth = 100.r;
  double width = 302.r;
  double padding = 12.r;

  @override
  Widget build(BuildContext context) {
    // return _oldView();
    return Center(
      child: Container(
        width: width,
        // height: 419.r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 302.r,
              // height: 329.r,
              alignment: Alignment.center,
              color: Colors.white,
              // decoration: const BoxDecoration(
              //     image: DecorationImage(
              //         image: AssetImage(
              //             'assets/images/recharge/recharge_record_bg.png'),
              //         fit: BoxFit.fill)),
              child: Column(
                children: [
                  Container(
                    height: 40.r,
                    color: const Color(0xFFF4F4F4),
                    child: Center(
                      child: Text(
                        "提现记录详情",
                        style: TextStyle(
                            color: AppTheme.blackTextColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    // height: 273.r,
                    padding: EdgeInsets.only(
                        top: 5.r, bottom: 15.r, left: padding, right: padding),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            _subTitleRow("user.center.ordernum".tr,
                                item.ordernumber ?? "",
                                isCopy: true,
                                copyContent: item.ordernumber ?? ""),
                          ],
                        ),
                        _subTitleRow("user.center.apply.time.wait".tr,
                            timeStampIntToSecond(item.addTime ?? 0)),
                        _subTitleRow("user.center.withdraw.money".tr,
                            decimalString(item.txTotal ?? "0.00")),
                        _subTitleRow("user.center.withdraw.real.money".tr,
                            decimalString(item.tx_total_true ?? "0.00")),
                        _subTitleRow(
                            "手续费：", decimalString(item.txSxf ?? "0.00")),
                        _subTitleRow("user.center.withdraw.type".tr,
                            getWidthdrawTypeString(item.type ?? 5)),
                        _subTitleRow("收款人：",
                            getLimitString(item.bankusername ?? "", 15)),
                        _subTitleRow(
                            "状态：", getWithdrawStatuString(item.state ?? 2),
                            rightStyle:
                                rightTitleStyle.copyWith(color: statusColor)),
                        _subTitleRow(
                          "收款账户：",
                          item.bankcard ?? "",
                        ),
                        _subTitleRow("备注：", item.remarks ?? "--",
                            isRemark: true),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.r,
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
        ),
      ),
    );
  }

  get statusColor {
    return item.state == 6
        ? const Color(0xFFDE3759)
        : (item.state == 3 || item.state == 5)
            ? const Color(0xFF67D06E)
            : (item.state == 2)
                ? const Color(0xFFE61C16)
                : const Color(0xFF42a0fe);
  }

  Widget _subTitleRow(String left, String right,
      {TextStyle? rightStyle,
      bool? isCopy = false,
      String? copyContent,
      bool? isRemark}) {
    double rightWidth = width - titleNoWidth - 2 * padding;
    if (isCopy == true) {
      rightWidth = rightWidth - 10.r - 13.r;
      copyContent ??= right;
    }

    return Padding(
      padding: EdgeInsets.only(bottom: 6.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: titleNoWidth,
              child: Text(
                left,
                style: leftTitleStyle,
              )),
          Container(
              constraints: BoxConstraints(
                  maxWidth: isCopy == true ? rightWidth - 10.r : rightWidth),
              child: Text(right,
                  maxLines: isRemark == true ? 15 : 1,
                  overflow: TextOverflow.ellipsis,
                  style: rightStyle ?? rightTitleStyle)),
          if (isCopy == true)
            GestureDetector(
              onTap: () {
                Clipboard.setData(ClipboardData(text: right));
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
      ),
    );
  }

  //老版本的ui
  _oldView() {
    return Center(
      child: Container(
        width: 342.w,
        height: 480.w,
        decoration: const BoxDecoration(color: Color(0xffffffff)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 342.w,
              height: 50,
              alignment: Alignment.center,
              child: Text(
                "提现记录详情",
                style: TextStyle(
                    color: stringToColor('000000'),
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                width: 342.w,
                child: Row(
                  children: [
                    SizedBox(
                      width: 16,
                    ),
                    Text("user.center.ordernum".tr,
                        style:
                            TextStyle(color: Color(0xff0B213B), fontSize: 14)),
                    Text(getLimitString(item.ordernumber ?? "", 18),
                        style: const TextStyle(
                            color: Color(0xff000000),
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                    InkWell(
                        onTap: () {
                          Clipboard.setData(
                              ClipboardData(text: item.ordernumber));
                          SmartDialog.showToast('user.center.success.copy'.tr);
                        },
                        child: Container(
                            width: 33,
                            height: 16,
                            margin:
                                EdgeInsets.only(left: 10, right: 10, bottom: 2),
                            padding: EdgeInsets.only(bottom: 1),
                            alignment: Alignment.topCenter,
                            //边框设置
                            decoration: BoxDecoration(
                              color: Color(0xffffffff),
                              //设置四周圆角 角度
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7.0)),
                              //设置四周边框
                              border:
                                  Border.all(width: 1, color: AppTheme.primary),
                            ),
                            child: Text('user.center.copy'.tr,
                                style: TextStyle(
                                    color: AppTheme.primary, fontSize: 10))))
                  ],
                )),
            Divider(),
            Container(
                width: 342.w,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Text("user.center.apply.time.wait".tr,
                        style: const TextStyle(
                            color: Color(0xff0B213B), fontSize: 14)),
                    Text(timeStampIntToSecond(item.addTime ?? 0),
                        style: const TextStyle(
                            color: Color(0xff000000),
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                  ],
                )),
            Divider(),
            Container(
                width: 342.w,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Text("user.center.withdraw.money".tr,
                        style: const TextStyle(
                            color: Color(0xff0B213B), fontSize: 14)),
                    Text(decimalString(item.txTotal ?? "0.00"),
                        style: const TextStyle(
                            color: Color(0xff000000),
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                  ],
                )),
            Divider(),
            Container(
                width: 342.w,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Text("user.center.withdraw.real.money".tr,
                        style:
                            TextStyle(color: Color(0xff0B213B), fontSize: 14)),
                    Text(decimalString(item.tx_total_true ?? "0.00"),
                        style: const TextStyle(
                            color: Color(0xff000000),
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                  ],
                )),
            Divider(),
            Container(
                width: 342.w,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Text("手续费：",
                        style: const TextStyle(
                            color: Color(0xff0B213B), fontSize: 14)),
                    Text(decimalString(item.txSxf ?? "0.00"),
                        style: const TextStyle(
                            color: Color(0xff000000),
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                  ],
                )),
            Divider(),
            Container(
                width: 342.w,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Text("user.center.withdraw.type".tr,
                        style:
                            TextStyle(color: Color(0xff0B213B), fontSize: 14)),
                    Text(getWidthdrawTypeString(item.type ?? 5),
                        style: const TextStyle(
                            color: Color(0xff000000),
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                  ],
                )),
            Divider(),
            Container(
                width: 342.w,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Text("收款人：",
                        style: const TextStyle(
                            color: Color(0xff0B213B), fontSize: 14)),
                    Text(getLimitString(item.bankusername ?? "", 15),
                        style: const TextStyle(
                            color: Color(0xff000000),
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                  ],
                )),
            Divider(),
            Container(
                width: 342.w,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Text("状态：",
                        style:
                            TextStyle(color: Color(0xff0B213B), fontSize: 14)),
                    Text(getWithdrawStatuString(item.state ?? 2),
                        style: TextStyle(
                          fontSize: 12,
                          color: (item.state == 2 || item.state == 6)
                              ? const Color(0xfff24942)
                              : (item.state == 3 || item.state == 5)
                                  ? const Color(0xff228F21)
                                  : const Color(0xffea9c37),
                        ))
                  ],
                )),
            Divider(),
            Container(
                width: 342.w,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Text("收款账户：",
                        style: const TextStyle(
                            color: Color(0xff0B213B), fontSize: 14)),
                    Text(item.bankcard ?? "",
                        style: const TextStyle(
                            color: Color(0xff000000),
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                  ],
                )),
            Divider(),
            Container(
                child: Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                Text("备注：",
                    style: const TextStyle(
                        color: Color(0xff0B213B), fontSize: 14)),
                Text(item.remarks ?? "--",
                    style: const TextStyle(
                        color: Color(0xff000000),
                        fontSize: 12,
                        fontWeight: FontWeight.bold)),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
