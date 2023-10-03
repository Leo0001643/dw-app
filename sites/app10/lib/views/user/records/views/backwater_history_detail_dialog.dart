import 'package:aone_common/common.dart';
import 'package:aone_common/utils/history.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../../../theme/color_schema.dart';

class BackwaterHistoryDetailDialog extends Dialog {
  final BackwaterItem item;

  const BackwaterHistoryDetailDialog({required this.item, Key? key})
      : super(key: key);

  //  onTap: () => {clickListener?.onConfirm(), Navigator.of(context).pop()},

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(left: 25.r, right: 25.r),
            // padding:
            //     EdgeInsets.only(top: 10.r, left: 15.r, bottom: 15.r, right: 15.r),
            decoration: const BoxDecoration(color: Color(0xffffffff)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 40.r,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(color: Color(0xffF4F4F4)),
                  child: Text(
                    "返水详情",
                    style: TextStyle(
                        color: stringToColor('000000'),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    padding:
                        EdgeInsets.only(left: 15.r, right: 15.r, bottom: 10.r),
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
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff4B4B4B),
                                  fontSize: 12)),
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
                    padding:
                        EdgeInsets.only(left: 15.r, right: 15.r, bottom: 10.r),
                    child: Row(
                      children: [
                        const Text("返水时间：",
                            style: TextStyle(
                                color: Color(0xff0B213B), fontSize: 12)),
                        Text(timeStampIntToSecond(item.upTime ?? 0),
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color(0xff4B4B4B),
                                fontSize: 12))
                      ],
                    )),
                Container(
                    padding:
                        EdgeInsets.only(left: 15.r, right: 15.r, bottom: 10.r),
                    // width: 316,
                    child: Row(
                      children: [
                        const Text("用户账户：",
                            style: TextStyle(
                                color: Color(0xff0B213B), fontSize: 12)),
                        Text(item.user_name ?? '',
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color(0xffFF0000),
                                fontSize: 12))
                      ],
                    )),
                Container(
                    padding:
                        EdgeInsets.only(left: 15.r, right: 15.r, bottom: 10.r),
                    child: Row(
                      children: [
                        const Text("返水金额：",
                            style: TextStyle(
                                color: Color(0xff0B213B), fontSize: 12)),
                        Text(decimalString(item.userFsTotal ?? "0.00"),
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color(0xffFF0000),
                                fontSize: 12))
                      ],
                    )),
                Container(
                    padding:
                        EdgeInsets.only(left: 15.r, right: 15.r, bottom: 10.r),
                    child: Row(
                      children: [
                        const Text("返水比例：",
                            style: TextStyle(
                                color: Color(0xff0B213B), fontSize: 12)),
                        Text(
                            '${double.parse(decimalString(item.user_fs_bl)) * 100}%',
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color(0xffFF0000),
                                fontSize: 12))
                      ],
                    )),
                Container(
                    padding:
                        EdgeInsets.only(left: 15.r, right: 15.r, bottom: 10.r),
                    child: Row(
                      children: [
                        const Text("总投注额：",
                            style: TextStyle(
                                color: Color(0xff0B213B), fontSize: 12)),
                        Text('${decimalString(item.betSum ?? "0.00")}',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: stringToColor('ff0000', 0.7),
                                fontSize: 12)),
                      ],
                    )),
                Container(
                    padding:
                        EdgeInsets.only(left: 15.r, right: 15.r, bottom: 10.r),
                    child: Row(
                      children: [
                        const Text("有效投注额：",
                            style: TextStyle(
                                color: Color(0xff0B213B), fontSize: 12)),
                        Text('${decimalString(item.bet_valid)}',
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color(0xffFF0000),
                                fontSize: 12))
                      ],
                    )),
                Container(
                    padding:
                        EdgeInsets.only(left: 15.r, right: 15.r, bottom: 10.r),
                    child: Row(
                      children: [
                        const Text("实际输赢：",
                            style: TextStyle(
                                color: Color(0xff0B213B), fontSize: 12)),
                        Text('${decimalString(item.bet_win ?? "0.00")}',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: stringToColor('ff0000', 0.7),
                                fontSize: 12)),
                      ],
                    )),
                Container(
                    padding:
                        EdgeInsets.only(left: 15.r, right: 15.r, bottom: 10.r),
                    child: Row(
                      children: [
                        Text("状态：",
                            style: TextStyle(
                                color: Color(0xff0B213B), fontSize: 12)),
                        Text(
                            '${getBackStatuString(
                              item.state ?? 8,
                            )}',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: getBackStatusColor(item.state!),
                                fontSize: 12))
                      ],
                    )),
                Container(
                    padding:
                        EdgeInsets.only(left: 15.r, right: 15.r, bottom: 10.r),
                    child: Row(
                      children: [
                        const Text("备注：",
                            style: TextStyle(
                                color: Color(0xff0B213B), fontSize: 12)),
                        Container(
                          constraints: BoxConstraints(maxWidth: 240.r),
                          child: Text("${item.remarks ?? '--'}",
                              maxLines: 15,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff4B4B4B),
                                  fontSize: 12)),
                        )
                      ],
                    )),
                const SizedBox(
                  height: 6,
                ),
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
    );
  }
}
