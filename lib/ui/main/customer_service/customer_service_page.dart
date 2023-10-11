import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';

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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.h,),
            Container(
              decoration: BoxDecoration(
                color: ColorX.color_f7f8fb,
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
                        style: TextStyle(fontSize: 24.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600,),),
                      SizedBox(height: 10.h,),
                      Text(Intr().qthwnfw,style: TextStyle(fontSize: 16.sp,color: ColorX.color_091722),),
                    ],
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
            buildCategaryItem("Skype：Johnny999",ImageX.icon_skype,0),
            buildCategaryItem("微信：Sherry888",ImageX.icon_wechat,1),
            buildCategaryItem("Telegram：09987234998",ImageX.icon_telegram,2),
            buildCategaryItem("letstalk：09987234998",ImageX.icon_letstalk,3),
            buildCategaryItem("whatsapp：09987234998",ImageX.icon_whatsapp,4),
            buildCategaryItem("QQ：09987234998",ImageX.icon_qq,5),
            buildCategaryItem("支付宝：09987234998",ImageX.icon_alibb,6),
            buildCategaryItem("洽洽：09987234998",ImageX.icon_qiaqia,7),
            buildCategaryItem("facebook：09987234998",ImageX.icon_facebook,8),
            buildCategaryItem("twitter：09987234998",ImageX.icon_twitter,9),
            buildCategaryItem("line：09987234998",ImageX.icon_line,10),
            buildCategaryItem("在线客服：09987234998",ImageX.icon_online,11),
            buildCategaryItem("语音客服：09987234998",ImageX.icon_voice,12),
            SizedBox(height: 50.h,),
          ],
        ),
      ),
    );
  }

  Widget buildCategaryItem(String name, String icon, int i) {
    return Column(
      children: [
        SizedBox(height: 10.h,),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(ImageX.bg_customer),fit: BoxFit.fill),
          ),
          padding: EdgeInsets.all(10.r),
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          height:  72.h,
          child: Row(
            children: [
              Image.asset(icon,),
              SizedBox(width: 8.w,),
              Text(name,style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722),),
              Expanded(child: Container(),),
              InkWell(
                onTap: (){},
                child: Text(Intr().djjr,style: TextStyle(fontSize: 12.sp,color: ColorX.color_091722,
                    decoration: TextDecoration.underline),),
              ),
            ],
          ),
        ),
      ],
    );
  }
}



