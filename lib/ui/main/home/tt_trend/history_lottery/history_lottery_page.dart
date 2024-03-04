import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/utils/refresh_change_notifier.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/drawer_scaffold.dart';
import 'package:leisure_games/ui/bean/history_lotto_entity.dart';
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


  @override
  void initState() {
    state.refreshController= RefreshController(initialRefresh: true);
    state.refreshListener.addListener(() {
      var refresh= state.refreshListener.value;
      RefreshChangeNotifier.dataComplete(state.refreshController, refresh);
    });
    super.initState();
  }


  @override
  void dispose() {
    state.refreshController.dispose();
    Get.delete<HistoryLotteryLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      scaffoldKey: state.scaffoldKey,
      appBar: WidgetUtils().buildRxAppBar(state.title,msg: true,scaffoldKey: state.scaffoldKey),
      backgroundColor: ColorX.pageBg2(),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return SmartRefresher(
                controller: state.refreshController,
                enablePullDown: true,
                enablePullUp: true,
                onRefresh: ()=> logic.loadData(true),
                onLoading: ()=> logic.loadData(false),
                child: ListView.builder(
                  itemCount: state.list.em(),
                  itemBuilder: (context,index){
                    return buildLotteryItem(state.list[index],index);
                  },
                ),
              );
            }),
          ),
          Container(
            alignment: Alignment.center,
            child: WidgetUtils().buildElevatedButton(Intr().goucai, 335.w, 50.h,bg: ColorX.color_fc243b,onPressed: (){
              logic.clickGoucai();
            }),
            margin: EdgeInsets.symmetric(vertical: 10.h),
          ),
        ],
      ),
    );
  }

  Widget buildLotteryItem(HistoryLottoEntity item,int index) {
    var nums = item.nums();
    return Container(
      decoration: BoxDecoration(color: ColorX.cardBg(),borderRadius: BorderRadius.circular(10.r),),
      margin: EdgeInsets.only(top: 10.h,left: 15.w,right: 15.w,),
      padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(state.hall.name.em(),style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),fontWeight: FontWeight.w500,),),
          WidgetUtils().buildDixqi1(item.qiShu.em().toString()),
          SizedBox(height: 10.h,),
          Wrap(
            spacing: 5.w,
            runSpacing: 5.h,
            children: nums.map((e) => WidgetUtils().buildBallDraw(state.hall.lid.em(), nums, e)).toList(),
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