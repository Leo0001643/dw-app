import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/app/utils/refresh_change_notifier.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/drawer_scaffold.dart';
import 'package:leisure_games/ui/bean/bill_wallet_entity.dart';
import 'package:leisure_games/ui/bean/flow_data_entity.dart';
import 'package:leisure_games/ui/bean/payment_list_entity.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'bill_flow_logic.dart';
///资金明细
class BillFlowPage extends StatefulWidget {
  const BillFlowPage({Key? key}) : super(key: key);

  @override
  State<BillFlowPage> createState() => _BillFlowPageState();
}

class _BillFlowPageState extends State<BillFlowPage> {
  final logic = Get.find<BillFlowLogic>();
  final state = Get.find<BillFlowLogic>().state;

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
    Get.delete<BillFlowLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      scaffoldKey: state.scaffoldKey,
      appBar: WidgetUtils().buildAppBar(Intr().zijinmingxi,msg: true,
          drawer:true,scaffoldKey: state.scaffoldKey),
      backgroundColor: ColorX.pageBg2(),
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
                      state.selectIndex = state.wallets.indexOf(e);
                      state.refreshController.requestRefresh();
                    },
                    child: buildWalletTab(e, state.currentWallet.value == e ),
                  );
                }).toList(),
              );
            }),
          ),
          SizedBox(height: 10.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: ()=> DialogUtils().showSelectOptionBtmDialog(context, Intr().xuanzheriqi,state.filterTime).then((value) {
                    if(unEmpty(value) && value is PaymentListBanks){
                      state.selectTime.value = value;
                      state.selectTime.refresh();
                      state.refreshController.requestRefresh();
                    }
                  }),
                  child: Row(
                    children: [
                      Obx(() {
                        return Text(state.selectTime.value.bankName.em(),style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),);
                      }),
                      SizedBox(width: 5.w,),
                      Image.asset(ImageX.icon_down_grey,color: ColorX.icon586(),),
                    ],
                  ),
                ),
                InkWell(
                  onTap: ()=> DialogUtils().showSelectOptionBtmDialog(context,Intr().shaixuan, state.filterStatus).then((value) {
                    if(unEmpty(value) && value is PaymentListBanks){
                      state.selectStatus.value = value;
                      state.selectStatus.refresh();
                      state.refreshController.requestRefresh();
                    }
                  }),
                  child: Row(
                    children: [
                      Obx(() {
                        return Text(state.selectStatus.value.bankName.em(), style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),);
                      }),
                      SizedBox(width: 5.w,),
                      Image.asset(ImageX.icon_down_grey,color: ColorX.icon586(),),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 12.w,vertical: 10.h),
              decoration: BoxDecoration(color: ColorX.cardBg(),borderRadius: BorderRadius.circular(10.r)),
              child: Column(
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
                            return buildBillItem(state.list[index]);
                          },
                        ),
                      );
                    }),
                  ),
                ],
              ),
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

  Widget buildBillItem(FlowDataList item) {
    var symbol = item.transType == "IN" ? "+":"-";
    var color = item.transType == "IN" ? ColorX.color_23a81d:ColorX.color_fc243b;
    var icon = state.selectIndex == 0 ? ImageX.icon_jj_grey:ImageX.usdtT();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      margin: EdgeInsets.only(top: 10.h),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(icon),
              SizedBox(width: 3.w,),
              Expanded(
                child: Text(item.mtype.em(),style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
              ),
              Text("$symbol ${item.mgold.em()}",style: TextStyle(fontSize: 14.sp,color: color),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(item.time.em(),style: TextStyle(fontSize: 12.sp,color: ColorX.text586()),),
              Text("${Intr().yue_}${item.afterMoney.em()}",style: TextStyle(fontSize: 12.sp,color: ColorX.text586()),),
            ],
          ),
        ],
      ),
    );
  }


}