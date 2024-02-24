
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/game_room_item_entity.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/ws_bet_result_entity.dart';
import 'package:leisure_games/ui/main/home/game_room/game_room_logic.dart';

import '../utils/game_rule_util.dart';

class BettingLeftItem extends StatefulWidget{

  final int index;
  final GameRoomLogic logic;
  final GameRoomItemEntity gameRoomItemEntity;
  const BettingLeftItem(this.index,this.logic,this.gameRoomItemEntity, {super.key});

  @override
  State<StatefulWidget> createState() =>StateBettingLeftItem();

}

class StateBettingLeftItem extends State<BettingLeftItem>{
  @override
  Widget build(BuildContext context) {
    WsBetResultEntity? wsBetResultEntity=widget.gameRoomItemEntity.data as WsBetResultEntity;
    String termData=GameRuleUtil.getSSB(wsBetResultEntity?.term??""); // 4
    int allMonny=0;
    for(BetContent c in wsBetResultEntity?.content??[]) {
      String betMoney = c?.c??"0";
      allMonny+=int.tryParse(betMoney)??0;
    }

    print("=========>avatar  ${wsBetResultEntity.avatar} ${wsBetResultEntity.content}");
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10.h,),
          Padding(
            padding: EdgeInsets.only(left: 13.w),
            child: Row(
              children: [
                GFAvatar(
                  backgroundImage: AssetImage('assets/images/${wsBetResultEntity.avatar??ImageX.icon_avatar}.png'),
                  shape: GFAvatarShape.circle,
                  radius: 16.r,
                ),
                SizedBox(width: 5.w,),
                Text(wsBetResultEntity.nickname??"",style: TextStyle(fontSize: 14.sp,color: ColorX.text606(),),),
              ],
            ),
          ),
          GFCard(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.only(left: 50.w,right: 20.w,bottom: 5.h),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
            color: ColorX.cardBg(),
            elevation: 3.r,
            content: Column(
              children: [
                InkWell(
                  onTap: ()=> DialogUtils().showConfirmBetDialog(context,widget.logic),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 4.w,horizontal: 15.w,),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color(0xFFFF697A).withOpacity(0.9),
                        Color(0xFFFC4559).withOpacity(0.9),
                      ],
                      ),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),topRight: Radius.circular(10.r),),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(termData,style: TextStyle(fontSize: 14.sp,color:Colors.white),),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Text(Intr().touzhu,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w600,color: Colors.white),),
                            Image.asset(ImageX.icon_right_black,color: Colors.white,),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),


                ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: wsBetResultEntity.content?.length??0,
                    separatorBuilder: (context,index){
                      return Divider(height: 1.h,color: ColorX.color_f1f1f1,);
                    },
                    itemBuilder: (context,index){
                      BetContent? item= wsBetResultEntity.content?[index];
                      return buildBettingInfoItem(wsBetResultEntity,item);
                    }),

                Container(
                  padding: EdgeInsets.only(right: 10.w,top: 8.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(Intr().zhudan_,style: TextStyle(fontSize: 13.sp,color: ColorX.text605()),),
                      Text("${wsBetResultEntity.content?.length??0}",style: TextStyle(fontSize: 15.sp,color: ColorX.color_fc243b),),
                      Text(Intr().zongji_,style: TextStyle(fontSize: 13.sp,color: ColorX.text605()),),
                      Text("${GameRuleUtil.getMoneySymbol(wsBetResultEntity?.moneyType??"CNY")}${allMonny}",style: TextStyle(fontSize: 15.sp,color: ColorX.color_fc243b),),
                    ],
                  ),
                ),
                SizedBox(height: 7.h,),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget buildBettingInfoItem(WsBetResultEntity? wsBetResultEntity,BetContent? c) {
   String betType = c?.a??"";
   String betNum = c?.b??"";
   String betMoney = c?.c??"";
   String betOddsExpected = c?.d??"";
   String betOdds1314 = c?.e??"";
   print("=======>c${jsonEncode(c?.toJson())}");
    String? qiShu=wsBetResultEntity?.term;
    String betName = GameRuleUtil.getBetTypeName(betType);
    String partMsg = "x"+ GameRuleUtil.getMoneySymbol(wsBetResultEntity?.moneyType??"CNY");
    String betOdds="";
    print("=====>betMoney ${betMoney}  betOdds1314 ${betOdds1314}");
    if (betOddsExpected==(betOdds1314)||betMoney.isEmpty==true|| betOdds1314=="null"||betOdds1314.isEmpty==true) {
      betOdds ="${betOddsExpected} ${partMsg} ${betMoney}";
    } else {
      betOdds ="${betOddsExpected}/${betOdds1314??""}${partMsg}${betMoney}";
    }
    // length = bet.betOdds.length() - c.betMoney.length() - 2;
    // bet.betOdds.setSpan(colorRed, 0, length, Spannable.SPAN_EXCLUSIVE_INCLUSIVE);
    // bet.betOdds.setSpan(colorBlue, length + 1, bet.betOdds.length(), Spannable.SPAN_EXCLUSIVE_INCLUSIVE);
    // String moneyAll = BigDecimalUtil.addPlay(msg.moneyAll, c.betMoney);
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${betName}",style: TextStyle(fontSize: 13.sp,color: ColorX.text333()),),
              Text("${betOdds} ",style: TextStyle(fontSize: 13.sp,color: ColorX.text586()),),
            ],
          ),
        ),
        Divider(color: ColorX.color_10_949,height: 1.h,indent: 10.w,endIndent: 10.w,),
      ],
    );
  }

}




