import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';

import 'withdraw_logic.dart';

///
///提现中心
///author: Soushin
///2023/10/15 12:49
///
class WithdrawPage extends StatefulWidget {
  const WithdrawPage({Key? key}) : super(key: key);

  @override
  State<WithdrawPage> createState() => _WithdrawPageState();
}

class _WithdrawPageState extends State<WithdrawPage> {
  final logic = Get.find<WithdrawLogic>();
  final state = Get.find<WithdrawLogic>().state;

  @override
  void dispose() {
    Get.delete<WithdrawLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildAppBar("提现中心"),
      backgroundColor: ColorX.color_f7f8fb,
      body: Column(
        children: [
          Container(
            height: 140.h,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GFAvatar(
                  backgroundImage: NetworkImage(Constants.test_image,),
                  size: 40.r,
                ),
                SizedBox(height: 7.h,),
                Text("提现帐户: 2946781",style: TextStyle(fontSize: 12.sp,color: ColorX.color_091722),),
              ],
            ),
          ),
          buildCategoryItem("从CNY钱包提出", ImageX.icon_rmb_grey, 0),
          buildCategoryItem("从USDT钱包提出", ImageX.icon_tjyhicon_ustd_greyk, 0),

        ],
      ),
    );
  }


  Widget buildCategoryItem(String title, String icon, int i) {
    return InkWell(
      onTap: ()=> Get.toNamed(i==0 ? Routes.withdraw_check:Routes.withdraw_apply),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.white,
        ),
        margin: EdgeInsets.only(left: 20.w,right: 20.w,top: 10.h),
        padding: EdgeInsets.all(15.r),
        child: Row(
          children: [
            Image.asset(icon,width: 18.r,),
            SizedBox(width: 5.w,),
            Text(title,style: TextStyle(fontSize: 14.sp,color: ColorX.color_58698d),),
            Expanded(child: Container()),
            Image.asset(ImageX.icon_right_grey),
          ],
        ),
      ),
    );
  }
}