import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/drawer_scaffold.dart';
import 'package:leisure_games/app/widget/lc_tabbar.dart';
import 'package:leisure_games/ui/bean/change_main_page_event.dart';
import 'package:leisure_games/ui/bean/digiccy_channel_entity.dart';
import 'package:leisure_games/ui/bean/payment_channel_entity.dart';
import 'package:leisure_games/ui/bean/payment_list_entity.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'recharge_digital_logic.dart';

///usdt钱包充值
class RechargeDigitalPage extends StatefulWidget {
  const RechargeDigitalPage({Key? key}) : super(key: key);

  @override
  State<RechargeDigitalPage> createState() => _RechargeDigitalPageState();
}

class _RechargeDigitalPageState extends State<RechargeDigitalPage> with SingleTickerProviderStateMixin {
  final logic = Get.find<RechargeDigitalLogic>();
  final state = Get.find<RechargeDigitalLogic>().state;

  @override
  void initState() {
    state.tabController = TabController(length: state.tabs.length, vsync: this);
    state.tabController.addListener(() {
      state.selectOnline.value = state.tabController.index == 0;
      switch(state.tabController.index){
        case 0:
          state.currentList.assignAll(state.onLineList);
          state.currentList.refresh();
          if(unEmpty(state.onLineList)){
            state.currentAccount.value = state.onLineList.first;
            state.currentAccount.refresh();
          }
          break;
        case 1:
          state.currentList.assignAll(state.offLineList);
          state.currentList.refresh();
          if(unEmpty(state.offLineList)){
            state.currentAccount.value = state.offLineList.first;
            state.currentAccount.refresh();
          }
          break;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<RechargeDigitalLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      scaffoldKey: state.scaffoldKey,
      backgroundColor: ColorX.pageBg2(),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(ImageX.rechargeBgT()),fit: BoxFit.fill),
            ),
            height: 226.h,
          ),
          Column(
            children: [
              WidgetUtils().buildRoomBar(state.title,bgColor: Colors.transparent,msg: true,drawer: true,
                  scaffoldKey: state.scaffoldKey,systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
                  onTap: (){
                if(unEmpty(state.paymentList.value)){
                  DialogUtils().showSelectPaywayBtmDialog(context,state.paymentList.value).then((value) {
                    if(unEmpty(value)){ jumpPage(value!); }
                  });
                }
              }),
              Obx(() {
                return Visibility(
                  visible: unEmpty(state.onLineList) && unEmpty(state.offLineList),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
                    child: LCTabBar(
                      length: state.tabs.length,
                      controller: state.tabController,
                      tabBarHeight: 35.h,
                      tabBarColor: Colors.transparent,
                      tabAlignment: TabAlignment.fill,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorPadding: EdgeInsets.only(top: 31.h,left: 30.w,right: 30.w,bottom: 1.h),
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.r),
                        color: ColorX.text0917(),
                      ),
                      labelColor: ColorX.text0917(),
                      unselectedLabelColor: ColorX.text586(),
                      width: 335.w,
                      tabs: state.tabs.map((e) => Text(e,style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600),),).toList(),
                    ),
                  ),
                );
              }),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 15.w,),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: ColorX.text586(),width: 3.r,strokeAlign: BorderSide.strokeAlignOutside),
                              shape: BoxShape.circle,
                            ),
                            width: 8.r,height: 8.r,
                          ),
                          SizedBox(width: 13.w,),
                          Text(Intr().diyibu_xuanzhezhifuxieyi,
                            style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
                        ],
                      ),
                      SizedBox(height: 15.h,),
                      Row(
                        children: [
                          SizedBox(width: 18.w,),
                          Container(width: 1.w,height: 55.h,color: Colors.black54,),
                          SizedBox(width: 13.w,),
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Obx(() {
                                return Row(
                                  children: state.currentList.map((element) {
                                    return Row(
                                      children: [
                                        InkWell(
                                          onTap: (){
                                            state.currentAccount.value = element;
                                            state.currentAccount.refresh();
                                          },
                                          child: buildAgreementItem(element, state.currentAccount.value == element),
                                        ),
                                        SizedBox(width: 10.r,),
                                      ],
                                    );
                                  }).toList(),
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h,),
                      Row(
                        children: [
                          SizedBox(width: 15.w,),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: ColorX.text586(),width: 3.r,strokeAlign: BorderSide.strokeAlignOutside),
                              shape: BoxShape.circle,
                            ),
                            width: 8.r,height: 8.r,
                          ),
                          SizedBox(width: 13.w,),
                          Text(Intr().dierbu_chakanshoukuanxinxi,
                            style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      Row(
                        children: [
                          SizedBox(width: 18.w,),
                          Obx(() {
                            return Visibility(
                              visible: !state.selectOnline.value,
                              child: Container(width: 1.w,height: 120.h,color: Colors.black12,),
                            );
                          }),
                          SizedBox(width: 13.w,),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: ColorX.cardBg(),
                              ),
                              padding: EdgeInsets.all(10.r),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Obx(() {
                                    return Visibility(
                                      visible: state.selectOnline.value,
                                      child: Row(
                                        children: [
                                          Text("*",style: TextStyle(fontSize: 14.sp,color: ColorX.color_fc243b),),
                                          Text(Intr().chongzhizhanghu,style: TextStyle(fontSize: 12.sp,color: ColorX.text586()),),
                                        ],
                                      ),
                                    );
                                  }),
                                  // Obx(() {
                                  //   return Visibility(
                                  //     visible: !state.selectOnline.value,
                                  //     child: Text(Intr().shoukuanzhanghu,style: TextStyle(fontSize: 13.sp,color: ColorX.text0917()),),
                                  //   );
                                  // }),
                                  Obx(() {
                                    return Visibility(
                                      visible: state.selectOnline.value,
                                      child: SizedBox(height: 10.h,),
                                    );
                                  }),
                                  Obx(() {
                                    return Visibility(
                                      visible: state.selectOnline.value,
                                      child: Container(
                                        decoration: BoxDecoration(color: ColorX.cardBg2(),borderRadius: BorderRadius.circular(5.r)),
                                        width: 300.w,height: 45.h,
                                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(AppData.user()!.username.em(),style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
                                            InkWell(
                                              onTap: ()=> WidgetUtils().clickCopy(AppData.user()!.username.em()),
                                              child: Image.asset(ImageX.icon_copy,color: ColorX.text586(),),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                                  Obx(() {
                                    return Visibility(
                                      visible: state.selectOnline.value,
                                      child: SizedBox(height: 10.h,),
                                    );
                                  }),
                                  Row(
                                    children: [
                                      Obx(() {
                                        return Visibility(
                                          visible: state.selectOnline.value,
                                          child: Obx(() {
                                            return QrImageView(
                                              data: logic.getAddress(),
                                              size: 112.r,
                                              backgroundColor: Colors.white,
                                            );
                                          }),
                                        );
                                      }),
                                      Obx(() {
                                        return Visibility(
                                          visible: state.selectOnline.value,
                                          child: SizedBox(width: 17.w,),
                                        );
                                      }),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(Intr().shoukuanzhanghu,style: TextStyle(fontSize: 13.sp,color: ColorX.text0917()),),
                                            SizedBox(height: 10.h,),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: ColorX.cardBg2(),
                                                borderRadius: BorderRadius.circular(8.r),
                                              ),
                                              padding: EdgeInsets.all(5.r),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Obx(() {
                                                    return Text(logic.getAddress(),
                                                      style: TextStyle(fontSize: 14.sp,color: ColorX.text949()),);
                                                  }),
                                                  Container(
                                                    constraints: BoxConstraints(
                                                      maxWidth: 0.5.sw,
                                                    ),
                                                    child: InkWell(
                                                      onTap: ()=> WidgetUtils().clickCopy(logic.getAddress(),),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Image.asset(ImageX.icon_copy,color: ColorX.text5862(),),
                                                          Text(Intr().fuzhilianjie, style: TextStyle(fontSize: 12.sp,color: ColorX.text0917()),),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 8.w,),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 20.w,),
                        ],
                      ),
                      Obx(() {
                        return Visibility(
                          visible: !state.selectOnline.value,
                          child: SizedBox(height: 15.h,),
                        );
                      }),
                      Obx(() {
                        return Visibility(
                          visible: !state.selectOnline.value,
                          child: Row(
                            children: [
                              SizedBox(width: 15.w,),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: ColorX.text586(),width: 3.r,strokeAlign: BorderSide.strokeAlignOutside),
                                  shape: BoxShape.circle,
                                ),
                                width: 8.r,height: 8.r,
                              ),
                              SizedBox(width: 13.w,),
                              Text(Intr().disanbu_tianxierukuanxinxi,
                                style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
                            ],
                          ),
                        );
                      }),
                      Obx(() {
                        return Visibility(
                          visible: !state.selectOnline.value,
                          child: SizedBox(height: 10.h,),
                        );
                      }),
                      Obx(() {
                        return Visibility(
                          visible: !state.selectOnline.value,
                          child: Row(
                            children: [
                              SizedBox(width: 30.w,),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: ColorX.cardBg(),
                                ),
                                padding: EdgeInsets.all(10.r),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text("*",style: TextStyle(fontSize: 14.sp,color: ColorX.color_fc243b),),
                                        Text(Intr().chongzhizhanghu,style: TextStyle(fontSize: 12.sp,color: ColorX.text586()),),
                                      ],
                                    ),
                                    SizedBox(height: 10.h,),
                                    Container(
                                      decoration: BoxDecoration(color: ColorX.cardBg2(),borderRadius: BorderRadius.circular(5.r)),
                                      width: 300.w,height: 45.h,
                                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(AppData.user()!.username.em(),style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
                                          InkWell(
                                            onTap: ()=> WidgetUtils().clickCopy(AppData.user()!.username.em()),
                                            child: Image.asset(ImageX.icon_copy,color: ColorX.text586(),),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10.h,),
                                    Text(Intr().qianbaodizhi,style: TextStyle(fontSize: 12.sp,color: ColorX.text586()),),
                                    SizedBox(height: 10.h,),
                                    WidgetUtils().buildTextField(300.w, 45.h, 14.sp, ColorX.text0917(), Intr().shuruzhuanzhangqianbao,defText: state.walletAddress,
                                        backgroundColor: ColorX.cardBg2(),hintColor: ColorX.text586(),onChanged: (v)=> state.walletAddress = v),
                                    SizedBox(height: 10.h,),
                                    Row(
                                      children: [
                                        Text("*",style: TextStyle(fontSize: 14.sp,color: ColorX.color_fc243b),),
                                        Text(Intr().huikuanjine,style: TextStyle(fontSize: 12.sp,color: ColorX.text586()),),
                                      ],
                                    ),
                                    SizedBox(height: 10.h,),
                                    WidgetUtils().buildTextField(300.w, 45.h, 14.sp, ColorX.text0917(), Intr().qingshuruhuikuanjine,defText: state.remitAmount,
                                        backgroundColor: ColorX.cardBg2(), inputType: TextInputType.number,hintColor: ColorX.text586()
                                        ,onChanged: (v)=> state.remitAmount = v),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                      SizedBox(height: 20.h,),
                      Obx(() {
                        var tab = state.selectOnline.value ? Intr().fanhuishouye : Intr().yiwanchengtijiaorukuan;
                        return WidgetUtils().buildElevatedButton(tab, 335.w, 50.h,bg: ColorX.color_fc243b,onPressed: (){
                          if(state.selectOnline.value){
                            eventBus.fire(ChangeMainPageEvent(0));
                            Get.back();
                          }else {
                            if(unEmpty(state.walletAddress)&& unEmpty(state.remitAmount)){
                              DialogUtils().showMessageDialog(context, Intr().shifoujinxingzhuanzhang,onConfirm: (){
                                Navigator.pop(context);
                                logic.digiccyDeposit();
                              },onCancel: ()=> Navigator.pop(context));
                            }
                          }
                        });
                      }),
                      SizedBox(height: 20.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          WidgetUtils().buildElevatedButton(Intr().bibiduihuan, 102.w, 38.h,bg: ColorX.cardBg(),textColor: ColorX.text0917(),onPressed: (){
                            Get.toNamed(Routes.coin_exchange);
                          }),
                          SizedBox(width: 16.w,),
                          WidgetUtils().buildElevatedButton(Intr().chongzhijilu, 102.w, 38.h,bg: ColorX.cardBg(),textColor: ColorX.text0917(),onPressed: (){
                            Get.toNamed(Routes.recharge_record);
                          }),
                          SizedBox(width: 16.w,),
                          WidgetUtils().buildElevatedButton(Intr().eduzhuanhuan, 102.w, 38.h,bg: ColorX.cardBg(),textColor: ColorX.text0917(),onPressed: (){
                            Get.toNamed(Routes.quota_conversion);
                          }),
                        ],
                      ),
                      SizedBox(height: 20.h,),
                      Obx(() {
                        return Visibility(
                          visible: state.selectOnline.value,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(Intr().zhifushuoming_,
                                  style: TextStyle(fontSize: 16.sp,color: ColorX.text5862(),height: 1.8),),
                                Obx(() {
                                  var name = "";
                                  if(state.currentAccount.value is DigiccyChannelWallet){
                                    name = (state.currentAccount.value as DigiccyChannelWallet).protocol.em();
                                  }else if(state.currentAccount.value is PaymentChannelBankSet){
                                    name = (state.currentAccount.value as PaymentChannelBankSet).bankName.em();
                                  }
                                  return Text.rich(TextSpan(
                                      children: [
                                        TextSpan(text: Intr().zhifushuoming_1,
                                          style: TextStyle(fontSize: 13.sp,color: ColorX.text5862(),height: 1.8),),
                                        TextSpan(text: "USDT-$name",
                                          style: TextStyle(fontSize: 13.sp,color: ColorX.color_fc243b,height: 1.8),),
                                        TextSpan(text: Intr().zhifushuoming_2,
                                          style: TextStyle(fontSize: 13.sp,color: ColorX.text5862(),height: 1.8),),
                                      ]
                                  ));
                                }),
                              ],
                            ),
                          ),
                        );
                      }),
                      SizedBox(height: 50.h,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      )
    );
  }

  Widget buildAgreementItem(Object item,bool select) {
    var name = "";
    if(item is DigiccyChannelWallet){
      name = "${(item).protocol.em()} ${Intr().chongzhi}";
    }else if(item is PaymentChannelBankSet){
      if(isEmpty(item.bankBranch)){
        name = "${(item).bankName.em()} ${Intr().chongzhi}";
      } else {
        name = "${(item).bankName.em()} ${Intr().chongzhi}\n${item.bankBranch.em()}";
      }
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        gradient: select ? const LinearGradient(colors: [ColorX.color_ff5164,ColorX.color_fd273e],begin: Alignment.topLeft,end:
        Alignment.bottomRight) : const LinearGradient(colors: [Colors.white,Colors.white]),
      ),
      width: 150.w,
      // height: 50.h,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
      child: Text(name,style: TextStyle(fontSize: 16.sp,color: select?Colors.white:ColorX.color_091722,fontWeight: FontWeight.w600),),
    );
  }

  void jumpPage(PaymentListBanks value) {
    if(value.id == state.paymentInfo.id){
      ///打开自己，不做任何操作
    } else {///打开其他类型的选项
      switch(value.bankCode){
        case Constants.code_usdt:
          break;
        case Constants.code_wangyin:
        case Constants.code_zhifubao:
        case Constants.code_weixin:
        case Constants.code_ysfzf:
        case Constants.code_qmf:
        case Constants.code_caifutong:
        case Constants.code_jingdong:
          Get.offAndToNamed(Routes.recharge_category, arguments: value);
          break;
        default:
          Get.offAndToNamed(Routes.recharge_wallet, arguments: value);
          break;
      }
    }
  }


}