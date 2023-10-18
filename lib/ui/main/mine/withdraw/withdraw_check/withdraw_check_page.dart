import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';

import 'withdraw_check_logic.dart';

///
///提现稽核
///
class WithdrawCheckPage extends StatefulWidget {
  const WithdrawCheckPage({Key? key}) : super(key: key);

  @override
  State<WithdrawCheckPage> createState() => _WithdrawCheckPageState();
}

class _WithdrawCheckPageState extends State<WithdrawCheckPage> {
  final logic = Get.find<WithdrawCheckLogic>();
  final state = Get.find<WithdrawCheckLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildAppBar("从CNY钱包提出",msg: true),
      backgroundColor: ColorX.color_f7f8fb,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15.h,),
              Text("确认稽核信息",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600,color: ColorX.color_091722),),
              SizedBox(height: 7.h,),
              Text("自提现后第一次存款之后总有效投注: 991.73",style: TextStyle(fontSize: 13.sp,color: ColorX.color_58698d),),
              SizedBox(height: 16.h,),
              Container(
                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(12.r),),
                padding: EdgeInsets.all(15.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      child: Text("优惠稽核",style: TextStyle(fontSize: 13.sp,color: ColorX.color_58698d),),
                      padding: EdgeInsets.only(left: 12.w),
                    ),
                    SizedBox(height: 7.h,),
                    GFListTile(
                      onTap: (){},
                      title: Text("没有通过优惠稽核,需扣除优惠 100",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
                      padding: EdgeInsets.symmetric(vertical: 13.h,horizontal: 8.w),
                      margin: EdgeInsets.zero,
                      radius: 10.r,
                      color: ColorX.color_f7f8fb,
                      shadow: BoxShadow(color: Colors.transparent),
                    ),
                    SizedBox(height: 15.h,),
                    Padding(
                      child: Text("常态性稽核",style: TextStyle(fontSize: 13.sp,color: ColorX.color_58698d),),
                      padding: EdgeInsets.only(left: 12.w),
                    ),
                    SizedBox(height: 7.h,),
                    GFListTile(
                      onTap: (){},
                      title: Text("通过常态性稽核,不收取行政费用!",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
                      padding: EdgeInsets.symmetric(vertical: 13.h,horizontal: 8.w),
                      margin: EdgeInsets.zero,
                      radius: 10.r,
                      color: ColorX.color_f7f8fb,
                      shadow: BoxShadow(color: Colors.transparent),
                    ),
                    SizedBox(height: 15.h,),
                    Padding(
                      child: Text("多次提现手续费",style: TextStyle(fontSize: 13.sp,color: ColorX.color_58698d),),
                      padding: EdgeInsets.only(left: 12.w),
                    ),
                    SizedBox(height: 7.h,),
                    GFListTile(
                      onTap: (){},
                      title: Text("1小时内 1 次提现,免手续费!",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
                      padding: EdgeInsets.symmetric(vertical: 13.h,horizontal: 8.w),
                      margin: EdgeInsets.zero,
                      radius: 10.r,
                      color: ColorX.color_f7f8fb,
                      shadow: BoxShadow(color: Colors.transparent),
                    ),
                    SizedBox(height: 15.h,),
                    Padding(
                      child: Text("时效手续费",style: TextStyle(fontSize: 13.sp,color: ColorX.color_58698d),),
                      padding: EdgeInsets.only(left: 12.w),
                    ),
                    SizedBox(height: 7.h,),
                    GFListTile(
                      onTap: (){},
                      title: Text("免收手续费!",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
                      padding: EdgeInsets.symmetric(vertical: 13.h,horizontal: 8.w),
                      margin: EdgeInsets.zero,
                      radius: 10.r,
                      color: ColorX.color_f7f8fb,
                      shadow: BoxShadow(color: Colors.transparent),
                    ),
                    SizedBox(height: 15.h,),
                    Padding(
                      child: Text("此次稽核时间",style: TextStyle(fontSize: 13.sp,color: ColorX.color_58698d),),
                      padding: EdgeInsets.only(left: 12.w),
                    ),
                    SizedBox(height: 7.h,),
                    GFListTile(
                      onTap: (){},
                      title: Text("美东时间:2023 - 07- 05 08:29:25",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
                      padding: EdgeInsets.symmetric(vertical: 13.h,horizontal: 8.w),
                      margin: EdgeInsets.zero,
                      radius: 10.r,
                      color: ColorX.color_f7f8fb,
                      shadow: BoxShadow(color: Colors.transparent),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h,),
              WidgetUtils().buildElevatedButton("继续提现", 335.w, 50.h,bg: ColorX.color_fc243b,onPressed: (){
                Get.toNamed(Routes.withdraw_apply);
              }),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<WithdrawCheckLogic>();
    super.dispose();
  }
}

