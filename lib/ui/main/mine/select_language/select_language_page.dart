import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/search_bar/gf_search_bar.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/bean/language_menu_entity.dart';

import 'select_language_logic.dart';

class SelectLanguagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StateSelectLanguagePage();

}

class StateSelectLanguagePage extends State<SelectLanguagePage>{


  final logic = Get.find<SelectLanguageLogic>();
  final state = Get.find<SelectLanguageLogic>().state;

  @override
  void dispose() {
    Get.delete<SelectLanguageLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildAppBar(Intr().xzndyy,msg: true),
      backgroundColor: ColorX.color_f7f8fb,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              margin: EdgeInsets.symmetric(horizontal: 12.w),
              child: Row(
                children: [
                  SizedBox(width: 10.w,),
                  Icon(Icons.search_rounded,size: 20.w,),
                  WidgetUtils().buildTextField(
                      321.w, 44.h, 15.sp, ColorX.color_091722, Intr().sszcbz,
                      onChanged: (value)=> logic.searchCountry(value))
                ],
              ),
            ),
            SizedBox(height: 10.h,),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              child: Obx(() {
                return ListView.separated(
                    shrinkWrap: true,
                    itemCount: state.countryList.length,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context,index){
                      return Divider(height: 1.h,color: ColorX.color_f1f1f1,);
                    },
                    itemBuilder: (context,index){
                      var item = state.countryList[index];
                      return Obx(() {
                        return ListTile(
                          onTap: (){
                            state.dropdownValue.value = item;
                            state.dropdownValue.refresh();
                          },
                          title: Row(
                            children: [
                              Image.asset(item.icon.em(),width: 24.r,),
                              SizedBox(width: 12.w,),
                              Text(item.language.em(),
                                style: TextStyle(fontSize: 14.sp,color: ColorX.color_3e3737),),
                            ],
                          ),
                          trailing: state.dropdownValue.value == item
                              ? Image.asset(ImageX.icon_select) : Image.asset(ImageX.icon_unselect),
                        );
                      });
                    });
              }),
            ),
          ],
        ),
      ),
    );
  }


}






