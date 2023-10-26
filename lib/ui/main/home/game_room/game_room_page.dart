import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/main/home/game_room/betting_left_item.dart';

import 'game_room_logic.dart';

class GameRoomPage extends StatefulWidget {
  const GameRoomPage({Key? key}) : super(key: key);

  @override
  State<GameRoomPage> createState() => _GameRoomPageState();
}

class _GameRoomPageState extends State<GameRoomPage> {
  final logic = Get.find<GameRoomLogic>();
  final state = Get.find<GameRoomLogic>().state;

  @override
  void initState() {
    state.roomType = Get.arguments ?? 0;
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<GameRoomLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var textColor = state.roomType == 0 ? ColorX.color_091722:Colors.white;
    return Scaffold(
      appBar: WidgetUtils().buildGameBar(
          state.title, buildRoomType(),
          collect: true,msg: true,onTap: (){
        DialogUtils().showSelectRoomBtmDialog(context);
      }),
      backgroundColor: ColorX.color_f7f8fb,
      body: Container(
        child: Column(
          children: [
            Container(
              decoration: buildBoxDecorationType(),
              margin: EdgeInsets.only(left: 10.w,right: 10.w,top: 10.h),
              padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 15.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.all(2.r),
                            child: GFAvatar(
                              backgroundImage: NetworkImage(Constants.test_image),
                              shape: GFAvatarShape.circle,
                              radius: 17.r,
                            ),
                          ),
                          Center(child: buildAvatarType(),),
                        ],
                      ),
                      SizedBox(width: 3.w,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Balance",style: TextStyle(fontSize: 12.sp,color: textColor),),
                          SizedBox(height: 3.h,),
                          buildBalanceType(),
                        ],
                      ),
                      SizedBox(width: 50.w,),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildUserTab(0,"号源",ImageX.icon_radio_uncheck,textColor),
                            buildUserTab(1,"注单",ImageX.icon_dan2,textColor),
                            buildUserTab(2,"咪牌",ImageX.icon_pai2,textColor),
                            buildUserTab(3,"趋势",ImageX.icon_qs_hei,textColor),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Divider(height: 1.h,color: ColorX.color_f1f1f1,),
                  SizedBox(height: 10.h,),
                  buildCurrentTermType(),
                  SizedBox(height: 10.h,),
                  Container(
                    decoration: buildRoomBoxType(),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("第1231312期",style: TextStyle(fontSize: 14.sp,color: Colors.white,fontWeight: FontWeight.w600),),
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  buildDrawTime("00"),
                                  Text(" : ",style: TextStyle(fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.w600),),
                                  buildDrawTime("02"),
                                  Text(" : ",style: TextStyle(fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.w600),),
                                  buildDrawTime("53"),
                                  SizedBox(width: 10.w,),
                                  Text("End",style: TextStyle(fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.w600),),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 6.h,),
                        buildNotifyItem("⎡20:00] ：The game is over in 3 minutes !",textColor),
                        buildNotifyItem("⎡21:00] ：The game begins. 18 people in here!",textColor),
                        SizedBox(height: 10.h,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context,index){
                      return BettingLeftItem(index,logic);
                    },
                  ),
                  buildFloatingBtn((){ showToast("弹幕"); }),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.h),
              alignment: Alignment.center,
              child: buildBottomBtn(),
            ),
          ],
        ),
      ),
    );
  }


  Widget buildUserTab(int i, String tab, String icon,Color color) {
    return InkWell(
      onTap: ()=> logic.onTabClick(context,i),
      child: Column(
        children: [
          Image.asset(icon,color: color,),
          Text(tab,style: TextStyle(fontSize: 12.sp,color: color),),
        ],
      ),
    );
  }

  Widget buildDrawNum(String num) {
    var color = state.roomType == 0 ? ColorX.color_f7f8fb:ColorX.color_c7956f;
    return Container(
      width: 24.r,height: 24.r,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color,borderRadius: BorderRadius.circular(15.r),),
      child: Text(num, style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
    );
  }

  Widget buildDrawMark(String mark,Color color) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Text(mark,style: TextStyle(fontSize: 18.sp,color: color,fontWeight: FontWeight.w500),),
    );
  }

  Widget buildDrawResult(String result) {
    var color = state.roomType == 0 ? ColorX.color_10_fc2:ColorX.color_c7956f;
    var textColor = state.roomType == 0 ? ColorX.color_fc243b:ColorX.color_091722;
    return Container(
      width: 24.r,height: 24.r,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color,borderRadius: BorderRadius.circular(15.r),),
      child: Text(result, style: TextStyle(fontSize: 14.sp,color: textColor,fontWeight: FontWeight.w600),),
    );
  }

  Widget buildDrawTime(String time) {
    return Container(
      width:26.r,height: 26.r,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ColorX.color_10_fff,
        border: Border.all(color: Colors.white,width: 1.r),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Text(time,style: TextStyle(fontSize: 16.sp,color: Colors.white,fontWeight: FontWeight.w600),),
    );
  }

  Widget buildFloatingBtn(VoidCallback onPressed) {
    return Positioned(
      right: 0,
      bottom: 30.h,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r),bottomLeft: Radius.circular(20.r)),
          ),
          padding: EdgeInsets.symmetric(vertical: 7.h,horizontal: 10.w),
          child: Wrap(
            children: [
              Icon(Icons.edit_calendar_rounded,color: ColorX.color_091722,),
              SizedBox(width: 5.w,),
              Text("弹幕",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722,fontWeight: FontWeight.w500),),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRoomType() {
    var color = ColorX.color_fc243b;
    var text = "普通房";
    switch(state.roomType){
      case 0:
        color = ColorX.color_fc243b;
        text = "普通房";
        break;
      case 1:
        color = ColorX.color_62_586;
        text = "高级房";
        break;
      case 2:
        color = ColorX.color_574436;
        text = "贵宾房";
        break;
    }
    return Container(
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(5.r)),
      padding: EdgeInsets.symmetric(horizontal: 5.r,vertical: 2.h),
      child: Text(text,style: TextStyle(color: Colors.white,fontSize: 10.sp),),
    );
  }

  Widget buildAvatarType() {
    switch(state.roomType){
      case 1:
        return Image.asset(ImageX.ic_2avatar,fit: BoxFit.fill,width: 38.r,);
      case 2:
        return Image.asset(ImageX.ic_3avatar,fit: BoxFit.fill,width: 38.r,);
      default:
        return Image.asset(ImageX.ic_1avatar,fit: BoxFit.fill,width: 38.r,);
    }
  }

  BoxDecoration buildBoxDecorationType() {
    var color = Colors.white;
    switch(state.roomType){
      case 0:
        color = Colors.white;
        break;
      case 1:
        color = Color(0xff363f57);
        break;
      case 2:
        color = ColorX.color_574436;
        break;
    }
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(10.r),
    );
  }

  Widget buildBalanceType() {
    var color = ColorX.color_fc243b;
    switch(state.roomType){
      case 0:
        color = ColorX.color_fc243b;
        break;
      case 1:
        color = ColorX.color_70b6ff;
        break;
      case 2:
        color = ColorX.color_ffe0ac;
        break;
    }
    return Text("\$8888.66",
      style: TextStyle(fontSize: 14.sp,color: color,fontWeight: FontWeight.w500),);
  }

  Widget buildCurrentTermType() {
    var color = state.roomType == 0 ? ColorX.color_091722:ColorX.color_ffe0ac;
    return InkWell(
      onTap: ()=> DialogUtils().showHistoryLotteryBtmDialog(context,logic),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("第823242期",style: TextStyle(fontSize: 12.sp,color: color,fontWeight: FontWeight.w500),),
          SizedBox(width: 5.w,),
          buildDrawNum("5"),
          buildDrawMark("+",color),
          buildDrawNum("8"),
          buildDrawMark("+",color),
          buildDrawNum("5"),
          buildDrawMark("=",color),
          buildDrawResult("22"),
          // SizedBox(width: 5.w,),
          Text("（小 双）",style: TextStyle(fontSize: 14.sp,color: color,fontWeight: FontWeight.w600),),
          Image.asset(ImageX.icon_down_black,color: color,),
        ],
      ),
    );
  }

  BoxDecoration buildRoomBoxType() {
    var image = ImageX.ic_1room_last;
    switch(state.roomType){
      case 0:
        image = ImageX.ic_1room_last;
        break;
      case 1:
        image = ImageX.ic_2room_last;
        break;
      case 2:
        image = ImageX.ic_3room_last;
        break;
    }
    return BoxDecoration(
      image: DecorationImage(image: AssetImage(image),fit: BoxFit.fill,),
    );
  }

  Widget buildNotifyItem(String text,Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        children: [
          Image.asset(ImageX.icon_ntf,color: color,),
          SizedBox(width: 5.w,),
          Text(text,style: TextStyle(fontSize: 12.sp,color: color),),
        ],
      ),
    );
  }

  Widget buildBottomBtn() {
    var colors = [Color(0xffff5163),Color(0xfffd273e)];
    switch(state.roomType){
      case 0:
        colors = [Color(0xffff5163),Color(0xfffd273e)];
        break;
      case 1:
        colors = [Color(0xff5f6e88),Color(0xff363f57),];
        break;
      case 2:
        colors = [Color(0xff88705f),Color(0xff574436),];
        break;
    }
    var textColor = state.roomType == 2 ? ColorX.color_ffe0ac:Colors.white;
    return InkWell(
      // onTap: ()=> DialogUtils().showBettingBtmDialog(context, logic),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        width: 335.w,
        height: 50.h,
        alignment: Alignment.center,
        child: Text("投注",style: TextStyle(fontSize: 16.sp,color: textColor,fontWeight: FontWeight.w600),),
      ),
    );
  }



}