import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/bean/language_menu_entity.dart';

import 'withdraw_apply_logic.dart';

///
///提现申请
///author: Soushin
///2023/10/15 21:25
///
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
    return Scaffold(
      appBar: WidgetUtils().buildAppBar("提现信息",msg: true),
      backgroundColor: ColorX.color_f7f8fb,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15.h,),
              Text("确认提现信息",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600,color: ColorX.color_091722),),
              SizedBox(height: 16.h,),
              Container(
                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(12.r),),
                padding: EdgeInsets.all(15.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      child: Text("提现账户",style: TextStyle(fontSize: 13.sp,color: ColorX.color_58698d),),
                      padding: EdgeInsets.only(left: 12.w),
                    ),
                    SizedBox(height: 7.h,),
                    Obx(() {
                      return DropdownButtonHideUnderline(
                        child: GFDropdown(
                          elevation: 0,
                          borderRadius: BorderRadius.circular(10.r),
                          iconEnabledColor: ColorX.color_091722,
                          dropdownButtonColor:  ColorX.color_f7f8fb,
                          dropdownColor: Colors.white,
                          isExpanded: true,
                          itemHeight: 45.h,
                          value: state.dropdownValue.value,
                          onChanged: (newValue) {
                            state.dropdownValue.value = newValue!;
                            state.dropdownValue.refresh();
                          },
                          items: buildAccountItem(),
                        ),
                      );
                    }),
                    SizedBox(height: 15.h,),
                    Padding(
                      child: Text("提现金额",style: TextStyle(fontSize: 13.sp,color: ColorX.color_58698d),),
                      padding: EdgeInsets.only(left: 12.w),
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
                    WidgetUtils().buildTextField(335.w, 45.h, 14.sp, ColorX.color_091722, "¥ 或输入提现金额",backgroundColor: ColorX.color_f7f8fb),
                    SizedBox(height: 15.h,),
                    Padding(
                      child: Text("提现密码",style: TextStyle(fontSize: 13.sp,color: ColorX.color_58698d),),
                      padding: EdgeInsets.only(left: 12.w),
                    ),
                    SizedBox(height: 7.h,),
                    Container(
                      decoration: BoxDecoration(color: ColorX.color_f7f8fb,borderRadius: BorderRadius.circular(10.r),),
                      child: Row(
                        children: [
                          Obx(() {
                            return WidgetUtils().buildTextField(275.w, 46.h, 14.sp,
                                ColorX.color_091722, "请输入提现密码",backgroundColor: Colors.transparent,
                                onChanged: (v)=> state.pwdValue = v,defText: state.pwdValue,
                                obscureText: !state.pwdVisible.value,inputType: TextInputType.visiblePassword);
                          }),
                          InkWell(
                            onTap: ()=> state.pwdVisible.value = !state.pwdVisible.value,
                            child: Obx(() {
                              return state.pwdVisible.value ? Image.asset(ImageX.icon_show,width: 30.w,):Image.asset(ImageX.icon_hide,width: 30.w,);
                            }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h,),
              Text("确认金额",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600,color: ColorX.color_091722),),
              SizedBox(height: 16.h,),
              Container(
                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(12.r),),
                padding: EdgeInsets.all(15.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      child: Text("手续费",style: TextStyle(fontSize: 13.sp,color: ColorX.color_58698d),),
                      padding: EdgeInsets.only(left: 12.w),
                    ),
                    SizedBox(height: 10.h,),
                    Container(
                      decoration: BoxDecoration(color: ColorX.color_f7f8fb,borderRadius: BorderRadius.circular(10.r),),
                      padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 13.h),
                      child: Row(
                        children: [
                          Text("100",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722),),
                        ],
                      ),
                    ),
                    Padding(
                      child: Text("可到账金额",style: TextStyle(fontSize: 13.sp,color: ColorX.color_58698d),),
                      padding: EdgeInsets.only(left: 12.w,top: 16.h),
                    ),
                    SizedBox(height: 10.h,),
                    Container(
                      decoration: BoxDecoration(color: ColorX.color_f7f8fb,borderRadius: BorderRadius.circular(10.r),),
                      padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 13.h),
                      child: Row(
                        children: [
                          Text("100",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 28.h,),
              WidgetUtils().buildElevatedButton("确定", 335.w, 50.h,bg: ColorX.color_fc243b,onPressed: (){
                Get.toNamed(Routes.withdraw_result);
              }),
              SizedBox(height: 20.h,),
            ],
          ),
        ),
      ),
    );
  }


  List<DropdownMenuItem<LanguageMenuEntity>> buildAccountItem() {
    return state.country.map((e) {
      return DropdownMenuItem<LanguageMenuEntity>(
        value: e,
        child: Row(
          children: [
            SizedBox(width: 5.w,),
            Text(e.language.em(),style: TextStyle(fontSize: 14.sp,color: ColorX.color_949eb9),),
          ],
        ),
      );
    }).toList();
  }


  Widget buildBtnAmount(int i) {
    return Container(
      decoration: BoxDecoration(color: ColorX.color_f7f8fb,borderRadius: BorderRadius.circular(10.r)),
      alignment: Alignment.center,
      height: 40.h,width: 55.w,
      child: Text("$i",style: TextStyle(fontSize: 14.sp,color: Colors.black,fontWeight: FontWeight.w600),),
    );
  }


}