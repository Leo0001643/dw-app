
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/ui/main/home/game_room/game_room_logic.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HistoryLotteryBtmDialog extends StatefulWidget{
  final GameRoomLogic logic;

  const HistoryLotteryBtmDialog(this.logic, {super.key});

  @override
  State<StatefulWidget> createState() => StateHistoryLotteryBtmDialog();

}

class StateHistoryLotteryBtmDialog extends State<HistoryLotteryBtmDialog>{
  late RefreshController _refreshController;

  @override
  void initState() {
    _refreshController= RefreshController();
    super.initState();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.77.sh,
      width: 1.sw,
      decoration: BoxDecoration(
        color: ColorX.color_f7f8fb,
        borderRadius: BorderRadius.only(topRight: Radius.circular(15.r),topLeft: Radius.circular(15.r)),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w,right: 20.w,top: 15.h),
            child: Image.asset(buildRoomHeadType(),width: 335.w,fit: BoxFit.fill,),
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 35.w,vertical: 25.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(Intr().dixqi(["1231312"]),style: TextStyle(fontSize: 14.sp,color: Colors.white,fontWeight: FontWeight.w600),),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        buildDrawTime("00"),
                        Text(" : ",style: TextStyle(fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.w600),),
                        buildDrawTime("02"),
                        Text(" : ",style: TextStyle(fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.w600),),
                        buildDrawTime("53"),
                        SizedBox(width: 10.w,),
                        Text(Intr().end,style: TextStyle(fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.w600),),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SmartRefresher(
                  controller: _refreshController,
                  enablePullDown: true,
                  enablePullUp: true,
                  onRefresh: ()=> _refreshController.refreshCompleted(),
                  onLoading: ()=> _refreshController.loadComplete(),
                  child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context,index){
                      return buildLotteryItem(index);
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String buildRoomHeadType() {
    switch(widget.logic.state.roomType){
      case 1:
        return ImageX.ic_2room_last;
      case 2:
        return ImageX.ic_3room_last;
      default:
        return ImageX.ic_1room_last;
    }
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


  Widget buildLotteryItem(int index) {
    return Container(
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10.r),),
      margin: EdgeInsets.only(top: 10.h,left: 15.w,right: 15.w,),
      padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 15.w),
      child: Row(
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            runAlignment: WrapAlignment.center,
            alignment: WrapAlignment.center,
            spacing: 3.w,
            children: [
              Text(Intr().di,style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d,),),
              Text("112030767",style: TextStyle(fontSize: 12.sp,color: ColorX.color_091722,),),
              Text(Intr().qi,style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d,),),
            ],
          ),
          SizedBox(width: 3.w,),
          buildDrawNum("5"),
          buildDrawMark("+"),
          buildDrawNum("8"),
          buildDrawMark("+"),
          buildDrawNum("5"),
          buildDrawMark("="),
          buildDrawResult("22"),
          Wrap(
            children: [
              Text("(",style: TextStyle(fontSize: 12.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
              Text(Intr().bet_xiao,style: TextStyle(fontSize: 12.sp,color: ColorX.color_529aff,fontWeight: FontWeight.w600),),
              SizedBox(width: 3.w,),
              Text(Intr().bet_shuang,style: TextStyle(fontSize: 12.sp,color: ColorX.color_fc243b,fontWeight: FontWeight.w600),),
              Text(")",style: TextStyle(fontSize: 12.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
            ],
          ),
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
      padding: EdgeInsets.symmetric(horizontal: 5.w),
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


}

