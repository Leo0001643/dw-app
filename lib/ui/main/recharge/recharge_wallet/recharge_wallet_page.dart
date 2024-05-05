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
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/drawer_scaffold.dart';
import 'package:leisure_games/ui/bean/jump_payment_entity.dart';
import 'package:leisure_games/ui/bean/payment_list_entity.dart';

import 'recharge_wallet_logic.dart';

///充值-第三方钱包
class RechargeWalletPage extends StatefulWidget {
  @override
  State<RechargeWalletPage> createState() => _RechargeWalletPageState();
}

class _RechargeWalletPageState extends State<RechargeWalletPage> {
  final logic = Get.find<RechargeWalletLogic>();
  final state = Get.find<RechargeWalletLogic>().state;

  @override
  void dispose() {
    Get.delete<RechargeWalletLogic>();
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
              WidgetUtils().buildRoomBar(state.title,msg: true,drawer: true,scaffoldKey: state.scaffoldKey,bgColor: Colors.transparent,
                  systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
                  onTap: (){
                if(unEmpty(state.paymentList)){
                  DialogUtils().showSelectPaywayBtmDialog(context,state.paymentList.value).then((value) {
                    if(unEmpty(value)){jumpPage(value!);}
                  });
                }
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
                          Expanded(
                            child: Text(Intr().dianjixiafangzhifu,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h,),
                      Row(
                        children: [
                          SizedBox(width: 18.w,),
                          Container(width: 1.w,height: 130.h,color: Colors.black54,),
                          SizedBox(width: 13.w,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Obx(() {
                                    return Wrap(
                                      spacing: 5.w,
                                      children: state.channelList.map((element) {
                                        var index = state.channelList.indexOf(element);
                                        return buildPayItem(element, index, state.selectIndex.value == index);
                                      }).toList(),
                                    );
                                  }),
                                ),
                                SizedBox(height: 10.h,),
                                Text(Intr().wenxintishi_,style: TextStyle(fontSize: 12.sp,color: ColorX.text586(),fontWeight: FontWeight.w600),),
                                Text(Intr().wenxintishi_1,style: TextStyle(fontSize: 12.sp,color: ColorX.text586()),),
                                // Obx(() {
                                //   if(isEmpty(state.channelList)){
                                //     return Container();
                                //   }
                                //   return Text(Intr().wenxintishi_2(["${state.channelList[state.selectIndex.value].rate.em()}"]),
                                //     style: TextStyle(fontSize: 12.sp,color: ColorX.text586()),);
                                // }),
                                Obx(() {
                                  if(isEmpty(state.channelList)){
                                    return Container();
                                  }
                                  return Text(Intr().wenxintishi_3(['2',state.channelList[state.selectIndex.value].mark.em()]),
                                    style: TextStyle(fontSize: 12.sp,color: ColorX.color_5583e7),);
                                }),
                              ],
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
                          Obx(() {
                            if(isEmpty(state.channelList)){
                              return Container();
                            }
                            var item =state.channelList[state.selectIndex.value];
                            return Text(Intr().tianrujine([DataUtils.formatMoney(item.moneyDown),DataUtils.formatMoney(item.moneyUp)]),
                              style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),);
                          }),
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      Row(
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
                                  decoration: BoxDecoration(color: ColorX.appBarBg2(),borderRadius: BorderRadius.circular(5.r)),
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
                                Obx(() {
                                  return WidgetUtils().buildTextField(300.w, 45.h, 14.sp, ColorX.text0917(), Intr().shoudongshuruhuoxuanzhe,
                                      defText: state.remitAmount.value,backgroundColor: ColorX.appBarBg2(),inputType: TextInputType.number,
                                      hintColor: ColorX.text5d6(),onChanged: (v)=>state.remitAmount.value = v);
                                }),
                                SizedBox(height: 10.h,),
                                SizedBox(
                                  width: 300.w,
                                  child: Obx(() {
                                    if(state.channelList.isEmpty) return Container();
                                    var list = state.channelList[state.selectIndex.value].moneyQuick?.split("|") ?? [];
                                    return Wrap(
                                      alignment:WrapAlignment.spaceBetween,
                                      runSpacing: 10.h,spacing: 10.w,
                                      children: [
                                        ...list.map((e) => buildBtnAmount(int.tryParse(e) ?? 0)),
                                      ],
                                    );
                                  }),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h,),
                      WidgetUtils().buildElevatedButton(Intr().tijiao, 335.w, 50.h,bg: ColorX.color_fc243b,onPressed: (){
                        if(unEmpty(state.remitAmount.value)){
                          logic.onlineDeposit(context);
                        }
                      }),
                      SizedBox(height: 20.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          WidgetUtils().buildElevatedButton(Intr().bibiduihuan, 102.w, 38.h,bg: ColorX.cardBg(),textColor: ColorX.text0917(),
                              textAlign: TextAlign.center,onPressed: (){
                            Get.toNamed(Routes.coin_exchange);
                          }),
                          SizedBox(width: 16.w,),
                          WidgetUtils().buildElevatedButton(Intr().chongzhijilu, 102.w, 38.h,bg: ColorX.cardBg(),textColor: ColorX.text0917(),
                              textAlign: TextAlign.center,onPressed: (){
                            Get.toNamed(Routes.recharge_record);
                          }),
                          SizedBox(width: 16.w,),
                          WidgetUtils().buildElevatedButton(Intr().eduzhuanhuan, 102.w, 38.h,bg: ColorX.cardBg(),textColor: ColorX.text0917(),
                              textAlign: TextAlign.center,onPressed: (){
                            Get.toNamed(Routes.quota_conversion);
                          }),
                        ],
                      ),
                      SizedBox(height: 20.h,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text(Intr().zhifushuoming_wallet,
                          style: TextStyle(fontSize: 13.sp,color: ColorX.text586(),height: 1.8),),
                      ),
                      SizedBox(height: 50.h,),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildPayItem(JumpPaymentEntity payment,int index,bool select) {
    return InkWell(
      onTap: ()=> state.selectIndex.value = index,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: select ? ColorX.color_fc243b : ColorX.color_e8e8e8,width: 1.w),
              borderRadius: BorderRadius.circular(8.r),
            ),
            width: 120.w,//height: 40.h,
            padding: EdgeInsets.symmetric(vertical: 5.h),
            alignment: Alignment.center,
            child: Text(Intr().zhifutiaozhuan_(["${index + 1}"]),
              style: TextStyle(fontSize: 14.sp,color: select?ColorX.color_fc243b:ColorX.text0917(),fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,),
          ),
          Visibility(
            visible: select,
            child: Positioned(
              right: 0,top: 0,
              child: Image.asset(ImageX.icon_choose),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBtnAmount(int i) {
    return InkWell(
      onTap: ()=> state.remitAmount.value = "$i",
      child: Container(
        decoration: BoxDecoration(color: ColorX.cardBg2(),borderRadius: BorderRadius.circular(5.r)),
        alignment: Alignment.center,
        height: 40.h,width: 65.w,
        child: Text("$i",style: TextStyle(fontSize: 14.sp,color: ColorX.textBlack(),fontWeight: FontWeight.w600),),
      ),
    );
  }

  void jumpPage(PaymentListBanks value) {
    if(value.id == state.paymentInfo.value.id){
      ///打开自己，不做任何操作
    } else {///打开其他类型的选项
      switch(value.bankCode){
        case Constants.code_usdt:
          Get.offAndToNamed(Routes.recharge_digital,arguments: value);
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
          logic.loadData(value);
          break;
      }
    }
  }

}