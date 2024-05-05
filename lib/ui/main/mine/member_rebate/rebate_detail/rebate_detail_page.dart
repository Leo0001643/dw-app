import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/drawer_scaffold.dart';
import 'package:leisure_games/app/widget/empty_data_widget.dart';
import 'package:leisure_games/ui/bean/rebate_detail_entity.dart';

import 'rebate_detail_logic.dart';

/// Author: Soushin-932707629@qq.com
/// Date: 2024/4/11 11:33
/// Description: 返水详情
class RebateDetailPage extends StatefulWidget {
  @override
  State<RebateDetailPage> createState() => _RebateDetailPageState();
}

class _RebateDetailPageState extends State<RebateDetailPage> {
  final logic = Get.find<RebateDetailLogic>();
  final state = Get.find<RebateDetailLogic>().state;

  @override
  void initState() {
    state.params = Get.arguments;
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<RebateDetailLogic>();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      scaffoldKey: state.scaffoldKey,
      appBar: WidgetUtils().buildAppBar(Intr().fanshuixiangqing,msg: true,
          drawer:true,scaffoldKey: state.scaffoldKey),
      backgroundColor: ColorX.pageBg(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: ColorX.cardBg3(),
            padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${state.params.details?.gameName.em()}（${state.params.record?.date.em()}）",
                  style: TextStyle(fontSize: 16.sp,color: ColorX.text0d1(),fontWeight: FontWeight.w500,),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(Intr().zongji,style: TextStyle(fontSize: 16.sp,color: ColorX.text0d1(),fontWeight: FontWeight.w500,),),
                    Text("¥${state.params.record?.lossMoneyBonus.em()}",style: TextStyle(fontSize: 16.sp,color: ColorX.color_fc243b,fontWeight: FontWeight.w500,),),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
            child: Row(
              children: [
                Expanded(
                  flex: 25,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(Intr().youxileixing,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),fontWeight: FontWeight.w500),),
                  ),
                ),
                Expanded(
                  flex: 25,
                  child: Center(
                    child: Text(Intr().youxiaotouzhu,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),fontWeight: FontWeight.w500),),
                  ),
                ),
                Expanded(
                  flex: 25,
                  child: Center(
                    child: Text(Intr().shuying,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),fontWeight: FontWeight.w500),),
                  ),
                ),
                Expanded(
                  flex: 25,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(Intr().fanshui,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),fontWeight: FontWeight.w500),),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if(isEmpty(state.data)){
                return EmptyDataWidget(width: 1.sw, height: 50.h);
              }
              return ListView.builder(
                itemCount: state.data.em(),
                itemBuilder: (context,index){
                  var item = state.data[index];
                  if(index == state.data.length - 1){
                    return Column(
                      children: [
                        buildProfitItem(item),
                        EmptyDataWidget(width: 1.sw, height: 50.h),
                      ],
                    );
                  }
                  return buildProfitItem(item);
                },
              );
            }),
          ),
          // Column(
          //   children: [
          //     Obx(() {
          //       if(state.list.em() < 2){
          //         return Container();
          //       }
          //       var dateRange = logic.getRangeDate();
          //       return InkWell(
          //         onTap: ()=> Get.toNamed(Routes.profit_rebate,arguments:
          //         DayReturnWaterDetailsParams(details:state.list.first, beginDate:dateRange.first,
          //             endDate:dateRange.last)),
          //         child: buildProfitItem(state.list.first),
          //       );
          //     }),
          //     Obx(() {
          //       if(state.list.em() < 2){
          //         return Container();
          //       }
          //       return buildRebateTotal(Intr().xiaoji,"¥${state.list.first.lossMoneyBonus.em()}");
          //     }),
          //   ],
          // ),
        ],
      ),
    );
  }


  ///负盈利
  Widget buildProfitItem(RebateDetailEntity item) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
      child: Row(
        children: [
          Expanded(
            flex: 25,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(item.gameType.em(),style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),),),
            ),
          ),
          Expanded(
            flex: 25,
            child: Center(
              child: Text(item.validBetMoney.em(),style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),),),
            ),
          ),
          Expanded(
            flex: 25,
            child: Center(
              child: Text(item.lossMoney.em(),style: TextStyle(fontSize: 14.sp,
                  color: ColorX.color_fe2427,fontWeight: FontWeight.w600),),
            ),
          ),
          Expanded(
            flex: 25,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(item.lossMoneyBonus.em(),style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),),),
            ),
          ),
        ],
      ),
    );
  }





}