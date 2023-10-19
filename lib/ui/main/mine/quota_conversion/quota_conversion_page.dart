import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/bean/change_main_page_event.dart';
import 'package:leisure_games/ui/bean/language_menu_entity.dart';

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
    state.tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    state.tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildAppBar("额度转换",msg: true),
      backgroundColor: ColorX.color_f7f8fb,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 5.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 40,
                      child: Obx(() {
                        return DropdownButtonHideUnderline(
                          child: GFDropdown(
                            elevation: 0,
                            borderRadius: BorderRadius.circular(10.r),
                            icon: Image.asset(ImageX.icon_down_grey),
                            border: BorderSide(color: Colors.white, width: 1.w),
                            dropdownButtonColor: Colors.white,
                            dropdownColor: Colors.white,
                            isExpanded: true,
                            itemHeight: 45.h,
                            value: state.dropdownValue.value,
                            onChanged: (newValue) {
                              state.dropdownValue.value = newValue!;
                              state.dropdownValue.refresh();
                            },
                            items: buildCategoryItem(),
                          ),
                        );
                      }),
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
                            Text("余额: ¥8,888",style: TextStyle(fontSize: 12.sp,color: ColorX.color_091722),),
                            InkWell(
                              onTap: (){},
                              child: Container(
                                width: 20.w,
                                alignment: Alignment.center,
                                child: Icon(Icons.refresh_rounded,color: ColorX.color_58698d,size: 15.r,),
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
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(color: ColorX.color_f7f8fb,borderRadius: BorderRadius.circular(10.r)),
                        margin: EdgeInsets.only(left: 15.w,top: 5.h,bottom: 5.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(() {
                              return DropdownButtonHideUnderline(
                                child: GFDropdown(
                                  elevation: 0,
                                  borderRadius: BorderRadius.circular(10.r),
                                  icon: Image.asset(ImageX.icon_down_grey),
                                  dropdownButtonColor: Colors.transparent,
                                  dropdownColor: Colors.white,
                                  isExpanded: true,
                                  itemHeight: 35.h,
                                  value: state.leftAccount.value,
                                  onChanged: (newValue) {
                                    state.leftAccount.value = newValue!;
                                  },
                                  items: buildLeftAccount(),
                                ),
                              );
                            }),
                            Row(
                              children: [
                                SizedBox(width: 5.w,),
                                Text("余额: ¥8,888",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722),),
                              ],
                            ),
                            SizedBox(height: 10.h,),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 60.w,
                      child: Image.asset(ImageX.icon_right_left),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(color: ColorX.color_f7f8fb,borderRadius: BorderRadius.circular(10.r)),
                        margin: EdgeInsets.only(right: 15.w,top: 5.h,bottom: 5.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(() {
                              return DropdownButtonHideUnderline(
                                child: GFDropdown(
                                  elevation: 0,
                                  borderRadius: BorderRadius.circular(10.r),
                                  icon: Image.asset(ImageX.icon_down_grey),
                                  dropdownButtonColor: Colors.transparent,
                                  dropdownColor: Colors.white,
                                  isExpanded: true,
                                  itemHeight: 35.h,
                                  value: state.rightAccount.value,
                                  onChanged: (newValue) {
                                    state.rightAccount.value = newValue!;
                                  },
                                  items: buildLeftAccount(),
                                ),
                              );
                            }),
                            Row(
                              children: [
                                SizedBox(width: 5.w,),
                                Text("余额: ¥8,888",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722),),
                              ],
                            ),
                            SizedBox(height: 10.h,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text("划转金额",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w600,color: ColorX.color_58698d),),
              SizedBox(height: 10.h,),
              Container(
                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10.r)),
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  children: [
                    Image.asset(ImageX.icon_dollar_grey,width: 24.r,),
                    WidgetUtils().buildTextField(230.w, 42.h, 14.sp,
                        ColorX.color_58698d, "请输入金额",backgroundColor: Colors.transparent,
                        inputType: TextInputType.number),
                  ],
                ),
              ),
              SizedBox(height: 24.h,),
              WidgetUtils().buildElevatedButton("确认划转", 351.w, 50.h,bg: ColorX.color_fc243b,onPressed: (){

              }),
              SizedBox(height: 10.h,),
              Row(
                children: [
                  WidgetUtils().buildElevatedButton("一键归集", 168.w, 40.h,
                      bg: Colors.white,textColor: ColorX.color_091722,onPressed: (){

                      }),
                  SizedBox(width: 10.w,),
                  WidgetUtils().buildElevatedButton("充值", 168.w, 40.h,
                      bg: Colors.white,textColor: ColorX.color_091722,onPressed: (){
                        eventBus.fire(ChangeMainPageEvent(3));
                        Get.back();
                      })
                ],
              ),
              SizedBox(height: 24.h,),
              Container(
                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10.r)),
                child: Column(
                  children: [
                    SizedBox(height: 10.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GFTabBar(
                          length: 3,
                          controller: state.tabController,
                          tabBarHeight: 35.h,
                          tabBarColor: Colors.white,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorPadding: EdgeInsets.only(top: 32.h,left: 10.w,right: 10.w),
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.r),
                            color: ColorX.color_091722,
                          ),
                          labelColor: ColorX.color_091722,
                          unselectedLabelColor: ColorX.color_58698d,
                          width: 280.w,
                          tabs: [
                            Text("各账户额度明细",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500),),
                            Text("划转记录",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500),),
                          ],
                        ),
                        InkWell(
                          onTap: (){},
                          child: Container(
                            width: 20.w,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(right: 10.w),
                            child: Icon(Icons.refresh_rounded,color: ColorX.color_58698d,size: 15.r,),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h,),
                    Wrap(
                      runSpacing: 10.h,
                      spacing: 10.w,
                      children: [
                        buildQuotaItem(),
                        buildQuotaItem(),
                        buildQuotaItem(),
                        buildQuotaItem(),
                        buildQuotaItem(),
                        buildQuotaItem(),
                        buildQuotaItem(),
                        buildQuotaItem(),
                        buildQuotaItem(),
                        buildQuotaItem(),
                        buildQuotaItem(),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



  List<DropdownMenuItem<LanguageMenuEntity>> buildCategoryItem() {
    return state.country.map((e) {
      return DropdownMenuItem<LanguageMenuEntity>(
        value: e,
        child: Row(
          children: [
            Image.asset(e.icon.em(),width: 24.r,),
            SizedBox(width: 6.w,),
            Text(e.language.em(),style: TextStyle(fontSize: 14.sp,color: ColorX.color_3e3737),),
          ],
        ),
      );
    }).toList();
  }

  List<DropdownMenuItem<String>> buildLeftAccount() {
    return state.accounts.map((e) {
      return DropdownMenuItem<String>(
        value: e,
        child: Text(e,style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722),),
      );
    }).toList();
  }

  Widget buildQuotaItem() {
    return Container(
      decoration: BoxDecoration(color: ColorX.color_f7f8fb,borderRadius: BorderRadius.circular(10.r)),
      width: 155.w,
      padding: EdgeInsets.all(10.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("BTBT",style: TextStyle(fontSize: 14.sp,color: ColorX.color_949eb9),),
              Text("转入",style: TextStyle(fontSize: 14.sp,color: ColorX.color_58698d,decoration: TextDecoration.underline),),
            ],
          ),
          SizedBox(height: 10.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("¥8,888",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722),),
              Text("转入",style: TextStyle(fontSize: 14.sp,color: ColorX.color_58698d,decoration: TextDecoration.underline),),
            ],
          ),
        ],
      ),
    );
  }



}