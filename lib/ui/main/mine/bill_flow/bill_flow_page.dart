import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/bean/bill_wallet_entity.dart';

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
  void dispose() {
    Get.delete<BillFlowLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildAppBar("资金明细",msg: true,),
      backgroundColor: ColorX.color_f7f8fb,
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
                  onTap: ()=> DialogUtils().showSelectOptionBtmDialog(context,"选择日期",["今日","7日","15日","30日",]),
                  child: Row(
                    children: [
                      Text("今日",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722),),
                      SizedBox(width: 5.w,),
                      Image.asset(ImageX.icon_down_grey),
                    ],
                  ),
                ),
                InkWell(
                  onTap: ()=> DialogUtils().showSelectOptionBtmDialog(context,"筛选",["全部","“存/提款”","转账"]),
                  child: Row(
                    children: [
                      Text("筛选",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722),),
                      SizedBox(width: 5.w,),
                      Image.asset(ImageX.icon_down_grey),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 12.w,vertical: 10.h),
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10.r)),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: ColorX.color_fefff4,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),topRight: Radius.circular(10.r),),
                    ),
                    height: 54.h,
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text("今日",style: TextStyle(fontSize: 18.sp,color: ColorX.color_091722,
                              fontWeight: FontWeight.w600),),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Text("支出",style: TextStyle(fontSize: 12.sp,color: ColorX.color_091722,
                                  fontWeight: FontWeight.w500),),
                              Text("¥12,345",style: TextStyle(fontSize: 16.sp,
                                  color: ColorX.color_fc243b,fontWeight: FontWeight.w500),),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("收入",style: TextStyle(fontSize: 12.sp,color: ColorX.color_091722,
                                  fontWeight: FontWeight.w500),),
                              Text("¥12,345",style: TextStyle(fontSize: 16.sp,
                                  color: ColorX.color_23a81d,fontWeight: FontWeight.w500),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 20,
                      itemBuilder: (context,index){
                        return buildBillItem(index);
                      },
                    ),
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
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
        border: select ? Border.all(color: ColorX.color_fc243b,width: 1.r) : null,
      ),
      margin: EdgeInsets.only(left: 15.w),
      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 8.h),
      child: Row(
        children: [
          Image.asset(select ? item.activeIcon:item.normalIcon),
          SizedBox(width: 3.w,),
          Text(item.name,style: TextStyle(fontSize: 14.sp,color: select ? ColorX.color_fc243b:ColorX.color_091722),),
        ],
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
          Image.asset(ImageX.icon_jj_grey),
          SizedBox(width: 3.w,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("奖金提取",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722),),
                Text("6月1日  15:55",style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d),),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("+¥188.00",style: TextStyle(fontSize: 14.sp,color: ColorX.color_23a81d),),
                Text("余额: 11,888",style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d),),
              ],
            ),
          ),
        ],
      ),
    );
  }


}