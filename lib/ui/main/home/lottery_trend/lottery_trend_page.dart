import 'package:flutter/material.dart';
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
import 'package:leisure_games/ui/bean/history_hall_entity.dart';

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
  // late RefreshController _refreshController;

  @override
  void initState() {
    // _refreshController= RefreshController();
    super.initState();
  }

  @override
  void dispose() {
    // _refreshController.dispose();
    Get.delete<LotteryTrendLogic>();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      scaffoldKey: state.scaffoldKey,
      appBar: WidgetUtils().buildAppBar(Intr().zoushi,msg: true,scaffoldKey: state.scaffoldKey),
      backgroundColor: ColorX.pageBg2(),
      body: Obx(() {
        return ListView.builder(
          itemCount: state.trendList.em(),
          itemBuilder: (context,index){
            return buildLotteryItem(state.trendList[index],index);
          },
        );
      }),
    );
  }

  Widget buildLotteryItem(HistoryHall item,int index) {
    var nums = item.nums();
    return InkWell(
      onTap: ()=> Get.toNamed(Routes.history_lottery,arguments: item),
      child: Container(
        decoration: BoxDecoration(color: ColorX.cardBg(),borderRadius: BorderRadius.circular(10.r)),
        margin: EdgeInsets.only(top: 10.h,left: 15.w,right: 15.w,),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 15.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GFAvatar(
                    backgroundImage: WidgetUtils().buildImageProvider(item.imgUrl.em()),
                    radius: 21.r,
                  ),
                  SizedBox(width: 10.w,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.name.em(),style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),fontWeight: FontWeight.w500,),),
                        WidgetUtils().buildDixqi1(item.qihao()),
                        SizedBox(height: 10.h,),
                        Wrap(
                          spacing: 5.w,
                          runSpacing: 5.h,
                          children: nums.map((e) => WidgetUtils().buildBallDraw(item.lid.em(),nums,e)).toList(),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(ImageX.icon_right_black,width: 20.w,height: 20.w,color: ColorX.iconBlack(),),
                ],
              ),
            ),
            Divider(height: 1.h,color: ColorX.color_10_949,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 15.h),
              child: Row(
                children: [
                  InkWell(
                    onTap: ()=> Get.toNamed(Routes.history_lottery,arguments: item),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Image.asset(ImageX.icon_lisi_kj,color: ColorX.icon586(),),
                        SizedBox(width: 3.w,),
                        Text(Intr().lishikaijiang,style: TextStyle(fontSize: 12.sp,color: ColorX.text586()),),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w,),
                  InkWell(
                    onTap: ()=> logic.clickHistoryTrend(item),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Image.asset(ImageX.icon_lisi_jiang,color: ColorX.icon586(),),
                        SizedBox(width: 3.w,),
                        Text(Intr().kaijiangzhoushi,style: TextStyle(fontSize: 12.sp,color: ColorX.text586()),),
                      ],
                    ),
                  ),
                  Expanded(child: Container(),),
                  InkWell(
                    onTap: ()=> logic.clickGoucai(),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(Intr().qugoucai,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),),),
                        SizedBox(width: 3.w,),
                        Image.asset(ImageX.icon_right_black,color: ColorX.iconBlack(),),
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





}



