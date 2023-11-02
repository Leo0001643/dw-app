import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/bean/bill_wallet_entity.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'betting_details_logic.dart';

class BettingDetailsPage extends StatefulWidget {
  const BettingDetailsPage({Key? key}) : super(key: key);

  @override
  State<BettingDetailsPage> createState() => _BettingDetailsPageState();
}

class _BettingDetailsPageState extends State<BettingDetailsPage> {
  final logic = Get.find<BettingDetailsLogic>();
  final state = Get.find<BettingDetailsLogic>().state;
  late RefreshController _refreshController;

  @override
  void initState() {
    _refreshController= RefreshController();
    super.initState();
  }


  @override
  void dispose() {
    _refreshController.dispose();
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
          onTap: ()=> DialogUtils().showSelectOptionBtmDialog(context, Intr().quanbujilu,
              ["比特币1分28","加拿大28","加拿大西28","台湾宾果28"]),
          child: Row(
            children: [
              Text(Intr().quanbujilu,style: TextStyle(fontSize: 12.sp,color: ColorX.color_091722),),
              Image.asset(ImageX.icon_down_black),
            ],
          ),
        ),
      ),),
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
            Container(
              color: ColorX.color_f7f8fb,
              margin: EdgeInsets.only(top: 10.h),
              height: 40.h,
              child: Row(
                children: [
                  Expanded(
                    flex: 25,
                    child: Center(
                      child: Text(Intr().danhao,style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722,fontWeight: FontWeight.w500),),
                    ),
                  ),
                  Container(height: 40.h,width: 1.w,color: ColorX.color_10_949,),
                  Expanded(
                    flex: 25,
                    child: Center(
                      child: Text(Intr().neirong,style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722,fontWeight: FontWeight.w500),),
                    ),
                  ),
                  Container(height: 40.h,width: 1.w,color: ColorX.color_10_949,),
                  Expanded(
                    flex: 25,
                    child: Center(
                      child: Text(Intr().xiazhujine,style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722,fontWeight: FontWeight.w500),),
                    )
                  ),
                  Container(height: 40.h,width: 1.w,color: ColorX.color_10_949,),
                  Expanded(
                    flex: 25,
                    child: Center(
                      child: Text(Intr().keyingjine,style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722,fontWeight: FontWeight.w500),),
                    ),
                  ),
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
                child: ListView.separated(
                  itemCount: 20,
                  itemBuilder: (context,index){
                    return buildBetItem(index);
                  },
                  separatorBuilder: (context,index){
                    return Divider(height: 1.r,color: ColorX.color_10_949,);
                  },
                ),
              ),
            ),
            Container(
              color: ColorX.color_f7f8fb,
              margin: EdgeInsets.only(top: 10.h),
              height: 40.h,
              child: Row(
                children: [
                  Expanded(
                    flex: 25,
                    child: Center(
                      child: Text(Intr().xiaoji,style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722,fontWeight: FontWeight.w500),),
                    ),
                  ),
                  Expanded(
                    flex: 25,
                    child: Center(
                      child: Text(Intr().xbi(["100"]),style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722,fontWeight: FontWeight.w500),),
                    ),
                  ),
                  Expanded(
                      flex: 25,
                      child: Center(
                        child: Text("¥123.98",style: TextStyle(fontSize: 14.sp,color: ColorX.color_fc243b,fontWeight: FontWeight.w500),),
                      )
                  ),
                  Expanded(
                    flex: 25,
                    child: Center(
                      child: Text("¥678",style: TextStyle(fontSize: 14.sp,color: ColorX.color_fc243b,fontWeight: FontWeight.w500),),
                    ),
                  ),
                ],
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

  Widget buildBetItem(int index) {
    return Container(
      color: Colors.white,
      height: 94.h,
      child: Row(
        children: [
          Expanded(
            flex: 25,
            child: Container(
              padding: EdgeInsets.all(10.r),
              child: Text("45_MAX4_CNY45_MAX4_CNY",
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
                  GFTypography(
                    text: Intr().qihao_(["762252\n加拿大西28"]),
                    textColor: ColorX.color_091722,
                    type: GFTypographyType.typo6,
                    showDivider: false,
                    fontWeight: FontWeight.normal,
                  ),
                  const GFTypography(
                    text: "大1.881/1.888",
                    textColor: ColorX.color_fc243b,
                    type: GFTypographyType.typo6,
                    showDivider: false,
                    fontWeight: FontWeight.normal,
                  ),
                  const GFTypography(
                    text: "07-03 09:0026",
                    textColor: ColorX.color_6655e7,
                    type: GFTypographyType.typo6,
                    showDivider: false,
                    fontWeight: FontWeight.normal,
                  ),
                ],
              ),
            ),
          ),
          Container(height: 94.h,width: 1.r,color: ColorX.color_10_949,),
          Expanded(
              flex: 25,
              child: Center(
                child: Text("¥459.9",style: TextStyle(fontSize: 14.sp,color: ColorX.color_fc243b,),),
              )
          ),
          Container(height: 94.h,width: 1.r,color: ColorX.color_10_949,),
          Expanded(
            flex: 25,
            child: Center(
              child: Text("8.88/8.88",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722,),),
            ),
          ),
        ],
      ),
    );
  }


}