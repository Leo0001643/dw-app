import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/controller/wallet_controller.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/lc_segment_tabs.dart';
import 'package:leisure_games/ui/main/home/game_room/game_room_logic.dart';
import 'package:leisure_games/ui/main/home/game_room/utils/game_rule_util.dart';
import 'package:leisure_games/ui/main/mine/mine_logic.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/ws_game_odds_server.dart'
    as WS;

///确认注单
class ConfirmBettingDialog extends StatefulWidget {
  double total = 0;
  double inputAmt = 0;
  final GameRoomLogic logic;

  ConfirmBettingDialog(this.logic, this.total, this.inputAmt, {super.key});

  @override
  State<StatefulWidget> createState() => StateConfirmBettingDialog();
}

class StateConfirmBettingDialog extends State<ConfirmBettingDialog>
    with SingleTickerProviderStateMixin {
  var payWays = ["RMB", "USDT"];
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: payWays.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.92.sw,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: buildHeadColor(),
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                topRight: Radius.circular(12.r),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "请确认注单",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.white,
                  ),
                ),
                buildTimer(),
              ],
            ),
          ),
          Container(
            height: 42.h,
            padding: EdgeInsets.symmetric(
              horizontal: 15.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildMonney(),
                LCSegmentTabs(
                  length: payWays.length,
                  width: 88.w,
                  labelColor: Colors.white,
                  unselectedLabelColor: ColorX.text0917(),
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(15.r),
                  tabBarColor: ColorX.cardBg6(),
                  indicatorWeight: 0,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: ColorX.color_fc243b,
                  labelPadding: EdgeInsets.zero,
                  tabs: payWays.map((e) {
                    return Text(
                      "  $e  ",
                      style: TextStyle(fontSize: 12.sp),
                    );
                    // return Container(
                    //   width: 42.w,
                    //   height: 20.w,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10.w),
                    //     color: payWays[_tabController.index]==e? ColorX.color_fc243b:ColorX.cardBg6(),
                    //   ),
                    //   child: Text(e,style: TextStyle(fontSize: 12.sp),),
                    // );
                  }).toList(),
                  tabController: _tabController,
                ),
              ],
            ),
          ),
          Divider(
            height: 2.h,
            color: ColorX.color_10_949,
          ),
          Container(
            height: 42.h,
            padding: EdgeInsets.symmetric(
              horizontal: 15.w,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 25,
                  child: Text(
                    "选中号码",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: ColorX.text0917(),
                    ),
                  ),
                ),
                Expanded(
                  flex: 35,
                  child: Text(
                    "赔率",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: ColorX.text0917(),
                    ),
                  ),
                ),
                Expanded(
                  flex: 40,
                  child: Text(
                    "金额",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: ColorX.text0917(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 2.h,
            color: ColorX.color_10_949,
          ),
          buildListItem(),
          Divider(
            height: 2.h,
            color: ColorX.color_10_949,
          ),
          SizedBox(
            height: 8.h,
          ),
          buildTotalTips(),
          SizedBox(
            height: 8.h,
          ),
          Divider(
            height: 2.h,
            color: ColorX.color_10_949,
          ),
          buildFootButton(),
          SizedBox(height:12.w ,)
        ],
      ),
    );
  }

  Widget buildBetItem(WS.Content content,GameRoomLogic logic) {
    print("======>212${jsonEncode(content.toJson())}");
    String betName = GameRuleUtil.getBetTypeName(content.type ?? "");
    // String partMsg = "x"+ GameRuleUtil.getMoneySymbol(content?.moneyType??"CNY");
    // String betOdds="";

    return Container(
      height: 42.h,
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 25,
            child: Text(
              "${betName ?? ""}",
              style: TextStyle(
                fontSize: 14.sp,
                color: ColorX.text0917(),
              ),
            ),
          ),
          Expanded(
            flex: 35,
            child: Text(
              "${content.play}",
              style: TextStyle(
                fontSize: 14.sp,
                color: ColorX.color_fc243b,
              ),
            ),
          ),
          Expanded(
            flex: 40,
            child: Row(
              children: [
                Text(
                  "x",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: ColorX.text0917(),
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorX.cardBg3(),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                    child: Stack(
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: WidgetUtils().buildTextField(73.w, 30.w, 14,
                                ColorX.text0917(), "${content.money}")),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "¥",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: ColorX.text586(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    logic.removeSelect(content);
                  },
                  child: Icon(
                    Icons.delete_forever_rounded,
                    size: 20.r,
                    color: ColorX.icon586(),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Color> buildHeadColor() {
    var colors = [Color(0xffff5163), Color(0xfffd273e)];
    switch (widget.logic.state.roomType.value) {
      case 1:
        colors = [Color(0xffff5163), Color(0xfffd273e)];
        break;
      case 2:
        colors = [
          Color(0xff5f6e88),
          Color(0xff363f57),
        ];
        break;
      case 3:
        colors = [
          Color(0xff88705f),
          Color(0xff574436),
        ];
        break;
    }
    return colors;
  }

  Color buildBtnColor() {
    var color = ColorX.color_fc243b;
    switch (widget.logic.state.roomType.value) {
      case 1:
        color = ColorX.color_fc243b;
        break;
      case 2:
        color = Color(0xff363f57);
        break;
      case 3:
        color = ColorX.color_574436;
        break;
    }
    return color;
  }

  buildTimer() {
    return GetBuilder<GameRoomLogic>(builder: (logic) {
      String termData = GameRuleUtil.getSSB(logic.term.value, year: "");
      return Text(
        Intr().dixqi([termData]),
        style: TextStyle(
          fontSize: 14.sp,
          color: Colors.white,
        ),
      );
    });
  }

  buildTips() {
    return GetBuilder<GameRoomLogic>(builder: (logic) {
      MineLogic mineLogic = Get.find<MineLogic>();

      return Row(
        children: [
          Text.rich(TextSpan(children: [
            TextSpan(
              text: "若中奖, 奖金",
              style: TextStyle(
                fontSize: 12.sp,
                color: ColorX.text586(),
              ),
            ),
            TextSpan(
              text: "${logic.sumOddsData()}",
              style: TextStyle(
                fontSize: 12.sp,
                color: ColorX.color_fc243b,
              ),
            ),
            TextSpan(
              text: ", 盈利 ",
              style: TextStyle(
                fontSize: 12.sp,
                color: ColorX.text586(),
              ),
            ),
            TextSpan(
              text: "¥${logic.sumOddsData()-logic.sumData()}",

              style: TextStyle(
                fontSize: 12.sp,
                color: ColorX.color_fc243b,
              ),
            ),
          ])),
        ],
      );
    });
  }

  buildMonney() {
    return GetBuilder<WalletController>(

        builder: (logic) {
      MineLogic mineLogic = Get.find<MineLogic>();
      return Row(
        children: [
          Text(
            Intr().yue_,
            style: TextStyle(
                fontSize: 15.sp,
                color: ColorX.text0917(),
                fontWeight: FontWeight.w500),
          ),
          Obx(() {
            return Text(
              AppData.wallet()
                  ? "¥${mineLogic.state.cnyBal.value.money?.em()}"
                  : "₮${mineLogic.state.usdtBal.value.money.em()}",
              style: TextStyle(
                fontSize: 18.sp,
                color: ColorX.text0917(),
                fontWeight: FontWeight.w600,
              ),
            );
          }),
        ],
      );
    });
  }

  buildListItem() {
    return GetBuilder<GameRoomLogic>(
        id:"bettingList",
        builder: (logic) {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: logic.selectBettingList.length,
          itemBuilder: (context, index) {
            WS.Content content = logic.selectBettingList[index];

            return buildBetItem(content,logic);
          });
    });
  }

  buildTotalTips() {
    return GetBuilder<GameRoomLogic>(builder: (logic) {
      return Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            buildTips(),
            SizedBox(
              height: 8.h,
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                text: "注单: ",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: ColorX.text0917(),
                ),
              ),
              TextSpan(
                text: "${logic.selectBettingList.length}",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: ColorX.color_fc243b,
                ),
              ),
              TextSpan(
                text: ", 总金额 ",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: ColorX.text0917(),
                ),
              ),
              TextSpan(
                text: "¥${logic.sumData()}",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: ColorX.color_fc243b,
                ),
              ),
            ])),
          ],
        ),
      );
    });
  }

  buildFootButton() {
    return GetBuilder<GameRoomLogic>(builder: (logic){

      return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WidgetUtils().buildElevatedButton("取消", 135.w, 40.h,
                bg: ColorX.cardBg3(),
                textColor: ColorX.text586(), onPressed: () {
                  Navigator.of(context).pop(false);
                }),
            SizedBox(
              width: 10.w,
            ),
            WidgetUtils().buildElevatedButton("确定", 135.w, 40.h,
                bg: buildBtnColor(),
                textColor: Colors.white, onPressed: () {
                  logic.sumbitBets(logic.sumData());
                  Navigator.of(context).pop(true);
                })
          ],
        ),
      );
    });
  }
}
