import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../bill_records/widgets/record_dialog_wrapper.dart';
import '../bet_records_controller.dart';

///投注列表分类cell的标题
class BetDropCellTitle extends StatelessWidget {
  const BetDropCellTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(
        fontSize: 14.sp, color: Color(0xFF888888), fontWeight: FontWeight.w600);
    return Container(
      width: 324.r,
      height: 40.r,
      margin: EdgeInsets.only(left: 9.r, right: 9.r),
      child: Row(
        children: [
          betLittleItem('游戏', style: style),
          betLittleItem('总投注', style: style),
          betLittleItem('有效投注', style: style),
          betLittleItem('输赢', style: style),
        ],
      ),
    );
  }
}

///投注列表分类cell,点击显示详情厂商列表
class BetDropCell extends StatefulWidget {
  final List<Bets> betList;
  const BetDropCell(this.betList, {Key? key}) : super(key: key);

  @override
  State<BetDropCell> createState() => _BetDropCellState();
}

class _BetDropCellState extends State<BetDropCell> {
  bool isShowDrop = false;

  String name = '';
  double betTotal = 0;
  double betValid = 0;
  double betWin = 0;

  @override
  void initState() {
    super.initState();

    for (Bets bet in widget.betList) {
      betTotal = betTotal + bet.betSumDouble;
      betValid = betValid + bet.betValidDouble;
      betWin = betWin + bet.betWinDouble;
      if (name.isEmpty) {
        name = bet.typeTitle;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(9.5.r, 0, 9.5.r, 10.r),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
      child: Column(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              ///分类的投注记录点击
              Bets bet = widget.betList.first;
              BetRecordsController.to.goBetTypeList(bet);
            },
            child: SizedBox(
              height: 40.r,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// (375-9-9-32)
                  SizedBox(
                    width: 324.r,
                    child: Row(
                      children: [
                        betLittleItem(name),
                        betLittleItem(betTotal.toString(), isNumberType: true),
                        betLittleItem(betValid.toString(), isNumberType: true),
                        betLittleItem(betWin.toString(), isNumberType: true),
                      ],
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      setState(() {
                        isShowDrop = !isShowDrop;
                      });
                    },
                    child: Container(
                      width: 32.r,
                      height: 40.r,
                      // color: Colors.red,
                      alignment: Alignment.center,
                      child: Image.asset(
                        isShowDrop
                            ? 'assets/images/records/arrow_up.png'
                            : 'assets/images/records/arrow_down.png',
                        width: 12.r,
                        height: 8.r,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isShowDrop)
            ...widget.betList
                .map(
                  (bet) => GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      Get.toNamed(Routes.betHistoryDetail, arguments: bet);
                    },
                    child: Container(
                      width: 324.r,
                      height: 40.r,
                      margin: EdgeInsets.only(right: 32.r),
                      child: Row(
                        children: [
                          betLittleItem(bet.name_cn),
                          betLittleItem(bet.betSum),
                          betLittleItem(bet.betValid),
                          betLittleItem(bet.betWin),
                        ],
                      ),
                    ),
                  ),
                )
                .toList()
        ],
      ),
    );
  }
}

betLittleItem(String? title, {TextStyle? style, bool? isNumberType}) {
  if (isNumberType == true) {
    title = filterRecordNumber(title);
  }
  return Container(
      width: 81.r,
      // color: Colors.red,
      alignment: Alignment.center,
      child: Text(
        title ?? '',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: style ?? TextStyle(fontSize: 12.sp, color: Color(0xFF888888)),
      ));
}
