import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'lottery_trend_logic.dart';

///走势
class LotteryTrendPage extends StatefulWidget {
  const LotteryTrendPage({Key? key}) : super(key: key);

  @override
  State<LotteryTrendPage> createState() => _LotteryTrendPageState();
}

class _LotteryTrendPageState extends State<LotteryTrendPage> {
  final logic = Get.find<LotteryTrendLogic>();
  final state = Get.find<LotteryTrendLogic>().state;
  late RefreshController _refreshController;

  @override
  void initState() {
    _refreshController= RefreshController();
    super.initState();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    Get.delete<LotteryTrendLogic>();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildAppBar(Intr().zoushi,msg: true),
      backgroundColor: ColorX.color_f7f8fb,
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        enablePullUp: true,
        onRefresh: ()=> _refreshController.refreshCompleted(),
        onLoading: ()=> _refreshController.loadComplete(),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context,index){
            return buildLotteryItem(index);
          },
        ),
      ),
    );
  }

  Widget buildLotteryItem(int index) {
    return InkWell(
      onTap: ()=> Get.toNamed(Routes.history_lottery),
      child: Container(
        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10.r)),
        margin: EdgeInsets.only(top: 10.h,left: 15.w,right: 15.w,),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 15.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GFAvatar(
                    backgroundImage: NetworkImage(Constants.test_image),
                    radius: 21.r,
                  ),
                  SizedBox(width: 10.w,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("台湾宾果PC28",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722,fontWeight: FontWeight.w500,),),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          runAlignment: WrapAlignment.center,
                          alignment: WrapAlignment.center,
                          spacing: 3.w,
                          children: [
                            Text(Intr().di,style: TextStyle(fontSize: 13.sp,color: ColorX.color_58698d,),),
                            Text("112030767",style: TextStyle(fontSize: 13.sp,color: ColorX.color_091722,),),
                            Text(Intr().qi,style: TextStyle(fontSize: 13.sp,color: ColorX.color_58698d,),),
                          ],
                        ),
                        SizedBox(height: 10.h,),
                        Wrap(
                          spacing: 5.w,
                          children: [
                            buildDrawNum("2", ColorX.color_fc243b),
                            buildDrawNum("5", ColorX.color_fc243b),
                            buildDrawNum("8", ColorX.color_fc243b),
                            buildDrawNum("3", ColorX.color_fc243b),
                            buildDrawNum("0", ColorX.color_fc243b),
                            buildDrawNum("7", ColorX.color_fc243b),
                            buildDrawNum("6", ColorX.color_529aff),
                            buildDrawNum("4", ColorX.color_529aff),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Image.asset(ImageX.icon_right_black,width: 20.w,height: 20.w,),
                ],
              ),
            ),
            Divider(height: 1.h,color: ColorX.color_10_949,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 15.h),
              child: Row(
                children: [
                  InkWell(
                    onTap: ()=> Get.toNamed(Routes.history_lottery),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Image.asset(ImageX.icon_lisi_kj),
                        SizedBox(width: 3.w,),
                        Text(Intr().lishikaijiang,style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d),),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w,),
                  InkWell(
                    onTap: ()=> Get.toNamed(Routes.history_trend),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Image.asset(ImageX.icon_lisi_jiang),
                        SizedBox(width: 3.w,),
                        Text(Intr().kaijiangzhoushi,style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d),),
                      ],
                    ),
                  ),
                  Expanded(child: Container(),),
                  InkWell(
                    onTap: ()=> Get.toNamed(Routes.room_list),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(Intr().qugoucai,style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722,),),
                        SizedBox(width: 3.w,),
                        Image.asset(ImageX.icon_right_black),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget buildDrawNum(String num,Color bg) {
    return Container(
      width: 24.r,height: 24.r,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: bg,borderRadius: BorderRadius.circular(15.r),),
      child: Text(num, style: TextStyle(fontSize: 14.sp,color: Colors.white,fontWeight: FontWeight.w600),),
    );
  }


}



