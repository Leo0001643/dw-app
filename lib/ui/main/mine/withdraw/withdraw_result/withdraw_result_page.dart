import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';

import 'withdraw_result_logic.dart';
///
///提现结果
class WithdrawResultPage extends StatefulWidget {
  const WithdrawResultPage({Key? key}) : super(key: key);

  @override
  State<WithdrawResultPage> createState() => _WithdrawResultPageState();
}

class _WithdrawResultPageState extends State<WithdrawResultPage> {
  final logic = Get.find<WithdrawResultLogic>();
  final state = Get.find<WithdrawResultLogic>().state;

  @override
  void dispose() {
    Get.delete<WithdrawResultLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorX.pageBg2(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(ImageX.rechargeBgT()),fit: BoxFit.fill),
              ),
              height: 226.h,
            ),
            Column(
              children: [
                WidgetUtils().buildAppBar(Intr().tixian,bgColor: Colors.transparent,msg: true),
                Container(
                  height: 115.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(ImageX.icon_select,width: 24.r,height: 24.r,),
                      SizedBox(height: 5.r,),
                      Text(Intr().tijiaochenggong,style: TextStyle(fontSize: 20.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
                      // SizedBox(height: 5.r,),
                      // Text("请3分钟后刷新本页,查询进度",style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d),),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: ColorX.cardBg(),borderRadius: BorderRadius.circular(10.r)),
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  padding: EdgeInsets.all(15.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(Intr().tixianxiangqing,style: TextStyle(fontSize: 16.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
                      SizedBox(height: 15.h,),
                      buildInfoItem(Intr().tixianzhanghu,"xxx"),
                      SizedBox(height: 15.h,),
                      buildInfoItem(Intr().tijiaoshijian,"2023-07-05  11:45:10"),
                      SizedBox(height: 15.h,),
                      Row(
                        children: [
                          buildInfoItem(Intr().tixianjine,"¥500"),
                          SizedBox(width: 3.w,),
                          Text(Intr().shouxufei_(["¥100"]),style: TextStyle(fontSize: 12.sp,color: ColorX.color_62_586),),
                        ],
                      ),
                      SizedBox(height: 15.h,),
                      buildInfoItem(Intr().daozhangjine,"¥500"),
                      SizedBox(height: 15.h,),
                      buildInfoItem(Intr().zhanghuyue,"¥500"),
                    ],
                  ),
                ),
                SizedBox(height: 24.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WidgetUtils().buildElevatedButton(Intr().wancheng, 150.w, 40.h,bg: ColorX.color_fc243b,onPressed: (){
                      Get.until(ModalRoute.withName(Routes.main));
                    }),
                  ],
                ),
              ],
            ),
          ],
        )
      ),
    );
  }

  Widget buildInfoItem(String key, String value) {
    return Row(
      children: [
        Text(key,style: TextStyle(fontSize: 12.sp,color: ColorX.text586()),),
        SizedBox(width: 10.w,),
        Text(value,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
      ],
    );
  }

}