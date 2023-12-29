import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
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
      appBar: WidgetUtils().buildAppBar(Intr().bibiduihuan,msg: true),
      backgroundColor: ColorX.pageBg2(),
      body: Column(
        children: [
          SizedBox(height: 25.h,),
          Container(
            decoration: BoxDecoration(color: ColorX.cardBg(),borderRadius: BorderRadius.circular(12.r),),
            padding: EdgeInsets.all(15.r),
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text( Intr().cong_from ,style: TextStyle(fontSize: 12.sp,color: ColorX.text0917()),),
                SizedBox(height: 5.h,),
                Container(
                  decoration: BoxDecoration(
                      color: ColorX.cardBg2(),borderRadius: BorderRadius.circular(10.r)),
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Obx(() {
                    var balance = state.c2u.value ? state.cnyBal.value : state.usdtBal.value;
                    return Row(
                      children: [
                        WidgetUtils().buildImage(balance.icon.em(),18.r, 18.r),
                        SizedBox(width: 5.w,),
                        Text(balance.language.em(),style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
                        SizedBox(width: 5.w,),
                        Container(
                          color: ColorX.color_10_949,
                          width: 1.w,height: 20.h,
                        ),
                        Expanded(
                          child: Obx(() {
                            return WidgetUtils().buildTextField(170.w, 42.h, 14.sp, ColorX.color_58698d, Intr().qingshurujine,
                                backgroundColor: Colors.transparent,hintColor: ColorX.text586(),defText: state.fromAmount.value,
                                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),],
                                inputType: TextInputType.number,onChanged: (v)=> logic.exchangeCoin(v));
                          }),
                        ),
                        InkWell(
                          onTap: ()=> logic.exchangeCoin((balance.money.em().toInt()).toString()),
                          child: Text(Intr().quanbu,style: TextStyle(fontSize: 14.sp,color: ColorX.text5862()),),
                        ),
                      ],
                    );
                  }),
                ),
                SizedBox(height: 8.h,),
                Obx(() {
                  var balance = state.c2u.value ? state.cnyBal.value : state.usdtBal.value;
                  var symbol = state.c2u.value ? "¥":"₮";
                  return Text("${Intr().yue_}$symbol${balance.money}",style: TextStyle(fontSize: 12.sp,color: ColorX.text0917()),);
                }),
              ],
            ),
          ),
          SizedBox(height: 15.h,),
          InkWell(
            onTap: (){
              state.fromAmount.value = "";
              state.toAmount.value = "";
              state.c2u.value = !state.c2u.value;
            },
            child: Container(
              decoration: BoxDecoration(
                  color: ColorX.cardBg(),borderRadius: BorderRadius.circular(10.r)),
              padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
              child: Image.asset(ImageX.icon_down_up,color: ColorX.icon586(),),
            ),
          ),
          SizedBox(height: 15.h,),
          Container(
            decoration: BoxDecoration(color: ColorX.cardBg(),borderRadius: BorderRadius.circular(12.r),),
            padding: EdgeInsets.all(15.r),
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text( Intr().zhi_to ,style: TextStyle(fontSize: 12.sp,color: ColorX.text0917()),),
                SizedBox(height: 5.h,),
                Container(
                  decoration: BoxDecoration(
                      color: ColorX.cardBg2(),borderRadius: BorderRadius.circular(10.r)),
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Obx(() {
                    var balance = state.c2u.value ? state.usdtBal.value : state.cnyBal.value;
                    return Row(
                      children: [
                        WidgetUtils().buildImage(balance.icon.em(),18.r, 18.r),
                        SizedBox(width: 5.w,),
                        Text(balance.language.em(),style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
                        SizedBox(width: 5.w,),
                        Container(
                          color: ColorX.color_10_949,
                          width: 1.w,height: 20.h,
                        ),
                        Expanded(
                          child: WidgetUtils().buildTextField(170.w, 42.h, 14.sp, ColorX.text586(), "",
                              backgroundColor: Colors.transparent,hintColor: ColorX.text586(),defText: state.toAmount.value,suffixIcon: true,),
                        ),
                      ],
                    );
                  }),
                ),
                SizedBox(height: 8.h,),
                Obx(() {
                  var balance = state.c2u.value ?  state.usdtBal.value:state.cnyBal.value;
                  var symbol = state.c2u.value ? "₮":"¥";
                  return Text("${Intr().yue_}$symbol${balance.money}",style: TextStyle(fontSize: 12.sp,color: ColorX.text0917()),);
                }),
              ],
            ),
          ),//
          //
          Container(
            padding: EdgeInsets.only(left: 20.w,top: 10.h),
            child: Row(
              children: [
                Obx(() {
                  var rate = state.c2u.value ? "1 CNY = ${(1 / state.usdtRate.toDouble()).toStringAsFixed(6)} USDT":"1 USDT = ${state.usdtRate} CNY";
                  return Text(Intr().huilv_([rate]),style: TextStyle(fontSize: 12.sp,color: ColorX.text5862()),);
                }),
                // InkWell(
                //   onTap: (){},
                //   child: SizedBox(
                //     width: 25.w,
                //     child: Icon(Icons.refresh_rounded,size: 15.r,color: ColorX.text5862(),),
                //   ),
                // ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.h),
            alignment: Alignment.bottomCenter,
            child: WidgetUtils().buildElevatedButton(Intr().duihuan, 335.w, 50.h,
                bg: ColorX.color_fc243b, onPressed: ()=> logic.exchange()),
          ),
        ],
      ),
    );
  }

}