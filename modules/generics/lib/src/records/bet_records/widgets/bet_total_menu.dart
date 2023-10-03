import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///顶部的三个menu方块
class BetTotalMenu extends StatelessWidget {
  final String totalBet;
  final String validBet;
  final String winBet;
  const BetTotalMenu(this.totalBet, this.validBet, this.winBet, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 9.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _menu(
              title: '总投注',
              money: totalBet,
              topBg: Color(0xFFAC7A5F),
              bgColors: [Color(0xFFF7E9DE), Color(0xFFF5DBCE)]),
          _menu(
              title: '有效投注',
              money: validBet,
              topBg: Color(0xFFEA7A3A).withOpacity(0.3),
              bgColors: [Color(0xFFF4E7DD), Color(0xFFF3D6C8)]),
          _menu(
              title: '输赢',
              money: winBet,
              topBg: Color(0xFF967CFB).withOpacity(0.3),
              bgColors: [Color(0xFFFE6DCFE), Color(0xFFCBAFFF)]),
        ],
      ),
    );
  }

  _menu(
      {required String title,
      required String money,
      required Color topBg,
      required List<Color> bgColors}) {
    return Container(
      width: 110.r,
      height: 50.r,
      clipBehavior: Clip.hardEdge,
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(bottom: 4.r),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: bgColors)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 64.r,
            height: 22.r,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: topBg,
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(15.r))),
            child: Text(
              title,
              style: TextStyle(fontSize: 12.sp, color: Colors.white),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              money,
              style: TextStyle(fontSize: 15.sp, color: Color(0xFF0047FF)),
            ),
          ),
        ],
      ),
    );
  }
}
