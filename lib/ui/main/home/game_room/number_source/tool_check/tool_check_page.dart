import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';

import 'tool_check_logic.dart';

class ToolCheckPage extends StatefulWidget {
  const ToolCheckPage({Key? key}) : super(key: key);

  @override
  State<ToolCheckPage> createState() => _ToolCheckPageState();
}

class _ToolCheckPageState extends State<ToolCheckPage> {
  final logic = Get.find<ToolCheckLogic>();
  final state = Get.find<ToolCheckLogic>().state;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("输入对应号源",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
                WidgetUtils().buildElevatedButton("校验", 50.w, 26.h,textSize: 12.sp,
                    bg:ColorX.color_fc243b,onPressed: (){}),
              ],
            ),
            SizedBox(height: 10.h,),
            WidgetUtils().buildTextField(333.w, 124.h, 14.sp, ColorX.color_091722, "",
            backgroundColor: ColorX.color_f7f8fb,),
            SizedBox(height: 25.h,),
            Text("校验结果",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
            buildCheckItem("SHA256转化值","sdsdfsdf"),
            buildCheckItem("取前16位数字","sdsdfsdf"),
            buildCheckItem("10进位转换","sdsdfsdf"),
            buildCheckItem("除以二的64次方","sdsdfsdf"),
            buildCheckItem("最终开奖号码","sdsdfsdf"),
            SizedBox(height: 25.h,),
            Text("说明",style: TextStyle(fontSize: 16.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
            Text("用户可通过相关在线SHA256函数查询网站,复述上述全部哈希值字符串,进行查询,下方提供查询网址:",
              style: TextStyle(fontSize: 16.sp,color: ColorX.color_091722,height: 1.8),),
            SizedBox(height: 15.h,),
            Text("号源查询",style: TextStyle(fontSize: 16.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
            SizedBox(height: 10.h,),
            Row(
              children: [
                Text("https://modao.cc",style: TextStyle(fontSize: 16.sp,color: ColorX.color_091722,),),
                SizedBox(width: 5.w,),
                InkWell(
                  onTap: ()=> WidgetUtils().clickCopy("https://modao.cc"),
                  child: Text("点击复制",style: TextStyle(fontSize: 14.sp,color: ColorX.color_58698d,decoration: TextDecoration.underline,),),
                ),
              ],
            ),
            SizedBox(height: 10.h,),
            Row(
              children: [
                Text("https://modao.cc",style: TextStyle(fontSize: 16.sp,color: ColorX.color_091722,),),
                SizedBox(width: 5.w,),
                InkWell(
                  onTap: ()=> WidgetUtils().clickCopy("https://modao.cc"),
                  child: Text("点击复制",style: TextStyle(fontSize: 14.sp,color: ColorX.color_58698d,decoration: TextDecoration.underline,),),
                ),
              ],
            ),
            SizedBox(height: 25.h,),
            Text("校验说明",style: TextStyle(fontSize: 16.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
            SizedBox(height: 10.h,),
            Text("1.开奖时,抓取最新时间段内交易的哈希值集合,将其平成长字符串",
              style: TextStyle(fontSize: 16.sp,color: ColorX.color_091722,height: 1.8),),
            SizedBox(height: 10.h,),
            Container(
              color: ColorX.color_091722,
              height: 100.h,
              width: 335.w,
            ),
            SizedBox(height: 10.h,),
            Text("2.将上述字符串进行SHA256转化",
              style: TextStyle(fontSize: 16.sp,color: ColorX.color_091722,height: 1.8),),
            SizedBox(height: 10.h,),
            Container(
              color: ColorX.color_091722,
              height: 100.h,
              width: 335.w,
            ),
            SizedBox(height: 10.h,),
            Text("3.通过数学公式进行转换,转换规则如下:",
              style: TextStyle(fontSize: 16.sp,color: ColorX.color_091722,height: 1.8),),
            SizedBox(height: 10.h,),
            Container(
              color: ColorX.color_091722,
              height: 100.h,
              width: 335.w,
            ),
            SizedBox(height: 10.h,),
            Text("4.根据转换结果,选取小数后3位作为开奖号码",
              style: TextStyle(fontSize: 16.sp,color: ColorX.color_091722,height: 1.8),),
            SizedBox(height: 10.h,),
            Container(
              color: ColorX.color_091722,
              height: 100.h,
              width: 335.w,
            ),
            SizedBox(height: 40.h,),
          ],
        ),
      ),
    );
  }

  Widget buildCheckItem(String key, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15.w,top: 10.h),
          child: Text(key,style: TextStyle(fontSize: 14.sp,color: ColorX.color_58698d,),),
        ),
        SizedBox(height: 5.h,),
        Container(
          width: 335.w,
          height: 46.h,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 10.w),
          decoration: BoxDecoration(color: ColorX.color_f7f8fb,borderRadius: BorderRadius.circular(10.r),),
          child: Text(value,style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722,),),
        ),
      ],
    );
  }


}