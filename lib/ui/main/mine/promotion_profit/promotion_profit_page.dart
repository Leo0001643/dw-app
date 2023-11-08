import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
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
      appBar: WidgetUtils().buildAppBar(Intr().tuiguangzhuanqian,msg: true),
      backgroundColor: ColorX.pageBg2(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                child: Text(Intr().jieshaorenxinxi,style: TextStyle(fontSize: 14.sp,color: ColorX.text586()),),
                padding: EdgeInsets.only(left: 12.w,bottom: 10.h),
              ),
              Container(
                decoration: BoxDecoration(color: ColorX.cardBg3(),borderRadius: BorderRadius.circular(12.r),),
                padding: EdgeInsets.all(15.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(Intr().daima,style: TextStyle(fontSize: 13.sp,color: ColorX.text586()),),
                    SizedBox(height: 5.h,),
                    GFListTile(
                      onTap: (){},
                      title: Text("100001547",
                        style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),fontWeight: FontWeight.w500),),
                      padding: EdgeInsets.symmetric(vertical: 13.h,horizontal: 10.w),
                      margin: EdgeInsets.zero,
                      radius: 10.r,
                      color: ColorX.cardBg2(),
                      shadow: BoxShadow(color: Colors.transparent),
                      icon: InkWell(
                        onTap: ()=> WidgetUtils().clickCopy("100001547"),
                        child: Text(Intr().fuzhi,style: TextStyle(fontSize: 14.sp,color: ColorX.text5862()),),
                      ),
                    ),
                    SizedBox(height: 14.h,),
                    Text(Intr().lianjie,style: TextStyle(fontSize: 13.sp,color: ColorX.text586()),),
                    SizedBox(height: 5.h,),
                    GFListTile(
                      onTap: (){},
                      title: Text("http://soptj9qq.com/#/register?sp=100001547",
                        style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),fontWeight: FontWeight.w500),),
                      padding: EdgeInsets.symmetric(vertical: 13.h,horizontal: 10.w),
                      margin: EdgeInsets.zero,
                      radius: 10.r,
                      color: ColorX.cardBg2(),
                      shadow: BoxShadow(color: Colors.transparent),
                      icon: InkWell(
                        onTap: ()=> WidgetUtils().clickCopy("http://soptj9qq.com/#/register?sp=100001547"),
                        child: Text(Intr().fuzhi,style: TextStyle(fontSize: 14.sp,color: ColorX.text5862()),),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                child: Text(Intr().tuiguangerweima,style: TextStyle(fontSize: 14.sp,color: ColorX.text586()),),
                padding: EdgeInsets.only(left: 12.w,bottom: 10.h,top: 20.h),
              ),
              Container(
                decoration: BoxDecoration(color: ColorX.cardBg(),borderRadius: BorderRadius.circular(12.r),),
                padding: EdgeInsets.all(15.r),
                child: Row(
                  children: [
                    QrImageView(
                      data: "12312312311231",
                      size: 136.r,
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(width: 36.w,),
                    Column(
                      children: [
                        WidgetUtils().buildElevatedButton(Intr().baocuntupian, 132.w, 40.h,
                            bg: ColorX.cardBg2(),textColor:ColorX.text0917(),onPressed: (){}),
                        SizedBox(height: 15.h,),
                        WidgetUtils().buildElevatedButton(Intr().fuzhilianjie, 132.w, 40.h,
                            bg: ColorX.cardBg2(),textColor:ColorX.text0917(),onPressed: (){}),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(Intr().tuiguangerweima,style: TextStyle(fontSize: 14.sp,color: ColorX.text586()),),
                    Text(Intr().huiyuanliebiao,style: TextStyle(fontSize: 12.sp,color: ColorX.text586()),),
                  ],
                ),
                padding: EdgeInsets.only(left: 12.w,bottom: 10.h,top: 20.h),
              ),
              Container(
                decoration: BoxDecoration(color: ColorX.cardBg(),borderRadius: BorderRadius.circular(12.r),),
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
                child: Text(Intr().riqi,style: TextStyle(fontSize: 13.sp,color: ColorX.text0917(),fontWeight: FontWeight.w500),overflow: TextOverflow.ellipsis,),
              ),
              Expanded(
                flex: 23,
                child: Text("线下用户线下用户线下用户线下用户线下用户线下用户线下用户线下用户线下用户线下用户线下用户线下用户线下用户线下用户",
                  style: TextStyle(fontSize: 13.sp,color: ColorX.text0917(),fontWeight: FontWeight.w500,),overflow: TextOverflow.ellipsis,),
              ),
              Expanded(
                flex: 23,
                child: Text(Intr().xiaxiancunkuan,style: TextStyle(fontSize: 13.sp,color: ColorX.text0917(),fontWeight: FontWeight.w500),overflow: TextOverflow.ellipsis,),
              ),
              Expanded(
                flex: 23,
                child: Text(Intr().zhuanquhongli,style: TextStyle(fontSize: 13.sp,color: ColorX.text0917(),fontWeight: FontWeight.w500),overflow: TextOverflow.ellipsis,),
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
          child: Text(Intr().riqi,style: TextStyle(fontSize: 13.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
        ),
        Expanded(
          flex: 23,
          child: Text(Intr().xianxiayonghu,style: TextStyle(fontSize: 13.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
        ),
        Expanded(
          flex: 23,
          child: Text(Intr().xiaxiancunkuan,style: TextStyle(fontSize: 13.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
        ),
        Expanded(
          flex: 23,
          child: Text(Intr().zhuanquhongli,style: TextStyle(fontSize: 13.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
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