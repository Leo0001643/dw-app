import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/ws_game_odds_server.dart';
import 'package:leisure_games/ui/main/home/game_room/game_room_logic.dart';
import 'package:leisure_games/ui/main/home/game_room/widget/betting_dialog_item_widget.dart';
import 'package:leisure_games/ui/main/home/game_room/widget/betting_middle_item_widget.dart';
import 'package:leisure_games/ui/main/home/game_room/widget/betting_small_item_widget.dart';

class BettingTemaPage extends StatefulWidget {
  String ballName;
  int index;

  BettingTemaPage(this.index, this.ballName, {super.key});

  @override
  State<StatefulWidget> createState() {
    return BettingChildPageState();
  }
}

class BettingChildPageState extends State<BettingTemaPage> {
  var selectPhrases = (-1).obs;
  List<OddsContent> dataBettingList=<OddsContent>[];
  List<OddsContent> dataBettingList1=<OddsContent>[];
  List<OddsContent> dataBettingList2=<OddsContent>[];
  ///实际显示使用的列表
  var showList = RxList.empty(growable: true);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initItem();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameRoomLogic>(
        id: "bettingList",
        builder: (logic) {
      Map<int, OddsContent> arrayMap = {};
      print("--------->数据${dataBettingList.length}");
      return Container(
        width: 1.sw,
        padding: EdgeInsets.only(left: 15.w,right: 15.w,top:8.w),
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Container(
              child: GridView.builder(
                    shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 6.0,
                    mainAxisSpacing: 6,
                    childAspectRatio: 64 / 64,
                  ),
                  itemCount: dataBettingList.length,
                  itemBuilder: (BuildContext context, int index) {
                      print("===== index ${index}   ${dataBettingList[index].hashCode} ");
                   return BettingDialogItemWidget(index,dataBettingList[index]);
                  }),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(top: 6.w),
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 6,
                    crossAxisSpacing: 6.0,
                    mainAxisSpacing: 6,
                    childAspectRatio: 52 / 59,
                  ),
                  itemCount:dataBettingList1.length,
                  itemBuilder: (BuildContext context, int index) {
                    return BettingMiddleItemWidget(index,dataBettingList1[index]);
                  }),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(top: 6.w),
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 6,
                    crossAxisSpacing: 6.0,
                    mainAxisSpacing: 6,
                    childAspectRatio: 52 / 65,
                  ),
                  itemCount:dataBettingList2.length,
                  itemBuilder: (BuildContext context, int index) {
                    return BettingSmallItemWidget(index,dataBettingList2[index]);
                  }),
            ),
          )
        ]
        ),
      );
    });
  }

  Widget buildSizeCard(OddsContent data ) {
    print("---->${jsonEncode(data.toJson())}");
    return  GFCard(
      height: 63.h,
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
      ),

      elevation: 2.r,
      content: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            gradient: LinearGradient(
              colors: [Colors.white,Color(0xFFF3F4F9).withOpacity(0.9)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child:Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 6.h,
              ),
              Text(
                "${data.name}",
                style: TextStyle(fontSize: 13.sp, color: ColorX.text0917()),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "4.2",
                style: TextStyle(fontSize: 13.sp, color: ColorX.textd53()),
              ),
              SizedBox(
                height: 6.h,
              ),
            ],
          ),
        ),
    );
  }

  Widget buildWaveCard(String item) {
    return SizedBox(
      width: 52.w,
      child: GFCard(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        elevation: 1.r,
        content: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            gradient: LinearGradient(
              colors: ColorX.cardColors(),
              // colors: [Color(0xffffeed4),Color(0xfffff5d0)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          width: 52.w,
          height: 59.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 3.h,
              ),
              Text(
                "大",
                style: TextStyle(fontSize: 13.sp, color: ColorX.text0917()),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "4.2",
                style: TextStyle(fontSize: 13.sp, color: ColorX.textd53()),
              ),
              SizedBox(
                height: 3.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNumCard(String item) {
    return SizedBox(
      width: 52.w,
      child: GFCard(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        elevation: 1.r,
        content: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            gradient: LinearGradient(
              colors: ColorX.cardColors(),
              // colors: [Color(0xffffeed4),Color(0xfffff5d0)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          width: 52.w,
          height: 59.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 3.h,
              ),
              Container(
                alignment: Alignment.center,
                width: 28.r,
                height: 28.r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: ColorX.color_e7ebf4, width: 1.r),
                ),
                child: Text(
                  "04",
                  style: TextStyle(fontSize: 14.sp, color: ColorX.color_5583e7),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                "4.2",
                style: TextStyle(fontSize: 13.sp, color: ColorX.textd53()),
              ),
              SizedBox(
                height: 3.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void initItem() {
    GameRoomLogic logic=Get.find<GameRoomLogic>();
    dataBettingList=logic.getDataBettingList(widget.index);
    dataBettingList1=logic.getDataBettingList(widget.index,type: 1);
    dataBettingList2=logic.getDataBettingList(widget.index,type: 2);
    setState(() {
    });
  }
}
