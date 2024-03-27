import 'dart:convert';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/drawer_scaffold.dart';
import 'package:leisure_games/ui/bean/bet_record_group_entity.dart';
import 'package:leisure_games/ui/bean/bill_wallet_entity.dart';

import 'betting_record_logic.dart';

///投注记录
class BettingRecordPage extends StatefulWidget {
  const BettingRecordPage({Key? key}) : super(key: key);

  @override
  State<BettingRecordPage> createState() => _BettingRecordPageState();
}

class _BettingRecordPageState extends State<BettingRecordPage> {
  final logic = Get.find<BettingRecordLogic>();
  final state = Get.find<BettingRecordLogic>().state;


  @override
  void dispose() {
    Get.delete<BettingRecordLogic>();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      scaffoldKey: state.scaffoldKey,
      appBar: WidgetUtils().buildAppBar(Intr().touzhujilu,msg: true,
          bgColor: ColorX.appBarBg(),drawer:true, scaffoldKey: state.scaffoldKey),
      backgroundColor: ColorX.pageBg(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Obx(() {
              return Row(
                children: state.wallets.map((e){
                  return GestureDetector(
                    onTap: (){
                      state.currentWallet.value = e;
                      state.currentWallet.refresh();
                      logic.loadData();
                    },
                    child: buildWalletTab(e, state.currentWallet.value == e ),
                  );
                }).toList(),
              );
            }),
          ),
          SizedBox(height: 20.h,),
          Container(
            color: ColorX.cardBg2(),
            padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
            child: Row(
              children: [
                Expanded(
                  flex: 40,
                  child: Text(Intr().touzhuriqi,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1()),),
                ),
                Expanded(
                  flex: 30,
                  child: Text(Intr().shuying,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1()),),
                ),
                Expanded(
                  flex: 30,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(Intr().youxiaotouzhu,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1()),),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              return ListView.separated(
                itemBuilder: (context,index){
                  if(unEmpty(state.record.value.record)){
                    var item = state.record.value.record![index];
                    if((index + 1) < state.record.value.record.em()){
                      return buildBettingItem(item);
                    } else {
                      return Column(
                        children: [
                          buildBettingItem(item),
                          Divider(height: 1.h,color: ColorX.color_10_949,indent: 10.w,endIndent: 10.w,),
                          buildTotalFooter(state.record.value)
                        ],
                      );
                    }
                  } else {
                    return Container();
                  }
                },
                separatorBuilder: (context,index){
                  return Divider(height: 1.h,color: ColorX.color_10_949,indent: 10.w,endIndent: 10.w,);
                },
                itemCount: state.record.value.record.em(),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget buildWalletTab(BillWalletEntity item,bool select) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: select ? ColorX.cardBg():ColorX.cardBg3(),
        border: select ? Border.all(color: ColorX.color_fc243b,width: 1.r) : null,
      ),
      margin: EdgeInsets.only(left: 15.w),
      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 8.h),
      child: Row(
        children: [
          WidgetUtils().buildImage(select ? item.activeIcon:item.normalIcon, 15.r, 15.r),
          SizedBox(width: 3.w,),
          Text(item.name,style: TextStyle(fontSize: 14.sp,color: select ? ColorX.color_fc243b:ColorX.text0917()),),
        ],
      ),
    );
  }

  Widget buildTotalFooter(BetRecordGroupEntity group) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 13.h),
      child: Row(
        children: [
          Expanded(
            flex: 40,
            child: Text(Intr().zongji,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),fontWeight: FontWeight.w600),),
          ),
          Expanded(
            flex: 30,
            child: Text("${(group.winloseTotal.em() >= 0) ? "+" : ""}${DataUtils.formatMoney(group.winloseTotal)}",
              style: TextStyle(fontSize: 14.sp,color: (group.winloseTotal.em() >= 0) ? ColorX.color_23a81d : ColorX.color_fc243b,fontWeight: FontWeight.w600),),
          ),
          Expanded(
            flex: 30,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(DataUtils.formatMoney(group.validAmountTotal),style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),fontWeight: FontWeight.w600),),
            ),
          ),
        ],
      ),
    );
  }

  ///0 显示黑色 正数 显示绿色  负数 显示红色

  Widget buildBettingItem(BetRecordGroupRecord item) {
    var winloseColor = item.winlose.em() == 0 ? ColorX.color_5b6d7b : ((item.winlose.em() > 0) ? ColorX.color_23a81d : ColorX.color_fc243b);

    return InkWell(
      onTap:(){
        if(item.validamount.em() > 0){
          if(state.currentWallet.value == state.wallets.first){
            item.cur = "1";
          } else {
            item.cur = "5";
          }
          item.title=item.time;
          Get.toNamed(Routes.betting_detail,arguments: item);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 13.h),
        child: Row(
          children: [
            Expanded(
              flex: 40,
              child: Text(item.time.em(),style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),),),
            ),
            Expanded(
              flex: 30,
              child: Text("${(item.winlose.em() >= 0) ? "+" : ""}${DataUtils.formatMoney(item.winlose)}",
                style: TextStyle(fontSize: 14.sp,color: winloseColor),),
            ),
            Expanded(
              flex: 30,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(DataUtils.formatMoney(item.validamount),style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),),),
              ),
            ),
            item.validamount.em() >0 ? WidgetUtils().buildImage(ImageX.ic_into_right, 12.r, 12.r) : SizedBox(width: 12.r,),
          ],
        ),
      ),
    );
  }

}