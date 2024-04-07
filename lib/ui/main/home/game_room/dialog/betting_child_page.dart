
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/odds_content.dart';
import 'package:leisure_games/ui/main/home/game_room/game_room_logic.dart';
import 'package:leisure_games/ui/main/home/game_room/widget/betting_dialog_item_widget.dart';
import 'package:leisure_games/ui/main/home/game_room/widget/betting_small_item_widget.dart';

class BettingChildPage extends StatefulWidget {
  // String ballName;
  int index;
  RxList<OddsContent> selectBetting;
  RxString inputAmt;
  String betName;

  BettingChildPage(this.index,this.selectBetting,this.inputAmt,this.betName, {super.key});

  @override
  State<StatefulWidget> createState() {
    return BettingChildPageState();
  }
}

class BettingChildPageState extends State<BettingChildPage> {
  var selectPhrases = (-1).obs;
  List<OddsContent> dataBettingList1=<OddsContent>[];
  List<OddsContent> dataBettingList2=<OddsContent>[];
  ///实际显示使用的列表
  var showList = RxList.empty(growable: true);

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 300),(){
      initItem().then((value) => setState(() {}));
    });
    widget.selectBetting.listen((p0) {
      if(widget.selectBetting.isEmpty){
        dataBettingList1.forEach((element) { element.check = false; });
        dataBettingList2.forEach((element) { element.check = false; });
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print("--------->数据${dataBettingList1.length}");
    return Container(
      width: 1.sw,
      padding: EdgeInsets.only(left: 15.w,right: 15.w,top:8.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: (dataBettingList1.length / 6 + 1) * 52.h,
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 6,
                    crossAxisSpacing: 6.0,
                    mainAxisSpacing: 6,
                    childAspectRatio: 52 / 65,
                  ),
                  itemCount: dataBettingList1.length,
                  itemBuilder: (BuildContext context, int index) {
                    print("===== index ${index}   ${dataBettingList1[index].hashCode} ");
                    var content = dataBettingList1[index];
                    content.level = index;
                    return BettingSmallItemWidget(index,content,widget.selectBetting,widget.inputAmt,widget.betName,false,useNoColor:true);
                  }),
            ),
            Container(
              margin: EdgeInsets.only(top: 6.h),
              height: 64.h,
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 6.0,
                    mainAxisSpacing: 6,
                    childAspectRatio: 64 / 64,
                  ),
                  itemCount: dataBettingList2.length,
                  itemBuilder: (BuildContext context, int index) {
                    print("===== index ${index}   ${dataBettingList2[index].hashCode} ");
                    return BettingDialogItemWidget(index,dataBettingList2[index],widget.selectBetting,widget.inputAmt,widget.betName,);
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> initItem() async {
    GameRoomLogic logic=Get.find<GameRoomLogic>();
    List<OddsContent> total=logic.getDataBettingList(widget.index);
    if(total.length > 5) {
      dataBettingList1=total.sublist(0,total.length-5);
      dataBettingList2=total.sublist(total.length-5,total.length);
    }
    return Future.value(true);
  }




}
