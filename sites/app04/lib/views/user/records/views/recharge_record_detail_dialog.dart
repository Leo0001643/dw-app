import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../../../theme/color_schema.dart';

class RechargeRecordDetailDialog extends Dialog {
  final Items item;

  const RechargeRecordDetailDialog({required this.item, Key? key})
      : super(key: key);

  //  onTap: () => {clickListener?.onConfirm(), Navigator.of(context).pop()},

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 342.w,
        height: 420.w,
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
              color: const Color(0xfff4f4f4),
              alignment: Alignment.center,
              child:const Text(
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
                        style:
                        const TextStyle(color: Color(0xff0B213B), fontSize: 14)),
                    Expanded(
                      child: Text(item.ordernumber ?? "",
                          style:
                             const TextStyle(color: Color(0xff000000), fontSize: 12,fontWeight: FontWeight.bold)),
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
            Divider(),
            Container(
                width: 342.w,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    const Text("充值时间：",
                        style: TextStyle(
                            color: Color(0xff0B213B), fontSize: 14)),
                    Text(timeStampIntToSecond(item.addTime ?? 0),
                        style: const TextStyle(color: Color(0xff000000), fontSize: 12,fontWeight: FontWeight.bold)),
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
                        style: TextStyle(
                            color: Color(0xff0B213B), fontSize: 14)),
                    Text(item.userName ?? "",
                        style:  const TextStyle(color: Color(0xff000000), fontSize: 12,fontWeight: FontWeight.bold)),
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
                        style: TextStyle(
                            color: Color(0xff0B213B), fontSize: 14)),
                    Text(getLimitString(item.cunkuanren ?? "",10),
                        style:  const TextStyle(color: Color(0xff000000), fontSize: 12,fontWeight: FontWeight.bold)),
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
                        style: TextStyle(
                            color: Color(0xff0B213B), fontSize: 14)),
                    Text(decimalString(item.payTotal ?? "0.00"),
                        style:  const TextStyle(color: Color(0xff000000), fontSize: 12,fontWeight: FontWeight.bold)),
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
                        style: TextStyle(
                            color: Color(0xff0B213B), fontSize: 14)),
                    Text(
                        '${getTypeString(item.type ?? 3)}',
                        style:  const TextStyle(color: Color(0xff000000), fontSize: 12,fontWeight: FontWeight.bold)),
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
                        style: TextStyle(
                            color: Color(0xff0B213B), fontSize: 14)),
                    Text(decimalString(item.yhtotal ?? "0.00"),
                        style:  const TextStyle(color: Color(0xff000000), fontSize: 12,fontWeight: FontWeight.bold)),
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
                        style: TextStyle(
                            color: Color(0xff0B213B), fontSize: 14)),
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
                        style: TextStyle(
                            color: Color(0xff0B213B), fontSize: 14)),
                    Text(decimalString(item.xml_total ?? "0.00"),
                        style:  const TextStyle(color: Color(0xff000000), fontSize: 12,fontWeight: FontWeight.bold)),
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
                        style: TextStyle(color: Color(0xff0B213B), fontSize: 14)),
                    Text(item.remarks??"--",
                        style:  const TextStyle(color: Color(0xff000000), fontSize: 12,fontWeight: FontWeight.bold)),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
