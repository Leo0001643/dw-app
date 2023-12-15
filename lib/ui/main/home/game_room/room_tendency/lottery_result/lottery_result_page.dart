import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/controller/room_tendency_controller.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'lottery_result_logic.dart';

///开奖结果
class LotteryResultPage extends StatefulWidget {
  const LotteryResultPage({Key? key}) : super(key: key);

  @override
  State<LotteryResultPage> createState() => _LotteryResultPageState();
}

class _LotteryResultPageState extends State<LotteryResultPage> with AutomaticKeepAliveClientMixin  {
  final logic = Get.find<LotteryResultLogic>();
  final state = Get.find<LotteryResultLogic>().state;
  late RefreshController _refreshController;


  @override
  bool get wantKeepAlive => true;

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
      color: ColorX.pageBg2(),
      child: GetBuilder<RoomTendencyController>(
        id: RoomTendencyController.room_tendency_id,
        builder: (ctx){
          return ListView.builder(
            itemCount: ctx.data?.list.em() ?? 0,
            itemBuilder: (context,index){
              if(isEmpty(ctx.data?.list)){ return Container(); }
              return buildLotteryItem(ctx.data!.list![index]);
            },
          );
        },
      ),
    );
  }


  Widget buildLotteryItem(List<String> item) {
    if(item.length < 3){ return Container(); }
    var chars = item[2].em().split(",");
    if(chars.length < 4){ return Container(); }
    ///大小  单双
    var result = int.parse(chars[3]);

    ///大小
    var size = DataUtils.getDx(result);
    ///单双
    var sd = DataUtils.getDs(result);

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
              Text(item.first.em(),style: TextStyle(fontSize: 12.sp,color: ColorX.text0917(),),),
              Text(Intr().qi,style: TextStyle(fontSize: 12.sp,color: ColorX.text586(),),),
            ],
          ),
          SizedBox(width: 3.w,),
          buildDrawNum(chars[0]),
          buildDrawMark("+"),
          buildDrawNum(chars[1]),
          buildDrawMark("+"),
          buildDrawNum(chars[2]),
          buildDrawMark("="),
          buildDrawResult(chars[3]),
          Wrap(
            children: [
              Text(" (",style: TextStyle(fontSize: 12.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
              Text(size,style: TextStyle(fontSize: 12.sp,color: ColorX.text586(),fontWeight: FontWeight.w600),),
              SizedBox(width: 3.w,),
              Text(sd,style: TextStyle(fontSize: 12.sp,color: ColorX.color_fc243b,fontWeight: FontWeight.w600),),
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
      decoration: BoxDecoration(color:  DataUtils.getBallBgColor(int.parse(result)),borderRadius: BorderRadius.circular(15.r),),
      child: Text(result, style: TextStyle(fontSize: 14.sp,color:Colors.white,fontWeight: FontWeight.w600),),
    );
  }




}