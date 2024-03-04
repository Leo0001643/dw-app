import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/drawer_scaffold.dart';
import 'package:leisure_games/ui/bean/change_main_page_event.dart';
import 'package:leisure_games/ui/bean/platform_entity.dart';

import '../../../../main.dart';
import '../../ends_drawer_view.dart';
import 'quota_conversion_logic.dart';

class QuotaConversionPage extends StatefulWidget {
  const QuotaConversionPage({Key? key}) : super(key: key);

  @override
  State<QuotaConversionPage> createState() => _QuotaConversionPageState();
}

class _QuotaConversionPageState extends State<QuotaConversionPage>  with SingleTickerProviderStateMixin{
  final logic = Get.find<QuotaConversionLogic>();
  final state = Get.find<QuotaConversionLogic>().state;

  @override
  void initState() {
    // state.tabController = TabController(length: state.tabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    // state.tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      scaffoldKey: state.scaffoldKey,
      appBar: WidgetUtils().buildAppBar(Intr().eduzhuanhuan,msg: true,
          drawer:true,scaffoldKey: state.scaffoldKey),
      backgroundColor: ColorX.pageBg2(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 5.h),
                decoration: BoxDecoration(
                  color: ColorX.cardBg(),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 40,
                      child: InkWell(
                        onTap: ()=> DialogUtils().showCurrencyDialog(context).then((value) {
                          if(value == true){
                            logic.loadData();
                            logic.loadBalance(false);
                          }
                        }),
                        child: SizedBox(
                          height: 40.h,
                          child: Obx(() {
                            return Row(
                              children: [
                                SizedBox(width: 10.w,),
                                WidgetUtils().buildImage(state.mainBal.value.icon.em(),24.r, 24.r,),
                                SizedBox(width: 6.w,),
                                Text(state.mainBal.value.language.em(), style: TextStyle(fontSize: 14.sp,color: ColorX.text3e3(),),),
                                Expanded(child: Container()),
                                Image.asset(ImageX.icon_down_grey,color: ColorX.icon586(),),
                              ],
                            );
                          }),
                        ),
                      ),
                    ),
                    Container(
                      color: ColorX.color_f7f8fb,
                      width: 1.w,
                      height: 15.h,
                    ),
                    Expanded(
                      flex: 60,
                      child: Container(
                        padding: EdgeInsets.only(right: 15.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Obx(() {
                              var symbol = AppData.wallet() ? "¥":"₮";
                              return Text("${Intr().yue_}$symbol${state.leftAccount.value.money.em()}",style: TextStyle(fontSize: 12.sp,color: ColorX.text0917()),);
                            }),
                            InkWell(
                              onTap: ()=> logic.loadBalance(false),
                              child: Container(
                                width: 20.w,
                                alignment: Alignment.center,
                                child: Icon(Icons.refresh_rounded,color: ColorX.icon586(),size: 15.r,),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.h),
                decoration: BoxDecoration(
                  color: ColorX.cardBg(),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(color: ColorX.cardBg2(),borderRadius: BorderRadius.circular(10.r)),
                        margin: EdgeInsets.only(left: 15.w,top: 5.h,bottom: 5.h),
                        padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 8.w),
                        child: Obx(() {
                          var symbol = AppData.wallet() ? "¥":"₮";
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap:()=> DialogUtils().showSelectOptionBtmGirdDialog(context, Intr().qingxuanzhezhuanchu, state.platforms).then((value) {
                                  if(unEmpty(value)){
                                    state.leftAccount.value = value;
                                    state.leftAccount.refresh();
                                  }
                                }),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(state.leftAccount.value.toString(),style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
                                    ),
                                    WidgetUtils().buildImage(ImageX.icon_down_grey, 15.r, 15.r,),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5.h,),
                              Text("${Intr().yue_}$symbol${state.leftAccount.value.money.em()}",
                                style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
                            ],
                          );
                        }),
                      ),
                    ),
                    SizedBox(
                      width: 60.w,
                      child: Image.asset(ImageX.icon_right_left),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(color: ColorX.cardBg2(),borderRadius: BorderRadius.circular(10.r)),
                        margin: EdgeInsets.only(right: 15.w,top: 5.h,bottom: 5.h),
                        padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 8.w),
                        child: Obx(() {
                          var symbol = AppData.wallet() ? "¥":"₮";
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap:()=> DialogUtils().showSelectOptionBtmGirdDialog(context, Intr().qingxuanzhezhuanru, state.platforms).then((value) {
                                  if(unEmpty(value)){
                                    state.rightAccount.value = value;
                                    state.rightAccount.refresh();
                                  }
                                }),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(state.rightAccount.value.toString(),style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
                                    ),
                                    WidgetUtils().buildImage(ImageX.icon_down_grey, 15.r, 15.r,),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5.h,),
                              Text("${Intr().yue_}$symbol${state.rightAccount.value.money.em()}",
                                style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
                            ],
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              Text(Intr().huazhuanjine,
                style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w600,color: ColorX.text586()),),
              SizedBox(height: 10.h,),
              Container(
                decoration: BoxDecoration(color: ColorX.cardBg(),borderRadius: BorderRadius.circular(10.r)),
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  children: [
                    Image.asset(ImageX.icon_dollar_grey,width: 24.r,),
                    Obx(() {
                      return WidgetUtils().buildTextField(230.w, 42.h, 14.sp,
                          ColorX.text586(), Intr().qingshurujine,backgroundColor: Colors.transparent,
                          defText: state.inputAmount.value,inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),],
                          hintColor: ColorX.text586(), inputType: TextInputType.number,onChanged: (v)=> state.inputAmount.value = v);
                    }),
                  ],
                ),
              ),
              SizedBox(height: 24.h,),
              WidgetUtils().buildElevatedButton(Intr().querenhuazhuan, 351.w, 50.h,bg: ColorX.color_fc243b,
                  onPressed: ()=> logic.transferConfirm()),
              SizedBox(height: 10.h,),
              Row(
                children: [
                  WidgetUtils().buildElevatedButton(Intr().yijianguiji, 168.w, 40.h,
                      bg: ColorX.cardBg(),textColor: ColorX.text0917(),
                      onPressed: ()=> logic.oneKeyCollect()),
                  SizedBox(width: 10.w,),
                  WidgetUtils().buildElevatedButton(Intr().chongzhi, 168.w, 40.h,
                      bg: ColorX.cardBg(),textColor: ColorX.text0917(),onPressed: (){
                        eventBus.fire(ChangeMainPageEvent(2));
                        Get.back();
                      })
                ],
              ),
              SizedBox(height: 24.h,),
              Container(
                decoration: BoxDecoration(color: ColorX.cardBg(),borderRadius: BorderRadius.circular(10.r)),
                child: Column(
                  children: [
                    SizedBox(height: 15.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 30.w,),
                        Text(Intr().gezhanghumingxi,style: TextStyle(fontSize: 16.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
                        InkWell(
                          onTap: ()=> logic.loadData(),
                          child: Container(
                            width: 20.w,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(right: 10.w),
                            child: Icon(Icons.refresh_rounded,color: ColorX.text5862(),size: 15.r,),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h,),
                    Obx(() {
                      ///不显示主账号的
                      if(state.platforms.em() <= 1){ return Container();}
                      return Wrap(
                        runSpacing: 10.h,
                        spacing: 10.w,
                        children: state.platforms.sublist(1).map((element) => buildQuotaItem(element)).toList(),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



  Widget buildQuotaItem(PlatformEntity item) {
    var symbol = AppData.wallet() ? "¥":"₮";

    return Container(
      decoration: BoxDecoration(color: ColorX.cardBg2(),borderRadius: BorderRadius.circular(10.r)),
      width: 155.w,
      padding: EdgeInsets.all(10.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(item.liveName.em(),style: TextStyle(fontSize: 14.sp,color: ColorX.text949()),),
              InkWell(
                onTap: (){
                  state.rightAccount.value = item;
                  state.rightAccount.refresh();
                },
                child: Text(Intr().zhuanru,style: TextStyle(fontSize: 14.sp,color: ColorX.text5862(),decoration: TextDecoration.underline),),
              ),
            ],
          ),
          SizedBox(height: 10.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("$symbol${item.money.em()}",style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
              InkWell(
                onTap: ()=> logic.transfer(item),
                child: Text(Intr().huishou,style: TextStyle(fontSize: 14.sp,color: ColorX.text5862(),decoration: TextDecoration.underline),),
              ),
            ],
          ),
        ],
      ),
    );
  }



}