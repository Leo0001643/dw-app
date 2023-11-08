import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';

import 'bind_bank_logic.dart';

class BindBankPage extends StatefulWidget {
  const BindBankPage({Key? key}) : super(key: key);

  @override
  State<BindBankPage> createState() => _BindBankPageState();
}

class _BindBankPageState extends State<BindBankPage> {
  final logic = Get.find<BindBankLogic>();
  final state = Get.find<BindBankLogic>().state;

  @override
  void dispose() {
    Get.delete<BindBankLogic>();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildAppBar(Intr().bangdingyinhangka,msg: true,bgColor: ColorX.appBarBg()),
      backgroundColor: ColorX.pageBg(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 27.w,top: 30.h),
              child: Text(Intr().wodeyinhangka_(["1","2"]),
                style: TextStyle(fontSize: 16.sp,color: ColorX.text0917()),),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.h),
              child: GFCarousel(
                height: 205.h,
                viewportFraction: 0.9,
                enableInfiniteScroll: false,
                items: [
                  buildBankItem(0),
                  buildBankItem(1),
                  buildBankItem(2),
                ],
              ),
            ),
            SizedBox(height: 10.h,),
            Container(
              decoration: BoxDecoration(
                color: ColorX.cardBg3(),
                borderRadius: BorderRadius.circular(10.r),
              ),
              height: 181.h,
              // padding: EdgeInsets.symmetric(vertical: 17.h,horizontal: 27.w),
              margin: EdgeInsets.symmetric(horizontal: 27.w),
              child: GFBorder(
                dashedLine: [5,7],
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
                    Text(Intr().tianjiayinhangka,style: TextStyle(fontSize: 16.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
                    SizedBox(height: 3.h,),
                    Text(Intr().zuiduoketianjia_(["3"]),style: TextStyle(fontSize: 13.sp,color: ColorX.text586()),),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 27.w),
              child: Text.rich(TextSpan(
                  children: [
                    TextSpan(text: Intr().wenxintixing_yinhangka,
                      style: TextStyle(fontSize: 14.sp,color: ColorX.text586(),height: 1.8),),
                    WidgetSpan(
                      child: InkWell(
                        onTap: (){},
                        child: Text(Intr().lxkf,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),height: 1.8,decoration: TextDecoration.underline),),
                      ),
                    ),
                  ]
              ),),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBankItem(int index) {
    return Container(
      decoration: BoxDecoration(
        color: ColorX.color_ff5164,
        borderRadius: BorderRadius.circular(10.r),
      ),
      width: 321.w,
      padding: EdgeInsets.symmetric(vertical: 17.h,horizontal: 27.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("招商银行",
            style: TextStyle(fontSize: 20.sp,color: Colors.white,fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 10.h,),
          Text(Intr().kahao,style: TextStyle(fontSize: 12.sp,color: Colors.white),),
          Text("342* **** **** **** 1242",
            style: TextStyle(fontSize: 20.sp,color: Colors.white),),
          SizedBox(height: 10.h,),
          Text(Intr().cikaren,style: TextStyle(fontSize: 12.sp,color: Colors.white),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("三三",
                style: TextStyle(fontSize: 20.sp,color: Colors.white),),
              Align(
                alignment: Alignment.centerRight,
                child: Image.asset(ImageX.icon_union_grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

}