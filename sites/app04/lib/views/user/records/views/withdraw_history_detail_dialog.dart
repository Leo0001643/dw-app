import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../../../theme/color_schema.dart';

class WidthdrawHistoryDetailDialog extends Dialog {
  final WidthdrawItem item;

  const WidthdrawHistoryDetailDialog({required this.item, Key? key})
      : super(key: key);

  //  onTap: () => {clickListener?.onConfirm(), Navigator.of(context).pop()},

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 342.w,
        // height: 450.r,
        padding: EdgeInsets.only(bottom: 15.r),
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
              child: Text(
                "提现记录详情",
                style: TextStyle(
                    color: stringToColor('000000'),
                    fontSize: 14,
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
                          style:  const TextStyle(color: Color(0xff000000), fontSize: 12,fontWeight: FontWeight.bold)),
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
                    Text("user.center.apply.time.wait".tr,
                        style: const TextStyle(
                            color: Color(0xff0B213B), fontSize: 14)),
                    Text(timeStampIntToSecond(item.addTime ?? 0),
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
                    Text("user.center.withdraw.money".tr,
                        style: const TextStyle(
                            color: Color(0xff0B213B), fontSize: 14)),
                    Text(decimalString(item.txTotal ?? "0.00"),
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
                    Text("user.center.withdraw.real.money".tr,
                        style: TextStyle(
                            color: Color(0xff0B213B), fontSize: 14)),
                    Text(decimalString(item.tx_total_true ?? "0.00"),
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
                    Text("手续费：",
                        style: const TextStyle(
                            color: Color(0xff0B213B), fontSize: 14)),
                    Text(decimalString(item.txSxf ?? "0.00"),
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
                    Text("user.center.withdraw.type".tr,
                        style: TextStyle(
                            color: Color(0xff0B213B), fontSize: 14)),
                    Text(getWidthdrawTypeString(item.type ?? 5),
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
                    Text("收款人：",
                        style: const TextStyle(
                            color: Color(0xff0B213B), fontSize: 14)),
                    Text(getLimitString(item.bankusername ?? "",15),
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
                    Text("状态：",
                        style: TextStyle(
                            color: Color(0xff0B213B), fontSize: 14)),
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
                        style:  const TextStyle(color: Color(0xff000000), fontSize: 12,fontWeight: FontWeight.bold)),
                  ],
                )),
            Divider(),
            Container(
                width: 342.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Container(
                      // color: Colors.pink,
                      child:const Text("备注：",
                          style:  TextStyle(
                              color: Color(0xff0B213B), fontSize: 14)),
                    ),
                    Expanded(
                      child: Container(
                        // color: Colors.red,
                        child: Text(item.remarks??"--",
                        softWrap: true,
                            style:  const TextStyle(color: Color(0xff000000), fontSize: 14)),
                      ),
                    ),
                  ],
                )),

          ],
        ),
      ),
    );
  }
}
