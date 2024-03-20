import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/drawer_scaffold.dart';

import 'recharge_result_logic.dart';
///
///充值结果
class RechargeResultPage extends StatefulWidget {
  const RechargeResultPage({Key? key}) : super(key: key);

  @override
  State<RechargeResultPage> createState() => _RechargeResultPageState();
}

class _RechargeResultPageState extends State<RechargeResultPage> {
  final logic = Get.find<RechargeResultLogic>();
  final state = Get.find<RechargeResultLogic>().state;

  @override
  void dispose() {
    Get.delete<RechargeResultLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
        scaffoldKey: state.scaffoldKey,
      backgroundColor: ColorX.pageBg2(),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(ImageX.rechargeBgT()),fit: BoxFit.fill),
            ),
            height: 226.h,
          ),
          Column(
            children: [
              WidgetUtils().buildAppBar(Intr().chongzhi,msg: true,
                  bgColor: Colors.transparent,scaffoldKey: state.scaffoldKey),
              Container(
                height: 115.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(ImageX.icon_select,width: 24.r,height: 24.r,),
                    SizedBox(height: 5.r,),
                    Text(Intr().tijiaochenggong,style: TextStyle(fontSize: 20.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
                    SizedBox(height: 5.r,),
                    Text(Intr().qing3fenzhonghoushuaxin,style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d),),
                  ],
                ),
              ),
              Obx(() {
                var result = state.result.value;
                return Container(
                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10.r)),
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  padding: EdgeInsets.all(15.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(Intr().chongzhixiangqing,style: TextStyle(fontSize: 16.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
                      SizedBox(height: 15.h,),
                      buildInfoItem(Intr().chongzhixingming,result.remitName.em()),
                      SizedBox(height: 15.h,),
                      buildInfoItem(Intr().dingdanbianhao,result.orderId.em()),
                      SizedBox(height: 15.h,),
                      buildInfoItem(Intr().tijiaoshijian,result.date.em()),
                      SizedBox(height: 15.h,),
                      buildInfoItem(Intr().chongzhijine,"¥${result.money.em()}"),
                    ],
                  ),
                );
              }),
              SizedBox(height: 20.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WidgetUtils().buildElevatedButton(Intr().shuaxin, 150.w, 40.h,bg: Colors.white,textColor:ColorX.color_091722,onPressed: (){}),
                  SizedBox(width: 20.w,),
                  WidgetUtils().buildElevatedButton(Intr().wancheng, 150.w, 40.h,bg: ColorX.color_fc243b,onPressed: (){
                    Get.back();
                  }),
                ],
              ),
            ],
          ),
        ],
      )
    );
  }

  Widget buildInfoItem(String key, String value) {
    return Row(
      children: [
        Text(key,style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d),),
        SizedBox(width: 10.w,),
        Text(value,style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722),),
      ],
    );
  }
}