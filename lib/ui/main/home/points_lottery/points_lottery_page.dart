
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/drawer_scaffold.dart';
import 'package:luckywheel/luckywheel.dart';

import 'points_lottery_logic.dart';

///积分摇奖
class PointsLotteryPage extends StatefulWidget {
  const PointsLotteryPage({Key? key}) : super(key: key);

  @override
  State<PointsLotteryPage> createState() => _PointsLotteryPageState();
}

class _PointsLotteryPageState extends State<PointsLotteryPage> with TickerProviderStateMixin {
  final logic = Get.find<PointsLotteryLogic>();
  final state = Get.find<PointsLotteryLogic>().state;

  @override
  void initState() {
    state.wheelController = LuckyWheelController(
      vsync: this,
      totalParts: 12,
      stopDuration: 5000,
      onRotationEnd: (idx) => logic.onResult(context,idx),
    );
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<PointsLotteryLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      scaffoldKey: state.scaffoldKey,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(ImageX.color_pillar),fit: BoxFit.fill,),
        ),
        child: Column(
          children: [
            WidgetUtils().buildAppBar(Intr().jifenyaojiang,bgColor: Colors.transparent,systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),scaffoldKey: state.scaffoldKey),
            Center(
              child: Image.asset(ImageX.luckyTitleP()),
            ),
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage(ImageX.accountBg),fit: BoxFit.fill,),
              ),
              // width: 120.r,
              height: 22.r,
              padding: EdgeInsets.only(left: 30.w,right: 10.w),
              // alignment: Alignment.centerLeft,
              child: Obx(() {
                return Text(Intr().jifenmeici(["${state.pointLottery.value.point.em()}"]),
                  style: TextStyle(fontSize: 12.sp,color: Colors.white,),);
              }),
            ),
            SizedBox(height: 10.h,),
            Obx(() {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Center(
                    child: Visibility(
                      visible: state.wheelState.value,
                      child: Image.asset(ImageX.wheel,width: 275.w,fit: BoxFit.fill,),
                    ),
                  ),
                  Center(
                     child: Visibility(
                       visible: !state.wheelState.value,
                       child: Image.asset(ImageX.wheel2,width: 275.w,fit: BoxFit.fill,),
                     ),
                  ),
                  Center(
                    child: LuckyWheel(
                      onResult: (v)=> logic.onResult(context,v),
                      controller: state.wheelController,
                      // child: SpinningWidget(width: 150.r, height: 150.r, totalParts: 12),
                      child: Image.asset(ImageX.panCNY,width: 200.w,fit: BoxFit.fill,),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 30.h,right: 3.w),
                      child: InkWell(
                        child: Image.asset(ImageX.drawBtnP(),width: 68.w,fit: BoxFit.fill,),
                        onTap: ()=> logic.start(1),
                      ),
                    ),
                  ),
                ],
              );
            }),
            SizedBox(height: 10.h,),
            Row(
              children: [
                buildFastPoints(Intr().lianyao5,5),
                buildFastPoints(Intr().lianyao10,10),
                buildFastPoints(Intr().lianyao15,15),
                buildFastPoints(Intr().lianyao20,20),
              ],
            ),
            Expanded(child: Container()),
            Container(
              height: 0.08.sh,
              color: Colors.black12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: ()=> logic.lotteryRole(),
                    child: Text(Intr().huodongguizhe,style: TextStyle(fontSize: 14.sp,color: ColorX.color_fc9824,),),
                  ),
                  InkWell(
                    onTap: ()=> Get.toNamed(Routes.bonus_packet),
                    child: Text(Intr().jiangjintiqu,style: TextStyle(fontSize: 14.sp,color: ColorX.color_fc9824,),),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFastPoints(String text,int index) {
    return Expanded(
      child: InkWell(
        onTap: ()=> logic.start(index),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(ImageX.btn_bg),fit: BoxFit.fill,),
          ),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 10.w,),
          margin: EdgeInsets.symmetric(horizontal: 2.w,),
          child: Text(text,style: TextStyle(fontSize: 12.sp,color: ColorX.color_fc243b,),),
        ),
      ),
    );
  }




}