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

import 'withdraw_logic.dart';

///
///提现中心
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
      backgroundColor: ColorX.pageBg2(),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(ImageX.rechargeBgT()),fit: BoxFit.fill),
            ),
            height: 226.h,
          ),
          Column(
            children: [
              WidgetUtils().buildAppBar(Intr().tixianzhongxin,bgColor: Colors.transparent),
              Container(
                height: 140.h,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GFAvatar(
                      backgroundImage: NetworkImage(Constants.test_image,),
                      radius: 20.r,
                    ),
                    SizedBox(height: 7.h,),
                    Text(Intr().tixianzhanghu_(["2946781"]),style: TextStyle(fontSize: 12.sp,color: ColorX.text0917()),),
                  ],
                ),
              ),
              buildCategoryItem(Intr().congcnyqianbaotichu, ImageX.icon_rmb_grey, 0),
              buildCategoryItem(Intr().congusdtqianbaotichu, ImageX.icon_tjyhicon_ustd_greyk, 0),

            ],
          ),
        ],
      )
    );
  }


  Widget buildCategoryItem(String title, String icon, int i) {
    return InkWell(
      onTap: ()=> Get.toNamed(i==0 ? Routes.withdraw_check:Routes.withdraw_apply),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: ColorX.cardBg(),
        ),
        margin: EdgeInsets.only(left: 20.w,right: 20.w,top: 10.h),
        padding: EdgeInsets.all(15.r),
        child: Row(
          children: [
            Image.asset(icon,width: 18.r,color: ColorX.icon586(),),
            SizedBox(width: 5.w,),
            Text(title,style: TextStyle(fontSize: 14.sp,color: ColorX.text586()),),
            Expanded(child: Container()),
            Image.asset(ImageX.icon_right_grey,color: ColorX.icon586(),),
          ],
        ),
      ),
    );
  }
}