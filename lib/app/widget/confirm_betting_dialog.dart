

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/lc_segment_tabs.dart';
import 'package:leisure_games/ui/main/home/game_room/game_room_logic.dart';

///确认注单
class ConfirmBettingDialog extends StatefulWidget{

  final GameRoomLogic logic;
  ConfirmBettingDialog(this.logic, {super.key});

  @override
  State<StatefulWidget> createState() =>StateConfirmBettingDialog();
}

class StateConfirmBettingDialog extends State<ConfirmBettingDialog> with SingleTickerProviderStateMixin{

  var payWays = ["RMB","USDT"];
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: payWays.length, vsync: this);
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
      height: 0.5.sh,
      width: 0.92.sw,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: buildHeadColor(),
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(12.r),topRight: Radius.circular(12.r),),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("请确认注单",style: TextStyle(fontSize: 14.sp,color: Colors.white,),),
                Text(Intr().dixqi([" 1231312 "]),style: TextStyle(fontSize: 14.sp,color: Colors.white,),),
              ],
            ),
          ),
          Container(
            height: 42.h,
            padding: EdgeInsets.symmetric(horizontal: 15.w,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${Intr().yue_}¥ 6666.00",style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),),),
                LCSegmentTabs(
                  length: payWays.length,
                  labelColor: Colors.white,
                  unselectedLabelColor: ColorX.text0917(),
                  width: 88.w,
                  height: 22.h,
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(15.r),
                  tabBarColor: ColorX.cardBg6(),
                  indicatorColor: buildBtnColor(),
                  labelPadding: EdgeInsets.zero,
                  tabs: payWays.map((e) => Text(e,style: TextStyle(fontSize: 12.sp),)).toList(),
                  tabController: _tabController,
                ),
              ],
            ),
          ),
          Divider(height: 2.h,color: ColorX.color_10_949,),
          Container(
            height: 42.h,
            padding: EdgeInsets.symmetric(horizontal: 15.w,),
            child: Row(
              children: [
                Expanded(
                  flex: 25,
                  child: Text("选中号码",style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),),),
                ),
                Expanded(
                  flex: 35,
                  child: Text("赔率",style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),),),
                ),
                Expanded(
                  flex: 40,
                  child: Text("金额",style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),),),
                ),
              ],
            ),
          ),
          Divider(height: 2.h,color: ColorX.color_10_949,),
          buildBetItem(),
          buildBetItem(),
          buildBetItem(),
          Divider(height: 2.h,color: ColorX.color_10_949,),
          SizedBox(height: 8.h,),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: 15.w,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text.rich(TextSpan(
                    children: [
                      TextSpan(text: "若中奖, 奖金",style: TextStyle(fontSize: 12.sp,color: ColorX.text586(),),),
                      TextSpan(text: "¥60.000",style: TextStyle(fontSize: 12.sp,color: ColorX.color_fc243b,),),
                      TextSpan(text: ", 盈利 ",style: TextStyle(fontSize: 12.sp,color: ColorX.text586(),),),
                      TextSpan(text: "¥30.000",style: TextStyle(fontSize: 12.sp,color: ColorX.color_fc243b,),),
                    ]
                )),
                SizedBox(height: 8.h,),
                Text.rich(TextSpan(
                    children: [
                      TextSpan(text: "注单: ",style: TextStyle(fontSize: 12.sp,color: ColorX.text0917(),),),
                      TextSpan(text: "3",style: TextStyle(fontSize: 18.sp,color: ColorX.color_fc243b,),),
                      TextSpan(text: ", 总金额 ",style: TextStyle(fontSize: 12.sp,color: ColorX.text0917(),),),
                      TextSpan(text: "¥3000000",style: TextStyle(fontSize: 12.sp,color: ColorX.color_fc243b,),),
                    ]
                )),
              ],
            ),
          ),
          SizedBox(height: 8.h,),
          Divider(height: 2.h,color: ColorX.color_10_949,),
          Expanded(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WidgetUtils().buildElevatedButton("取消", 135.w, 40.h,
                      bg: ColorX.cardBg3(),textColor: ColorX.text586(),onPressed: (){
                        Navigator.of(context).pop(false);
                      }),
                  SizedBox(width: 10.w,),
                  WidgetUtils().buildElevatedButton("确定", 135.w, 40.h,
                      bg: buildBtnColor(),textColor: Colors.white,onPressed: (){
                        Navigator.of(context).pop(true);
                      })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBetItem() {
    return Container(
      height: 42.h,
      padding: EdgeInsets.symmetric(horizontal: 15.w,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 25,
            child: Text("特码 - 大",style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),),),
          ),
          Expanded(
            flex: 35,
            child: Text("1.8884/1.555",style: TextStyle(fontSize: 14.sp,color: ColorX.color_fc243b,),),
          ),
          Expanded(
            flex: 40,
            child: Row(
              children: [
                Text("x",style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),),),
                SizedBox(width: 5.w,),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorX.cardBg3(),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 3.h),
                    child: Row(
                      children: [
                        Text("¥",style: TextStyle(fontSize: 12.sp,color: ColorX.text586(),),),
                        SizedBox(width: 3.w,),
                        Text("1000000",style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){},
                  child: Icon(Icons.delete_forever_rounded,size: 20.r,color: ColorX.icon586(),),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }


  List<Color> buildHeadColor(){
    var colors = [Color(0xffff5163),Color(0xfffd273e)];
    switch(widget.logic.state.roomType){
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
    return colors;
  }

  Color buildBtnColor(){
    var color = ColorX.color_fc243b;
    switch(widget.logic.state.roomType){
      case 0:
        color = ColorX.color_fc243b;
        break;
      case 1:
        color = Color(0xff363f57);
        break;
      case 2:
        color = ColorX.color_574436;
        break;
    }
    return color;
  }

}



