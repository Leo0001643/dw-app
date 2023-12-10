import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'betting_detail_logic.dart';

//投注详情
class BettingDetailPage extends StatefulWidget {
  const BettingDetailPage({Key? key}) : super(key: key);

  @override
  State<BettingDetailPage> createState() => _BettingDetailPageState();
}

class _BettingDetailPageState extends State<BettingDetailPage> {
  final logic = Get.find<BettingDetailLogic>();
  final state = Get.find<BettingDetailLogic>().state;

  @override
  void initState() {
    state.title.value = Get.arguments;
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<BettingDetailLogic>();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildRxAppBar(state.title,msg: true,bgColor: ColorX.appBarBg()),
      backgroundColor: ColorX.pageBg(),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 20.h,),
            Container(
              color: ColorX.cardBg3(),
              padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
              child: Row(
                children: [
                  Expanded(
                    child: Text(Intr().youxipingtai,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1()),),
                    flex: 28,
                  ),
                  Expanded(
                    child: Center(
                      child: Text(Intr().bishu,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1()),),
                    ),
                    flex: 18,
                  ),
                  Expanded(
                    child: Center(
                       child: Text(Intr().touzhue,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1()),),
                    ),
                    flex: 18,
                  ),
                  Expanded(
                    child: Center(
                      child:  Text(Intr().shuying,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1()),),
                    ),
                    flex: 18,
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(Intr().youxiaotouzhu,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1()),),
                    ),
                    flex: 18,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: ListView.separated(
                    itemBuilder: (context,index){
                      return GFAccordion(
                        titleChild: buildRecordItem(index),
                        contentChild: buildExpandedContent(index),
                        expandedIcon: Image.asset(ImageX.icon_down_grey,color: ColorX.icon586(),),
                        collapsedIcon: Image.asset(ImageX.ic_into_right,color: ColorX.icon586(),),
                        expandedTitleBackgroundColor: ColorX.pageBg(),
                        collapsedTitleBackgroundColor: ColorX.pageBg(),
                        contentBackgroundColor: ColorX.cardBg(),
                        contentPadding: EdgeInsets.zero,
                        titleBorderRadius: BorderRadius.zero,
                        contentBorderRadius: BorderRadius.circular(12.r),
                        titlePadding: EdgeInsets.symmetric(vertical: 13.h),
                        margin: EdgeInsets.symmetric(horizontal: 15.w),
                      );
                    },
                    separatorBuilder: (context,index){
                      return Divider(height: 1.h,color: ColorX.color_10_949,indent: 10.w,endIndent: 10.w,);
                    },
                    itemCount: state.record.value.length
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRecordItem(int index) {
    var result = index%2 == 1;
    return Container(
      child: Column(
        children: [
          Container(
            // padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Row(
              children: [
                Expanded(
                  flex: 28,
                  child: Text("加拿大西28",style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1()),),
                ),
                Expanded(
                  flex: 18,
                  child: Center(
                    child: Text("1",style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1()),),
                  ),
                ),
                Expanded(
                  flex: 18,
                  child: Center(
                    child: Text("10",style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1()),),
                  ),
                ),
                Expanded(
                  flex: 18,
                  child: Center(
                    child: Text("-30",style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1()),),
                  ),
                ),
                Expanded(
                  flex: 18,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 5.w),
                      child: Text("10",style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1()),),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildExpandedContent(int index) {
    return Container(
      padding: EdgeInsets.all(15.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildDetailItem(index),
          SizedBox(height: 15.h,),
          Divider(height: 1.h,color: ColorX.color_10_949,indent: 10.w,endIndent: 10.w,),
          SizedBox(height: 15.h,),
          buildDetailItem(index),
          SizedBox(height: 15.h,),
          Divider(height: 1.h,color: ColorX.color_10_949,indent: 10.w,endIndent: 10.w,),
          SizedBox(height: 15.h,),
          buildDetailItem(index),
        ],
      ),
    );
  }

  Widget buildDetailItem(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              flex: 87,
              child: Text("2023-07-03 09:00:26",style: TextStyle(fontSize: 13.sp,color: ColorX.text586()),),
            ),
            Expanded(
              flex: 13,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text("-10000",style: TextStyle(fontSize: 13.sp,color: ColorX.color_fc243b),),
              ),
            ),
          ],
        ),
        SizedBox(height: 5.h,),
        Text(Intr().dixqi([" 1231312 "]),style: TextStyle(fontSize: 13.sp,color: ColorX.text0917()),),
        SizedBox(height: 5.h,),
        Text("加拿大西28/普通房@1.8881 1.888",style: TextStyle(fontSize: 13.sp,color: ColorX.text0917()),),
        SizedBox(height: 5.h,),
        Text(Intr().youxiaotouzhu_(["10","10"]),style: TextStyle(fontSize: 13.sp,color: ColorX.text586()),),
      ],
    );
  }



}