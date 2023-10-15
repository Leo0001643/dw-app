import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';

import 'service_details_logic.dart';

class ServiceDetailsPage extends StatefulWidget {
  const ServiceDetailsPage({Key? key}) : super(key: key);

  @override
  State<ServiceDetailsPage> createState() => _ServiceDetailsPageState();
}

class _ServiceDetailsPageState extends State<ServiceDetailsPage> {
  final logic = Get.find<ServiceDetailsLogic>();
  final state = Get.find<ServiceDetailsLogic>().state;

  @override
  void dispose() {
    Get.delete<ServiceDetailsLogic>();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            WidgetUtils().buildAppBar("Skype",msg: true,bgColor: Colors.transparent),
            Stack(
              children: [
                Container(
                  color: Colors.black,
                  height: 150.h,
                ),
                Container(
                  margin: EdgeInsets.only(top: 120.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r),topRight: Radius.circular(20.r)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h,),
                      buildCategaryItem("客服小强","Johnny999",ImageX.icon_wechat, 0),
                      buildCategaryItem("客服小强", "Johnny999",ImageX.icon_wechat, 1),
                      buildCategaryItem("客服小强", "Johnny999",ImageX.icon_wechat, 2),
                      buildCategaryItem("客服小强", "Johnny999",ImageX.icon_wechat, 3),
                      SizedBox(height: 10.h,),

                      Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: Text("温馨提示：\n长按号码可以复制到剪切板",style: TextStyle(fontSize: 14.sp,color: ColorX.color_58698d),),
                      ),
                      SizedBox(height: 32.h,),
                      Center(
                        child: WidgetUtils().buildElevatedButton("返回", 131.w, 40.h,
                            bg: ColorX.color_f7f8fb,textColor: ColorX.color_091722,onPressed: (){
                                Navigator.of(context).pop();
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }

  Widget buildCategaryItem(String name,String code, String icon, int i) {
    return Column(
      children: [
        SizedBox(height: 10.h,),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(ImageX.bg_customer),fit: BoxFit.fill),
          ),
          padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 15.w),
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          height:  72.h,
          child: Row(
            children: [
              Image.asset(icon,),
              SizedBox(width: 8.w,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(name,style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722),),
                  SizedBox(height: 5.h,),
                  Text(code,style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
                ],
              ),
              Expanded(child: Container(),),
              InkWell(
                onTap: ()=> WidgetUtils().clickCopy(code),
                child: Text("点击复制",style: TextStyle(fontSize: 12.sp,color: ColorX.color_091722,
                    decoration: TextDecoration.underline),),
              ),
            ],
          ),
        ),
      ],
    );
  }

}