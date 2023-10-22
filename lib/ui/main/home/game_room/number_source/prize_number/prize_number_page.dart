import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';

import 'prize_number_logic.dart';

class PrizeNumberPage extends StatefulWidget {
  const PrizeNumberPage({Key? key}) : super(key: key);

  @override
  State<PrizeNumberPage> createState() => _PrizeNumberPageState();
}

class _PrizeNumberPageState extends State<PrizeNumberPage> {
  final logic = Get.find<PrizeNumberLogic>();
  final state = Get.find<PrizeNumberLogic>().state;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 8.h,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("第1231124123期",style: TextStyle(fontSize: 14.sp,color: ColorX.color_58698d,fontWeight: FontWeight.w600,),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("倒计时",style: TextStyle(fontSize: 14.sp,color: ColorX.color_58698d,fontWeight: FontWeight.w600,),),
                    SizedBox(width: 5.w,),
                    buildDrawTime("00"),
                    Text(" : ",style: TextStyle(fontSize: 18.sp,color: ColorX.color_58698d,fontWeight: FontWeight.w600),),
                    buildDrawTime("02"),
                    Text(" : ",style: TextStyle(fontSize: 18.sp,color: ColorX.color_58698d,fontWeight: FontWeight.w600),),
                    buildDrawTime("53"),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.w,right: 15.w,),
            child: Row(
              children: [
                buildDrawNum("2",ColorX.color_fc243b),
                SizedBox(width: 5.w,),
                buildDrawNum("7",ColorX.color_fc243b),
                SizedBox(width: 5.w,),
                buildDrawNum("9",ColorX.color_5583e7),
                SizedBox(width: 5.w,),
                buildDrawNum("9",ColorX.color_5583e7),
              ],
            ),
          ),
          Container(
            color: ColorX.color_f7f8fb,
            margin: EdgeInsets.only(top: 10.h),
            padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
            child: Row(
              children: [
                Expanded(
                  flex: 30,
                  child: Text("期号",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
                ),
                Expanded(
                  flex: 25,
                  child: Center(
                    child: Text("开奖号码",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
                  ),
                ),
                Expanded(
                  flex: 45,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text("号源(近50期)",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context,index){
                return buildNumberItem(index);
              },
            ),
          ),
        ],
      ),
    );
  }


  Widget buildDrawTime(String time) {
    return Container(
      width:26.r,height: 26.r,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ColorX.color_f7f8fb,
        border: Border.all(color: Colors.white,width: 1.r),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Text(time,style: TextStyle(fontSize: 16.sp,color: ColorX.color_fc243b,fontWeight: FontWeight.w600),),
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

  Widget buildNumberItem(int index) {
    var result = index%2 == 1;
    return InkWell(
      onTap: (){
        DialogUtils().showUnbrokenNumberBtmDialog(context);
      },
      child: Container(
        color: result ? ColorX.color_f7f8fb:Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
        child: Row(
          children: [
            Expanded(
              flex: 30,
              child: Text("202306161188",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
            ),
            Expanded(
              flex: 25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("0 0 4",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722, fontWeight: FontWeight.w600,),),
                  SizedBox(width: 5.w,),
                  buildDrawNum("9", ColorX.color_529aff),
                ],
              ),
            ),
            Expanded(
              flex: 45,
              child: Row(
                children: [
                  Expanded(
                    child: Text("6cce4fc7e14b54ce50999d89a8e841730b69276cce4fc7e14b54ce50999d89a8e841730b6927",
                      style: TextStyle(fontSize: 14.sp,color: ColorX.color_5583e7,fontWeight: FontWeight.w600,),
                      maxLines: 2,overflow: TextOverflow.ellipsis,),
                  ),
                  Image.asset(ImageX.ic_into_right),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}