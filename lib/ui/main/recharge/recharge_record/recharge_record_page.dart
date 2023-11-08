import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
  late RefreshController _refreshController;

  @override
  void initState() {
    _refreshController= RefreshController();
    super.initState();
  }

  @override
  void dispose() {
    _refreshController.dispose();
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
                buildFilterItem(state.filterStatus.first, state.filterStatus),
                buildFilterItem(state.filterWays.first, state.filterWays),
                buildFilterItem(state.filterTime.first, state.filterTime),
              ],
            ),
          ),
          Expanded(
            child: SmartRefresher(
              controller: _refreshController,
              enablePullDown: true,
              enablePullUp: true,
              onRefresh: ()=> _refreshController.refreshCompleted(),
              onLoading: ()=> _refreshController.loadComplete(),
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context,index){
                  return buildBillItem(index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget buildFilterItem(String tab,List<String> list) {
    return Expanded(
      child: InkWell(
        onTap: ()=> DialogUtils().showSelectOptionBtmDialog(context,Intr().qingxuanzhe,list),
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


  Widget buildBillItem(int index) {
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
                Text("银行卡转账",style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
                Text("6月1日  15:55",style: TextStyle(fontSize: 12.sp,color: ColorX.text586()),),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("¥188.00",style: TextStyle(fontSize: 14.sp,color: ColorX.color_23a81d),),
                Text("成功",style: TextStyle(fontSize: 12.sp,color: ColorX.text586()),),
              ],
            ),
          ),
        ],
      ),
    );
  }


}