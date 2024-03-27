import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/drawer_scaffold.dart';
import 'package:leisure_games/ui/bean/bet_detail_item_child_entity.dart' as T;

import 'betting_detail_other_logic.dart';

/// Author: Soushin-932707629@qq.com
/// Date: 2024/3/25 18:09
/// Description: 其他游戏详情
class BettingDetailOtherPage extends StatefulWidget {
  @override
  State<BettingDetailOtherPage> createState() => _BettingDetailOtherPageState();
}

class _BettingDetailOtherPageState extends State<BettingDetailOtherPage> {
  final logic = Get.find<BettingDetailOtherLogic>();
  final state = Get.find<BettingDetailOtherLogic>().state;

  @override
  void dispose() {
    Get.delete<BettingDetailOtherLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      scaffoldKey: state.scaffoldKey,
      appBar: WidgetUtils().buildRxAppBar(logic.state.title,msg: true,bgColor: ColorX.appBarBg(),drawer:true,scaffoldKey: state.scaffoldKey),
      backgroundColor: ColorX.pageBg(),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h,),
            Container(
              color: ColorX.cardBg2(),
              padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
              child: Row(
                children: [
                  Expanded(
                    flex: 40,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(Intr().tz_time,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1()),),
                    ),
                  ),
                  Expanded(
                    flex: 30,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(Intr().touzhue,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1()),),
                    ),
                  ),
                  Expanded(
                    flex: 30,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(Intr().youxiaotouzhu,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1()),),
                    ),
                  ),
                  Expanded(
                    flex: 30,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(Intr().shuying,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1()),),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(() {
                return ListView.separated(
                  itemBuilder: (context,index){
                    return buildBettingItem(state.record.value.record![index]);
                  },
                  separatorBuilder: (context,index){
                    return Divider(height: 0.h,color: Colors.transparent,indent: 10.w,endIndent: 10.w,);
                  },
                  itemCount: state.record.value.record.em(),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBettingItem(T.Record item) {
    var date = DateUtil.formatDate(DateUtil.getDateTimeByMs(item.betTime.em(),isUtc: true).subtract(const Duration(hours: 4)), format: DateFormats.full);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 13.h),
      child: Row(
        children: [
          Expanded(
            flex: 40,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(date,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),),),
            ),
          ),
          Expanded(
            flex: 30,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(item.betamount.em(),
                style: TextStyle(fontSize: 14.sp, color: ColorX.color_fc243b,),),
            ),
          ),
          Expanded(
            flex: 30,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(item.validamount.em(aft: '0.0'),
                style: TextStyle(fontSize: 14.sp, color: ColorX.color_fc243b,),),
            ),
          ),

          Expanded(
            flex: 30,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("${((item.winlose.em()) >= 0) ? "+" : ""}${DataUtils.formatMoney(item.winlose)}",
                style: TextStyle(fontSize: 14.sp,color: ((item.winlose.em()??0) >= 0) ? ColorX.color_23a81d : ColorX.color_fc243b,),),
            ),
          ),
        ],
      ),
    );
  }

}