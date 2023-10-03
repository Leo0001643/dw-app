import 'package:aone_common/common.dart';
import 'package:aone_common/utils/history.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../theme/color_schema.dart';

class PreferentialHistoryDetailDialog extends Dialog {
  final YhItem item;

  const PreferentialHistoryDetailDialog({required this.item, Key? key})
      : super(key: key);

  //  onTap: () => {clickListener?.onConfirm(), Navigator.of(context).pop()},

  @override
  Widget build(BuildContext context) {
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
                    color: const Color(0xfff4f4f4),
                    alignment: Alignment.center,
                    child: Text(
                      "优惠详情",
                      style: TextStyle(
                          color: stringToColor('000000'),
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10.r,
                  ),
                  ...[
                    _DataItem(
                      name: 'user.center.ordernum'.tr,
                      value: item.ordernumber ?? "",
                      canCopy: true,
                    ),
                    _DataItem(
                      name: '申请时间：',
                      value: timeStampIntToSecond(item.get_time ?? 0),
                    ),
                    _DataItem(
                      name: '用户账户',
                      value: item.user_name ?? "",
                    ),
                    _DataItem(
                      name: "优惠金额",
                      value: decimalString(item.yhTotal ?? "0.00"),
                    ),
                    _DataItem(
                      name: "洗码量：",
                      value: decimalString(item.xml_total ?? "0.00"),
                    ),
                    _DataItem(
                      name: "状态：",
                      value: getStatuString(item.state ?? 0),
                      valueColor: getStatusColor(item.state ?? 0),
                    ),
                    _DataItem(
                      name: "优惠类型：",
                      value: getYhTypeString(item.yh_type??0),
                    ),
                    _DataItem(
                      name: "活动名称：",
                      value: getLimitString(item.activity_title??'--',20),
                    ),
                    _DataItem(
                      name: "备注：",
                      value: item.remarks??"--",
                    ),
                  ]
                      .map((e) => _DetailItem(
                      item: e
                  ))
                      .toList(),
                  SizedBox(
                    height: 22.r,
                  ),
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
        ),
      ),
    );

    return Center(
      child: Container(
        width: 342.w,
        height: 380.w,
        decoration:const BoxDecoration(
            color: Color(0xffffffff)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 342.w,
              height: 50,
              alignment: Alignment.center,
              color: const Color(0xfff4f4f4),
              child:const Text(
                "优惠详情",
                style: TextStyle(
                    color: Color(0xff000000),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10,),
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
                    Expanded(
                      child: Text(item.ordernumber ?? "",
                          style:
                          TextStyle(color: Color(0xff4B4B4B), fontSize: 12)),
                    ),
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
                                style:  TextStyle(
                                    color: AppTheme.primary, fontSize: 10))))
                  ],
                )),
            Container(
              width: 342.w,
              height: 11,
              alignment: Alignment.center,
              child: Container(
                  width: 310.w,
                  height: 0.5, //边框设置
                  decoration: BoxDecoration(
                    color: stringToColor('0B213B', 0.1),
                  )),
            ),
            Container(
                width: 342.w,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Text("申请时间：",
                        style: const TextStyle(
                            color: Color(0xff0B213B), fontSize: 14)),
                    Text(timeStampIntToSecond(item.get_time ?? 0),
                        style: const TextStyle(
                            color: Color(0xff4B4B4B), fontSize: 12))
                  ],
                )),
            Container(
              width: 342.w,
              height: 11,
              alignment: Alignment.center,
              child: Container(
                  width: 310.w,
                  height: 0.5, //边框设置
                  decoration: BoxDecoration(
                    color: stringToColor('0B213B', 0.1),
                  )),
            ),

            Container(
                width: 342.w,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Text("用户账户：",
                        style: const TextStyle(
                            color: Color(0xff0B213B), fontSize: 14)),
                    Text(item.user_name ?? "",
                        style: const TextStyle(
                            color: Color(0xff4B4B4B), fontSize: 12))
                  ],
                )),
            Container(
              width: 342.w,
              height: 11,
              alignment: Alignment.center,
              child: Container(
                  width: 310.w,
                  height: 0.5, //边框设置
                  decoration: BoxDecoration(
                    color: stringToColor('0B213B', 0.1),
                  )),
            ),
            Container(
                width: 342.w,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Text("优惠金额：",
                        style: TextStyle(
                            color: Color(0xff0B213B), fontSize: 14)),
                    Text(decimalString(item.yhTotal ?? "0.00"),
                        style: TextStyle(
                            color: Color(0xffFF0000), fontSize: 12))
                  ],
                )),
            Container(
              width: 342.w,
              height: 11,
              alignment: Alignment.center,
              child: Container(
                  width: 310.w,
                  height: 0.5, //边框设置
                  decoration: BoxDecoration(
                    color: stringToColor('0B213B', 0.1),
                  )),
            ),
            Container(
                width: 342.w,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Text("洗码量：",
                        style: const TextStyle(
                            color: Color(0xff0B213B), fontSize: 14)),
                    Text(decimalString(item.xml_total ?? "0.00"),
                        style: const TextStyle(
                            color: Color(0xffFF0000), fontSize: 12))
                  ],
                )),
            Container(
              width: 342.w,
              height: 11,
              alignment: Alignment.center,
              child: Container(
                  width: 310.w,
                  height: 0.5, //边框设置
                  decoration: BoxDecoration(
                    color: stringToColor('0B213B', 0.1),
                  )),
            ),
            Container(
                width: 342.w,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Text("状态：",
                        style: TextStyle(
                            color: Color(0xff0B213B), fontSize: 14)),
                    Text(
                        '${getStatuString(item.state ?? 0)}',
                        style: TextStyle(
                            color:  getStatusColor(item.state ?? 0), fontSize: 12
                        ))
                  ],
                )),
            Container(
              width: 342.w,
              height: 11,
              alignment: Alignment.center,
              child: Container(
                  width: 310.w,
                  height: 0.5, //边框设置
                  decoration: BoxDecoration(
                    color: stringToColor('0B213B', 0.1),
                  )),
            ),
            Container(
                width: 342.w,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Text("优惠类型：",
                        style: const TextStyle(
                            color: Color(0xff0B213B), fontSize: 14)),
                    Text(  '${getYhTypeString(item.yh_type??0)}',
                        style: const TextStyle(
                            color: Color(0xff4B4B4B), fontSize: 12))
                  ],
                )),
            Container(
              width: 342.w,
              height: 11,
              alignment: Alignment.center,
              child: Container(
                  width: 310.w,
                  height: 0.5, //边框设置
                  decoration: BoxDecoration(
                    color: stringToColor('0B213B', 0.1),
                  )),
            ),
            Container(
                width: 342.w,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Text("活动名称：",
                        style: const TextStyle(
                            color: Color(0xff0B213B), fontSize: 14)),
                    Text("${getLimitString(item.activity_title??'--',10)}",
                        style: const TextStyle(
                            color: Color(0xff4B4B4B), fontSize: 12))
                  ],
                )),
            Container(
              width: 342.w,
              height: 11,
              alignment: Alignment.center,
              child: Container(
                  width: 310.w,
                  height: 0.5, //边框设置
                  decoration: BoxDecoration(
                    color: stringToColor('0B213B', 0.1),
                  )),
            ),
            Container(
                width: 342.w,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Text("备注：",
                        style: TextStyle(
                            color: Color(0xff0B213B), fontSize: 14)),
                    Text(item.remarks??"--",
                        style: TextStyle(
                            color: item.state == 3
                                ? Color(0xff58CD55)
                                : Color(0xffffffff),
                            fontSize: 12))
                  ],
                )),


          ],
        ),
      ),
    );
  }
}

class _DataItem {
  final String name;
  final String value;
  final bool canCopy ;
  final Color valueColor;

  const _DataItem({
    required this.name,
    required this.value,
    this.canCopy= false,
    this.valueColor = Colors.black,
  });
}

class _DetailItem extends StatelessWidget {
  final _DataItem item;

  const _DetailItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.r,vertical: 5.r),
      child: Row(
        children: [
          Text(
            item.name,
            style: TextStyle(
              color: const Color(0xff0B213B),
              fontSize: 12.sp,
            ),
          ),
          Flexible(
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