import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/controller/room_tendency_controller.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/res/colorx.dart';

import 'double_queue_logic.dart';

///双面长龙
class DoubleQueuePage extends StatefulWidget {
  const DoubleQueuePage({Key? key}) : super(key: key);

  @override
  State<DoubleQueuePage> createState() => _DoubleQueuePageState();
}

class _DoubleQueuePageState extends State<DoubleQueuePage> with AutomaticKeepAliveClientMixin {
  final logic = Get.find<DoubleQueueLogic>();
  final state = Get.find<DoubleQueueLogic>().state;
  // late RefreshController _refreshController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // _refreshController= RefreshController();
    super.initState();
  }

  @override
  void dispose() {
    // _refreshController.dispose();
    // Get.delete<DoubleQueueLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorX.pageBg2(),
      child: GetBuilder<RoomTendencyController>(
        id: RoomTendencyController.room_tendency_id,
        builder: (ctr){
          return ListView.builder(
            itemCount: ctr.data?.longTop.em(),
            itemBuilder: (context,index){
              var item =  ctr.data!.longTop![index];
              return buildLotteryItem(item);
            },
          );
        },
      ),
    );
  }

  Widget buildLotteryItem(String item) {
    var type = "";
    var num = "";
    item.split("|").forEach((element) {
      if(isEmpty(type)){
        type = element.replaceAll(",", "-");
      } else {
        num = element;
      }
    });
    return Container(
      decoration: BoxDecoration(color: ColorX.cardBg(),borderRadius: BorderRadius.circular(10.r),),
      margin: EdgeInsets.only(top: 10.h,left: 15.w,right: 15.w,),
      padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 15.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(type,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),),),
          Text("$num ${Intr().qi}",style: TextStyle(fontSize: 14.sp,color: int.parse(num) >= 5 ? ColorX.color_fc243b:ColorX.text0917(),),),
        ],
      ),
    );
  }

}