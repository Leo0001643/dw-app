
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/lc_segment_tabs.dart';
import 'package:leisure_games/ui/main/home/game_room/dialog/betting_child_page.dart';
import 'package:leisure_games/ui/main/home/game_room/game_room_logic.dart';
import 'package:leisure_games/ui/main/home/game_room/text_timer/text_item_logic.dart';
import 'package:leisure_games/ui/main/mine/mine_logic.dart';

import '../../../../../app/utils/dialog_utils.dart';
import '../utils/game_rule_util.dart';

class BettingBtmDialog extends StatefulWidget {
  final GameRoomLogic logic;
  BettingBtmDialog(this.logic, {super.key});

  @override
  State<StatefulWidget> createState() => StateBettingBtmDialog();

}

class StateBettingBtmDialog extends State<BettingBtmDialog> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  int type=0;
  var tabs = [Intr().tema,Intr().diyiqiu,Intr().dierqiu,Intr().disanqiu,];

  var chips = [ImageX.chip1,ImageX.chip5,ImageX.chip10,ImageX.chip50,ImageX.chip100,ImageX.chip500,ImageX.chip1000,
    ImageX.chip5000,ImageX.chip10000,];

  var chipIndex = (-1).obs;



  @override
  void initState() {
    _tabController = TabController(length: tabs.length, vsync: this);
    initData();
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String termData=GameRuleUtil.getSSB(widget.logic.term.value,year:"");

    return Container(
      height: 0.77.sh,
      width: 1.sw,
      decoration: BoxDecoration(
        // color: ColorX.pageBg4(),
        color: Color(0xFFF7F8FB),
        borderRadius: BorderRadius.only(topRight: Radius.circular(15.r),topLeft: Radius.circular(15.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.w,top: 15.h),
                child: InkWell(
                  onTap: ()=> Navigator.of(context).pop(),
                  child: Image.asset(ImageX.icon_down_arrow,color: ColorX.iconBlack(),),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Text(Intr().touzhu,style: TextStyle(fontSize: 16.sp,color: ColorX.text0917(),),),
                ),
              ),
            ],
          ),
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
                    padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 12.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(Intr().dixqi(["${termData}"]),style: TextStyle(fontSize: 14.sp,color: Colors.white,fontWeight: FontWeight.w600),),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            getTimer()
                          ],
                        ),
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
            child:TabBarView(
              controller: _tabController,
              children: [
                BettingChildPage(0,"first"),
                BettingChildPage(1,"second"),
                BettingChildPage(2,"three"),
                BettingChildPage(3,"three"),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      children: [
                        SizedBox(height: 10.h,),
                        GFCard(
                          height: 138.h,
                          margin: EdgeInsets.zero,
                          padding: EdgeInsets.zero,
                          color: ColorX.cardBg4(),
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
                    child: Container(
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
                                          border: Border.all(color: ColorX.color_091722,width: 1.r),
                                          borderRadius: BorderRadius.circular(10.r)
                                      ),
                                      margin: EdgeInsets.only(left: 10.w),
                                      child: Obx(() {
                                        return WidgetUtils().buildTextField(101.w, 40.h, 15.sp, ColorX.color_949eb9, Intr().qingshurujine,
                                            backgroundColor: ColorX.cardBg(),hintColor: ColorX.text586(),
                                            defText: "${widget.logic.inputAmt.value}",inputType: TextInputType.number,onChanged: (v){
                                              widget.logic.inputAmt.value =double.tryParse(  v)??0;
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
                                          Text("${widget.logic.selectBettingList.length*(widget.logic.inputAmt.value??0)}",style: TextStyle(fontSize: 14.sp,fontWeight:FontWeight.w700,color: buildTextColor(),),),

                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10.w,),
                                    InkWell(
                                      onTap: (){
                                        widget.logic.inputAmt.value = 0;
                                        chipIndex.value = -1;
                                      },
                                      child: Image.asset(ImageX.icon_clear,width: 48.w,height: 40.h,),
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
                              if(type==0) {
                                showToast("封盘中");
                                return;
                              }
                              if (widget.logic.selectBettingList.isEmpty) {
                                showToast("请选择投注项目");
                                return;
                              } else if (widget.logic.inputAmt.value==0) {
                                showToast("下注金额为空");
                                return;
                              }
                              double totalMony=widget.logic.selectBettingList.length*(widget.logic.inputAmt.value??0);
                              ///确认投注
                              DialogUtils().showConfirmBetDialog(context, widget.logic,total: totalMony,inputAmt:widget.logic.inputAmt.value);
                            }),
                          ),
                        ],
                      ),
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
        id: "textTimerItem",
        builder: (logic) {
          print("开始刷新logic");
          String result = "";

          String term1="";
          String term2="";
          if ("封盘中" == logic?.state.text_timer.value) {
            result = "封盘中";
            type=0;
          } else {
            type=1;
            result =
                logic?.subToTime(logic!.state.text_timer.value)??"";
            try{
              term1=result.split(":")[0];
              term2=result.split(":")[1];
            }catch(e){
              print("==========>${e.toString()}");
            }
          }
          return type==0?Container(
            width: 50.w,
            height: 20.w,
            padding: EdgeInsets.symmetric(
              horizontal: 4.w,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4.w)),
                color: Color(0xFFFF7F8C)),
            child:  Text("封盘中",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 12,
                )),
          ):
          Row(
            children: [
              Container(
                  height: 24.w,
                  padding: EdgeInsets.symmetric(
                    horizontal:6.w,
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6.w)),
                      color: Colors.white),
                  child: Text(term1,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFFC243B),
                        fontSize: 16,
                      ))),
              SizedBox(width:4.w,),
              Text(":",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 16,
                  )),
              SizedBox(width:4.w,),
              Container(
                  height: 24.w,
                  padding: EdgeInsets.symmetric(
                    horizontal:6.w,
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6.w)),
                      color: Colors.white),
                  child: Text(term2,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFFC243B),
                        fontSize: 16,
                      ))),
              SizedBox(width:4.w,),
              Text("后结束",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 16,
                  )),
            ],
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


  Widget buildDrawTime(String time) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ColorX.color_10_fff,
        border: Border.all(color: Colors.white,width: 1.r),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Text(time,style: TextStyle(fontSize: 16.sp,color: Colors.white,fontWeight: FontWeight.w600),),
    );
  }
  Widget buildChipItem(String icon, int index, double top, double btm) {
    return InkWell(
      onTap: () {
        chipIndex.value = index;
        widget.logic.inputAmt.value=switchChipMonney(index);
        widget.logic.selectBettingList;
        setState(() {
        });
      },
      child: Container(
        margin: EdgeInsets.only(left: 5.w, right: 5.w, top: top, bottom: btm),
        child: Image.asset(icon, width: 45.r, height: 45.r, fit: BoxFit.fill,),
      ),
    );
  }

  void initData() {}

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
}




