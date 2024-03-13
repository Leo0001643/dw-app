import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/drawer_scaffold.dart';
import 'package:leisure_games/ui/bean/change_main_page_event.dart';

import 'select_currency_logic.dart';

///
///选择币种
class SelectCurrencyPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => StateSelectCurrencyPage();

}

class StateSelectCurrencyPage extends State<SelectCurrencyPage>{


  final logic = Get.find<SelectCurrencyLogic>();
  final state = Get.find<SelectCurrencyLogic>().state;

  @override
  void dispose() {
    Get.delete<SelectCurrencyLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      scaffoldKey: state.scaffoldKey,
      appBar: WidgetUtils().buildAppBar(Intr().zxndbz,msg: true,scaffoldKey: state.scaffoldKey),
      backgroundColor: ColorX.pageBg2(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Container(
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(10.r),
            //   ),
            //   margin: EdgeInsets.symmetric(horizontal: 12.w),
            //   child: Row(
            //     children: [
            //       SizedBox(width: 10.w,),
            //       Icon(Icons.search_rounded,size: 20.w,),
            //       WidgetUtils().buildTextField(
            //           321.w, 44.h, 15.sp, ColorX.color_091722, Intr().sszcbz,
            //           onChanged: (value)=> logic.searchCoin(value))
            //     ],
            //   ),
            // ),
            // SizedBox(height: 10.h,),
            Container(
              decoration: BoxDecoration(
                color: ColorX.cardBg5(),
                borderRadius: BorderRadius.circular(10.r),
              ),
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              child: Obx(() {
                return ListView.separated(
                    shrinkWrap: true,
                    itemCount: state.coinList.length,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context,index){
                      return Divider(height: 1.h,color: ColorX.color_f1f1f1,);
                    },
                    itemBuilder: (context,index){
                      var item = state.coinList[index];
                      return Obx(() {
                        return ListTile(
                          onTap: ()=> logic.changeWallet(item),
                          title: Row(
                            children: [
                              WidgetUtils().buildImage(item.icon.em(),24.r, 24.r),
                              SizedBox(width: 5.w,),
                              Text("${item.language}${item.money}",
                                style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
                            ],
                          ),
                          trailing: WidgetUtils().buildImage(state.dropdownValue.value == item ? ImageX.icon_select : ImageX.iconUnselect(), 24.r, 24.r,fit: BoxFit.scaleDown),
                        );
                      });
                    });
              }),
            ),
            SizedBox(height: 10.h,),
            Container(
              decoration: BoxDecoration(
                color: ColorX.cardBg5(),
                borderRadius: BorderRadius.circular(10.r),
              ),
              padding: EdgeInsets.symmetric(vertical: 18.h,horizontal: 13.w),
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  InkWell(
                    onTap: ()=> Get.toNamed(Routes.coin_exchange),
                    child: Text(Intr().bbdh,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
                  ),
                  Expanded(child: Container()),
                  InkWell(
                    onTap: (){

                      Get.until((ModalRoute.withName(Routes.main)));
                      eventBus.fire(ChangeMainPageEvent(3));
                    },
                    child: Row(
                      children: [
                        Text(Intr().lxkf,style: TextStyle(fontSize: 14.sp,color: ColorX.text949()),),
                        Image.asset(ImageX.ic_into_right,color: ColorX.icon586(),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}




