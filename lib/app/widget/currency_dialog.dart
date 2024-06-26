

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/controller/wallet_controller.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/bean/balance_entity.dart';

class CurrencyDialog extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => StateCurrencyDialog();

}

class StateCurrencyDialog extends State<CurrencyDialog>{

  List<BalanceEntity> country = [
    BalanceEntity(language: Intr().wallet_cny, icon: ImageX.iconJjGrey()),
    BalanceEntity(language: Intr().wallet_usdt, icon: ImageX.usdtT()),
  ];
  var dropdownValue = BalanceEntity().obs;

  @override
  void initState() {
    dropdownValue.value = country[AppData.wallet() ? 0 : 1];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h,horizontal: 16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Center(
                child: Text(Intr().xuanzeqianbao,style: TextStyle(fontSize: 16.sp,color: ColorX.text3e3()),),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: ()=> Navigator.of(context).pop(),
                  child: Image.asset(ImageX.icon_close_dialog,width: 24.r,),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h,),
          Text(Intr().morenqianbao,style: TextStyle(fontSize: 14.sp,color: ColorX.text3e3()),),
          SizedBox(height: 8.h,),
          ...country.map((e) => buildLanguageItem(e)).toList(),
          SizedBox(height: 12.h,),
          Text(Intr().shedingqianbao,
            style: TextStyle(fontSize: 12.sp,color: ColorX.text586()),),
          SizedBox(height: 12.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WidgetUtils().buildElevatedButton(Intr().bibiduihuan, 122.w, 45.h,
                  bg: ColorX.cardBg3(),textColor: ColorX.text0917(),onPressed: (){
                    Get.offAndToNamed(Routes.coin_exchange);
                  }),
              WidgetUtils().buildElevatedButton(Intr().queren, 122.w, 45.h,
                  bg: ColorX.color_fc243b,onPressed: (){
                    ///如果确实不一样在做切换
                    var result = dropdownValue.value.language != (AppData.wallet() ? Intr().wallet_cny : Intr().wallet_usdt);
                    if(result){
                      AppData.setWallet(!AppData.wallet());
                      ///切换钱包
                      Get.find<WalletController>().changeWallet();
                    }
                    Navigator.pop(context,result);
                  }),
            ],
          )
        ],
      ),
    );
  }


  Widget buildLanguageItem(BalanceEntity e) {
    return Column(
      children: [
        InkWell(
          onTap: (){
            dropdownValue.value = e;
            dropdownValue.refresh();
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 10.h),
            child: Row(
              children: [
                WidgetUtils().buildImage(e.icon.em(),24.r,24.r,fit: BoxFit.scaleDown),
                SizedBox(width: 12.w,),
                Expanded(
                  child: Text(e.language.em(),style: TextStyle(fontSize: 14.sp,color: ColorX.text3e3()),),
                ),
                Obx(() {
                  return WidgetUtils().buildImage(e.language == dropdownValue.value.language ? ImageX.icon_select : ImageX.iconUnselect(), 24.r, 24.r);
                }),
              ],
            ),
          ),
        ),
        Divider(height: 1.h,color: ColorX.color_f1f1f1,),
      ],
    );
  }





}
