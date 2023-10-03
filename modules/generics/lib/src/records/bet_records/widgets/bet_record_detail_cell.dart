import 'package:aone_common/common.dart';
import 'package:aone_common/data/model/entities/record/record_detail_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../../cashier/utils/dj_image.dart';
import '../bet_detail/bet_records_detail_dialog.dart';

class BetRecordDetailCell extends StatelessWidget {
  final DetailBets bet;

  ///true:显示游戏 subname
  ///false:显示游戏 game_name
  final bool? isSubGame;
  const BetRecordDetailCell(this.bet, {Key? key, this.isSubGame = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (_) {
              return BetRecordDetailDialog(
                record: bet,
                status: status,
                statusColor: statusColor,
              );
            });
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: 110.r,
        margin: EdgeInsets.fromLTRB(9.r, 10.r, 9.r, 0),
        padding: EdgeInsets.symmetric(horizontal: 10.r),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 48.r,
                  // color: Colors.red,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (isSubGame == true && bet.game_logo != null)
                        Padding(
                          padding: EdgeInsets.only(right: 5.r),
                          child: DjImage.network(
                            bet.game_logo!,
                            width: 30.r,
                          ),
                        ),
                      Text(
                        (isSubGame == true ? bet.game_name : bet.subName) ?? '',
                        style: TextStyle(
                            fontSize: 15.sp, color: Color(0xFF888888)),
                      ),
                      const Spacer(),
                      Text(
                        bet.betWin2FixString,
                        style: TextStyle(
                            fontSize: 15.sp, color: Color(0xFF888888)),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Color(0xFFF0F0F0),
                  thickness: 1,
                  height: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '订单编号 ${orderNumberFormatter(bet.bet_id)}'.composing,
                      maxLines: 1,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      style: textStyle,
                    ),

                    ///增大按钮的点击区域
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        onCopy(bet.bet_id ?? '');
                      },
                      child: Container(
                        width: 35.r,
                        height: 34.r,
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/images/records/copy.png',
                          width: 16.r,
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      status,
                      style: TextStyle(fontSize: 12.sp, color: statusColor),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '有效投注：${bet.betValid2FixString}',
                      style: textStyle,
                    ),
                    Text('总投注额：${bet.betSum2FixString}', style: textStyle),
                  ],
                ),
              ],
            ),
            Positioned(
              right: 62.r,
              top: 24.r,
              child: Image.asset(
                'assets/images/records/$statusImg',
                width: 55.r,
              ),
            )
          ],
        ),
      ),
    );
  }

  get statusImg {
    if (bet.win_state == 1) {
      return 'status_ying.png';
    } else if (bet.win_state == 2) {
      return 'status_shu.png';
    }
    return 'status_he.png';
  }

  get textStyle {
    return TextStyle(fontSize: 12.sp, color: const Color(0xFF969696));
  }

  onCopy(String copy) {
    Clipboard.setData(ClipboardData(text: copy));
    SmartDialog.showToast('user.center.success.copy'.tr);
  }

  String get status {
    return getCommonBetState(bet.bet_state).statusName ?? '';
  }

  Color get statusColor {
    return getCommonBetState(bet.bet_state).textColor ?? Colors.black;
  }
}
