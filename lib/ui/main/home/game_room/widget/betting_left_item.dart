
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/socket/ws_bet_entity.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/game_room_item_entity.dart';
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
    var wsBetResultEntity = widget.gameRoomItemEntity.data as WsBetEntity;
    String termData=GameRuleUtil.getSSB(wsBetResultEntity.term.em(aft: '--')); // 4
    var allMonny = 0.0;
    for(WsBetContent c in wsBetResultEntity.content??[]) {
      String betMoney = c.c??"0";
      allMonny += DataUtils.formatNum(betMoney);
    }
    var isSelf = wsBetResultEntity.username == AppData.user()?.username;
    // print("=========>avatar  ${wsBetResultEntity.avatar} ${wsBetResultEntity.content}}");
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10.h,),
          Padding(
            padding: EdgeInsets.only(left: 13.w,right: 13.w,bottom: 5.h),
            child: Row(
              textDirection: isSelf ? TextDirection.rtl : TextDirection.ltr,
              // mainAxisAlignment: isSelf ? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [
                GFAvatar(
                  backgroundImage: AssetImage(DataUtils.findAvatar(wsBetResultEntity.avatar)),
                  shape: GFAvatarShape.circle,
                  radius: 16.r,
                ),
                SizedBox(width: 5.w,),
                Text(wsBetResultEntity.nickname.em(),style: TextStyle(fontSize: 14.sp,color: ColorX.text606(),),),
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
                  onTap: (){
                    if(AppData.isLogin()){
                      DialogUtils().showConfirmBetDialog(context,widget.logic,wsBetResultEntity,false);
                    } else {
                      showToast(Intr().qingxiandenglu);
                    }
                  },
                  child: Obx(() {
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 4.w,horizontal: 15.w,),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: ColorX.betColors(widget.logic.state.roomType.value),),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),topRight: Radius.circular(10.r),),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(termData,style: TextStyle(fontSize: 14.sp,color:Colors.white),),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(Intr().gentou,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w600
                                  ,color: isSelf ? ColorX.color_4893fc : Colors.white),),
                              Image.asset(ImageX.icon_right_black,color: Colors.white,),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
                ),
                ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: wsBetResultEntity.content?.length??0,
                    separatorBuilder: (context,index){
                      return Divider(color: ColorX.color_10_949,height: 1.h,indent: 10.w,endIndent: 10.w,);
                    },
                    itemBuilder: (context,index){
                      WsBetContent? item= wsBetResultEntity.content?[index];
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
                      Text("${GameRuleUtil.getMoneySymbol(wsBetResultEntity.moneyType??"CNY")}${DataUtils.formatMoney(allMonny)}",style: TextStyle(fontSize: 15.sp,color: ColorX.color_fc243b),),
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


  Widget buildBettingInfoItem(WsBetEntity wsBetResultEntity,WsBetContent? c) {
   String betType = c?.a??"";
   String betNum = c?.b??"";
   String betMoney = DataUtils.numNoZero(c?.c);
   String betOddsExpected = c?.d??"";
   String betOdds1314 = c?.e??"";
   print("=======>c${jsonEncode(c?.toJson())}");
    // String? qiShu=wsBetResultEntity.term;
    String betName = GameRuleUtil.getBetTypeName(betType);
    if(unEmpty(betNum)){
      betName = "$betName-$betNum";
    }
    String partMsg = "x${GameRuleUtil.getMoneySymbol(wsBetResultEntity.moneyType??"CNY")}";
    // String betOdds="";
    print("=====>betMoney $betMoney  betOdds1314 $betOdds1314");

   var normal = betOddsExpected == betOdds1314 || isEmpty(betMoney) || isEmpty(betOdds1314);

    // if (betOddsExpected==(betOdds1314)||betMoney.isEmpty==true|| isEmpty(betOdds1314)) {
    //   betOdds ="$betOddsExpected $partMsg $betMoney";
    // } else {
    //   betOdds ="$betOddsExpected/$betOdds1314$partMsg$betMoney";
    // }
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
              Text(betName,style: TextStyle(fontSize: 13.sp,color: ColorX.text333()),),
              // Text(betOdds,style: TextStyle(fontSize: 13.sp,color: ColorX.text586()),),
              Text.rich(TextSpan(
                children: [
                  TextSpan(text: betOddsExpected,style: TextStyle(fontSize: 13.sp,color: ColorX.color_fc243b),),
                  TextSpan(text: normal ? "":"/",style: TextStyle(fontSize: 13.sp,color: ColorX.text586()),),
                  TextSpan(text: normal ? "":betOdds1314,style: TextStyle(fontSize: 13.sp,color: ColorX.color_fc243b),),
                  TextSpan(text: partMsg,style: TextStyle(fontSize: 13.sp,color: ColorX.text586()),),
                  TextSpan(text: betMoney,style: TextStyle(fontSize: 13.sp,color: ColorX.text586()),),
                ]
              )),
            ],
          ),
        ),
      ],
    );
  }

}




