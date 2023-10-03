import 'package:aone_common/services/user/user_service.dart';
import 'package:aone_common/utils/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/theme_scaffold.dart';
import '../controllers/card_manager_logic.dart';

class BankcardDetailsViewNew extends GetView<CardManagerChildLogic> {
  const BankcardDetailsViewNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CardManagerChildLogic>(builder: (_) {
      return ThemeScaffold(
        title: '银行卡详情',
        body: Column(
          children: <Widget>[
            _buildBankcardView(),
            _buildFootView(),
          ],
        ),
      );
    });
  }

  _buildBankcardView() {
    var state = CardManagerChildLogic.to.state;
    var bankInfos = state.banks[state.selIndex];

    return Container(
        margin: EdgeInsets.only(top: 15.r, left: 8.r, right: 8.r),
        padding:
            EdgeInsets.only(top: 15.r, left: 14.r, bottom: 15.r, right: 12.r),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'assets/images/user/card_manager_bankcardground.png'),
                fit: BoxFit.fill)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  bankInfos.bankname,
                  style: TextStyle(
                      color: stringToColor('0b213b'),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold),
                ),
                // const Spacer()
                Text(
                  bankInfos.bankcard,
                  style: TextStyle(
                      color: stringToColor('0b213b'),
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Text(
              bankInfos.type == 1 ? '银行卡' : '数字钱包',
              style: TextStyle(
                  color: stringToColor('0b213b'),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40.r,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FractionallySizedBox(
                  // alignment: Alignment.center,
                  widthFactor: 1,
                  child: Container(
                    height: 22.r,
                    alignment: Alignment.centerRight,
                    child: Text(
                      UserService.to.state.trueName,
                      style: TextStyle(
                          color: stringToColor('0b213b'),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.r,
                ),
                Text(
                  bankInfos.bankkaihu,
                  style: TextStyle(
                      color: stringToColor('0b213b'),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ));
  }

  _buildFootView() {
    return Container(
      margin: EdgeInsets.only(top: 70.r),
      child: Text.rich(TextSpan(children: [
        TextSpan(
            text: '如需修改请 ',
            style: TextStyle(color: stringToColor('8c8c8c'), fontSize: 14.sp)),
        TextSpan(
            text: 'login.onlineservice'.tr,
            style: TextStyle(color: Colors.blue, fontSize: 14.sp),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                debugPrint('点击了在线客服');
              }),
      ])),
    );
  }
}
