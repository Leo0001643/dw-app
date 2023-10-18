import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/empty_data_widget.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'promotion_profit_logic.dart';

///
///推广赚钱
class PromotionProfitPage extends StatefulWidget {
  const PromotionProfitPage({Key? key}) : super(key: key);

  @override
  State<PromotionProfitPage> createState() => _PromotionProfitPageState();
}

class _PromotionProfitPageState extends State<PromotionProfitPage> {
  final logic = Get.find<PromotionProfitLogic>();
  final state = Get.find<PromotionProfitLogic>().state;

  @override
  void dispose() {
    Get.delete<PromotionProfitLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildAppBar("推广赚钱",msg: true),
      backgroundColor: ColorX.color_f7f8fb,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                child: Text("介绍人信息",style: TextStyle(fontSize: 14.sp,color: ColorX.color_58698d),),
                padding: EdgeInsets.only(left: 12.w,bottom: 10.h),
              ),
              Container(
                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(12.r),),
                padding: EdgeInsets.all(15.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("代码",style: TextStyle(fontSize: 13.sp,color: ColorX.color_58698d),),
                    SizedBox(height: 5.h,),
                    GFListTile(
                      onTap: (){},
                      title: Text("100001547",
                        style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722,fontWeight: FontWeight.w500),),
                      padding: EdgeInsets.symmetric(vertical: 13.h,horizontal: 10.w),
                      margin: EdgeInsets.zero,
                      radius: 10.r,
                      color: ColorX.color_f7f8fb,
                      shadow: BoxShadow(color: Colors.transparent),
                      icon: InkWell(
                        onTap: ()=> WidgetUtils().clickCopy("100001547"),
                        child: Text("复制",style: TextStyle(fontSize: 14.sp,color: ColorX.color_58698d),),
                      ),
                    ),
                    SizedBox(height: 14.h,),
                    Text("链接",style: TextStyle(fontSize: 13.sp,color: ColorX.color_58698d),),
                    SizedBox(height: 5.h,),
                    GFListTile(
                      onTap: (){},
                      title: Text("http://soptj9qq.com/#/register?sp=100001547",
                        style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722,fontWeight: FontWeight.w500),),
                      padding: EdgeInsets.symmetric(vertical: 13.h,horizontal: 10.w),
                      margin: EdgeInsets.zero,
                      radius: 10.r,
                      color: ColorX.color_f7f8fb,
                      shadow: BoxShadow(color: Colors.transparent),
                      icon: InkWell(
                        onTap: ()=> WidgetUtils().clickCopy("http://soptj9qq.com/#/register?sp=100001547"),
                        child: Text("复制",style: TextStyle(fontSize: 14.sp,color: ColorX.color_58698d),),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                child: Text("推广二维码",style: TextStyle(fontSize: 14.sp,color: ColorX.color_58698d),),
                padding: EdgeInsets.only(left: 12.w,bottom: 10.h,top: 20.h),
              ),
              Container(
                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(12.r),),
                padding: EdgeInsets.all(15.r),
                child: Row(
                  children: [
                    QrImageView(
                      data: "12312312311231",
                      size: 136.r,
                    ),
                    SizedBox(width: 36.w,),
                    Column(
                      children: [
                        WidgetUtils().buildElevatedButton("保存图片", 132.w, 40.h,
                            bg: ColorX.color_f7f8fb,textColor:ColorX.color_091722,onPressed: (){}),
                        SizedBox(height: 15.h,),
                        WidgetUtils().buildElevatedButton("复制链接", 132.w, 40.h,
                            bg: ColorX.color_f7f8fb,textColor:ColorX.color_091722,onPressed: (){}),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("推广二维码",style: TextStyle(fontSize: 14.sp,color: ColorX.color_58698d),),
                    Text("会员列表(通过 sp=495 注册的会员如下",style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d),),
                  ],
                ),
                padding: EdgeInsets.only(left: 12.w,bottom: 10.h,top: 20.h),
              ),
              Container(
                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(12.r),),
                padding: EdgeInsets.all(15.r),
                alignment: Alignment.center,
                child: buildPromotionList(["","",""]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPromotionItem(String item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(height: 1.h,color: ColorX.color_10_949,),
        Container(
          height: 40.h,
          child: Row(
            children: [
              Expanded(
                flex: 30,
                child: Text("日期",style: TextStyle(fontSize: 13.sp,color: ColorX.color_091722,fontWeight: FontWeight.w500),overflow: TextOverflow.ellipsis,),
              ),
              Expanded(
                flex: 23,
                child: Text("线下用户线下用户线下用户线下用户线下用户线下用户线下用户线下用户线下用户线下用户线下用户线下用户线下用户线下用户",
                  style: TextStyle(fontSize: 13.sp,color: ColorX.color_091722,fontWeight: FontWeight.w500,),overflow: TextOverflow.ellipsis,),
              ),
              Expanded(
                flex: 23,
                child: Text("下线存款",style: TextStyle(fontSize: 13.sp,color: ColorX.color_091722,fontWeight: FontWeight.w500),overflow: TextOverflow.ellipsis,),
              ),
              Expanded(
                flex: 23,
                child: Text("赚取红利",style: TextStyle(fontSize: 13.sp,color: ColorX.color_091722,fontWeight: FontWeight.w500),overflow: TextOverflow.ellipsis,),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildPromotionList(List<String> list) {
    if(isEmpty(list)){
      return EmptyDataWidget(iconWidth: 170.r, iconHeight: 170.r,text: "",);
    }
    var childs = List<Widget>.empty(growable: true);
    childs.add(Row(
      children: [
        Expanded(
          flex: 30,
          child: Text("日期",style: TextStyle(fontSize: 13.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
        ),
        Expanded(
          flex: 23,
          child: Text("线下用户",style: TextStyle(fontSize: 13.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
        ),
        Expanded(
          flex: 23,
          child: Text("下线存款",style: TextStyle(fontSize: 13.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
        ),
        Expanded(
          flex: 23,
          child: Text("赚取红利",style: TextStyle(fontSize: 13.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
        ),
      ],
    ));
    childs.add(SizedBox(height: 10.h,),);
    list.forEach((element) {
      childs.add(buildPromotionItem(""));
    });
    return Column(children: childs,);
  }



}