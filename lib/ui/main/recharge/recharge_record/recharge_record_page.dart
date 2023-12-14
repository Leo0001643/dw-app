import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/bean/deposit_log_entity.dart';
import 'package:leisure_games/ui/bean/payment_list_entity.dart';

import 'recharge_record_logic.dart';
///充值记录
class RechargeRecordPage extends StatefulWidget {
  const RechargeRecordPage({Key? key}) : super(key: key);

  @override
  State<RechargeRecordPage> createState() => _RechargeRecordPageState();
}

class _RechargeRecordPageState extends State<RechargeRecordPage> {
  final logic = Get.find<RechargeRecordLogic>();
  final state = Get.find<RechargeRecordLogic>().state;
  // late RefreshController _refreshController;

  @override
  void initState() {
    // _refreshController= RefreshController();
    super.initState();
  }

  @override
  void dispose() {
    // _refreshController.dispose();
    Get.delete<RechargeRecordLogic>();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildAppBar(Intr().chongzhijilu,msg: true,bgColor: ColorX.appBarBg()),
      backgroundColor: ColorX.pageBg(),
      body: Column(
        children: [
          Container(
            height: 45.h,
            child: Row(
              children: [
                Obx(() {
                  return buildFilterItem(0,state.selectStatus.value.bankName.em(), state.filterStatus);
                }),
                Obx(() {
                  return buildFilterItem(1,state.selectWay.value.bankName.em(), state.filterWays);
                }),
                Obx(() {
                  return buildFilterItem(2,state.selectTime.value.bankName.em(), state.filterTime);
                }),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (context,index){
                  return buildBillItem(state.data[index],index);
                },
              );
            })
          ),
        ],
      ),
    );
  }


  Widget buildFilterItem(int index,String tab,List list) {
    return Expanded(
      child: InkWell(
        onTap: ()=> DialogUtils().showSelectOptionBtmDialog(context,Intr().qingxuanzhe,list).then((value) {
          if(unEmpty(value) && value is PaymentListBanks){
            switch(index){
              case 0:
                state.selectStatus.value = value;
                state.selectStatus.refresh();
                break;
              case 1:
                state.selectWay.value = value;
                state.selectWay.refresh();
                break;
              case 2:
                state.selectTime.value = value;
                state.selectTime.refresh();
                break;
            }
            logic.loadData();
          }
        }),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(tab,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
            Image.asset(ImageX.icon_down_black,color: ColorX.icon586(),),
          ],
        ),
      ),
    );
  }


  Widget buildBillItem(DepositLogEntity item,int index) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      margin: EdgeInsets.only(top: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.bankName.em(),style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
                Text(DateUtil.formatDateMs(item.addTime.em() * 1000),
                  style: TextStyle(fontSize: 12.sp,color: ColorX.text586()),),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("¥${item.money}",style: TextStyle(fontSize: 14.sp,color: ColorX.color_23a81d),),
                Text(item.statusText(),style: TextStyle(fontSize: 12.sp,color: ColorX.text586()),),
              ],
            ),
          ),
        ],
      ),
    );
  }


}