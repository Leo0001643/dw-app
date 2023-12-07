import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/bean/change_main_page_event.dart';
import 'package:leisure_games/ui/bean/user_draw_detail_entity.dart';

import 'bind_usdt_logic.dart';

class BindUsdtPage extends StatefulWidget {
  const BindUsdtPage({Key? key}) : super(key: key);

  @override
  State<BindUsdtPage> createState() => _BindUsdtPageState();
}

class _BindUsdtPageState extends State<BindUsdtPage> {
  final logic = Get.find<BindUsdtLogic>();
  final state = Get.find<BindUsdtLogic>().state;

  @override
  void dispose() {
    Get.delete<BindUsdtLogic>();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildAppBar(Intr().bangdingusdt,msg: true,bgColor: ColorX.appBarBg()),
      backgroundColor: ColorX.pageBg(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 27.w,top: 30.h),
              child: Obx(() {
                var length = state.userDraw.value.dcBanks.em();
                return Text(Intr().wodeshuzhiqianbao_(["$length","${state.maxCount - length}"]),
                  style: TextStyle(fontSize: 16.sp,color: ColorX.text0917()),);
              }),
            ),
            Obx(() {
              return Visibility(
                visible: unEmpty(state.userDraw.value.dcBanks),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10.h),
                  child: GFCarousel(
                    height: 205.h,
                    viewportFraction: 0.9,
                    enableInfiniteScroll: false,
                    scrollPhysics: const NeverScrollableScrollPhysics(),
                    items: state.userDraw.value.dcBanks?.map((e) => buildUsdtItem(e)).toList() ?? [],
                  ),
                ),
              );
            }),
            SizedBox(height: 10.h,),
            Obx(() {
              return Visibility(
                visible: state.userDraw.value.dcBanks.em() < state.maxCount,
                child: InkWell(
                  onTap: ()=> DialogUtils().showSelectUsdtBtmDialog(context, state.list ?? []).then((value){
                    if(unEmpty(value)){ Get.toNamed(Routes.add_usdt,arguments: value); }
                  }),
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorX.cardBg3(),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    height: 181.h,
                    // padding: EdgeInsets.symmetric(vertical: 17.h,horizontal: 27.w),
                    margin: EdgeInsets.symmetric(horizontal: 27.w),
                    child: GFBorder(
                      dashedLine: const [5,7],
                      color: ColorX.text586(),
                      type: GFBorderType.rRect,
                      radius: Radius.circular(10.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Icon(Icons.add_circle_outline_rounded,color: ColorX.iconBlack(),size: 24.r,),
                          ),
                          SizedBox(height: 5.h,),
                          Text(Intr().tianjiashuziqianbao,style: TextStyle(fontSize: 16.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
                          SizedBox(height: 3.h,),
                          Text(Intr().zuiduoketianjia_(["${state.maxCount}"]),style: TextStyle(fontSize: 13.sp,color: ColorX.text586()),),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 27.w),
              child: Text.rich(TextSpan(
                  children: [
                    TextSpan(text: Intr().wenxintixing_usdt,
                      style: TextStyle(fontSize: 14.sp,color: ColorX.text586(),height: 1.8),),
                    WidgetSpan(
                      child: InkWell(
                        onTap: (){
                          eventBus.fire(ChangeMainPageEvent(3));//转到客服显示
                          Get.until((ModalRoute.withName(Routes.main)));
                        },
                        child: Text(Intr().lxkf,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),height: 1.8,decoration: TextDecoration.underline),),
                      ),
                    ),
                  ]
              ),),
            ),
          ],
        ),
      ),
    );
  }


  Widget buildUsdtItem(UserDrawDetailBanks item) {
    return Container(
      decoration: BoxDecoration(
        color: ColorX.color_529aff,
        borderRadius: BorderRadius.circular(10.r),
      ),
      width: 321.w,
      padding: EdgeInsets.symmetric(vertical: 17.h,horizontal: 27.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("USDT",
            style: TextStyle(fontSize: 20.sp,color: Colors.white,fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 10.h,),
          Text(Intr().dizhi,style: TextStyle(fontSize: 12.sp,color: Colors.white),),
          Text(item.bankAccount.em(),
            style: TextStyle(fontSize: 20.sp,color: Colors.white),),
          SizedBox(height: 10.h,),
          Text(Intr().suoshuxieyi,style: TextStyle(fontSize: 12.sp,color: Colors.white),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.bankName.em(), style: TextStyle(fontSize: 20.sp,color: Colors.white),),
              Align(
                alignment: Alignment.centerRight,
                child: Image.asset(ImageX.icon_usdt_grey),
              ),
            ],
          ),
        ],
      ),
    );
  }


}