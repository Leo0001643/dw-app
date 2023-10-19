import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/empty_data_widget.dart';

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
    return Scaffold(
      appBar: WidgetUtils().buildAppBar("会员返水",msg: true,bgColor: Colors.white),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(() {
                  return Row(
                    children: state.times.map((e){
                      return GestureDetector(
                        onTap: (){
                          state.currentTime.value = e;
                        },
                        child: buildTimeTab(e, state.currentTime.value == e ),
                      );
                    }).toList(),
                  );
                }),
              ),
              SizedBox(height: 10.h,),
              Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: Text("注:北京时间 = 美东时间 + 12小时",style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d),),
              ),
              SizedBox(height: 17.h,),
              Container(
                color: ColorX.color_f7f8fb,
                padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("负盈利返水",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600,),),
                    InkWell(
                      onTap: (){
                        DialogUtils().showRebateRoleBtmDialog(context);
                      },
                      child: Image.asset(ImageX.icon_bzzx),
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
                        child: Text("游戏类型",style: TextStyle(fontSize: 14.sp,color: ColorX.color_0d192d,fontWeight: FontWeight.w500),),
                      ),
                    ),
                    Expanded(
                      flex: 25,
                      child: Center(
                        child: Text("有效投注",style: TextStyle(fontSize: 14.sp,color: ColorX.color_0d192d,fontWeight: FontWeight.w500),),
                      ),
                    ),
                    Expanded(
                      flex: 25,
                      child: Center(
                        child: Text("输赢",style: TextStyle(fontSize: 14.sp,color: ColorX.color_0d192d,fontWeight: FontWeight.w500),),
                      ),
                    ),
                    Expanded(
                      flex: 25,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text("返水",style: TextStyle(fontSize: 14.sp,color: ColorX.color_0d192d,fontWeight: FontWeight.w500),),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  InkWell(
                    onTap: ()=> Get.toNamed(Routes.profit_rebate),
                    child: buildProfitItem(),
                  ),
                  InkWell(
                    onTap: ()=> Get.toNamed(Routes.profit_rebate),
                    child: buildProfitItem(),
                  ),
                  InkWell(
                    onTap: ()=> Get.toNamed(Routes.profit_rebate),
                    child: buildProfitItem(),
                  ),
                  buildRebateTotal("小计","¥0"),
                ],
              ),
              SizedBox(height: 17.h,),
              Container(
                color: ColorX.color_f7f8fb,
                padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("投注量返水",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600,),),
                    InkWell(
                      onTap: (){
                        DialogUtils().showRebateRoleBtmDialog(context);
                      },
                      child: Image.asset(ImageX.icon_bzzx),
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
                        child: Text("游戏类型",style: TextStyle(fontSize: 14.sp,color: ColorX.color_0d192d,fontWeight: FontWeight.w500),),
                      ),
                    ),
                    Expanded(
                      flex: 33,
                      child: Center(
                        child: Text("有效投注",style: TextStyle(fontSize: 14.sp,color: ColorX.color_0d192d,fontWeight: FontWeight.w500),),
                      ),
                    ),
                    Expanded(
                      flex: 33,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text("返水",style: TextStyle(fontSize: 14.sp,color: ColorX.color_0d192d,fontWeight: FontWeight.w500),),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  InkWell(
                    onTap: ()=> Get.toNamed(Routes.bet_amount_rebate),
                    child: buildBetAmountItem(),
                  ),
                  InkWell(
                    onTap: ()=> Get.toNamed(Routes.bet_amount_rebate),
                    child: buildBetAmountItem(),
                  ),
                  InkWell(
                    onTap: ()=> Get.toNamed(Routes.bet_amount_rebate),
                    child: buildBetAmountItem(),
                  ),
                ],
              ),
              buildRebateTotal("总计", "¥0"),
              SizedBox(height: 10.h,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("今日投注组合占比率",style: TextStyle(fontSize: 14.sp,color: ColorX.color_0d192d,fontWeight: FontWeight.w600),),
                    Text("0%",style: TextStyle(fontSize: 14.sp,color: ColorX.color_0d192d,fontWeight: FontWeight.w600),),
                  ],
                ),
              ),
              Center(
                child: EmptyDataWidget(iconWidth: 100.w, iconHeight: 100.h,text: "",),
              ),
            ],
          ),
        ),
      ),
    );
  }



  buildTimeTab(String name, bool select) {
    return Container(
      decoration: BoxDecoration(
        color: select ? Colors.white:ColorX.color_f7f8fb,
        borderRadius: BorderRadius.circular(10.r),
        border: select ? Border.all(color: ColorX.color_fc243b,width: 1.r) : null,
      ),
      margin: EdgeInsets.only(left: 15.w),
      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 8.h),
      child: Text(name,style: TextStyle(fontSize: 14.sp,color: select ? ColorX.color_fc243b:ColorX.color_091722),),
    );
  }

  ///负盈利
  Widget buildProfitItem() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
      child: Row(
        children: [
          Expanded(
            flex: 25,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("PC28",style: TextStyle(fontSize: 14.sp,color: ColorX.color_0d192d,),),
            ),
          ),
          Expanded(
            flex: 25,
            child: Center(
              child: Text("72.7600",style: TextStyle(fontSize: 14.sp,color: ColorX.color_0d192d,),),
            ),
          ),
          Expanded(
            flex: 25,
            child: Center(
              child: Text("37.2400",style: TextStyle(fontSize: 14.sp,color: ColorX.color_0d192d,),),
            ),
          ),
          Expanded(
            flex: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("0.00000",style: TextStyle(fontSize: 14.sp,color: ColorX.color_0d192d,),),
                Image.asset(ImageX.ic_into_right)
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
          Text(name,style: TextStyle(fontSize: 14.sp,color: ColorX.color_0d192d,fontWeight: FontWeight.w600),),
          Text(amount,style: TextStyle(fontSize: 14.sp,color: ColorX.color_fc243b,fontWeight: FontWeight.w600),),
        ],
      ),
    );
  }

  Widget buildBetAmountItem() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
      child: Row(
        children: [
          Expanded(
            flex: 25,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("PC28",style: TextStyle(fontSize: 14.sp,color: ColorX.color_0d192d,),),
            ),
          ),
          Expanded(
            flex: 25,
            child: Center(
              child: Text("72.7600",style: TextStyle(fontSize: 14.sp,color: ColorX.color_0d192d,),),
            ),
          ),
          Expanded(
            flex: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("0.00000",style: TextStyle(fontSize: 14.sp,color: ColorX.color_0d192d,),),
                Image.asset(ImageX.ic_into_right)
              ],
            ),
          ),
        ],
      ),
    );
  }



}