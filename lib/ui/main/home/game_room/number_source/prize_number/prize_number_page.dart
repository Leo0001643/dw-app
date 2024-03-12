import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/ui/bean/btc_source_entity.dart';
import 'package:leisure_games/ui/bean/source_check_event.dart';
import 'package:leisure_games/ui/main/home/game_room/game_room_logic.dart';
import 'package:leisure_games/ui/main/home/game_room/text_timer/text_item_logic.dart';

import 'prize_number_logic.dart';

class PrizeNumberPage extends StatefulWidget {
  const PrizeNumberPage({Key? key}) : super(key: key);

  @override
  State<PrizeNumberPage> createState() => _PrizeNumberPageState();
}

class _PrizeNumberPageState extends State<PrizeNumberPage> with AutomaticKeepAliveClientMixin{
  final logic = Get.find<PrizeNumberLogic>();
  final state = Get.find<PrizeNumberLogic>().state;
  String result = "";

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 8.h,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Obx(() {
                  var term = Get.find<GameRoomLogic>().term.value;
                  if(isEmpty(term)){ return Container(); }
                  // var item = state.data.first;
                  return Text(Intr().juelidixqi([term]),
                    style: TextStyle(fontSize: 14.sp,color: ColorX.text586(),fontWeight: FontWeight.w600,),);
                }),
              ),
              GetBuilder<TextItemLogic>(
                id: TextItemLogic.id_textTimerItem,
                builder: (lgc){
                  Color color = ColorX.color_58698d;
                  if (Intr().fengpanzhong == lgc.state.text_timer.value) {
                    result = Intr().fengpanzhong;
                    color = ColorX.color_fc243b;
                  } else {
                    ///如果最后一次的封盘中，需要请求下一期结果
                    if(result == Intr().fengpanzhong){
                      Future.delayed(Duration(seconds: 5),(){ logic.loadData(); });
                    }
                    result = lgc.subToTime(lgc.state.text_timer.value);
                    ///倒计时10秒的时候 文字变红色
                    if(result.length == 5 && int.parse(result.substring(3,4)) == 0){
                      color = ColorX.color_fc243b;
                    }
                  }
                  return Row(
                    children: [
                      Visibility(
                        visible: result != Intr().fengpanzhong,
                        child: Text(Intr().daojishi,style: TextStyle(fontWeight: FontWeight.w500, color: color, fontSize: 14.sp,)),
                      ),
                      SizedBox(width: 5.w,),
                      Container(
                        height: 25.h,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 4.w,),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(6.w)), color: ColorX.color_F7F8FB),
                        child: Text(result, style: TextStyle(fontWeight: FontWeight.w500, color: color, fontSize: 14.sp,)),
                      ),
                    ],
                  );
                },
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w,right: 15.w,),
          child: Obx(() {
            if(isEmpty(state.data)){ return Container(); }
            var childs = List<Widget>.empty(growable: true);
            var item = state.data.first;
            var splits = item.originalNum.em().split("");
            splits.forEach((element) {
              childs.add(buildDrawNum(element,ColorX.color_70b6ff));
              childs.add(SizedBox(width: 5.w,));
            });
            childs.add(buildDrawResult(item.luckyNum.em(),DataUtils.getBallBgColor(int.parse(item.luckyNum.em()))));
            return Row(children: childs,);
          }),
        ),
        Container(
          color: ColorX.pageBg2(),
          margin: EdgeInsets.only(top: 10.h),
          padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
          child: Row(
            children: [
              Expanded(
                flex: 30,
                child: Text(Intr().qihao,
                  style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
              ),
              Expanded(
                flex: 25,
                child: Center(
                  child: Text(Intr().kaijianghaoma,
                    style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
                ),
              ),
              Expanded(
                flex: 45,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: LayoutBuilder(
                    builder: (context,cst){
                      return Text.rich(TextSpan(
                          children: [
                            TextSpan(text: Intr().haoyuanjinqi,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
                            TextSpan(text: "50",style: TextStyle(fontSize: 14.sp,color: ColorX.color_fc243b,fontWeight: FontWeight.w600),),
                            TextSpan(text: AppData.localeIndex() == 0 ? "期)":")",style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
                          ]
                      ));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Obx(() {
            return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context,index){
                return buildNumberItem(index,state.data[index]);
              },
            );
          }),
        ),
      ],
    );
  }


  // Widget buildDrawTime(String time) {
  //   return Container(
  //     width:26.r,height: 26.r,
  //     alignment: Alignment.center,
  //     decoration: BoxDecoration(
  //       color: ColorX.cardBg(),
  //       border: Border.all(color: Colors.white,width: 1.r),
  //       borderRadius: BorderRadius.circular(5.r),
  //     ),
  //     child: Text(time,style: TextStyle(fontSize: 16.sp,color: ColorX.color_fc243b,fontWeight: FontWeight.w600),),
  //   );
  // }

  Widget buildDrawNum(String num,Color bg) {
    return Container(
      width: 24.r,height: 24.r,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: bg,width: 2.w),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Text(num, style: TextStyle(fontSize: 14.sp,color: bg,fontWeight: FontWeight.w600),),
    );
  }

  Widget buildDrawResult(String num,Color bg) {
    return Container(
      width: 24.r,height: 24.r,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Text(num, style: TextStyle(fontSize: 14.sp,color: Colors.white,fontWeight: FontWeight.w600),),
    );
  }

  Widget buildNumberItem(int index,BtcSourceEntity item) {
    var result = index%2 == 1;
    return InkWell(
      onTap: ()=>DialogUtils().showUnbrokenNumberBtmDialog(context,item).then((value) {
        if(unEmpty(value)){ behaviorBus.fire(SourceCheckEvent(value)); }
      }),
      child: Container(
        color: result ? ColorX.cardBg2():ColorX.cardBg(),
        padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
        child: Row(
          children: [
            Expanded(
              flex: 30,
              child: Text("${item.term.em()}",
                style: TextStyle(fontSize: 13.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
            ),
            Expanded(
              flex: 25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(item.originalNumStr(),
                    style: TextStyle(fontSize: 13.sp,color: ColorX.text0917(), fontWeight: FontWeight.w600,),),
                  SizedBox(width: 5.w,),
                  buildDrawResult(item.luckyNum.em(), DataUtils.getBallBgColor(int.parse(item.luckyNum.em()))),
                ],
              ),
            ),
            Expanded(
              flex: 45,
              child: Row(
                children: [
                  Expanded(
                    child: Text(item.btcHash.em(),
                      style: TextStyle(fontSize: 13.sp,color: ColorX.color_5583e7,fontWeight: FontWeight.w600,),
                      maxLines: 2,overflow: TextOverflow.ellipsis,),
                  ),
                  Image.asset(ImageX.ic_into_right),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;


}