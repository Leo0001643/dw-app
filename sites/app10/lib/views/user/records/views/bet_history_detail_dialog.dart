import 'package:aone_common/common.dart';
import 'package:aone_common/data/model/entities/record/record_detail_entity.dart';
import 'package:aone_common/utils/history.dart';
import 'package:app10/theme/color_schema.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

class BetHistoryDetailDialog extends Dialog {
  final DetailBets item;

  const BetHistoryDetailDialog({required this.item, Key? key})
      : super(key: key);

  //  onTap: () => {clickListener?.onConfirm(), Navigator.of(context).pop()},

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 310.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 342.w,
                    height: 40,
                    alignment: Alignment.center,
                    color: const Color(0xFFF4F4F4),
                    child: const Text(
                      "游戏投注记录详情",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      padding: EdgeInsets.only(
                          left: 15.r, right: 15.r, bottom: 10.r),
                      child: Row(
                        children: [
                          Text("user.center.ordernum".tr,
                              style: TextStyle(
                                  color: Color(0xff0B213B), fontSize: 12)),
                          Container(
                            constraints: BoxConstraints(maxWidth: 210.r),
                            child: Text(item.bet_id ?? "",
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
                                  ClipboardData(text: item.bet_id));
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
                      padding: EdgeInsets.only(
                          left: 15.r, right: 15.r, bottom: 10.r),
                      child: Row(
                        children: [
                          Text("游戏名称：",
                              style: const TextStyle(
                                  color: Color(0xff0B213B), fontSize: 12)),
                          Text(getLimitString(item.subName ?? "", 20),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff4B4B4B),
                                  fontSize: 12))
                        ],
                      )),
                  Container(
                      padding: EdgeInsets.only(
                          left: 15.r, right: 15.r, bottom: 10.r),
                      child: Row(
                        children: [
                          Text("用户账号：",
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xff0B213B),
                              )),
                          AutoSizeText(item.user_name ?? "",
                              minFontSize: 6,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff4B4B4B),
                                  fontSize: 12))
                        ],
                      )),
                  Container(
                      padding: EdgeInsets.only(
                          left: 15.r, right: 15.r, bottom: 10.r),
                      child: Row(
                        children: [
                          Text("投注时间：",
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xff0B213B),
                              )),
                          AutoSizeText(timeStampIntToSecond(item.bet_time ?? 0),
                              minFontSize: 6,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff4B4B4B),
                                  fontSize: 12))
                        ],
                      )),
                  Container(
                      padding: EdgeInsets.only(
                          left: 15.r, right: 15.r, bottom: 10.r),
                      child: Row(
                        children: [
                          Text("总投注额：",
                              style: TextStyle(
                                  color: Color(0xff0B213B), fontSize: 12)),
                          Text(decimalString(item.betSum ?? "0.00"),
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffFF0000),
                                  fontSize: 12))
                        ],
                      )),
                  Container(
                      padding: EdgeInsets.only(
                          left: 15.r, right: 15.r, bottom: 10.r),
                      child: Row(
                        children: [
                          Text("有效投注额：",
                              style: const TextStyle(
                                  color: Color(0xff0B213B), fontSize: 12)),
                          Text(decimalString(item.betValid ?? "0.00"),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffFF0000),
                                  fontSize: 12))
                        ],
                      )),
                  Container(
                      padding: EdgeInsets.only(
                          left: 15.r, right: 15.r, bottom: 10.r),
                      child: Row(
                        children: [
                          Text("实际输赢：",
                              style: TextStyle(
                                  color: Color(0xff0B213B), fontSize: 12)),
                          Text('${decimalString(item.betWin)}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffFF0000),
                                  fontSize: 12))
                        ],
                      )),
                  Container(
                      padding: EdgeInsets.only(
                          left: 15.r, right: 15.r, bottom: 10.r),
                      child: Row(
                        children: [
                          Text("状态：",
                              style: const TextStyle(
                                  color: Color(0xff0B213B), fontSize: 12)),
                          Text('${getBetStatuString(item.bet_state ?? 0)}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff4B4B4B),
                                  fontSize: 12))
                        ],
                      )),
                  Container(
                      padding: EdgeInsets.only(
                          left: 15.r, right: 15.r, bottom: 10.r),
                      child: Row(
                        children: [
                          Text("备注：",
                              style: const TextStyle(
                                  color: Color(0xff0B213B), fontSize: 12)),
                          Container(
                            constraints: BoxConstraints(maxWidth: 250.r),
                            child: Text("${getLimitString('--', 10)}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff4B4B4B),
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
        ),
      ),
    );
  }
}
