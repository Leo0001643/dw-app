import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';

import 'coin_exchange_logic.dart';

///
///币币兑换
class CoinExchangePage extends StatefulWidget {
  const CoinExchangePage({Key? key}) : super(key: key);

  @override
  State<CoinExchangePage> createState() => _CoinExchangePageState();
}

class _CoinExchangePageState extends State<CoinExchangePage> {
  final logic = Get.find<CoinExchangeLogic>();
  final state = Get.find<CoinExchangeLogic>().state;

  @override
  void dispose() {
    Get.delete<CoinExchangeLogic>();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildAppBar("币币兑换",msg: true),
      backgroundColor: ColorX.color_f7f8fb,
      body: Column(
        children: [
          SizedBox(height: 25.h,),
          Container(
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(12.r),),
            padding: EdgeInsets.all(15.r),
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("从",style: TextStyle(fontSize: 12.sp,color: ColorX.color_091722),),
                SizedBox(height: 5.h,),
                Container(
                  decoration: BoxDecoration(
                      color: ColorX.color_f7f8fb,borderRadius: BorderRadius.circular(10.r)),
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    children: [
                      Image.asset(ImageX.icon_rmb,width: 18.w,),
                      SizedBox(width: 5.w,),
                      Text("CNY钱包",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722),),
                      SizedBox(width: 5.w,),
                      Container(
                        color: ColorX.color_10_949,
                        width: 1.w,height: 20.h,
                      ),
                      Expanded(
                        child: WidgetUtils().buildTextField(170.w, 42.h, 14.sp,
                            ColorX.color_58698d, "请输入金额",backgroundColor: Colors.transparent,
                            inputType: TextInputType.number),
                      ),
                      InkWell(
                        onTap: (){},
                        child: Text("全部",style: TextStyle(fontSize: 14.sp,color: ColorX.color_58698d),),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.h,),
                Text("余额: ¥8,888",style: TextStyle(fontSize: 12.sp,color: ColorX.color_091722),),
              ],
            ),
          ),
          SizedBox(height: 15.h,),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,borderRadius: BorderRadius.circular(10.r)),
            padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
            child: Image.asset(ImageX.icon_down_up),
          ),
          SizedBox(height: 15.h,),
          Container(
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(12.r),),
            padding: EdgeInsets.all(15.r),
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("至",style: TextStyle(fontSize: 12.sp,color: ColorX.color_091722),),
                SizedBox(height: 5.h,),
                Container(
                  decoration: BoxDecoration(
                      color: ColorX.color_f7f8fb,borderRadius: BorderRadius.circular(10.r)),
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    children: [
                      Image.asset(ImageX.icon_dollar_grey),
                      SizedBox(width: 5.w,),
                      Text("USDT钱包",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722),),
                      SizedBox(width: 5.w,),
                      Container(
                        color: ColorX.color_10_949,
                        width: 1.w,height: 20.h,
                      ),
                      Expanded(
                        child: WidgetUtils().buildTextField(170.w, 42.h, 14.sp,
                            ColorX.color_58698d, "请输入金额",backgroundColor: Colors.transparent,
                            inputType: TextInputType.number),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.h,),
                Text("余额: ¥8,888",style: TextStyle(fontSize: 12.sp,color: ColorX.color_091722),),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20.w,top: 10.h),
            child: Row(
              children: [
                Text("汇率: 1 CNY = 0.14 USDT",style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d),),
                InkWell(
                  onTap: (){},
                  child: SizedBox(
                    width: 25.w,
                    child: Icon(Icons.refresh_rounded,size: 15.r,color: ColorX.color_58698d,),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: 20.h),
              alignment: Alignment.bottomCenter,
              child: WidgetUtils().buildElevatedButton("兑换", 335.w, 50.h,bg: ColorX.color_fc243b,onPressed: (){
                Get.toNamed(Routes.withdraw_result);
              }),
            ),
          ),
        ],
      ),
    );
  }

}