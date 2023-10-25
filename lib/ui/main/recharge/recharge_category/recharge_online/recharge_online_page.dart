import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';

import 'recharge_online_logic.dart';

class RechargeOnlinePage extends StatefulWidget {
  const RechargeOnlinePage({Key? key}) : super(key: key);

  @override
  State<RechargeOnlinePage> createState() => _RechargeOnlinePageState();
}

class _RechargeOnlinePageState extends State<RechargeOnlinePage> {
  final logic = Get.find<RechargeOnlineLogic>();
  final state = Get.find<RechargeOnlineLogic>().state;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 15.w,),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: ColorX.color_091722,width: 3.r,strokeAlign: BorderSide.strokeAlignOutside),
                  shape: BoxShape.circle,
                ),
                width: 8.r,height: 8.r,
              ),
              SizedBox(width: 13.w,),
              Text("点击下方支付跳转链接并阅读提示信息",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
            ],
          ),
          SizedBox(height: 15.h,),
          Row(
            children: [
              SizedBox(width: 18.w,),
              Container(width: 1.w,height: 130.h,color: Colors.black54,),
              SizedBox(width: 13.w,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildPayItem("支付跳转1", true),
                    SizedBox(height: 10.h,),
                    Text("温馨提示:",style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d,fontWeight: FontWeight.w600),),
                    Text("1、系统将会自动打开一个网页，请按提示继续操作",style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d),),
                    Text("2、手续费 1.22%,到账率高!",style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d),),
                    Text("3、1111",style: TextStyle(fontSize: 12.sp,color: ColorX.color_5583e7),),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 15.h,),
          Row(
            children: [
              SizedBox(width: 15.w,),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: ColorX.color_5b6d7b,width: 3.r,strokeAlign: BorderSide.strokeAlignOutside),
                  shape: BoxShape.circle,
                ),
                width: 8.r,height: 8.r,
              ),
              SizedBox(width: 13.w,),
              Text("填入金额(1-0)并点击确定",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
            ],
          ),
          SizedBox(height: 10.h,),
          Row(
            children: [
              SizedBox(width: 30.w,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(10.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("充值账户",style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d),),
                    SizedBox(height: 10.h,),
                    Container(
                      decoration: BoxDecoration(color: ColorX.color_f7f8fb,borderRadius: BorderRadius.circular(5.r)),
                      width: 300.w,height: 45.h,
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("username",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722),),
                          InkWell(
                            onTap: ()=> WidgetUtils().clickCopy("username"),
                            child: Image.asset(ImageX.icon_copy,color: ColorX.color_58698d,),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    WidgetUtils().buildTextField(300.w, 45.h, 14.sp, ColorX.color_091722, "手动输入或下方选择金额",backgroundColor: ColorX.color_f7f8fb),
                    SizedBox(height: 10.h,),
                    SizedBox(
                      width: 300.w,
                      child: Wrap(
                        alignment:WrapAlignment.spaceBetween,
                        runSpacing: 10.h,spacing: 10.w,
                        children: [
                          buildBtnAmount(100),
                          buildBtnAmount(200),
                          buildBtnAmount(500),
                          buildBtnAmount(1000),
                          buildBtnAmount(2000),
                          buildBtnAmount(5000),
                          buildBtnAmount(10000),
                          buildBtnAmount(20000),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h,),
          WidgetUtils().buildElevatedButton("提交", 335.w, 50.h,bg: ColorX.color_fc243b,onPressed: (){
            Get.offAndToNamed(Routes.recharge_result);
          }),
          SizedBox(height: 20.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WidgetUtils().buildElevatedButton("币币兑换", 102.w, 38.h,bg: Colors.white,textColor: ColorX.color_091722,onPressed: (){
                Get.toNamed(Routes.coin_exchange);
              }),
              SizedBox(width: 16.w,),
              WidgetUtils().buildElevatedButton("充值记录", 102.w, 38.h,bg: Colors.white,textColor: ColorX.color_091722,onPressed: (){
                Get.toNamed(Routes.recharge_record);
              }),
              SizedBox(width: 16.w,),
              WidgetUtils().buildElevatedButton("额度转换", 102.w, 38.h,bg: Colors.white,textColor: ColorX.color_091722,onPressed: (){
                Get.toNamed(Routes.quota_conversion);
              }),
            ],
          ),
          SizedBox(height: 20.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text("支付说明:\n1.公司帐户资金如何领取到个人帐户 人民币银行结算账户管理方法规定\n2.公司帐户资金如何领取到个人帐户 人民币银行结算账户管理方法规定",
            style: TextStyle(fontSize: 13.sp,color: ColorX.color_58698d,height: 1.8),),
          ),
          SizedBox(height: 50.h,),

        ],
      ),
    );
  }


  Widget buildPayItem(String name,bool select) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: select ? ColorX.color_fc243b : ColorX.color_e8e8e8,width: 1.w),
            borderRadius: BorderRadius.circular(8.r),
          ),
          width: 120.w,height: 40.h,
          padding: EdgeInsets.symmetric(vertical: 5.h),
          alignment: Alignment.center,
          child: Text(name,style: TextStyle(fontSize: 14.sp,color: select?ColorX.color_fc243b:ColorX.color_091722,fontWeight: FontWeight.w600),),
        ),
        Visibility(
          visible: select,
          child: Positioned(
            right: 0,top: 0,
            child: Image.asset(ImageX.icon_choose),
          ),
        ),
      ],
    );
  }

  Widget buildBtnAmount(int i) {
    return Container(
      decoration: BoxDecoration(color: ColorX.color_f7f8fb,borderRadius: BorderRadius.circular(5.r)),
      alignment: Alignment.center,
      height: 40.h,width: 65.w,
      child: Text("$i",style: TextStyle(fontSize: 14.sp,color: Colors.black,fontWeight: FontWeight.w600),),
    );
  }



}