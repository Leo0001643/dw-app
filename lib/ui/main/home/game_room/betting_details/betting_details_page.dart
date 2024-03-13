import 'package:common_utils/common_utils.dart';
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
import 'package:leisure_games/ui/bean/bill_wallet_entity.dart';
import 'package:leisure_games/ui/bean/current_bet_entity.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'betting_details_logic.dart';

///注单
class BettingDetailsPage extends StatefulWidget {
  const BettingDetailsPage({Key? key}) : super(key: key);

  @override
  State<BettingDetailsPage> createState() => _BettingDetailsPageState();
}

class _BettingDetailsPageState extends State<BettingDetailsPage> {
  final logic = Get.find<BettingDetailsLogic>();
  final state = Get.find<BettingDetailsLogic>().state;
  // late RefreshController _refreshController;

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
    state.refreshController.dispose();
    Get.delete<BettingDetailsLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildAppBarBtn(Intr().xiazhuxiangqing,
      Padding(
        padding: EdgeInsets.only(right: 10.w),
        child: InkWell(
          onTap: () => Get.back(),
          child: Image.asset(ImageX.icon_close,width: 25.r,height: 25.r,color: ColorX.icon586(),),
        ),
      ),back: false),
      backgroundColor: ColorX.pageBg(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              InkWell(
                onTap: ()=> DialogUtils().showSelectOptionBtmDialog(context, Intr().quanbujilu,state.types).then((value) {
                  if(unEmpty(value)){
                    state.type.value = value;
                    state.type.refresh();
                    state.refreshController.requestRefresh();
                  }
                }),
                child: Row(
                  children: [
                    Obx(() {
                      return Text(state.type.value.memo.em(),style: TextStyle(fontSize: 12.sp,color: ColorX.text0917()),);
                    }),
                    Image.asset(ImageX.icon_down_black,color: ColorX.iconBlack(),),
                    SizedBox(width: 5.w,),
                  ],
                ),
              )
            ],
          ),
          Container(
            color: ColorX.pageBg2(),
            margin: EdgeInsets.only(top: 10.h),
            height: 40.h,
            child: Row(
              children: [
                Expanded(
                  flex: 25,
                  child: Center(
                    child: Text(Intr().danhao,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),fontWeight: FontWeight.w700),),
                  ),
                ),
                Container(height: 40.h,width: 1.w,color: ColorX.color_10_949,),
                Expanded(
                  flex: 25,
                  child: Center(
                    child: Text(Intr().neirong,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),fontWeight: FontWeight.w700),),
                  ),
                ),
                Container(height: 40.h,width: 1.w,color: ColorX.color_10_949,),
                Expanded(
                  flex: 25,
                  child: Center(
                    child: Text(Intr().xiazhujine,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),fontWeight: FontWeight.w700),),
                  )
                ),
                Container(height: 40.h,width: 1.w,color: ColorX.color_10_949,),
                Expanded(
                  flex: 25,
                  child: Center(
                    child: Text(Intr().keyingjine,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),fontWeight: FontWeight.w700),),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              return SmartRefresher(
                controller: state.refreshController,
                enablePullDown: true,
                enablePullUp: true,
                footer: CustomFooter(builder: (context,mode)=> Container(),height: 0,),
                onRefresh: ()=> logic.loadData(true),
                onLoading: ()=> logic.loadData(false),
                child: isEmpty(state.list) ?
                ListView(
                  children: [
                    buildBetEmpty(),
                    buildLastTotal(),
                  ],
                ):
                ListView.separated(
                  itemCount: state.list.em(),
                  itemBuilder: (context,index){
                    var item = state.list[index];
                    if(state.list.em() - 1 == index) {
                      return Column(
                        children: [
                          buildBetItem(item),
                          buildLastTotal(),
                        ],
                      );
                    } else {
                      return buildBetItem(item);
                    }
                  },
                  separatorBuilder: (context,index){
                    return Divider(height: 1.r,color: ColorX.color_10_949,);
                  },
                ),
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
        color: select ? ColorX.cardBg2():ColorX.cardBg(),
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

  Widget buildBetItem(CurrentBetContent item) {
    return Container(
      color: ColorX.cardBg(),
      // height: 94.h,
      child: Row(
        children: [
          Expanded(
            flex: 25,
            child: Container(
              padding: EdgeInsets.all(10.r),
              child: Text(item.billNo.em(),
                style: TextStyle(
                  fontSize: 14.sp,
                  color: ColorX.color_5583e7,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 2,
              ),
            ),
          ),
          Container(height: 94.h,width: 1.r,color: ColorX.color_10_949,),
          Expanded(
            flex: 25,
            child: Container(
              padding: EdgeInsets.all(5.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(Intr().qihao_(["${item.term.em()}\n${item.gameType.em()}"]),
                  style: TextStyle(color: ColorX.text0917(),fontSize: 12.sp,),),
                  Text("${item.betMsg.em()}${item.betOddsExpected.em()}/${item.betOdds1314.em()}",
                    style: TextStyle(color: ColorX.color_fc243b,fontSize: 12.sp,),),
                  Text(DateUtil.formatDateMs(item.createTime.em(),format: "MM-dd HH:mm:ss"),
                    style: TextStyle(color: ColorX.color_6655e7,fontSize: 12.sp,),),
                ],
              ),
            ),
          ),
          Container(height: 94.h,width: 1.r,color: ColorX.color_10_949,),
          Expanded(
              flex: 25,
              child: Center(
                child: Text("¥${item.betMoney.em()}",style: TextStyle(fontSize: 14.sp,color: ColorX.color_fc243b,),),
              )
          ),
          Container(height: 94.h,width: 1.r,color: ColorX.color_10_949,),
          Expanded(
            flex: 25,
            child: Center(
              child: Text("${item.winMoneyExpected.em()}/${item.winMoney1314.em()}",style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),),),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBetEmpty() {
    return Container(
      color: ColorX.cardBg(),
      // height: 94.h,
      child: Row(
        children: [
          Expanded(
            flex: 25,
            child: Container(
              padding: EdgeInsets.all(10.r),
              child: Text("----",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: ColorX.text5862(),
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 2,
              ),
            ),
          ),
          Container(height: 50.h,width: 1.r,color: ColorX.color_10_949,),
          Expanded(
            flex: 25,
            child: Container(
              padding: EdgeInsets.all(5.r),
              child: Text(Intr().zanwuxiazhujilu,
                style: TextStyle(color: ColorX.text5862(),fontSize: 12.sp,),),
            ),
          ),
          Container(height: 50.h,width: 1.r,color: ColorX.color_10_949,),
          Expanded(
              flex: 25,
              child: Center(
                child: Text("--.--",style: TextStyle(fontSize: 14.sp,color: ColorX.text5862(),),),
              )
          ),
          Container(height: 50.h,width: 1.r,color: ColorX.color_10_949,),
          Expanded(
            flex: 25,
            child: Center(
              child: Text("--.--",style: TextStyle(fontSize: 14.sp,color: ColorX.text5862(),),),
            ),
          ),
        ],
      ),
    );
  }


  Widget buildLastTotal() {
    return Container(
      color: ColorX.cardBg(),
      margin: EdgeInsets.only(top: 10.h),
      height: 40.h,
      child: Row(
        children: [
          Expanded(
            flex: 25,
            child: Center(
              child: Text(Intr().xiaoji,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),fontWeight: FontWeight.w500),),
            ),
          ),
          Expanded(
            flex: 25,
            child: Center(
              child: Obx(() {
                return Text(Intr().xbi(["${state.list.em()}"]),style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),fontWeight: FontWeight.w500),);
              }),
            ),
          ),
          Expanded(
              flex: 25,
              child: Center(
                child: Obx(() {
                  var betTotal = 0.0;
                  state.list.forEach((element) {
                    betTotal += element.betMoney.em();
                  });
                  return Text("¥$betTotal",style: TextStyle(fontSize: 14.sp,color: ColorX.color_fc243b,fontWeight: FontWeight.w500),);
                }),
              )
          ),
          Expanded(
            flex: 25,
            child: Center(
              child: Obx(() {
                var winTotal = 0.0;
                state.list.forEach((element) {
                  winTotal += element.winMoneyExpected.em();
                });
                return Text("¥$winTotal",style: TextStyle(fontSize: 14.sp,color: ColorX.color_fc243b,fontWeight: FontWeight.w500),);
              }),
            ),
          ),
        ],
      ),
    );
  }


}