import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'lottery_result_logic.dart';

///开奖结果
class LotteryResultPage extends StatefulWidget {
  const LotteryResultPage({Key? key}) : super(key: key);

  @override
  State<LotteryResultPage> createState() => _LotteryResultPageState();
}

class _LotteryResultPageState extends State<LotteryResultPage> {
  final logic = Get.find<LotteryResultLogic>();
  final state = Get.find<LotteryResultLogic>().state;
  late RefreshController _refreshController;

  @override
  void initState() {
    _refreshController= RefreshController();
    super.initState();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    // Get.delete<LotteryResultLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorX.pageBg2(),
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
    );
  }


  Widget buildLotteryItem(int index) {
    return Container(
      decoration: BoxDecoration(color: ColorX.cardBg(),borderRadius: BorderRadius.circular(10.r),),
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
              Text(Intr().di,style: TextStyle(fontSize: 12.sp,color: ColorX.text586(),),),
              Text("112030767",style: TextStyle(fontSize: 12.sp,color: ColorX.text0917(),),),
              Text(Intr().qi,style: TextStyle(fontSize: 12.sp,color: ColorX.text586(),),),
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
              Text("(",style: TextStyle(fontSize: 12.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
              Text("小",style: TextStyle(fontSize: 12.sp,color: ColorX.text586(),fontWeight: FontWeight.w600),),
              SizedBox(width: 3.w,),
              Text("双",style: TextStyle(fontSize: 12.sp,color: ColorX.color_fc243b,fontWeight: FontWeight.w600),),
              Text(")",style: TextStyle(fontSize: 12.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
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
      decoration: BoxDecoration(color: ColorX.cardBg2(),borderRadius: BorderRadius.circular(15.r),),
      child: Text(num, style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
    );
  }

  Widget buildDrawMark(String mark) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Text(mark,style: TextStyle(fontSize: 18.sp,color: ColorX.text0917(),fontWeight: FontWeight.w500),),
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