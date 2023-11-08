import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';

import 'points_record_logic.dart';
//积分记录
class PointsRecordPage extends StatefulWidget {
  const PointsRecordPage({Key? key}) : super(key: key);

  @override
  State<PointsRecordPage> createState() => _PointsRecordPageState();
}

class _PointsRecordPageState extends State<PointsRecordPage> {
  final logic = Get.find<PointsRecordLogic>();
  final state = Get.find<PointsRecordLogic>().state;


  @override
  void dispose() {
    Get.delete<PointsRecordLogic>();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildAppBar(Intr().jifenjilu,msg: true,bgColor: ColorX.appBarBg()),
      backgroundColor: ColorX.pageBg(),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Obx(() {
                return Row(
                  children: state.times.map((e){
                    return GestureDetector(
                      onTap: (){
                        state.currentTime.value = e;
                      },
                      child: buildTimeTab(e, state.currentTime.value == e ),
                    );
                  }).toList(),
                );
              }),
            ),
            SizedBox(height: 10.h,),
            Padding(
              padding: EdgeInsets.only(left: 15.w),
              child: Text(Intr().zhu_beijingshijian,style: TextStyle(fontSize: 12.sp,color: ColorX.text5862()),),
            ),
            SizedBox(height: 10.h,),
            Container(
              color: ColorX.cardBg3(),
              padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
              child: Row(
                children: [
                  Expanded(
                    flex: 25,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(Intr().riqi_meidong,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1()),),
                    ),
                  ),
                  Expanded(
                    flex: 25,
                    child: Center(
                      child: Text(Intr().jiaoyileibie,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1()),),
                    ),
                  ),
                  Expanded(
                    flex: 25,
                    child: Center(
                      child: Text(Intr().jiaoyiedu,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1()),),
                    ),
                  ),
                  Expanded(
                    flex: 25,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(Intr().xianyouedu,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1()),),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context,index){
                  if((index + 1) < state.record.value.length){
                    return buildRecordItem(index);
                  } else {
                    return Column(
                      children: [
                        buildRecordItem(index),
                        Divider(height: 1.h,color: ColorX.color_10_949,indent: 10.w,endIndent: 10.w,),
                        buildTotalFooter()
                      ],
                    );
                  }
                },
                separatorBuilder: (context,index){
                  return Divider(height: 1.h,color: ColorX.color_10_949,indent: 10.w,endIndent: 10.w,);
                },
                itemCount: state.record.value.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildTimeTab(String name, bool select) {
    return Container(
      decoration: BoxDecoration(
        color: select ? ColorX.cardBg():ColorX.cardBg3(),
        borderRadius: BorderRadius.circular(10.r),
        border: select ? Border.all(color: ColorX.color_fc243b,width: 1.r) : null,
      ),
      margin: EdgeInsets.only(left: 15.w),
      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 8.h),
      child: Text(name,style: TextStyle(fontSize: 14.sp,color: select ? ColorX.color_fc243b:ColorX.text0917()),),
    );
  }

  Widget buildRecordItem(int index) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
      child: Row(
        children: [
          Expanded(
            flex: 25,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("2023-06-08",style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1()),),
            ),
          ),
          Expanded(
            flex: 25,
            child: Center(
              child: Text("下注积分奖励",style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1()),),
            ),
          ),
          Expanded(
            flex: 25,
            child: Center(
              child: Text("0",style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1()),),
            ),
          ),
          Expanded(
            flex: 25,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text("0",style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1()),),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTotalFooter() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 13.h),
      child: Row(
        children: [
          Expanded(
            flex: 25,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(Intr().zongji,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),
                  fontWeight: FontWeight.w600),),
            ),
          ),
          Expanded(
            flex: 25,
            child: Center(
              child: Text("下注积分奖励",style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),
                  fontWeight: FontWeight.w600),),
            ),
          ),
          Expanded(
            flex: 25,
            child: Center(
              child: Text("1222.76",style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1(),
                  fontWeight: FontWeight.w600),),
            ),
          ),
          Expanded(
            flex: 25,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text("+659.0",style: TextStyle(fontSize: 14.sp,color: ColorX.color_fc243b,
              fontWeight: FontWeight.w600),),
            ),
          ),
        ],
      ),
    );
  }


}