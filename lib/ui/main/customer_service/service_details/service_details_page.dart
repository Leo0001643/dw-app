import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/bean/customer_service_entity.dart';

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
  void initState() {
    state.detail = Get.arguments;
    state.title.value = state.detail.name.em();
    super.initState();
    print("====== isChat 》${state.detail.isChat}");
  }

  @override
  void dispose() {
    Get.delete<ServiceDetailsLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorX.cardBg5(),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage(ImageX.kefudetail),fit: BoxFit.cover,),
                ),
                height: 213.h,
                child: WidgetUtils().buildRxAppBar(state.title,msg: true,bgColor: Colors.transparent),
              ),
              Container(
                margin: EdgeInsets.only(top: 193.h),
                decoration: BoxDecoration(
                  color: ColorX.cardBg5(),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r),topRight: Radius.circular(20.r)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h,),
                    Column(
                      children: state.detail.custerServers?.map((e) =>
                          buildCategaryItem(e, state.detail.custerServers!.indexOf(e))).toList() ?? [],
                    ),
                    // buildCategaryItem("客服小强","Johnny999",ImageX.icon_wechat, 0),
                    // buildCategaryItem("客服小强", "Johnny999",ImageX.icon_wechat, 1),
                    // buildCategaryItem("客服小强", "Johnny999",ImageX.icon_wechat, 2),
                    // buildCategaryItem("客服小强", "Johnny999",ImageX.icon_wechat, 3),
                    SizedBox(height: 10.h,),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Text(Intr().wenxintishi_fuzhi,style: TextStyle(fontSize: 14.sp,color: ColorX.text586(),height: 1.5),),
                    ),
                    SizedBox(height: 32.h,),
                    Center(
                      child: WidgetUtils().buildElevatedButton(Intr().fanhui, 131.w, 40.h,
                          bg: ColorX.cardBg3(),textColor: ColorX.text0917(),onPressed: (){
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
    );
  }

  Widget buildCategaryItem(CustomerServiceCusterServers server, int i) {
    return Column(
      children: [
        SizedBox(height: 10.h,),
        Container(
          decoration: BoxDecoration(
            color: ColorX.cardBg3(),
            borderRadius: BorderRadius.circular(10.r),
            // image: DecorationImage(image: AssetImage(ImageX.bg_customer),fit: BoxFit.fill),
          ),
          padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 15.w),
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          height:  72.h,
          child: Row(
            children: [
              GFAvatar(
                backgroundImage: WidgetUtils().buildImageProvider("${server.url}${server.image}"),
                shape: GFAvatarShape.circle,
                radius: 18.r,
              ),
              SizedBox(width: 8.w,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(server.name.em(),style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
                  SizedBox(height: 5.h,),
                  Text(server.number.em(),style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
                ],
              ),
              Expanded(child: Container(),),


              InkWell(
                onTap: ()=> WidgetUtils().clickCopy(server.number.em()),
                child: Text((state?.detail.isChat==true)?Intr().nowChat:Intr().dianjifuzhi,style: TextStyle(fontSize: 12.sp,color: ColorX.text0917(),
                    decoration: TextDecoration.underline),),
              ),
            ],
          ),
        ),
      ],
    );
  }

}