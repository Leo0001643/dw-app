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
  void dispose() {
    Get.delete<GameRoomLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildGameBar(
          state.title,
          Container(
            decoration: BoxDecoration(color: ColorX.color_fc243b,borderRadius: BorderRadius.circular(5.r)),
            padding: EdgeInsets.symmetric(horizontal: 5.r,vertical: 2.h),
            child: Text("Regular",style: TextStyle(color: Colors.white,fontSize: 12.sp),),
          ),
          collect: true,msg: true,onTap: (){
        DialogUtils().showSelectRoomBtmDialog(context);
      }),
      backgroundColor: ColorX.color_f7f8fb,
      body: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              margin: EdgeInsets.only(left: 10.w,right: 10.w,top: 10.h),
              padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 15.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [Color(0xffffcfef),Color(0xffffe2f4),Color(0xffff5a42)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        padding: EdgeInsets.all(2.r),
                        child: GFAvatar(
                          backgroundImage: NetworkImage(Constants.test_image),
                          shape: GFAvatarShape.circle,
                          radius: 17.r,
                        ),
                      ),
                      SizedBox(width: 3.w,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Balance",style: TextStyle(fontSize: 12.sp,color: ColorX.color_091722),),
                          SizedBox(height: 3.h,),
                          Text("\$8888.66",style: TextStyle(fontSize: 14.sp,color: ColorX.color_fc243b,fontWeight: FontWeight.w500),),
                        ],
                      ),
                      SizedBox(width: 50.w,),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildUserTab(0,"号源",ImageX.icon_radio_uncheck),
                            buildUserTab(1,"注单",ImageX.icon_dan2),
                            buildUserTab(2,"咪牌",ImageX.icon_pai2),
                            buildUserTab(3,"趋势",ImageX.icon_qs_hei),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Divider(height: 1.h,color: ColorX.color_f1f1f1,),
                  SizedBox(height: 10.h,),
                  InkWell(
                    onTap: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("第823242期",style: TextStyle(fontSize: 12.sp,color: ColorX.color_091722,fontWeight: FontWeight.w500),),
                        SizedBox(width: 5.w,),
                        buildDrawNum("5"),
                        buildDrawMark("+"),
                        buildDrawNum("8"),
                        buildDrawMark("+"),
                        buildDrawNum("5"),
                        buildDrawMark("="),
                        buildDrawResult("22"),
                        SizedBox(width: 5.w,),
                        Text("（小 双）",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
                        Image.asset(ImageX.icon_down_black),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Container(
                    decoration: BoxDecoration(color: ColorX.color_f7f8fb,borderRadius: BorderRadius.circular(10.r)),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: ColorX.color_ff5164,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(10.r,),topLeft: Radius.circular(10.r,)),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 12.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("第1231312期",style: TextStyle(fontSize: 14.sp,color: Colors.white,fontWeight: FontWeight.w600),),
                              Wrap(
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
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Row(
                            children: [
                              Image.asset(ImageX.icon_ntf,color: ColorX.color_58698d,),
                              SizedBox(width: 5.w,),
                              Text("⎡20:00] ：The game is over in 3 minutes !",style: TextStyle(fontSize: 12.sp,color: ColorX.color_091722),),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Row(
                            children: [
                              Image.asset(ImageX.icon_ntf,color: ColorX.color_58698d,),
                              SizedBox(width: 5.w,),
                              Text("⎡21:00] ：The game begins. 18 people in here!",style: TextStyle(fontSize: 12.sp,color: ColorX.color_091722),),
                            ],
                          ),
                        ),
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
                      return BettingLeftItem(index);
                    },
                  ),
                  buildFloatingBtn((){ showToast("弹幕"); }),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.h),
              alignment: Alignment.center,
              child: WidgetUtils().buildElevatedButton("投注", 335.w, 50.h,bg: ColorX.color_fc243b,onPressed: (){

              }),
            ),
          ],
        ),
      ),
    );
  }


  Widget buildUserTab(int i, String tab, String icon) {
    return InkWell(
      onTap: ()=> logic.onTabClick(i),
      child: Column(
        children: [
          Image.asset(icon),
          Text(tab,style: TextStyle(fontSize: 12.sp,color: ColorX.color_091722),),
        ],
      ),
    );
  }

  Widget buildDrawNum(String num) {
    return Container(
      width: 24.r,height: 24.r,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: ColorX.color_f7f8fb,borderRadius: BorderRadius.circular(15.r),),
      child: Text(num, style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
    );
  }

  Widget buildDrawMark(String mark) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Text(mark,style: TextStyle(fontSize: 18.sp,color: ColorX.color_091722,fontWeight: FontWeight.w500),),
    );
  }

  Widget buildDrawResult(String result) {
    return Container(
      width: 24.r,height: 24.r,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: ColorX.color_10_fc2,borderRadius: BorderRadius.circular(15.r),),
      child: Text(result, style: TextStyle(fontSize: 14.sp,color: ColorX.color_fc243b,fontWeight: FontWeight.w600),),
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



}