import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/drawer_scaffold.dart';

import 'withdraw_apply_logic.dart';

///
///提现申请
class WithdrawApplyPage extends StatefulWidget {
  const WithdrawApplyPage({Key? key}) : super(key: key);

  @override
  State<WithdrawApplyPage> createState() => _WithdrawApplyPageState();
}

class _WithdrawApplyPageState extends State<WithdrawApplyPage> {
  final logic = Get.find<WithdrawApplyLogic>();
  final state = Get.find<WithdrawApplyLogic>().state;

  @override
  void dispose() {
    Get.delete<WithdrawApplyLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      scaffoldKey: state.scaffoldKey,
      backgroundColor: ColorX.pageBg2(),
      body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(ImageX.rechargeBgT()),fit: BoxFit.fill),
                ),
                height: 226.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WidgetUtils().buildAppBar(Intr().tixianxinxi,bgColor: Colors.transparent,msg: true,drawer: true,
                      systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),scaffoldKey: state.scaffoldKey),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15.h,),
                        Text(Intr().querentixianxinxi,style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600,color: ColorX.text0917()),),
                        SizedBox(height: 16.h,),
                        Container(
                          decoration: BoxDecoration(color: ColorX.cardBg(),borderRadius: BorderRadius.circular(12.r),),
                          padding: EdgeInsets.all(15.r),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 12.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(Intr().tixianzhanghu,style: TextStyle(fontSize: 13.sp,color: ColorX.text586()),),
                                    Obx(() {
                                      return Text("${Intr().yue_}${state.pageType.value == '1' ? "¥":"₮"}${state.balance.value.money.em()}",
                                        style: TextStyle(fontSize: 13.sp,color: ColorX.text586()),);
                                    }),
                                  ],
                                ),
                              ),
                              SizedBox(height: 7.h,),
                              InkWell(
                                onTap: (){
                                  // var list  = state.pageType.value == '1' ? state.userDraw.value.banks : state.userDraw.value.dcBanks;
                                  // if(isEmpty(state.userDraw.value.banks)){ return; }

                                  if(state.pageType.value == '1' && unEmpty(state.userDraw.value.banks) && isEmpty(state.walletChannel)){
                                    var list = state.userDraw.value.banks.where((element) => element.bankStatus == 0).toList();
                                    DialogUtils().showSelectAccountBtmDialog(context, list, false).then((value) {
                                      if(unEmpty(value)){
                                        state.selectValue = value!;
                                        state.dropdownValue.value = state.selectValue.toString();
                                      }
                                    });
                                  } else if(state.pageType.value == '5'){
                                    var list = state.userDraw.value.dcBanks.where((element) => unEmpty(element.account) && element.status == 1
                                        && element.type?.startsWith("USDT") == true).toList();
                                    DialogUtils().showSelectAccountBtmDialog(context, list, true).then((value) {
                                      if(unEmpty(value)){
                                        state.selectValue = value!;
                                        state.dropdownValue.value = state.selectValue.toString();
                                      }
                                    });
                                  }else {
                                    ///其他钱包
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(color: ColorX.cardBg2(),borderRadius: BorderRadius.circular(10.r),),
                                  padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 10.w),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Obx(() {
                                          return Text(state.dropdownValue.value,style: TextStyle(fontSize: 14.sp,color: ColorX.textBlack(),fontWeight: FontWeight.bold),);
                                        }),
                                      ),
                                      Obx(() {
                                        return Visibility(
                                          visible: unEmpty(state.pageType.value) && isEmpty(state.walletChannel),
                                          child: Image.asset(ImageX.icon_down_grey,color: ColorX.icon586(),),
                                        );
                                      }),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 15.h,),
                              Padding(
                                padding: EdgeInsets.only(left: 12.w),
                                child: Text(Intr().tixianjine,style: TextStyle(fontSize: 13.sp,color: ColorX.text586()),),
                              ),
                              SizedBox(height: 7.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  buildBtnAmount(50),
                                  buildBtnAmount(100),
                                  buildBtnAmount(500),
                                  buildBtnAmount(1000),
                                  buildBtnAmount(3000),
                                ],
                              ),
                              SizedBox(height: 10.h,),
                              Container(
                                decoration: BoxDecoration(color: ColorX.cardBg2(),borderRadius: BorderRadius.circular(10.r),),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Obx(() {
                                        return WidgetUtils().buildTextField(0, 45.h, 14.sp, ColorX.textBlack(), Intr().qingshurutixianjine,
                                            defText: state.withdrawAmount.value,onChanged: (v)=> logic.conculateRate(v),
                                            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),],inputType: TextInputType.number,
                                            backgroundColor: Colors.transparent,hintColor: ColorX.text586());
                                      }),
                                    ),
                                    Obx(() {
                                      var symbol = state.pageType.value != '5' ? "CNY":"USDT";
                                      return Text(symbol,style: TextStyle(fontSize: 14.sp,color: ColorX.text586(),),);
                                    }),
                                    SizedBox(width: 10.w,),
                                  ],
                                ),
                              ),
                              SizedBox(height: 15.h,),
                              Padding(
                                padding: EdgeInsets.only(left: 12.w),
                                child: Text(Intr().tixianmima,style: TextStyle(fontSize: 13.sp,color: ColorX.text586()),),
                              ),
                              SizedBox(height: 7.h,),
                              Container(
                                decoration: BoxDecoration(color: ColorX.cardBg2(),borderRadius: BorderRadius.circular(10.r),),
                                child: Row(
                                  children: [
                                    Obx(() {
                                      return WidgetUtils().buildTextField(275.w, 46.h, 14.sp,
                                          ColorX.text0917(), Intr().qingshurutixianmima,backgroundColor: Colors.transparent,
                                          onChanged: (v)=> state.pwdValue = v,defText: state.pwdValue,hintColor: ColorX.text586(),
                                          obscureText: !state.pwdVisible.value,inputType: TextInputType.visiblePassword);
                                    }),
                                    InkWell(
                                      onTap: ()=> state.pwdVisible.value = !state.pwdVisible.value,
                                      child: Obx(() {
                                        return state.pwdVisible.value ? Image.asset(ImageX.icon_show,width: 30.w,color: ColorX.icon586(),):Image.asset(ImageX.icon_hide,width: 30.w,color: ColorX.icon586(),);
                                      }),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15.h,),
                        Text(Intr().querenjine,style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600,color: ColorX.text0917()),),
                        SizedBox(height: 16.h,),
                        Container(
                          decoration: BoxDecoration(color: ColorX.cardBg(),borderRadius: BorderRadius.circular(12.r),),
                          padding: EdgeInsets.all(15.r),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 12.w),
                                child: Text(Intr().shouxufei,style: TextStyle(fontSize: 13.sp,color: ColorX.text586()),),
                              ),
                              SizedBox(height: 10.h,),
                              Container(
                                decoration: BoxDecoration(color: ColorX.cardBg19(),borderRadius: BorderRadius.circular(10.r),),
                                padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 13.h),
                                width: 1.sw,
                                child: Obx(() {
                                  return Text(state.serviceAmount.value,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),);
                                }),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 12.w,top: 16.h),
                                child: Text(Intr().kedaozhangjine,style: TextStyle(fontSize: 13.sp,color: ColorX.text586()),),
                              ),
                              SizedBox(height: 10.h,),
                              Container(
                                decoration: BoxDecoration(color: ColorX.cardBg19(),borderRadius: BorderRadius.circular(10.r),),
                                padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 13.h),
                                width: 1.sw,
                                child: Obx(() {
                                  return Text(state.actualAmount.value,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),);
                                }),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 28.h,),
                        WidgetUtils().buildElevatedButton(Intr().ti_confirm, 335.w, 50.h,bg: ColorX.color_fc243b,onPressed: (){
                          logic.withdraw();
                        }),
                        SizedBox(height: 20.h,),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(Intr().wenxintishi_,style: TextStyle(fontSize: 16.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
                        SizedBox(height: 5.h,),
                        Text(Intr().ruoxuxiugaitixianzhanghu,style: TextStyle(fontSize: 12.sp,color: ColorX.text586()),),
                        SizedBox(height: 20.h,),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )
      ),
    );
  }


  // List<DropdownMenuItem<LanguageMenuEntity>> buildAccountItem() {
  //   return state.country.map((e) {
  //     return DropdownMenuItem<LanguageMenuEntity>(
  //       value: e,
  //       child: Row(
  //         children: [
  //           SizedBox(width: 5.w,),
  //           Text(e.language.em(),style: TextStyle(fontSize: 14.sp,color: ColorX.text586()),),
  //         ],
  //       ),
  //     );
  //   }).toList();
  // }


  Widget buildBtnAmount(int i) {
    return InkWell(
      onTap: ()=> logic.conculateRate("$i"),
      child: Container(
        decoration: BoxDecoration(color: ColorX.cardBg2(),borderRadius: BorderRadius.circular(10.r)),
        alignment: Alignment.center,
        height: 40.h,width: 55.w,
        child: Text("$i",style: TextStyle(fontSize: 14.sp,color: ColorX.textBlack(),fontWeight: FontWeight.w600),),
      ),
    );
  }


}