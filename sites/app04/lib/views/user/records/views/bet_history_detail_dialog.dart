import 'package:aone_common/common.dart';
import 'package:aone_common/data/model/entities/record/record_detail_entity.dart';
import 'package:aone_common/utils/history.dart';
import 'package:app04/theme/color_schema.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class BetHistoryDetailDialog extends Dialog {
  final DetailBets item;

  const BetHistoryDetailDialog({required this.item, Key? key})
      : super(key: key);

  //  onTap: () => {clickListener?.onConfirm(), Navigator.of(context).pop()},

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 342.w,
        height: 317,
        decoration: BoxDecoration(color: Color(0xffffffff)),
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
                "游戏投注记录详情",
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
                    Expanded(
                        child: AutoSizeText(
                            getLimitString(item.bet_id ?? "", 32),
                            maxLines: 1,
                            minFontSize: 6,
                            style: TextStyle(
                                color: Color(0xff4B4B4B), fontSize: 12))),
                    InkWell(
                        onTap: () {
                          Clipboard.setData(ClipboardData(text: item.bet_id));
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
                                    color: AppTheme.primary, fontSize: 10)))),
                    SizedBox(
                      width: 20.r,
                    )
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
                    Text("游戏名称：",
                        style: const TextStyle(
                            color: Color(0xff0B213B), fontSize: 14)),
                    Text(getLimitString(item.subName ?? "", 20),
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
                    AutoSizeText("用户账号：",
                        style: const TextStyle(
                          color: Color(0xff0B213B),
                        )),
                    AutoSizeText(item.user_name ?? "",
                        minFontSize: 6,
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
                    Text("总投注额：",
                        style:
                            TextStyle(color: Color(0xff0B213B), fontSize: 14)),
                    Text(decimalString(item.betSum ?? "0.00"),
                        style:
                            TextStyle(color: Color(0xffFF0000), fontSize: 12))
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
                    Text("有效投注额：",
                        style: const TextStyle(
                            color: Color(0xff0B213B), fontSize: 14)),
                    Text(decimalString(item.betValid ?? "0.00"),
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
                    Text("实际输赢：",
                        style:
                            TextStyle(color: Color(0xff0B213B), fontSize: 14)),
                    Text('${decimalString(item.betWin)}',
                        style:
                            TextStyle(color: Color(0xffFF0000), fontSize: 12))
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
                        style: const TextStyle(
                            color: Color(0xff0B213B), fontSize: 14)),
                    Text('${getBetStatuString(item.bet_state ?? 0)}',
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
                        style: const TextStyle(
                            color: Color(0xff0B213B), fontSize: 14)),
                    Text("${getLimitString('--', 10)}",
                        style: const TextStyle(
                            color: Color(0xff4B4B4B), fontSize: 12))
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
