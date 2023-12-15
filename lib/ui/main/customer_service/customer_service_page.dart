import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/bean/customer_service_entity.dart';

import 'customer_service_logic.dart';

class CustomerServicePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StateCustomerServicePage();

}

class StateCustomerServicePage extends State<CustomerServicePage>{
  final logic = Get.find<CustomerServiceLogic>();
  final state = Get.find<CustomerServiceLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildAppBar(Intr().kfzx,msg: true,drawer: true,back: false),
      backgroundColor: ColorX.pageBg(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.h,),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(ImageX.kefutopT()),fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(10.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              height: 126.h,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(Intr().xszxkf,
                        style: TextStyle(fontSize: 24.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600,),),
                      SizedBox(height: 10.h,),
                      Text(Intr().qthwnfw,style: TextStyle(fontSize: 16.sp,color: ColorX.text0917()),),
                    ],
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
            Obx(() {
              return Column(
                children: state.services.map((element)=> buildCategaryItem(element, state.services.indexOf(element))).toList(),
              );
            }),
            SizedBox(height: 50.h,),
          ],
        ),
      ),
    );
  }

  Widget buildCategaryItem(CustomerServiceEntity element, int i) {
    return Container(
      margin: EdgeInsets.only(left: 20.w,right: 20.w,top: 10.h),
      decoration: BoxDecoration(
        color: ColorX.cardBg4(),
        borderRadius: BorderRadius.circular(10.r),
        // image: DecorationImage(image: AssetImage(ImageX.bg_customer),fit: BoxFit.fill),
      ),
      child: InkWell(
        onTap: ()=> logic.clickService(element),
        child: Container(
          padding: EdgeInsets.all(10.r),
          height:  72.h,
          child: Row(
            children: [
              Image.network(element.image.em(),width: 40.r,),
              SizedBox(width: 8.w,),
              Text(element.name.em(),style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
              Expanded(child: Container(),),
              Image.asset(ImageX.ic_into_right,color: ColorX.icon586(),),
            ],
          ),
        ),
      ),
    );
  }
}



