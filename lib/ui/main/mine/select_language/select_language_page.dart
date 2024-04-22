import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/drawer_scaffold.dart';

import 'select_language_logic.dart';

class SelectLanguagePage extends StatefulWidget {
  const SelectLanguagePage({super.key});

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
    return DrawerScaffold(
      scaffoldKey: state.scaffoldKey,
      appBar: WidgetUtils().buildAppBar(Intr().xzndyy,msg: true,scaffoldKey: state.scaffoldKey),
      backgroundColor: ColorX.pageBg2(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.h,),
            Container(
              decoration: BoxDecoration(
                color: ColorX.cardBg(),
                borderRadius: BorderRadius.circular(10.r),
              ),
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              child: Obx(() {
                return ListView.separated(
                    shrinkWrap: true,
                    itemCount: state.countryList.length,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context,index){
                      return Divider(height: 1.h,color: ColorX.linef1f(),);
                    },
                    itemBuilder: (context,index){
                      var item = state.countryList[index];
                      return Obx(() {
                        return ListTile(
                          onTap: ()=> logic.changeLanguage(index,item),
                          title: Row(
                            children: [
                              Image.asset(item.icon.em(),width: 24.r,),
                              SizedBox(width: 12.w,),
                              Text(item.language.em(),
                                style: TextStyle(fontSize: 14.sp,color: ColorX.text3e3()),),
                            ],
                          ),
                          trailing: WidgetUtils().buildImage(state.dropdownValue.value == item ? ImageX.icon_select : ImageX.iconUnselect(), 24.r, 24.r,fit: BoxFit.scaleDown),
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






