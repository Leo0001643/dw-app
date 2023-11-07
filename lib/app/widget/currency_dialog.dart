

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/bean/language_menu_entity.dart';

class CurrencyDialog extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => StateCurrencyDialog();

}

class StateCurrencyDialog extends State<CurrencyDialog>{

  var dropdownValue = LanguageMenuEntity(language: Intr().rmb, icon: ImageX.icon_jj_grey).obs;

  late List<LanguageMenuEntity> country = [
    dropdownValue.value,
    LanguageMenuEntity(language: Intr().dollar, icon: ImageX.icon_dollar_grey),
    LanguageMenuEntity(language: Intr().thb, icon: ImageX.icon_thb_grey),
    LanguageMenuEntity(language: Intr().vnd, icon: ImageX.icon_vhd_grey),
  ];



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
                  child: Image.asset(ImageX.icon_close_dialog,color: ColorX.iconBlack(),width: 24.r,),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h,),
          Text(Intr().morenqianbao,style: TextStyle(fontSize: 14.sp,color: ColorX.text3e3()),),
          SizedBox(height: 8.h,),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5.h),
            child: Obx(() {
              return DropdownButtonHideUnderline(
                child: GFDropdown(
                  elevation: 0,
                  borderRadius: BorderRadius.circular(10.r),
                  iconEnabledColor: ColorX.text0917(),
                  border: BorderSide(color: Colors.black12, width: 1.w),
                  dropdownButtonColor: ColorX.pageBg(),
                  dropdownColor: ColorX.pageBg(),
                  isExpanded: true,
                  itemHeight: 45.h,
                  value: dropdownValue.value,
                  onChanged: (newValue) {
                    dropdownValue.value = newValue!;
                    dropdownValue.refresh();
                  },
                  items: buildLanguageItem(),
                ),
              );
            }),
          ),
          SizedBox(height: 12.h,),
          Text(Intr().shedingqianbao,
            style: TextStyle(fontSize: 12.sp,color: ColorX.text586()),),
          SizedBox(height: 20.h,),
          Divider(height: 1.h,color: ColorX.color_f1f1f1,),
          SizedBox(height: 12.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WidgetUtils().buildElevatedButton(Intr().tiaoguo, 122.w, 45.h,
                  bg: ColorX.cardBg3(),textColor: ColorX.text0917(),onPressed: (){
                    Navigator.of(context).pop();
                  }),

              WidgetUtils().buildElevatedButton(Intr().queren, 122.w, 45.h,bg: ColorX.color_fc243b,onPressed: (){

              }),
            ],
          )
        ],
      ),
    );
  }


  List<DropdownMenuItem<LanguageMenuEntity>> buildLanguageItem() {
    return country.map((e) {
      return DropdownMenuItem<LanguageMenuEntity>(
        value: e,
        child: Row(
          children: [
            Image.asset(e.icon.em(),width: 24.r,),
            SizedBox(width: 12.w,),
            Text(e.language.em(),style: TextStyle(fontSize: 14.sp,color: ColorX.text3e3()),),
          ],
        ),
      );
    }).toList();
  }





}
