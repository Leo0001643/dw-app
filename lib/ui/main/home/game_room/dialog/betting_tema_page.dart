
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/odds_content.dart';
import 'package:leisure_games/ui/main/home/game_room/game_room_logic.dart';
import 'package:leisure_games/ui/main/home/game_room/widget/betting_dialog_item_widget.dart';
import 'package:leisure_games/ui/main/home/game_room/widget/betting_middle_item_widget.dart';
import 'package:leisure_games/ui/main/home/game_room/widget/betting_small_item_widget.dart';

class BettingTemaPage extends StatefulWidget {
  // String ballName;
  int index;
  RxList<OddsContent> selectBetting;
  RxDouble inputAmt;
  String betName;

  BettingTemaPage(this.index,this.selectBetting,this.inputAmt,this.betName, {super.key});

  @override
  State<StatefulWidget> createState() {
    return BettingChildPageState();
  }
}

class BettingChildPageState extends State<BettingTemaPage>  {
  var selectPhrases = (-1).obs;
  List<OddsContent> dataBettingList=<OddsContent>[];
  List<OddsContent> dataBettingList1=<OddsContent>[];
  List<OddsContent> dataBettingList2=<OddsContent>[];
  ///实际显示使用的列表
  var showList = RxList.empty(growable: true);

  @override
  void initState() {
    initItem().then((value) => setState(() {}));
    widget.selectBetting.listen((p0) {
      if(widget.selectBetting.isEmpty){
        dataBettingList.forEach((element) { element.check = false; });
        dataBettingList1.forEach((element) { element.check = false; });
        dataBettingList2.forEach((element) { element.check = false; });
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      margin: EdgeInsets.only(left: 15.w,right: 15.w,top:8.h,bottom: 8.h),
      child: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 6.0,
                mainAxisSpacing: 6,
                childAspectRatio: 64 / 64,
              ),
              itemCount: dataBettingList.length,
              itemBuilder: (BuildContext context, int index) {
                print("===== index ${index}   ${dataBettingList[index].hashCode} ");
                return BettingDialogItemWidget(index,dataBettingList[index],widget.selectBetting,widget.inputAmt,widget.betName);
              }),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(top: 6.w),
            child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                  crossAxisSpacing: 6.0,
                  mainAxisSpacing: 6,
                  childAspectRatio: 52 / 59,
                ),
                itemCount:dataBettingList1.length,
                itemBuilder: (BuildContext context, int index) {
                  return BettingMiddleItemWidget(index,dataBettingList1[index],widget.selectBetting,widget.inputAmt,widget.betName);
                }),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(top: 6.w),
            child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                  crossAxisSpacing: 6.0,
                  mainAxisSpacing: 6,
                  childAspectRatio: 52 / 65,
                ),
                itemCount:dataBettingList2.length,
                itemBuilder: (BuildContext context, int index) {
                  return BettingSmallItemWidget(index,dataBettingList2[index],widget.selectBetting,widget.inputAmt,widget.betName);
                }),
          ),
        ),
      ]),
    );
  }

  Future<bool> initItem() async {
    GameRoomLogic logic=Get.find<GameRoomLogic>();
    dataBettingList=logic.getDataBettingList(widget.index);
    dataBettingList1=logic.getDataBettingList(widget.index,type: 1);
    dataBettingList2=logic.getDataBettingList(widget.index,type: 2);
    return Future.value(true);
  }


}
