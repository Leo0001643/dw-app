import 'package:aone_common/utils/date_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controllers/signin_everyday_controller.dart';

class SigninInstructions extends StatelessWidget {
  const SigninInstructions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logicVc = SigninEverydayController.to;
    return bulidSigninInstructionsWidget();
  }

  //可选择签到还是重签时
  bulidSigninInstructionsWidget() {
    final logicVc = SigninEverydayController.to;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 308.r,
            width: 351.r,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'assets/images/activity/sign/sign_center_instructions.png'),
                  fit: BoxFit.fill),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  height: 62.r,
                  child: Text(
                    '签到活动说明',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 12.r, right: 12.r),
                  height: 231.r,
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      gradient: const LinearGradient(
                          end: Alignment.bottomCenter,
                          begin: Alignment.topCenter,
                          colors: [
                            Color(0xFFF7EBC9),
                            Color(0xFFE0B478),
                          ])),
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      Text(
                        '1. 活动时间：${timeStampIntToSecond(logicVc.sininData!.hdInfo!.stime ?? 0)} 至 ${timeStampIntToSecond(logicVc.sininData!.hdInfo!.etime ?? 0)}\n2. 活动对象：达到指定条件即可参与，详情查阅优惠活动说明\n3. 签到方式：每日达成指定条件后即可签到领取彩金，连续签到达到指定天数时，还可以获得额外奖励。如需补签，请参照并查阅首页相关优惠活动说明或请洽客服。经发现通过不当途径参加本活动来获取利益之行为者，我司有权终止该客户参加此活动，并取消其获奖资格。',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 17.5.r,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 12.5.r, right: 12.5.r),
                        child: Text(
                          '* 本活动的最终解释权归本站所有',
                          style:
                              TextStyle(color: Colors.black, fontSize: 16.sp),
                        ),
                      ),
                      SizedBox(
                        height: 12.r,
                      ),
                    ],
                  )),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 44.r,
          ),
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Image.asset(
              'assets/images/activity/sign/sign_dialog_close.png',
              height: 32.r,
              width: 32.r,
            ),
          ),
        ],
      ),
    );
  }
}
