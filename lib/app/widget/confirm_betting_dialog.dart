import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/socket/ws_bet_entity.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/lc_segment_tabs.dart';
import 'package:leisure_games/ui/bean/change_main_page_event.dart';
import 'package:leisure_games/ui/main/home/game_room/game_room_logic.dart';
import 'package:leisure_games/ui/main/home/game_room/utils/format_util.dart';
import 'package:leisure_games/ui/main/home/game_room/utils/game_rule_util.dart';
import 'package:leisure_games/ui/main/home/home_logic.dart';

///确认注单
class ConfirmBettingDialog extends StatefulWidget {
  double total = 0;
  double inputAmt = 0;
  WsBetEntity betInfo;
  final bool optional;///区分自选或跟投
  final GameRoomLogic logic;

  ConfirmBettingDialog(this.logic, this.total, this.inputAmt,this.betInfo,this.optional, {super.key});

  @override
  State<StatefulWidget> createState() => StateConfirmBettingDialog();
}

class StateConfirmBettingDialog extends State<ConfirmBettingDialog>
    with SingleTickerProviderStateMixin {
  var payWays = ["CNY", "USDT"];
  late TabController _tabController;
  ///钱包类型切换
  int index = AppData.wallet() ? 0 : 1;
  double totalMoney = 0;

  var odds = RxList<WsBetContent>.empty(growable: true);

  @override
  void initState() {
    totalMoney = widget.total;
    odds.assignAll(widget.betInfo.content ?? []);
    odds.refresh();
    _tabController = TabController(initialIndex: index, length: payWays.length, vsync: this);
    _tabController.addListener(() {
      index=_tabController.index;
      setState(() {
      });
    });
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
      width: 0.90.sw,
      height: 0.55.sh,
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
                  Intr().qingquerenzhudan,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.white,
                  ),
                ),
                Obx(() {
                  return buildTerm(Get.find<GameRoomLogic>().term.value);
                }),
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
                    Intr().xuanzhonghaoma,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: ColorX.text0917(),
                    ),
                  ),
                ),
                Expanded(
                  flex: 35,
                  child: Text(
                    Intr().peilv,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: ColorX.text0917(),
                    ),
                  ),
                ),
                Expanded(
                  flex: 40,
                  child: Text(
                    Intr().jine,
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

  Widget buildBetItem(WsBetContent content,GameRoomLogic logic) {
    print("======>212${jsonEncode(content.toJson())}");
    // String betName = GameRuleUtil.getBetTypeName(content.type ?? "");
    // String partMsg = "x"+ GameRuleUtil.getMoneySymbol(content?.moneyType??"CNY");
    var betOdds= content.d.em();
    if(unEmpty(content.e)){
      betOdds = "$betOdds/${content.e.em()}";
    }
    var betName = "";
    if(isEmpty(content.showName)){
      betName = GameRuleUtil.getBetTypeName(content.a.em());
      if(unEmpty(content.b)){
        if(isEmpty(betName)){
          betName = content.b.em();
        }else {
          betName = "$betName-${content.b.em()}";
        }
      }
    } else {
      betName = content.showName.em();
    }

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
            child: Text(betName, style: TextStyle(fontSize: 14.sp, color: ColorX.text0917(),),),
          ),
          Expanded(
            flex: 30,
            child: Text(betOdds, style: TextStyle(
                fontSize: 14.sp,
                color: ColorX.color_fc243b,
              ),
            ),
          ),
          Expanded(
            flex: 45,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "x",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: ColorX.text0917(),
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorX.cardBg(),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    height: 35.h,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        SizedBox(width: 10.w,),
                        Text(
                          index==0?"¥":"₮",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: ColorX.text586(),
                          ),
                        ),
                        Expanded(
                          child: WidgetUtils().buildTextField(null, 35.h, 13.sp, ColorX.text0917(), "",
                              inputType: TextInputType.number,
                              inputFormatters: [LengthLimitingTextInputFormatter(9),],
                              defText: content.c.em(),backgroundColor: Colors.transparent,onChanged: (v){
                            content.c = v;
                            odds.refresh();
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // logic.removeSelect(content);
                    odds.remove(content);
                    odds.refresh();
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

  Widget buildTerm(String? term) {
    String termData = GameRuleUtil.getSSB(term.em(aft: '--'), year: "");
    return Text(
      termData,
      style: TextStyle(
        fontSize: 14.sp,
        color: Colors.white,
      ),
    );
  }

  buildTips() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text.rich(TextSpan(children: [
        TextSpan(
          text: Intr().ruozhongjiang,
          style: TextStyle(
            fontSize: 12.sp,
            color: ColorX.text586(),
          ),
        ),
        TextSpan(
          text: rakebackFormat(sumOddsData()),
          style: TextStyle(
            fontSize: 12.sp,
            color: ColorX.color_fc243b,
          ),
        ),
        TextSpan(
          text: Intr().yinli,
          style: TextStyle(
            fontSize: 12.sp,
            color: ColorX.text586(),
          ),
        ),
        TextSpan(
          text: " ${index==0?"¥":"₮"}${rakebackFormat(sumOddsData()-totalMoney)}",
          style: TextStyle(
            fontSize: 12.sp,
            color: ColorX.color_fc243b,
          ),
        ),
      ])),
    );
  }

  Widget buildMonney() {
    var homeLogic = Get.find<HomeLogic>();
    return Row(
      children: [
        Text(
          Intr().yue_,
          style: TextStyle(
              fontSize: 15.sp,
              color: ColorX.text0917(),
              fontWeight: FontWeight.w500),
        ),
        Text(
          index == 0
              ? "¥${homeLogic.state.cnyBal.value.money.em()}"
              : "₮${homeLogic.state.usdtBal.value.money.em()}",
          style: TextStyle(
            fontSize: 18.sp,
            color: ColorX.text0917(),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget buildListItem() {
    return Expanded(
      child: Obx(() {
        return ListView.builder(
            shrinkWrap: true,
            itemCount: odds.length,
            itemBuilder: (context, index) {
              var content = odds[index];
              return buildBetItem(content,widget.logic);
            });
      }),
    );
  }

  Widget buildTotalTips() {
    return Obx(() {
      totalMoney = sumData();
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
        ),
        child: Column(
          children: [
            buildTips(),
            SizedBox(
              height: 8.h,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text.rich(TextSpan(children: [
                TextSpan(
                  text: Intr().zhudan_,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: ColorX.text0917(),
                  ),
                ),
                TextSpan(
                  text: "${odds.em()}",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: ColorX.color_fc243b,
                  ),
                ),
                TextSpan(
                  text: Intr().zongjine,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: ColorX.text0917(),
                  ),
                ),
                TextSpan(
                  text: " ${index==0?"¥":"₮"}${rakebackFormat(totalMoney)}",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: ColorX.color_fc243b,
                  ),
                ),
              ])),
            ),
          ],
        ),
      );
    });
  }

  buildFootButton() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          WidgetUtils().buildElevatedButton(Intr().cancel, 135.w, 40.h,
              bg: ColorX.cardBg3(),
              textColor: ColorX.text586(), onPressed: () {
                Navigator.of(context).pop(false);
              }),
          SizedBox(
            width: 10.w,
          ),
          WidgetUtils().buildElevatedButton(Intr().confirm, 135.w, 40.h,
              bg: buildBtnColor(),
              textColor: Colors.white, onPressed: () {
                var homelogic = Get.find<HomeLogic>();

                double selfMoney = (index == 0 ? homelogic.state.cnyBal.value.money:homelogic.state.usdtBal.value.money ) ?? 0;
                if(selfMoney < totalMoney) {
                  DialogUtils().showMessageDialog(context,Intr().yuebuzhuqingxianchongzhi,title:Intr().com_tip,onConfirm: (){
                    Get.back();
                    eventBus.fire(ChangeMainPageEvent(2));
                    Get.until((ModalRoute.withName(Routes.main)));
                  });
                  return;
                }

            ///这里区分一下，如果是自选 需要实时取房间里的期号，如果不是要取投注信息里面的，防止投注时间过长导致的封盘过期
                var term = Get.find<GameRoomLogic>().term.value;//widget.optional ?  : widget.betInfo.term;
                widget.logic.sumbitBets(index == 0? "CNY":"USDT",term,odds);
                Navigator.of(context).pop(true);
              })
        ],
      ),
    );
  }


  double sumData(){
    double total=0;
    for(WsBetContent content in odds) {
      total+= double.tryParse(content.c.em()) ?? 0;
    }
    return total;
  }

  double sumOddsData(){
    double total=0;
    for(WsBetContent content  in odds) {
      total += (double.tryParse(content.c.em()) ?? 0) * double.parse(content.d.em());
    }
    return total;
  }


}
