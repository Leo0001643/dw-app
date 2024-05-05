import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/drawer_scaffold.dart';

import 'withdraw_check_logic.dart';

///
///提现稽核
///
class WithdrawCheckPage extends StatefulWidget {
  const WithdrawCheckPage({Key? key}) : super(key: key);

  @override
  State<WithdrawCheckPage> createState() => _WithdrawCheckPageState();
}

class _WithdrawCheckPageState extends State<WithdrawCheckPage> {
  final logic = Get.find<WithdrawCheckLogic>();
  final state = Get.find<WithdrawCheckLogic>().state;

  @override
  void initState() {
    logic.loadData(Get.arguments);
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<WithdrawCheckLogic>();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      scaffoldKey: state.scaffoldKey,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WidgetUtils().buildAppBar(state.type != '5' ? Intr().congcnyqianbaotichu : Intr().congusdtqianbaotichu,
                    bgColor: Colors.transparent,msg: true,systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),scaffoldKey: state.scaffoldKey),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15.h,),
                      Text(Intr().querenjihexinxi,style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600,color: ColorX.text0917()),),
                      SizedBox(height: 7.h,),
                      Obx(() {
                        return Text(Intr().zitixianhouzongtouzhu_(["${state.withdrawCheck.value.totalValidamount.em()}"]),style: TextStyle(fontSize: 13.sp,color: ColorX.text586()),);
                      }),
                      SizedBox(height: 16.h,),
                      Container(
                        decoration: BoxDecoration(color: ColorX.cardBg(),borderRadius: BorderRadius.circular(12.r),),
                        padding: EdgeInsets.all(15.r),
                        child: Obx(() {
                          var detail = state.withdrawCheck.value;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 12.w),
                                child: Text(Intr().youhuijihe,style: TextStyle(fontSize: 13.sp,color: ColorX.text586()),),
                              ),
                              SizedBox(height: 7.h,),
                              GFListTile(
                                onTap: (){},
                                title: Text(detail.poromsFeeHint(),style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
                                padding: EdgeInsets.symmetric(vertical: 13.h,horizontal: 8.w),
                                margin: EdgeInsets.zero,
                                radius: 10.r,
                                color: ColorX.cardBg2(),
                                shadow: BoxShadow(color: Colors.transparent),
                              ),
                              SizedBox(height: 15.h,),
                              Padding(
                                padding: EdgeInsets.only(left: 12.w),
                                child: Text(Intr().changtaixingjihe,style: TextStyle(fontSize: 13.sp,color: ColorX.text586()),),
                              ),
                              SizedBox(height: 7.h,),
                              GFListTile(
                                onTap: (){},
                                title: Text(detail.normalFeeHint(),style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
                                padding: EdgeInsets.symmetric(vertical: 13.h,horizontal: 8.w),
                                margin: EdgeInsets.zero,
                                radius: 10.r,
                                color: ColorX.cardBg2(),
                                shadow: BoxShadow(color: Colors.transparent),
                              ),
                              SizedBox(height: 15.h,),
                              Padding(
                                padding: EdgeInsets.only(left: 12.w),
                                child: Text(Intr().duocitixian,style: TextStyle(fontSize: 13.sp,color: ColorX.text586()),),
                              ),
                              SizedBox(height: 7.h,),
                              GFListTile(
                                onTap: (){},
                                title: Text(detail.replyFeeHint(),style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
                                padding: EdgeInsets.symmetric(vertical: 13.h,horizontal: 8.w),
                                margin: EdgeInsets.zero,
                                radius: 10.r,
                                color: ColorX.cardBg2(),
                                shadow: BoxShadow(color: Colors.transparent),
                              ),
                              SizedBox(height: 15.h,),
                              Padding(
                                padding: EdgeInsets.only(left: 12.w),
                                child: Text(Intr().shixiaoshouxufei,style: TextStyle(fontSize: 13.sp,color: ColorX.text586()),),
                              ),
                              SizedBox(height: 7.h,),
                              GFListTile(
                                onTap: (){},
                                title: Text(detail.timeFeeHint(),style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
                                padding: EdgeInsets.symmetric(vertical: 13.h,horizontal: 8.w),
                                margin: EdgeInsets.zero,
                                radius: 10.r,
                                color: ColorX.cardBg2(),
                                shadow: BoxShadow(color: Colors.transparent),
                              ),
                              SizedBox(height: 15.h,),
                              Padding(
                                padding: EdgeInsets.only(left: 12.w),
                                child: Text(Intr().cichijiheshijian,style: TextStyle(fontSize: 13.sp,color: ColorX.text586()),),
                              ),
                              SizedBox(height: 7.h,),
                              GFListTile(
                                onTap: (){},
                                title: Text(Intr().meidongshijian_([state.withdrawCheck.value.addTime.em()]),
                                  style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
                                padding: EdgeInsets.symmetric(vertical: 13.h,horizontal: 8.w),
                                margin: EdgeInsets.zero,
                                radius: 10.r,
                                color: ColorX.cardBg2(),
                                shadow: BoxShadow(color: Colors.transparent),
                              ),
                            ],
                          );
                        }),
                      ),
                      SizedBox(height: 20.h,),
                      WidgetUtils().buildElevatedButton(Intr().jixutixian, 335.w, 50.h,bg: ColorX.color_fc243b,onPressed: (){
                        Get.toNamed(Routes.withdraw_apply,arguments: state.withdrawCheck.value);
                      }),
                    ],
                  ),
                )
              ],
            ),
          ],
        )
      ),
    );
  }

}

