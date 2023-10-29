import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'double_queue_logic.dart';

///双面长龙
class DoubleQueuePage extends StatefulWidget {
  const DoubleQueuePage({Key? key}) : super(key: key);

  @override
  State<DoubleQueuePage> createState() => _DoubleQueuePageState();
}

class _DoubleQueuePageState extends State<DoubleQueuePage> {
  final logic = Get.find<DoubleQueueLogic>();
  final state = Get.find<DoubleQueueLogic>().state;
  late RefreshController _refreshController;

  @override
  void initState() {
    _refreshController= RefreshController();
    super.initState();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    // Get.delete<DoubleQueueLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorX.color_f7f8fb,
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
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10.r),),
      margin: EdgeInsets.only(top: 10.h,left: 15.w,right: 15.w,),
      padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 15.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("第一球 - 单",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722,),),
          Text("5期",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722,),),
        ],
      ),
    );
  }

}