import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/bean/bill_wallet_entity.dart';

import 'bonus_packet_logic.dart';

class BonusPacketPage extends StatefulWidget {
  const BonusPacketPage({Key? key}) : super(key: key);

  @override
  State<BonusPacketPage> createState() => _BonusPacketPageState();
}

class _BonusPacketPageState extends State<BonusPacketPage> {
  final logic = Get.find<BonusPacketLogic>();
  final state = Get.find<BonusPacketLogic>().state;

  @override
  void dispose() {
    Get.delete<BonusPacketLogic>();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildAppBar("红包与奖金",msg: true,bgColor: Colors.white),
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
            SizedBox(height: 10.h,),
            Container(
              color: ColorX.color_f7f8fb,
              padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
              child: Row(
                children: [
                  Expanded(
                    flex: 25,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("有效期",style: TextStyle(fontSize: 14.sp,color: ColorX.color_0d192d,
                      fontWeight: FontWeight.w500,),),
                    ),
                  ),
                  Expanded(
                    flex: 25,
                    child: Center(
                      child: Text("金额",style: TextStyle(fontSize: 14.sp,color: ColorX.color_0d192d,
                        fontWeight: FontWeight.w500,),),
                    ),
                  ),
                  Expanded(
                    flex: 25,
                    child: Center(
                      child: Text("需要打码量",style: TextStyle(fontSize: 14.sp,color: ColorX.color_0d192d,
                        fontWeight: FontWeight.w500,),),
                    ),
                  ),
                  Expanded(
                    flex: 25,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text("交易类别",style: TextStyle(fontSize: 14.sp,color: ColorX.color_0d192d,
                        fontWeight: FontWeight.w500,),),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context,index){
                    return buildBonusItem(index);
                  },
                  separatorBuilder: (context,index){
                    return Divider(height: 1.h,color: ColorX.color_10_949,indent: 10.w,endIndent: 10.w,);
                  },
                  itemCount: state.record.length,
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


  Widget buildBonusItem(int index) {
    var result = index%2 == 1;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
      child: Row(
        children: [
          Expanded(
            flex: 25,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("2023-06-08",style: TextStyle(fontSize: 14.sp,color: ColorX.color_0d192d),),
            ),
          ),
          Expanded(
            flex: 25,
            child: Center(
              child: Text("36",style: TextStyle(fontSize: 14.sp,color: ColorX.color_0d192d),),
            ),
          ),
          Expanded(
            flex: 25,
            child: Center(
              child: Text("0",style: TextStyle(fontSize: 14.sp,color: ColorX.color_0d192d),),
            ),
          ),
          Expanded(
            flex: 25,
            child: InkWell(
              onTap: () {
                if(!result){ showToast("提取成功"); }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(result ? "已提取" : "提取",style: TextStyle(fontSize: 14.sp, color: result ? ColorX.color_58698d : ColorX.color_0d192d,
                      decoration: result ? TextDecoration.underline : null),),
                  Image.asset(ImageX.ic_into_right),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}