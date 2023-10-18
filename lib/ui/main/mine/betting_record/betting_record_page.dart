import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
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
    return Scaffold(
      appBar: WidgetUtils().buildAppBar("投注记录",msg: true,bgColor: Colors.white),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
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
            SizedBox(height: 20.h,),
            Container(
              color: ColorX.color_f7f8fb,
              padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
              child: Row(
                children: [
                  Expanded(
                    flex: 40,
                    child: Text("投注日期 (东美时间)",style: TextStyle(fontSize: 14.sp,color: ColorX.color_0d192d),),
                  ),
                  Expanded(
                    flex: 30,
                    child: Text("输赢",style: TextStyle(fontSize: 14.sp,color: ColorX.color_0d192d),),
                  ),
                  Expanded(
                    flex: 30,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text("有效投注",style: TextStyle(fontSize: 14.sp,color: ColorX.color_0d192d),),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: ListView.separated(
                    itemBuilder: (context,index){
                      if((index + 1) < state.record.value.length){
                        return buildBettingItem(index);
                      } else {
                        return Column(
                          children: [
                            buildBettingItem(index),
                            Divider(height: 1.h,color: ColorX.color_10_949,indent: 10.w,endIndent: 10.w,),
                            buildTotalFooter()
                          ],
                        );
                      }
                    },
                    separatorBuilder: (context,index){
                        return Divider(height: 1.h,color: ColorX.color_10_949,indent: 10.w,endIndent: 10.w,);
                    },
                    itemCount: state.record.value.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildWalletTab(BillWalletEntity item,bool select) {
    return Container(
      decoration: BoxDecoration(
        color: select ? Colors.white:ColorX.color_f7f8fb,
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

  Widget buildTotalFooter() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 13.h),
      child: Row(
        children: [
          Expanded(
            flex: 40,
            child: Text("总计",style: TextStyle(fontSize: 14.sp,color: ColorX.color_0d192d,fontWeight: FontWeight.w600),),
          ),
          Expanded(
            flex: 30,
            child: Text("+659.0",style: TextStyle(fontSize: 14.sp,color: ColorX.color_fc243b,fontWeight: FontWeight.w600),),
          ),
          Expanded(
            flex: 30,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text("1234.0",style: TextStyle(fontSize: 14.sp,color: ColorX.color_0d192d,fontWeight: FontWeight.w600),),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBettingItem(int index) {
    var result = index%2 == 1;
    return InkWell(
      onTap: ()=> Get.toNamed(Routes.betting_detail,arguments: "2023-06-06"),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 13.h),
        child: Row(
          children: [
            Expanded(
              flex: 40,
              child: Text("2023-06-06",style: TextStyle(fontSize: 14.sp,color: ColorX.color_0d192d,),),
            ),
            Expanded(
              flex: 30,
              child: Text("${result ? "+" : "-"}897.0",style: TextStyle(fontSize: 14.sp,color: result ? ColorX.color_23a81d : ColorX.color_fc243b,),),
            ),
            Expanded(
              flex: 30,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text("0",style: TextStyle(fontSize: 14.sp,color: ColorX.color_0d192d,),),
              ),
            ),
          ],
        ),
      ),
    );
  }

}