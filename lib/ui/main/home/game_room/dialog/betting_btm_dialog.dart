
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/socket/ws_bet_entity.dart';
import 'package:leisure_games/app/utils/audio_utils.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/lc_segment_tabs.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/odds_content.dart';
import 'package:leisure_games/ui/main/home/game_room/dialog/betting_child_page.dart';
import 'package:leisure_games/ui/main/home/game_room/dialog/betting_tema_page.dart';
import 'package:leisure_games/ui/main/home/game_room/game_room_logic.dart';
import 'package:leisure_games/ui/main/home/game_room/text_timer/text_item_logic.dart';

import '../utils/game_rule_util.dart';

class BettingBtmDialog extends StatefulWidget {
  final GameRoomLogic logic;
  BettingBtmDialog(this.logic, {super.key});

  @override
  State<StatefulWidget> createState() => StateBettingBtmDialog();

}

class StateBettingBtmDialog extends State<BettingBtmDialog> with SingleTickerProviderStateMixin{
  static const riKey1 = Key('__RIKEY1__');
  static const riKey2 = Key('__RIKEY2__');
  static const riKey3 = Key('__RIKEY3__');
  static const riKey4 = Key('__RIKEY4__');

  late TabController _tabController;
  var tabs = [Intr().tema,Intr().diyiqiu,Intr().dierqiu,Intr().disanqiu,];

  var chips = [ImageX.chip1,ImageX.chip5,ImageX.chip10,ImageX.chip50,ImageX.chip100,ImageX.chip500,ImageX.chip1000,
    ImageX.chip5000,ImageX.chip10000,];

  var chipIndex = (-1).obs;
  ///选择的筹码
  var selectChip = RxList<double>.empty(growable: true);
  ///选择的类型
  RxList<OddsContent> selectBetting=<OddsContent>[].obs;

  var inputAmt = "".obs;

  var pageIndex = 0.obs;
  var contents = RxList<Widget>.empty(growable: true);

  @override
  void initState() {
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      pageIndex.value = _tabController.index;
    });
    contents.assignAll([BettingTemaPage(0,key: riKey1,selectBetting,inputAmt,Intr().tema),
      BettingChildPage(1,key: riKey2,selectBetting,inputAmt,Intr().diyiqiu),
      BettingChildPage(2,key: riKey3,selectBetting,inputAmt,Intr().dierqiu),
      BettingChildPage(3,key: riKey4,selectBetting,inputAmt,Intr().disanqiu),]);

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
      height: 0.83.sh,
      width: 1.sw,
      decoration: BoxDecoration(
        // color: ColorX.pageBg3(),
        borderRadius: BorderRadius.only(topRight: Radius.circular(15.r),topLeft: Radius.circular(15.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h,),
          Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: ColorX.cardBg(),width: 1.w),
                borderRadius: BorderRadius.circular(10.r),
              ),
              height: 95.h,
              width: 345.w,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(buildRoomHeadType()),fit: BoxFit.fill),
                    ),
                    height: 45.h,
                    alignment: Alignment.center,
                    // padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 12.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 15.w,),
                        Obx(() {
                          String termData=GameRuleUtil.getSSB(widget.logic.term.value,year:"");
                          return Text(termData,style: TextStyle(fontSize: 14.sp,color: Colors.white,fontWeight: FontWeight.w600),);
                        }),
                        Expanded(child: Container()),
                        getTimer(),
                        SizedBox(width: 15.w,),
                      ],
                    ),
                  ),
                  LCSegmentTabs(
                    length: tabs.length,
                    tabController: _tabController,
                    height: 40.h,
                    width: 340.w,
                    border: Border.all(color: Colors.transparent),
                    tabBarColor: Colors.transparent,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorPadding: EdgeInsets.only(top: 33.h,left: 10.w,right: 10.w,bottom: 3.r),
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.r),
                      color: buildTextColor(),
                    ),
                    labelColor: buildTextColor(),
                    unselectedLabelColor: ColorX.text0917(),
                    tabs: tabs.map((e) =>
                        Text(e,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w600),),
                    ).toList(),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              return IndexedStack(
                index: pageIndex.value,
                children: contents,
              );
            }),
          ),
          Container(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      children: [
                        SizedBox(height: 20.h,),
                        GFCard(
                          height: 110.h,
                          margin: EdgeInsets.zero,
                          padding: EdgeInsets.zero,
                          elevation: 3.r,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(20.r),topLeft: Radius.circular(20.r),),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,left: 0,right: 0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                height: 70.h,
                                alignment: Alignment.bottomLeft,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Obx(() {
                                    return Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: chips.map((e) {
                                        var index = chips.indexOf(e);
                                        var btm = chipIndex.value == index ? 20.h:0.0;
                                        var top = chipIndex.value == index ? 0.0:20.h;
                                        return buildChipItem(e,index,top,btm);
                                      }).toList(),
                                    );
                                  }),
                                ),
                              ),
                              SizedBox(height: 15.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(color: ColorX.text0917(),width: 1.r),
                                        borderRadius: BorderRadius.circular(10.r)
                                    ),
                                    margin: EdgeInsets.only(left: 10.w),
                                    child: Obx(() {
                                      return WidgetUtils().buildTextField(101.w, 35.h, 12.sp, ColorX.color_949eb9, Intr().xiazhujine,
                                          backgroundColor: ColorX.cardBg(),hintColor: ColorX.text586(),
                                          defText: inputAmt.value,inputType: TextInputType.number,onChanged: (v){
                                            inputAmt.value = v;
                                          });
                                    }),
                                  ),
                                  SizedBox(width: 10.w,),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(Intr().zongji,style: TextStyle(fontSize: 12.sp,color: ColorX.text0917(),fontWeight:FontWeight.w700,),),
                                        Obx(() {
                                          return Text("${selectBetting.length * DataUtils.formatDouble(inputAmt.value)}",style: TextStyle(fontSize: 14.sp,fontWeight:FontWeight.w700,color: buildTextColor(),),);
                                        })
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 10.w,),
                                  InkWell(
                                    onTap: (){
                                      inputAmt.value = "";
                                      chipIndex.value = -1;
                                      selectChip.clear();
                                      selectBetting.clear();
                                      selectBetting.refresh();
                                    },
                                    child: Container(
                                      width: 48.w,
                                      height: 40.h,
                                      decoration: BoxDecoration(color: ColorX.cardBg3(),borderRadius: BorderRadius.circular(10.r)),
                                      child:  WidgetUtils().buildImage(ImageX.emptyicon,20.w,28.h,fit: BoxFit.scaleDown,),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 30.h),
                          alignment: Alignment.center,
                          width: 90.w,
                          child: WidgetUtils().buildElevatedButton(Intr().touzhu, 62.w, 88.h, textSize:16.sp, bg: buildTextColor(), onPressed: (){
                            TextItemLogic textItemLogic = Get.find<TextItemLogic>();
                            if (Intr().fengpanzhong == textItemLogic.state.text_timer.value) {
                              showToast(Intr().fengpanzhong);
                              return;
                            }
                            if (selectBetting.isEmpty) {
                              showToast(Intr().qingxuanzhetouzhuxm);
                              return;
                            }
                            if (DataUtils.formatDouble(inputAmt.value) == 0.0) {
                              showToast(Intr().xiazhujinewk);
                              return;
                            }
                            var totalMony = selectBetting.length * DataUtils.formatDouble(inputAmt.value);
                            var betInfo = WsBetEntity();
                            betInfo.term = widget.logic.term.value;
                            var odds = List<WsBetContent>.empty(growable: true);
                            selectBetting.forEach((element) {
                              var bc = WsBetContent();
                              bc.a = element.type;
                              bc.b = element.name;
                              bc.c = inputAmt.value;
                              bc.d = element.play;
                              bc.e = element.play2;
                              odds.add(bc);
                            });
                            betInfo.content = odds;
                            loggerArray(["打印投注信息",betInfo.toJson()]);
                            Navigator.pop(context);
                            ///确认投注
                            DialogUtils().showConfirmBetDialog(context, widget.logic,betInfo,total: totalMony,
                                inputAmt:DataUtils.formatDouble(inputAmt.value), true);
                          }),
                        ),
                      ],
                    ),
                  )
                ],
              ),
          ),
        ],
      ),
    );
  }


  String buildRoomHeadType() {
    switch(widget.logic.state.roomType.value){
      case 2:
        return ImageX.ic_2room_head;
      case 3:
        return ImageX.ic_3room_head;
      default:
        return ImageX.ic_1room_head;
    }
  }


  Widget getTimer() {
    // 在这里构建你的 UI，使用 roomInf 数据
    return GetBuilder<TextItemLogic>(
        id: TextItemLogic.id_textTimerItem,
        builder: (lgc) {
          // print("开始刷新logic");
          String result = "";
          if (Intr().fengpanzhong == lgc.state.text_timer.value) {
            result = Intr().fengpanzhong;
          } else {
            result = lgc.subToTime(lgc.state.text_timer.value);
          }
          return Container(
            height: 28.h,
            padding: EdgeInsets.symmetric(
              horizontal: 4.w,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4.w)), color: Colors.white12),
            child: Text(result, style: TextStyle(fontWeight: FontWeight.w900, color: Colors.white, fontSize: 14.sp,
            )),
          );
        });
  }


  Color buildTextColor(){
    var color = ColorX.color_fc243b;
    switch(widget.logic.state.roomType.value){
      case 1:
        color = ColorX.color_fc243b;
        break;
      case 2:
        color = ColorX.color_70b6ff;
        break;
      case 3:
        color = ColorX.color_ffe0ac;
        break;
    }
    return color;
  }


  // Widget buildDrawTime(String time) {
  //   return Container(
  //     alignment: Alignment.center,
  //     decoration: BoxDecoration(
  //       color: ColorX.color_10_fff,
  //       border: Border.all(color: Colors.white,width: 1.r),
  //       borderRadius: BorderRadius.circular(5.r),
  //     ),
  //     child: Text(time,style: TextStyle(fontSize: 16.sp,color: Colors.white,fontWeight: FontWeight.w600),),
  //   );
  // }


  Widget buildChipItem(String icon, int index, double top, double btm) {
    return InkWell(
      onTap: () {
        chipIndex.value = index;
        selectChip.add(switchChipMonney(index));
        var amt = 0.0;
        ///提示音
        if(AppData.promptTone()){ AudioUtils().playBetSelect(); }
        selectChip.forEach((element) {
          amt += element;
        });
        inputAmt.value = DataUtils.formatMoney(amt);
        setItemMoney(inputAmt.value);
        setState(() {
        });
      },
      child: Container(
        margin: EdgeInsets.only(left: 5.w, right: 5.w, top: top, bottom: btm),
        child: Image.asset(icon, width: 45.r, height: 45.r, fit: BoxFit.fill,),
      ),
    );
  }

  // void initData() {}

  double switchChipMonney(int index) {
    double result=0;
    switch(index) {
      case 0:
        result=1;
        break;
      case 1:
        result=5;
        break;
      case 2:
        result=10;
        break;
      case 3:
        result=50;
        break;
      case 4:
        result=100;
        break;
      case 5:
        result=500;
        break;
      case 6:
        result=1000;
        break;
      case 7:
        result=5000;
        break;
      case 8:
        result=10000;
        break;
    }

    return result;
  }


  void setItemMoney(String money) {
    for(OddsContent content  in selectBetting) {
      content.money = DataUtils.formatDouble(money);
    }
  }



}




