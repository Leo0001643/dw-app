import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'history_lottery_logic.dart';

///历史开奖
class HistoryLotteryPage extends StatefulWidget {
  const HistoryLotteryPage({Key? key}) : super(key: key);

  @override
  State<HistoryLotteryPage> createState() => _HistoryLotteryPageState();
}

class _HistoryLotteryPageState extends State<HistoryLotteryPage> {
  final logic = Get.find<HistoryLotteryLogic>();
  final state = Get.find<HistoryLotteryLogic>().state;
  late RefreshController _refreshController;


  @override
  void initState() {
    _refreshController= RefreshController();
    super.initState();
  }


  @override
  void dispose() {
    _refreshController.dispose();
    Get.delete<HistoryLotteryLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildRxAppBar(state.title,msg: true,),
      backgroundColor: ColorX.color_f7f8fb,
      body: Column(
        children: [
          Expanded(
            child: SmartRefresher(
              controller: _refreshController,
              enablePullDown: true,
              enablePullUp: true,
              onRefresh: ()=> _refreshController.refreshCompleted(),
              onLoading: ()=> _refreshController.loadComplete(),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context,index){
                  return buildLotteryItem(index);
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.h),
            alignment: Alignment.center,
            child: WidgetUtils().buildElevatedButton("购彩", 335.w, 50.h,bg: ColorX.color_fc243b,onPressed: (){
              Get.toNamed(Routes.room_list);
            }),
          ),
        ],
      ),
    );
  }

  Widget buildLotteryItem(int index) {
    return Container(
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10.r),),
      margin: EdgeInsets.only(top: 10.h,left: 15.w,right: 15.w,),
      padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("台湾宾果PC28",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722,fontWeight: FontWeight.w500,),),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            runAlignment: WrapAlignment.center,
            alignment: WrapAlignment.center,
            spacing: 3.w,
            children: [
              Text("第",style: TextStyle(fontSize: 13.sp,color: ColorX.color_58698d,),),
              Text("112030767",style: TextStyle(fontSize: 13.sp,color: ColorX.color_091722,),),
              Text("期",style: TextStyle(fontSize: 13.sp,color: ColorX.color_58698d,),),
            ],
          ),
          SizedBox(height: 10.h,),
          Wrap(
            spacing: 5.w,
            children: [
              buildDrawNum("2", ColorX.color_fc243b),
              buildDrawNum("5", ColorX.color_fc243b),
              buildDrawNum("8", ColorX.color_fc243b),
              buildDrawNum("3", ColorX.color_fc243b),
              buildDrawNum("0", ColorX.color_fc243b),
              buildDrawNum("7", ColorX.color_fc243b),
              buildDrawNum("6", ColorX.color_529aff),
              buildDrawNum("4", ColorX.color_23a81d),
            ],
          ),
        ],
      ),
    );
  }


  Widget buildDrawNum(String num,Color bg) {
    return Container(
      width: 24.r,height: 24.r,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: bg,borderRadius: BorderRadius.circular(15.r),),
      child: Text(num, style: TextStyle(fontSize: 14.sp,color: Colors.white,fontWeight: FontWeight.w600),),
    );
  }


}