import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/ui/main/home/game_room/game_room_logic.dart';
import 'package:leisure_games/ui/main/home/game_room/widget/game_rcently_bet_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'lottery_result_logic.dart';

///开奖结果
class LotteryResultPage extends StatefulWidget {
  const LotteryResultPage({Key? key}) : super(key: key);

  @override
  State<LotteryResultPage> createState() => _LotteryResultPageState();
}

class _LotteryResultPageState extends State<LotteryResultPage> with AutomaticKeepAliveClientMixin  {
  final logic = Get.find<LotteryResultLogic>();
  final state = Get.find<LotteryResultLogic>().state;
  late RefreshController _refreshController;


  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _refreshController= RefreshController();
    super.initState();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorX.pageBg2(),
      child:GetBuilder<GameRoomLogic>(
          id: GameRoomLogic.gameRoomCompute,
          builder: (logic) {
            return Container(
              height: 1.sh,
              width: 1.sw,
              margin: EdgeInsets.only(top: 5.h),
              decoration: BoxDecoration(
                // color: ColorX.cardBg5(),
                color:Color(0xFFF7F8FB),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15.r), topLeft: Radius.circular(15.r)),
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: logic.recentlyWSLotteryEntityData.length,
                itemBuilder: (context, index) {
                  return GameRecentlyBetWidget(logic.recentlyWSLotteryEntityData[index]);
                },
              ),
            );
          }
      )
    );
  }


  Widget buildDrawNum(String num) {
    return Container(
      width: 24.r,
      height: 24.r,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ColorX.cardBg2(),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Text(
        num,
        style: TextStyle(
            fontSize: 14.sp,
            color: ColorX.text0917(),
            fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget buildDrawMark(String mark) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Text(
        mark,
        style: TextStyle(
            fontSize: 18.sp,
            color: ColorX.text0917(),
            fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget buildDrawResult(String result) {
    return Container(
      width: 24.r,
      height: 24.r,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ColorX.color_10_fc2,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Text(
        result,
        style: TextStyle(
            fontSize: 14.sp,
            color: ColorX.color_fc243b,
            fontWeight: FontWeight.w600),
      ),
    );
  }


}