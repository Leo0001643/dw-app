import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/drawer_scaffold.dart';
import 'package:leisure_games/ui/bean/change_main_page_event.dart';
import 'package:leisure_games/ui/bean/platform_entity.dart';

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
                            ///切换的时候需要把右边数据情况
                            state.rightAccount.value = PlatformEntity();
                            logic.loadData();
                            logic.loadBalance();
                          }
                        }),
                        child: SizedBox(
                          height: 40.h,
                          child: Obx(() {
                            return Row(
                              children: [
                                SizedBox(width: 10.w,),
                                WidgetUtils().buildImage(state.mainBal.value.currency.em(),24.r, 24.r,fit: BoxFit.scaleDown),
                                SizedBox(width: 6.w,),
                                Text(state.mainBal.value.liveName.em(), style: TextStyle(fontSize: 14.sp,color: ColorX.text3e3(),),),
                                Image.asset(ImageX.icon_down_grey,color: ColorX.icon586(),),
                                Expanded(child: Container()),
                              ],
                            );
                          }),
                        ),
                      ),
                    ),
                    Container(
                      color: ColorX.cardBg2(),
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
                              return Text("${Intr().yue_}$symbol${state.mainBal.value.money.em()}",style: TextStyle(fontSize: 12.sp,color: ColorX.text0917()),);
                            }),
                            InkWell(
                              onTap: ()=> logic.loadBalance(),
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
                                onTap:(){
                                  var list = state.platforms.where((element) => element.status == 1).toList();
                                  if(list.em() <= 1){///主账户可能也没有
                                    showToast(Intr().qingkaitongzhanghu);
                                    return;
                                  }
                                  var index = list.indexOf(state.leftAccount.value);
                                  DialogUtils().showSelectOptionBtmGirdDialog(context, Intr().qingxuanzhezhuanchu, list,index).then((value) {
                                    if(unEmpty(value)){
                                      state.leftAccount.value = value;
                                      state.leftAccount.refresh();
                                    }
                                  });
                                },
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(state.leftAccount.value.toString(),style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
                                    ),
                                    Image.asset(ImageX.icon_down_grey,color: ColorX.icon586(),),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5.h,),
                              Text("${Intr().yue_}$symbol${DataUtils.formatMoney(state.leftAccount.value.money)}",
                                style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
                            ],
                          );
                        }),
                      ),
                    ),
                    SizedBox(
                      width: 60.w,
                      child: InkWell(
                        onTap: (){
                          var value = state.leftAccount.value;
                          state.leftAccount.value = state.rightAccount.value;
                          state.leftAccount.refresh();
                          state.rightAccount.value = value;
                          state.rightAccount.refresh();
                        },
                        child: Image.asset(ImageX.icon_right_left,color: ColorX.iconBlack(),),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(color: ColorX.cardBg2(),borderRadius: BorderRadius.circular(10.r)),
                        margin: EdgeInsets.only(right: 15.w,top: 5.h,bottom: 5.h),
                        padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 8.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap:(){
                                ///账户没有被开通，提示开通账户
                                var list = state.platforms.where((element) => element.status == 1).toList();
                                if(list.em() <= 1){///主账户可能也没有
                                  showToast(Intr().qingkaitongzhanghu);
                                  return;
                                }
                                var index = list.indexOf(state.rightAccount.value);
                                DialogUtils().showSelectOptionBtmGirdDialog(context, Intr().qingxuanzhezhuanru, list,index).then((value) {
                                  if(unEmpty(value)){
                                    state.rightAccount.value = value;
                                    state.rightAccount.refresh();
                                  }
                                });
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Obx(() {
                                      var account = isEmpty(state.rightAccount.value.toString()) ? Intr().qingxuanzhe:state.rightAccount.value.toString();
                                      return Text(account,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),);
                                    }),
                                  ),
                                  Image.asset(ImageX.icon_down_grey,color: ColorX.icon586(),),
                                ],
                              ),
                            ),
                            SizedBox(height: 5.h,),
                            Obx(() {
                              if(isEmpty(state.rightAccount.value.toString())) return Container();
                              var symbol = AppData.wallet() ? "¥":"₮";
                              return Text("${Intr().yue_}$symbol${DataUtils.formatMoney(state.rightAccount.value.money)}",
                                style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),);
                            }),
                          ],
                        ),
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
                    Obx(() {
                      return WidgetUtils().buildImage(state.mainBal.value.currency.em(),24.r,24.r,);
                    }),
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
                      bg: ColorX.cardBg(),textColor: ColorX.text0917(),textAlign: TextAlign.center,
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
                        Text(Intr().gezhanghumingxi,style: TextStyle(fontSize: 16.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
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
      height: 70.h,
      padding: EdgeInsets.all(8.r),
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
                  if(item.status == 1){
                    state.rightAccount.value = item;
                    state.rightAccount.refresh();
                  }else {///开通
                    logic.openPlatformPermit(item);
                  }
                },
                child: Text(item.status == 1 ? Intr().zhuanru : Intr().open_plat,
                  style: TextStyle(fontSize: 14.sp,color: ColorX.text5862(),decoration: TextDecoration.underline),),
              ),
            ],
          ),
          // Visibility(
          //   visible: item.status == 1,
          //   child: SizedBox(height: 5.h,),
          // ),
          Visibility(
            visible: item.status == 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("$symbol${DataUtils.formatMoney(item.money)}",style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
                InkWell(
                  onTap: ()=> logic.transfer(item),
                  child: Text(Intr().huishou,style: TextStyle(fontSize: 14.sp,color: ColorX.text5862(),decoration: TextDecoration.underline),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }



}