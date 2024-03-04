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
import 'package:leisure_games/app/widget/drawer_scaffold.dart';
import 'package:leisure_games/ui/bean/change_main_page_event.dart';
import 'package:leisure_games/ui/bean/usdt_channel_entity.dart';

import '../../../../main.dart';
import '../../ends_drawer_view.dart';
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
    return DrawerScaffold(
      scaffoldKey: state.scaffoldKey,
      appBar: WidgetUtils().buildAppBar(Intr().bangdingusdt,msg: true,drawer:true,scaffoldKey: state.scaffoldKey),
      backgroundColor: ColorX.pageBg(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 27.w,top: 30.h,bottom: 20.h),
              child: Obx(() {
                var length = state.list.em();
                return Text(Intr().wodeshuzhiqianbao_(["$length","${state.maxCount - length}"]),
                  style: TextStyle(fontSize: 16.sp,color: ColorX.text0917()),);
              }),
            ),
            Obx(() {
              return Visibility(
                visible: unEmpty(state.list),
                child: Column(
                  children: [
                    ...state.list.map((e) => buildUsdtItem(e)).toList(),
                  ],
                ),
              );
            }),
            SizedBox(height: 10.h,),
            Obx(() {
              return Visibility(
                visible: state.list.em() < state.maxCount,
                child: InkWell(
                  onTap: ()=> DialogUtils().showSelectUsdtBtmDialog(context, state.dclist).then((value){
                    if(unEmpty(value)){
                      value!.mobile = state.userDraw.value.mobile;
                      Get.toNamed(Routes.add_usdt,arguments: value);
                    }
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
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: Intr().wenxintixing_usdt,
                      style: TextStyle(fontSize: 14.sp, color: ColorX.text586(), height: 1.8),
                    ),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.baseline,
                      baseline: TextBaseline.alphabetic,
                      child: InkWell(
                        onTap: () {
                          eventBus.fire(ChangeMainPageEvent(3)); //转到客服显示
                          Get.until((ModalRoute.withName(Routes.main)));
                        },
                        child:
                        Padding(padding: EdgeInsets.only(left: 5.w),child: Text(
                          Intr().lxkf,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                            color: ColorX.text0917(),
                            height: 1.8,
                            decoration: TextDecoration.underline,
                            decorationThickness: 3.0,
                            decorationColor: Colors.black, // 设置下划线颜色
                          ),
                        ),)
                      ),
                    ),
                  ],
                ),
              )
              ,
            ),
          ],
        ),
      ),
    );
  }


  Widget buildUsdtItem(UsdtChannelEntity item) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h,left: 20.w,right: 20.w),
      decoration: BoxDecoration(
        color: ColorX.color_529aff,
        borderRadius: BorderRadius.circular(10.r),
      ),
      padding: EdgeInsets.symmetric(vertical: 17.h,horizontal: 27.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("USDT",
            style: TextStyle(fontSize: 20.sp,color: Colors.white,fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 10.h,),
          Text(Intr().dizhi,style: TextStyle(fontSize: 12.sp,color: Colors.white),),
          Text(item.account.em(),
            style: TextStyle(fontSize: 20.sp,color: Colors.white),),
          SizedBox(height: 10.h,),
          Text(Intr().suoshuxieyi,style: TextStyle(fontSize: 12.sp,color: Colors.white),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.type.em(), style: TextStyle(fontSize: 20.sp,color: Colors.white),),
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