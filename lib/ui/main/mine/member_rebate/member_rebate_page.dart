import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/drawer_scaffold.dart';
import 'package:leisure_games/app/widget/empty_data_widget.dart';
import 'package:leisure_games/ui/bean/back_water_entity.dart';
import 'package:leisure_games/ui/bean/bill_wallet_entity.dart';
import 'package:leisure_games/ui/bean/day_return_water_details_params.dart';
import 'package:leisure_games/ui/bean/payment_list_entity.dart';

import 'member_rebate_logic.dart';
///会员返水
class MemberRebatePage extends StatefulWidget {
  const MemberRebatePage({Key? key}) : super(key: key);

  @override
  State<MemberRebatePage> createState() => _MemberRebatePageState();
}

class _MemberRebatePageState extends State<MemberRebatePage> {
  final logic = Get.find<MemberRebateLogic>();
  final state = Get.find<MemberRebateLogic>().state;


  @override
  void dispose() {
    Get.delete<MemberRebateLogic>();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      scaffoldKey: state.scaffoldKey,
      appBar: WidgetUtils().buildAppBar(Intr().huiyuanfanshui,msg: true,
          drawer:true,scaffoldKey: state.scaffoldKey),
      backgroundColor: ColorX.pageBg(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(() {
                  return Row(
                    children: state.wallets.map((e){
                      return GestureDetector(
                        onTap: (){
                          state.currentWallet.value = e;
                          state.currentWallet.refresh();
                          state.selectIndex = state.wallets.indexOf(e);
                          logic.loadList();
                        },
                        child: buildWalletTab(e, state.currentWallet.value == e ),
                      );
                    }).toList(),
                  );
                }),
              ),
              SizedBox(height: 10.h,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(() {
                  return Row(
                    children: state.filterTime.map((e){
                      return GestureDetector(
                        onTap: (){
                          state.selectTime.value = e;
                          state.selectTime.refresh();
                          logic.loadList();
                        },
                        child: buildTimeTab(e, state.selectTime.value == e ),
                      );
                    }).toList(),
                  );
                }),
              ),
              SizedBox(height: 10.h,),
              Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: Text(Intr().zhu_beijingshijian,style: TextStyle(fontSize: 12.sp,color: ColorX.text5862()),),
              ),
              SizedBox(height: 17.h,),
              Container(
                color: ColorX.cardBg3(),
                padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(Intr().fuyinglifanshui,style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600,
                    color: ColorX.textBlack()),),
                    InkWell(
                      onTap: (){
                        if(unEmpty(state.backWaterDesc)){
                          DialogUtils().showRebateRoleBtmDialog(context,state.backWaterDesc!);
                        }
                      },
                      child: WidgetUtils().buildImage(ImageX.iconBzzxT(), 24.r, 24.r),
                    ),
                  ],
                ),
              ),
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
              Column(
                children: [
                  Obx(() {
                    if(state.list.em() < 2){
                      return Container();
                    }
                    var dateRange = logic.getRangeDate();
                    return InkWell(
                      onTap: (){
                        var cur = state.selectIndex == 0 ? 1 : 5;
                        Get.toNamed(Routes.profit_rebate,arguments:
                        DayReturnWaterDetailsParams(details:state.list.first, beginDate:dateRange.first,
                            endDate:dateRange.last,cur: cur));
                      },
                      child: buildProfitItem(state.list.first),
                    );
                  }),
                  Obx(() {
                    if(state.list.em() < 2){
                      return Container();
                    }
                    var symbol = state.selectIndex == 0 ? 1 : 5;
                    return buildRebateTotal(Intr().xiaoji,"${symbolB(symbol)}${state.list.first.lossMoneyBonus.em()}");
                  }),
                ],
              ),
              SizedBox(height: 17.h,),
              Container(
                color: ColorX.cardBg3(),
                padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(Intr().touzhuliangfanshui,style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600,
                        color: ColorX.textBlack(),),),
                    InkWell(
                      onTap: (){
                        if(unEmpty(state.backWaterDesc)){
                          DialogUtils().showRebateRoleBtmDialog(context,state.backWaterDesc!);
                        }
                      },
                      child: WidgetUtils().buildImage(ImageX.iconBzzxT(), 24.r, 24.r),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
                child: Row(
                  children: [
                    Expanded(
                      flex: 33,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(Intr().youxileixing,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),fontWeight: FontWeight.w500),),
                      ),
                    ),
                    Expanded(
                      flex: 33,
                      child: Center(
                        child: Text(Intr().youxiaotouzhu,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),fontWeight: FontWeight.w500),),
                      ),
                    ),
                    Expanded(
                      flex: 33,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(Intr().fanshui,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),fontWeight: FontWeight.w500),),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Obx(() {
                    if(state.list.em() < 2){
                      return Container();
                    }
                    var dateRange = logic.getRangeDate();
                    return InkWell(
                      onTap: (){
                        var cur = state.selectIndex == 0 ? 1 : 5;
                        Get.toNamed(Routes.bet_amount_rebate,arguments:
                        DayReturnWaterDetailsParams(details:state.list.last, beginDate:dateRange.first, endDate:dateRange.last,cur: cur));
                      },
                      child: buildBetAmountItem(state.list.last),
                    );
                  }),
                  Obx(() {
                    if(state.list.em() < 2){
                      return Container();
                    }
                    var total = 0.0;
                    state.list.forEach((element) { total += element.lossMoneyBonus.em(); });
                    var symbol = state.selectIndex == 0 ? 1 : 5;
                    return buildRebateTotal(Intr().zongji, "${symbolB(symbol)}$total");
                  }),
                ],
              ),
              SizedBox(height: 10.h,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(Intr().jinrizuhezhanbilv,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),fontWeight: FontWeight.w600),),
                    Obx(() {
                      return Text("${state.constituteRatio.value.combinBetRatio.em()}%",style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),fontWeight: FontWeight.w600),);
                    }),
                  ],
                ),
              ),
              Center(
                child: EmptyDataWidget(width: 1.sw, height: 100.h),
              ),
            ],
          ),
        ),
      ),
    );
  }



  buildTimeTab(PaymentListBanks item, bool select) {
    return Container(
      decoration: BoxDecoration(
        color: select ? ColorX.cardBg():ColorX.cardBg3(),
        borderRadius: BorderRadius.circular(10.r),
        border: select ? Border.all(color: ColorX.color_fc243b,width: 1.r) : null,
      ),
      margin: EdgeInsets.only(left: 15.w),
      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 8.h),
      child: Text(item.bankName.em(),style: TextStyle(fontSize: 14.sp,color: select ? ColorX.color_fc243b:ColorX.text0917()),),
    );
  }

  ///负盈利
  Widget buildProfitItem(BackWaterEntity item) {
    var symbol = state.selectIndex == 0 ? 1 : 5;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
      child: Row(
        children: [
          Expanded(
            flex: 25,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(item.gameName.em(),style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),),),
            ),
          ),
          Expanded(
            flex: 25,
            child: Center(
              child: Text("${symbolB(symbol)}${item.validBetMoney.em()}",style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),),),
            ),
          ),
          Expanded(
            flex: 25,
            child: Center(
              child: Text("${symbolB(symbol)}${item.lossMoney.em()}",style: TextStyle(fontSize: 14.sp,
                color: ColorX.color_fe2427,fontWeight: FontWeight.w600),),
            ),
          ),
          Expanded(
            flex: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("${symbolB(symbol)}${item.lossMoneyBonus.em()}",style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),),),
                Image.asset(ImageX.ic_into_right,color: ColorX.icon586(),),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRebateTotal(String name,String amount) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),fontWeight: FontWeight.w600),),
          Text(amount,style: TextStyle(fontSize: 14.sp,color: ColorX.color_fc243b,fontWeight: FontWeight.w600),),
        ],
      ),
    );
  }

  Widget buildBetAmountItem(BackWaterEntity item) {
    var symbol = state.selectIndex == 0 ? 1 : 5;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
      child: Row(
        children: [
          Expanded(
            flex: 25,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(item.gameName.em(),style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),),),
            ),
          ),
          Expanded(
            flex: 25,
            child: Center(
              child: Text("${symbolB(symbol)}${item.validBetMoney.em()}",style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),),),
            ),
          ),
          Expanded(
            flex: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("${symbolB(symbol)}${item.lossMoneyBonus.em()}",style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),),),
                Image.asset(ImageX.ic_into_right,color: ColorX.icon586(),),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget buildWalletTab(BillWalletEntity item,bool select) {
    return Container(
      decoration: BoxDecoration(
        color: ColorX.cardBg(),
        borderRadius: BorderRadius.circular(10.r),
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

}