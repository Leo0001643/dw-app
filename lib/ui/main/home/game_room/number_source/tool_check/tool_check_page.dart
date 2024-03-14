import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
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
                Text(Intr().shuruduiyinghaoyuan,
                  style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
                WidgetUtils().buildElevatedButton(Intr().jiaoyan, 50.w, 26.h,textSize: 12.sp,
                    bg:ColorX.color_fc243b,onPressed: ()=> logic.onValid(),),
              ],
            ),
            SizedBox(height: 10.h,),
            Obx(() {
              return WidgetUtils().buildTextField(333.w, 124.h, 14.sp, ColorX.text0917(), Intr().qingzaiciyanzhenghaxizhi, maxLines: 10,
                backgroundColor: ColorX.cardBg3(),defText: state.inputHash.value,onChanged: (v)=>state.inputHash.value = v,);
            }),
            SizedBox(height: 25.h,),
            Text(Intr().jiaoyanjieguo,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
            Obx(() {
              return buildCheckItem(Intr().sha256zhuanhuahzi,state.sha256.value);
            }),
            Obx(() {
              return buildCheckItem(Intr().quqianshiliuwei,state.before16.value);
            }),
            Obx(() {
              return buildCheckItem(Intr().shijinweizhuanhuan,state.convert10.value);
            }),
            Obx(() {
              return buildCheckItem(Intr().chuyierde64cifang,state.equation2_64.value);
            }),
            Obx(() {
              return buildCheckItem(Intr().zuizhongkaijianghaoma,state.lottery_num.value);
            }),
            SizedBox(height: 25.h,),
            Text(Intr().shuoming,style: TextStyle(fontSize: 16.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
            Text(Intr().shuoming_jieshao,
              style: TextStyle(fontSize: 16.sp,color: ColorX.text0917(),height: 1.8),),
            SizedBox(height: 15.h,),
            Text(Intr().haoyuanchaxun,style: TextStyle(fontSize: 16.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
            SizedBox(height: 10.h,),
            Row(
              children: [
                Text(Constants.html_btc,style: TextStyle(fontSize: 16.sp,color: ColorX.text0917(),),),
                SizedBox(width: 5.w,),
                InkWell(
                  onTap: ()=> WidgetUtils().clickCopy(Constants.html_btc),
                  child: Text(Intr().dianjifuzhi,style: TextStyle(fontSize: 14.sp,color: ColorX.text586(),
                    decoration: TextDecoration.underline,decorationColor: ColorX.textBlack(),),),
                ),
              ],
            ),
            SizedBox(height: 10.h,),
            Row(
              children: [
                Expanded(
                  child: Text(Constants.html_blockchain,style: TextStyle(fontSize: 16.sp,color: ColorX.text0917(),),),
                ),
                SizedBox(width: 5.w,),
                InkWell(
                  onTap: ()=> WidgetUtils().clickCopy(Constants.html_blockchain),
                  child: Text(Intr().dianjifuzhi,style: TextStyle(fontSize: 14.sp,color: ColorX.text586(),
                    decoration: TextDecoration.underline,decorationColor: ColorX.textBlack(),),),
                ),
              ],
            ),
            SizedBox(height: 25.h,),
            Text(Intr().jiaoyanshuoming,style: TextStyle(fontSize: 16.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
            SizedBox(height: 10.h,),
            Text(Intr().jiaoyanshuoming1,
              style: TextStyle(fontSize: 16.sp,color: ColorX.text0917(),height: 1.8),),
            SizedBox(height: 10.h,),
            Container(
              width: 335.w,
              child: Image.asset(ImageX.checkMa1),
            ),
            SizedBox(height: 10.h,),
            Text(Intr().jiaoyanshuoming2,
              style: TextStyle(fontSize: 16.sp,color: ColorX.text0917(),height: 1.8),),
            SizedBox(height: 10.h,),
            Container(
              width: 335.w,
              child: Image.asset(ImageX.checkMa2),
            ),
            SizedBox(height: 10.h,),
            Text(Intr().jiaoyanshuoming3,
              style: TextStyle(fontSize: 16.sp,color: ColorX.text0917(),height: 1.8),),
            SizedBox(height: 10.h,),
            Container(
              width: 335.w,
              child: Column(
                children: [
                  Image.asset(ImageX.iconCheckMaP()),
                  SizedBox(height: 10.h,),
                  Image.asset(ImageX.iconCheckMa2P()),
                  SizedBox(height: 10.h,),
                  Image.asset(ImageX.iconCheckMa3P()),
                ],
              ),
            ),
            SizedBox(height: 10.h,),
            Text(Intr().jiaoyanshuoming4,
              style: TextStyle(fontSize: 16.sp,color: ColorX.text0917(),height: 1.8),),
            SizedBox(height: 10.h,),
            Container(
              width: 335.w,
              child: Image.asset(ImageX.iconCheckMa4P()),
            ),
            SizedBox(height: 20.h,),
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
          child: Text(key,style: TextStyle(fontSize: 14.sp,color: ColorX.text586(),),),
        ),
        SizedBox(height: 5.h,),
        Container(
          width: 335.w,
          height: 46.h,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 10.w),
          decoration: BoxDecoration(color: ColorX.cardBg(),borderRadius: BorderRadius.circular(10.r),),
          child: Text(value,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),),),
        ),
      ],
    );
  }


}