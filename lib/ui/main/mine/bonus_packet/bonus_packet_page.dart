import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/bean/bill_wallet_entity.dart';
import 'package:leisure_games/ui/bean/prize_list_entity.dart';

import '../../../../main.dart';
import '../../ends_drawer_view.dart';
import 'bonus_packet_logic.dart';

///红包和奖金
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
      key: scaffoldMineKey,
      appBar: WidgetUtils().buildAppBar(Intr().hongbaohejiangjin,msg: true,drawer:true,drawEnd:(){
        scaffoldMineKey.currentState?.openEndDrawer();
      }),
      endDrawer: EndsDrawerView(),
      backgroundColor: ColorX.pageBg(),
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
                        logic.changeTab();
                      },
                      child: buildWalletTab(e, state.currentWallet.value == e ),
                    );
                  }).toList(),
                );
              }),
            ),
            SizedBox(height: 10.h,),
            Container(
              color: ColorX.cardBg3(),
              padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
              child: Row(
                children: [
                  Expanded(
                    flex: 25,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(Intr().youxiaoqi,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),
                      fontWeight: FontWeight.w500,),),
                    ),
                  ),
                  Expanded(
                    flex: 25,
                    child: Center(
                      child: Text(Intr().jine,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),
                        fontWeight: FontWeight.w500,),),
                    ),
                  ),
                  Expanded(
                    flex: 25,
                    child: Center(
                      child: Text(Intr().xuyaodamaliang,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),
                        fontWeight: FontWeight.w500,),),
                    ),
                  ),
                  Expanded(
                    flex: 25,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(Intr().jiaoyileibie,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),
                        fontWeight: FontWeight.w500,),),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(() {
                return ListView.separated(
                  itemBuilder: (context,index){
                    return buildBonusItem(state.record[index]);
                  },
                  separatorBuilder: (context,index){
                    return Divider(height: 1.h,color: ColorX.color_10_949,indent: 10.w,endIndent: 10.w,);
                  },
                  itemCount: state.record.length,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }


  Widget buildWalletTab(BillWalletEntity item,bool select) {
    return Container(
      decoration: BoxDecoration(
        color: select ? ColorX.cardBg():ColorX.cardBg3(),
        borderRadius: BorderRadius.circular(10.r),
        border: select ? Border.all(color: ColorX.color_fc243b,width: 1.r) : null,
      ),
      margin: EdgeInsets.only(left: 15.w),
      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 8.h),
      child: Row(
        children: [
          Image.asset(select ? item.activeIcon:item.normalIcon),
          SizedBox(width: 3.w,),
          Text(item.name,style: TextStyle(fontSize: 14.sp,color: select ? ColorX.color_fc243b:ColorX.text0917()),),
        ],
      ),
    );
  }


  Widget buildBonusItem(PrizeListPrizes item) {
    // var result = index%2 == 1;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
      child: Row(
        children: [
          Expanded(
            flex: 25,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(DateUtil.formatDateMs(item.endTime.em() * 1000,format: DateFormats.y_mo_d),
                style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1()),),
            ),
          ),
          Expanded(
            flex: 25,
            child: Center(
              child: Text("${item.bonusMoney.em()}",style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1()),),
            ),
          ),
          Expanded(
            flex: 25,
            child: Center(
              child: Text("${item.bonusMoneyCode.em()}",style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1()),),
            ),
          ),
          Expanded(
            flex: 25,
            child: InkWell(
              onTap: () {
                // if(!result){ showToast(Intr().tiquchenggong); }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(item.statusString(),style: TextStyle(fontSize: 14.sp, color: true ? ColorX.text5862() : ColorX.text0d1(),
                      decoration: true ? TextDecoration.underline : null),),
                  Image.asset(ImageX.ic_into_right,color: ColorX.icon586(),),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}