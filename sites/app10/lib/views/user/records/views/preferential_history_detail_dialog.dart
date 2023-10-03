import 'package:aone_common/common.dart';
import 'package:aone_common/utils/history.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../../../theme/color_schema.dart';

class PreferentialHistoryDetailDialog extends Dialog {
  final YhItem item;

  const PreferentialHistoryDetailDialog({required this.item, Key? key})
      : super(key: key);

  //  onTap: () => {clickListener?.onConfirm(), Navigator.of(context).pop()},

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: 320.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 15),
                decoration: const BoxDecoration(color: Color(0xffffffff)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 342.w,
                      height: 40,
                      alignment: Alignment.center,
                      color: const Color(0xfff4f4f4),
                      child: const Text(
                        "优惠详情",
                        style: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        padding: EdgeInsets.only(
                            bottom: 6.r, left: 15.r, right: 15.r),
                        child: Row(
                          children: [
                            Text("user.center.ordernum".tr,
                                style: TextStyle(
                                    color: Color(0xff0B213B), fontSize: 12)),
                            Container(
                              constraints: BoxConstraints(maxWidth: 200.r),
                              child: Text(item.ordernumber ?? "",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Color(0xff4B4B4B),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600)),
                            ),
                            GestureDetector(
                              onTap: () {
                                Clipboard.setData(
                                    ClipboardData(text: item.ordernumber));
                                SmartDialog.showToast(
                                    'user.center.success.copy'.tr);
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
                        // width: 342.w,
                        padding: EdgeInsets.only(
                            bottom: 6.r, left: 15.r, right: 15.r),
                        child: Row(
                          children: [
                            Text("申请时间：",
                                style: const TextStyle(
                                    color: Color(0xff0B213B), fontSize: 12)),
                            Text(timeStampIntToSecond(item.get_time ?? 0),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff4B4B4B),
                                    fontSize: 12))
                          ],
                        )),
                    Container(
                        padding: EdgeInsets.only(
                            bottom: 6.r, left: 15.r, right: 15.r),
                        child: Row(
                          children: [
                            Text("用户账户：",
                                style: const TextStyle(
                                    color: Color(0xff0B213B), fontSize: 12)),
                            Text(item.user_name ?? "",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff4B4B4B),
                                    fontSize: 12))
                          ],
                        )),
                    Container(
                        padding: EdgeInsets.only(
                            bottom: 6.r, left: 15.r, right: 15.r),
                        child: Row(
                          children: [
                            Text("优惠金额：",
                                style: TextStyle(
                                    color: Color(0xff0B213B), fontSize: 12)),
                            Text(decimalString(item.yhTotal ?? "0.00"),
                                style: TextStyle(
                                    color: Color(0xffFF0000),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12))
                          ],
                        )),
                    Container(
                        padding: EdgeInsets.only(
                            bottom: 6.r, left: 15.r, right: 15.r),
                        child: Row(
                          children: [
                            Text("洗码量：",
                                style: const TextStyle(
                                    color: Color(0xff0B213B), fontSize: 12)),
                            Text(decimalString(item.xml_total ?? "0.00"),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffFF0000),
                                    fontSize: 12))
                          ],
                        )),
                    Container(
                        padding: EdgeInsets.only(
                            bottom: 6.r, left: 15.r, right: 15.r),
                        child: Row(
                          children: [
                            Text("状态：",
                                style: TextStyle(
                                    color: Color(0xff0B213B), fontSize: 12)),
                            Text('${getStatuString(item.state ?? 0)}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: getStatusColor(item.state ?? 0),
                                    fontSize: 12))
                          ],
                        )),
                    Container(
                        padding: EdgeInsets.only(
                            bottom: 6.r, left: 15.r, right: 15.r),
                        child: Row(
                          children: [
                            Text("优惠类型：",
                                style: const TextStyle(
                                    color: Color(0xff0B213B), fontSize: 12)),
                            Text('${getYhTypeString(item.yh_type ?? 0)}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff4B4B4B),
                                    fontSize: 12))
                          ],
                        )),
                    Container(
                        padding: EdgeInsets.only(
                            bottom: 6.r, left: 15.r, right: 15.r),
                        child: Row(
                          children: [
                            Text("活动名称：",
                                style: const TextStyle(
                                    color: Color(0xff0B213B), fontSize: 12)),
                            Text(
                                "${getLimitString(item.activity_title ?? '--', 10)}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff4B4B4B),
                                    fontSize: 12))
                          ],
                        )),
                    Container(
                        padding: EdgeInsets.only(
                            bottom: 6.r, left: 15.r, right: 15.r),
                        child: Row(
                          children: [
                            const Text("备注：",
                                style: TextStyle(
                                    color: Color(0xff0B213B), fontSize: 12)),
                            Container(
                              constraints: BoxConstraints(maxWidth: 265.w),
                              child: Text(filterZero(item.remarks),
                                  maxLines: 15,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12)),
                            )
                          ],
                        )),
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
          )),
    );
  }

  filterZero(String? title) {
    if (title == null) return '--';
    if (title == '0') {
      return '--';
    }
    return title;
  }
}
