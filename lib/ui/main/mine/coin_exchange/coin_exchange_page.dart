import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/drawer_scaffold.dart';

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
    return DrawerScaffold(
      scaffoldKey: state.scaffoldKey,
      appBar: WidgetUtils().buildAppBar(Intr().bibiduihuan,msg: true,
          drawer:true,scaffoldKey: state.scaffoldKey),
      backgroundColor: ColorX.pageBg2(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15.h,),
          Container(
            decoration: BoxDecoration(color: ColorX.cardBg(),borderRadius: BorderRadius.circular(12.r),),
            padding: EdgeInsets.all(15.r),
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() {
                        var balance = state.c2u.value ? state.cnyBal.value : state.usdtBal.value;
                        return Row(
                          children: [
                            WidgetUtils().buildImage(balance.icon.em(),18.r, 18.r),
                            SizedBox(width: 5.w,),
                            SizedBox(
                              width: 50.w,
                              child: Text( Intr().cong_from ,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w700,color: ColorX.text5862()),),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(balance.language.em(),
                                  style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w700,color: ColorX.textBlack()),),
                              ),
                            ),
                            SizedBox(width: 5.w,),
                            Expanded(
                              flex: 2,
                              child: Obx(() {
                                var balance = state.c2u.value ? state.cnyBal.value : state.usdtBal.value;
                                var symbol = state.c2u.value ? "¥":"₮";
                                return Text("$symbol${balance.money.em()}",
                                  style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w700,color: ColorX.textBlack()),);
                              }),
                            ),
                          ],
                        );
                      }),
                      SizedBox(height: 8.h,),
                      Row(
                        children: [
                          WidgetUtils().buildImage(ImageX.xiangxiaT(), 15.r, 15.r),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(color: ColorX.linef1f2()),
                              height: 1.h,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h,),
                      Obx(() {
                        var balance = state.c2u.value ? state.usdtBal.value : state.cnyBal.value;
                        return Row(
                          children: [
                            WidgetUtils().buildImage(balance.icon.em(),18.r, 18.r),
                            SizedBox(width: 5.w,),
                            SizedBox(
                              width: 50.w,
                              child: Text( Intr().zhi_to ,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w700,color: ColorX.text5862()),),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(balance.language.em(),style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w700,color: ColorX.textBlack()),),
                              ),
                            ),
                            SizedBox(width: 5.w,),
                            Expanded(
                              flex: 2,
                              child: Obx(() {
                                var balance = state.c2u.value ?  state.usdtBal.value:state.cnyBal.value;
                                var symbol = state.c2u.value ? "₮":"¥";
                                return Text("$symbol${balance.money.em()}",
                                  style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w700,color: ColorX.textBlack()),);
                              }),
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                ),
                SizedBox(width: 10.w,),
                InkWell(
                  onTap: (){
                    state.fromAmount.value = "";
                    state.toAmount.value = "";
                    state.c2u.value = !state.c2u.value;
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: ColorX.cardBg3(),borderRadius: BorderRadius.circular(10.r)),
                    padding: EdgeInsets.all(5.r),
                    child: Image.asset(ImageX.icon_down_up,color: ColorX.iconBlack(),width: 20.r,height: 20.r,fit: BoxFit.fill,),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15.h,),
          Container(
            decoration: BoxDecoration(color: ColorX.cardBg(),borderRadius: BorderRadius.circular(12.r),),
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: [
                Expanded(
                  child: Obx(() {
                    return WidgetUtils().buildTextField(0, 42.h, 14.sp, ColorX.color_58698d, Intr().qingshurujine,
                        backgroundColor: Colors.transparent,hintColor: ColorX.text586(),defText: state.fromAmount.value,
                        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),],
                        padding: EdgeInsets.zero,
                        inputType: TextInputType.number,onChanged: (v)=> logic.exchangeCoin(v));
                  }),
                ),
                InkWell(
                onTap: () {
                  var balance = state.c2u.value ? state.cnyBal.value : state.usdtBal.value;
                  logic.exchangeCoin((balance.money.em().toInt()).toString());
                },
                  child: Text(Intr().zuida,style: TextStyle(fontSize: 14.sp,color: ColorX.textBlack(),fontWeight: FontWeight.bold),),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20.w,top: 10.h),
            child: Obx(() {
              var rate = state.c2u.value ? "1 CNY = ${(1 / state.usdtRate.toDouble()).toStringAsFixed(6)} USDT":"1 USDT = ${state.usdtRate} CNY";
              return Text(Intr().huilv_([rate]),style: TextStyle(fontSize: 12.sp,color: ColorX.text5862()),);
            }),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 20.h),
              alignment: Alignment.topCenter,
              child: WidgetUtils().buildElevatedButton(Intr().duihuan, 335.w, 50.h,
                  bg: ColorX.color_fc243b, onPressed: ()=> logic.exchange()),
            ),
          ),
        ],
      ),
    );
  }

}