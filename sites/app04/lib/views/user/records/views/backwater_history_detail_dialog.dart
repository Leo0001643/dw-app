import 'package:aone_common/common.dart';
import 'package:aone_common/utils/history.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../theme/color_schema.dart';

class BackwaterHistoryDetailDialog extends Dialog {
  final BackwaterItem item;

  const BackwaterHistoryDetailDialog({required this.item, Key? key})
      : super(key: key);

  //  onTap: () => {clickListener?.onConfirm(), Navigator.of(context).pop()},

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(left: 25.r, right: 25.r),
        padding:
            EdgeInsets.only(top: 10.r, left: 15.r, bottom: 15.r, right: 15.r),
        decoration: BoxDecoration(
            color: Color(0xffffffff), borderRadius: BorderRadius.circular(8.r)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 37.5,
              alignment: Alignment.center,
              decoration: const BoxDecoration(color: Color(0xffffffff)),
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
                // width: 316,
                child: Row(
              children: [
                // SizedBox(
                //   width: 16,
                // ),
                Text("user.center.ordernum".tr,
                    style: TextStyle(color: Color(0xff0B213B), fontSize: 14)),
                Text(getLimitString(item.ordernumber ?? "", 20),
                    style: TextStyle(color: Color(0xff4B4B4B), fontSize: 12)),
                InkWell(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: item.ordernumber));
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

            //线条
            Container(
              margin:
                  EdgeInsets.only(top: 5, left: 10.r, bottom: 5, right: 10.r),
              height: 0.5,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: stringToColor('0B213B', 0.1),
              ),
            ),

            Container(
                // width: 316,
                child: Row(
              children: [
                const Text("返水时间：",
                    style: TextStyle(color: Color(0xff0B213B), fontSize: 14)),
                Text(timeStampIntToSecond(item.upTime ?? 0),
                    style:
                        const TextStyle(color: Color(0xff4B4B4B), fontSize: 12))
              ],
            )),
            //线条
            Container(
              margin:
                  EdgeInsets.only(top: 5, left: 10.r, bottom: 5, right: 10.r),
              height: 0.5,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: stringToColor('0B213B', 0.1),
              ),
            ),

            Container(
                // width: 316,
                child: Row(
              children: [
                const Text("用户账户：",
                    style: TextStyle(color: Color(0xff0B213B), fontSize: 14)),
                Text(item.user_name ?? '',
                    style:
                        const TextStyle(color: Color(0xffFF0000), fontSize: 12))
              ],
            )),
            //线条
            Container(
              margin:
                  EdgeInsets.only(top: 5, left: 10.r, bottom: 5, right: 10.r),
              height: 0.5,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: stringToColor('0B213B', 0.1),
              ),
            ),

            Container(
                // width: 316,
                child: Row(
              children: [
                const Text("返水金额：",
                    style: TextStyle(color: Color(0xff0B213B), fontSize: 14)),
                Text(decimalString(item.userFsTotal ?? "0.00"),
                    style: TextStyle(color: Color(0xffFF0000), fontSize: 12))
              ],
            )),
            //线条
            Container(
              margin:
                  EdgeInsets.only(top: 5, left: 10.r, bottom: 5, right: 10.r),
              height: 0.5,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: stringToColor('0B213B', 0.1),
              ),
            ),

            Container(
                child: Row(
              children: [
                const Text("返水比例：",
                    style: TextStyle(color: Color(0xff0B213B), fontSize: 14)),
                Text('${double.parse(decimalString(item.user_fs_bl)) * 100}%',
                    style:
                        const TextStyle(color: Color(0xffFF0000), fontSize: 12))
              ],
            )),
            //线条
            Container(
              margin:
                  EdgeInsets.only(top: 5, left: 10.r, bottom: 5, right: 10.r),
              height: 0.5,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: stringToColor('0B213B', 0.1),
              ),
            ),

            Container(
                // width: 322.w,
                child: Row(
              children: [
                const Text("总投注额：",
                    style: TextStyle(color: Color(0xff0B213B), fontSize: 14)),
                Text('${decimalString(item.betSum ?? "0.00")}',
                    style: TextStyle(
                        color: stringToColor('ff0000', 0.7), fontSize: 12)),
              ],
            )),
            //线条
            Container(
              margin:
                  EdgeInsets.only(top: 5, left: 10.r, bottom: 5, right: 10.r),
              height: 0.5,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: stringToColor('0B213B', 0.1),
              ),
            ),

            Container(
                // width: 322.w,
                child: Row(
              children: [
                const Text("有效投注额：",
                    style: TextStyle(color: Color(0xff0B213B), fontSize: 14)),
                Text('${decimalString(item.bet_valid)}',
                    style:
                        const TextStyle(color: Color(0xffFF0000), fontSize: 12))
              ],
            )),
            //线条
            Container(
              margin:
                  EdgeInsets.only(top: 5, left: 10.r, bottom: 5, right: 10.r),
              height: 0.5,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: stringToColor('0B213B', 0.1),
              ),
            ),

            Container(
                // width: 316.w,
                child: Row(
              children: [
                const Text("实际输赢：",
                    style: TextStyle(color: Color(0xff0B213B), fontSize: 14)),
                Text('${decimalString(item.bet_win ?? "0.00")}',
                    style: TextStyle(
                        color: stringToColor('ff0000', 0.7), fontSize: 12)),
              ],
            )),
            //线条
            Container(
              margin:
                  EdgeInsets.only(top: 5, left: 10.r, bottom: 5, right: 10.r),
              height: 0.5,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: stringToColor('0B213B', 0.1),
              ),
            ),

            Container(
                // width: 322,
                child: Row(
              children: [
                Text("状态：",
                    style: TextStyle(color: Color(0xff0B213B), fontSize: 14)),
                Text(
                    '${getBackStatuString(
                      item.state ?? 8,
                    )}',
                    style: TextStyle(
                        color: getBackStatusColor(item.state!), fontSize: 12))
              ],
            )),
            Container(
              margin:
                  EdgeInsets.only(top: 5, left: 10.r, bottom: 5, right: 10.r),
              height: 0.5,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: stringToColor('0B213B', 0.1),
              ),
            ),

            Container(
                // width: 322,
                child: Row(
              children: [
                const Text("备注：",
                    style: TextStyle(color: Color(0xff0B213B), fontSize: 14)),
                Text("${item.remarks ?? '--'}",
                    style:
                        const TextStyle(color: Color(0xff4B4B4B), fontSize: 12))
              ],
            )),
          ],
        ),
      ),
    );
  }
}
