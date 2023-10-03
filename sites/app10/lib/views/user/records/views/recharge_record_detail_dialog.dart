import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../../../theme/color_schema.dart';

class RechargeRecordDetailDialog extends Dialog {
  final Items item;

  RechargeRecordDetailDialog({required this.item, Key? key}) : super(key: key);

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

  double titleNoWidth = 65.r;
  double width = 302.r;
  double padding = 12.r;

  @override
  Widget build(BuildContext context) {
    // return _oldContainer();
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
              // padding: EdgeInsets.symmetric(horizontal: padding),
              color: Colors.white,
              // decoration: const BoxDecoration(
              //     image: DecorationImage(
              //         image: AssetImage(
              //             'assets/images/recharge/recharge_record_bg.png'),
              //         fit: BoxFit.fill)),
              child: Column(
                children: [
                  Container(
                    color: const Color(0xFFF4F4F4),
                    height: 40.r,
                    child: Center(
                      child: Text(
                        "充值记录详情",
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
                        top: 5.r, bottom: 20.r, left: padding, right: padding),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            _subTitleRow("user.center.ordernum".tr,
                                item.ordernumber ?? '',
                                isCopy: true,
                                copyContent: item.ordernumber ?? ""),
                          ],
                        ),
                        _subTitleRow(
                            "充值时间：", timeStampIntToSecond(item.addTime ?? 0)),
                        _subTitleRow("会员账户：", item.userName ?? ""),
                        _subTitleRow(
                            "存款人：",
                            filterZero(
                                getLimitString(item.cunkuanren ?? "", 10))),
                        _subTitleRow(
                            "充值金额：", decimalString(item.payTotal ?? "0.00")),
                        _subTitleRow("充值类型：", getTypeString(item.type ?? 3)),
                        _subTitleRow(
                            "优惠金额：", decimalString(item.yhtotal ?? "0.00")),
                        _subTitleRow(
                            "洗码量：", decimalString(item.xml_total ?? "0.00")),
                        _subTitleRow(
                            "状态：", getRechargeStatuString(item.state ?? 2),
                            rightStyle: rightTitleStyle.copyWith(
                                color: getRechargeStatuColor(item.state ?? 0))),
                        _subTitleRow(
                          "备注：",
                          filterZero(item.remarks ?? "--"),
                          isRemark: true,
                        ),
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

  filterZero(String? text) {
    if (text == '0') {
      return '';
    } else {
      return text;
    }
  }

  Widget _subTitleRow(String left, String right,
      {TextStyle? rightStyle,
      bool? isCopy = false,
      String? copyContent,
      bool? isRemark = false}) {
    double rightWidth = width - titleNoWidth - 2 * padding;
    if (isCopy == true) {
      rightWidth = rightWidth - 10.r - 13.r;
      copyContent ??= right;
    }

    return Padding(
      padding: EdgeInsets.only(bottom: 8.r),
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
                  maxWidth: isCopy == true
                      ? width - titleNoWidth - 2 * padding - 30.r
                      : width - titleNoWidth - 2 * padding),
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

  //老版本的样式
  _oldContainer() {
    return Center(
      child: Container(
        width: 342.w,
        height: 420.w,
        decoration: const BoxDecoration(color: Color(0xffffffff)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 342.w,
              height: 50,
              color: const Color(0xfff4f4f4),
              alignment: Alignment.center,
              child: const Text(
                "充值记录详情",
                style: TextStyle(
                    color: Color(0xff000000),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Container(
                width: 342.w,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Text("user.center.ordernum".tr,
                        style: const TextStyle(
                            color: Color(0xff0B213B), fontSize: 14)),
                    Text(item.ordernumber ?? "",
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
                    const Text("充值时间：",
                        style:
                            TextStyle(color: Color(0xff0B213B), fontSize: 14)),
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
                    const Text("会员账户：",
                        style:
                            TextStyle(color: Color(0xff0B213B), fontSize: 14)),
                    Text(item.userName ?? "",
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
                    const Text("存款人：",
                        style:
                            TextStyle(color: Color(0xff0B213B), fontSize: 14)),
                    Text(getLimitString(item.cunkuanren ?? "", 10),
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
                    const Text("充值金额：",
                        style:
                            TextStyle(color: Color(0xff0B213B), fontSize: 14)),
                    Text(decimalString(item.payTotal ?? "0.00"),
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
                    const Text("充值类型：",
                        style:
                            TextStyle(color: Color(0xff0B213B), fontSize: 14)),
                    Text('${getTypeString(item.type ?? 3)}',
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
                    const Text("优惠金额：",
                        style:
                            TextStyle(color: Color(0xff0B213B), fontSize: 14)),
                    Text(decimalString(item.yhtotal ?? "0.00"),
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
                    const Text("状态：",
                        style:
                            TextStyle(color: Color(0xff0B213B), fontSize: 14)),
                    Text(getRechargeStatuString(item.state ?? 2),
                        style: TextStyle(
                            color: getRechargeStatuColor(item.state ?? 0),
                            fontSize: 12))
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
                    const Text("洗码量：",
                        style:
                            TextStyle(color: Color(0xff0B213B), fontSize: 14)),
                    Text(decimalString(item.xml_total ?? "0.00"),
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
                    const Text("备注：",
                        style:
                            TextStyle(color: Color(0xff0B213B), fontSize: 14)),
                    Container(
                      constraints: BoxConstraints(maxWidth: 200.w),
                      child: Text(item.remarks ?? "--",
                          maxLines: 15,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
