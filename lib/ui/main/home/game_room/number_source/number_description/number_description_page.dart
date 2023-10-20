import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';

import 'number_description_logic.dart';

class NumberDescriptionPage extends StatefulWidget {
  const NumberDescriptionPage({Key? key}) : super(key: key);

  @override
  State<NumberDescriptionPage> createState() => _NumberDescriptionPageState();
}

class _NumberDescriptionPageState extends State<NumberDescriptionPage> {
  final logic = Get.find<NumberDescriptionLogic>();
  final state = Get.find<NumberDescriptionLogic>().state;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: ColorX.color_f7f8fb,
            margin: EdgeInsets.only(top: 10.h),
            padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
            width: 1.sw,
            alignment: Alignment.center,
            child: Text("比特币PC28取号机制",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
          ),
          buildDescItem("抓号源,获取未确认交易(随机种子)","复式投注是指所选号码个数超过单式投注的号码个数，所选号码可组合为每一种单式投注方式的多注彩票的投注。胆拖投注指先选取少于单式投注号码个数的号码作为每注都有的胆码，再选取除胆码以外的号码作为拖码，胆码与拖码个数之和必须多于单式投注号码个数，由胆码与拖码的每一种组合按单式投注方式组成多注彩票的投注。"),
          buildDescItem("SHA256转化","通过步骤一获取的随机种了是由某一时间点所有交易信息的汇总，即是一个包含N个64位16进制数字的组合。《假设X是发生在某一时间点的交易总量)通过字符串合操作将这些数字合并后，我们可以得到一个长度为64位的16进制数字，计作Y.通过SHA256算法对Y进行转化，可以将其转化为新的64位哈希值Z，并用来进行下一步骤的数学运算。"),
          buildDescItem("10近制转化","在步骤二获取Z之后，取其前16位，我们通过10进制转化公式可以得到一个0 - 2^64范围的数字A，用于生成最终开奖号码。"),
          buildDescItem("生成最终开奖号码","通过步骤三得到A之后，将它除以2^64，取结果的小数点后前3位数，即为开奖号码。"),
          SizedBox(height: 10.h,),
        ],
      ),
    );
  }

  Widget buildDescItem(String title, String desc) {
    return Column(
      children: [
        SizedBox(height: 15.h,),
        Row(
          children: [
            Image.asset(ImageX.icon_tiitle_ext),
            SizedBox(width: 12.w,),
            Text(title,style: TextStyle(fontSize: 16.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15.w,vertical: 8.h),
          child: Text(desc,style: TextStyle(fontSize: 16.sp,color: ColorX.color_091722,height: 1.7),),
        ),
      ],
    );
  }


}




