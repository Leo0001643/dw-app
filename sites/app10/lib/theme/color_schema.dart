/*
 * @Author: your name
 * @Date: 2022-04-09 22:22:10
 * @LastEditTime: 2022-04-09 22:25:18
 * @LastEditors: your name
 * @Description: 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 * @FilePath: /flutter_app/sites/app01/lib/theme/color_schema.dart
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color_config.dart';

abstract class AppTheme {
  // 主色
  static Color primary = AppColorsConfig.appTheme.primary!;
  static Color primaryOne = AppColorsConfig.appTheme.primaryOne!;
  static const Color onPrimary = Colors.white;

  static Color loadingColor = const Color(0xFFc89d42);
  static Color primaryCardBackground = const Color(0xFFFFD053);
  static Color primaryButtonBg = const Color(0xFFC89D42);
  static Color primaryBg = const Color(0xFF0C0C0C);

  //recharge
  static Color rechargeTextColor = AppColorsConfig.appTheme.rechargeTextColor!;
  static Color rechargeHighLightTextColor =
      AppColorsConfig.appTheme.rechargeHighLightTextColor!;
  static Color rechargeUnselectedColor =
      AppColorsConfig.appTheme.rechargeUnselectedColor!;
  static Color rechargeBtnColor = AppColorsConfig.appTheme.rechargeBtnColor!;
  static Color rechargeItemBg = Color(0xFF111111);
  static Color rechargeBorderColor = Color(0xFF222222);

  //user
  static Color userBgColor = AppColorsConfig.appTheme.userBgColor!;
  static Color userMainTextColor = AppColorsConfig.appTheme.userMainTextColor!;
  static Color userSubTextColor = AppColorsConfig.appTheme.userSubTextColor!;
  static Color userSubTextColor1 = AppColorsConfig.appTheme.userSubTextColor1!;
  static Color userItemBgColor = AppColorsConfig.appTheme.userItemBgColor!;
  static Color userDividerColor = AppColorsConfig.appTheme.userDividerColor!;
  static Color userButtonBg = AppColorsConfig.appTheme.userButtonBg!;

  //activity
  static const Color activityMenuSelectedBg = Color(0xFFffc957);
  static const Color activityMenuUnselectedBg = Colors.grey;
  static const Color activityHighlightTextColor = Color(0xFFC19E52);
  static const Color activityMainTextColor = Colors.white;

  static const Color mainTextColor = Colors.white;
  static const Color subTextColor = Color(0xFF65320C);
  static const Color subTextColor1 = Color(0xFF4b3b1c);
  static const Color itemBgColor = Color(0xFF111111);
  //游戏启动页
  static const Color progressBarColor = Color.fromRGBO(255, 241, 0, 1);
  //优惠中心
  static const LinearGradient promoBtnOnGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xFFF8DDBD), Color(0XffA67E54)]);

  static const LinearGradient promoBtnOffGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xFFE0E0E0), Color(0xffa8a8a8a)]);

  static const BoxShadow promoBtnOnBoxShadow =
      BoxShadow(color: Color(0xFFF8DDBD), blurRadius: 0, offset: Offset(0, 1));

  static const BoxShadow promoBtnOffBoxShadow =
      BoxShadow(color: Color(0xFFE0E0E0), blurRadius: 0, offset: Offset(0, 1));

  // 渐变主色
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xff202020),
      Color(0xff494949),
    ],
  );
  // 渐变主色垂直
  static const LinearGradient primaryGradientProti = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomLeft,
    colors: [
      Color(0xff202020),
      Color(0xff494949),
    ],
  );
  // 渐变主色
  static const LinearGradient greyGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      neutral3,
      neutral,
    ],
  );

  static const LinearGradient gradient1 = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFE8B36E),
      Color(0xFFF9EAC4),
    ],
  );

  //btn  bg
  static const LinearGradient primaryGradientBtnBg = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xffE8B36E),
      Color(0xffF9EAC4),
    ],
  );
  static const LinearGradient primaryGradientBtnUnBg = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF949494),
      Color(0xFF545454),
    ],
  );
  static const LinearGradient primaryBtnBg1 = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFC38A30),
      Color(0xFFA66E15),
    ],
  );
  static const LinearGradient primaryBtnBg2 = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFF9E1B2),
      Color(0xFFE9A16C),
    ],
  );

  //进度条渐变色
  static const LinearGradient progressGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromRGBO(251, 226, 72, 1),
      Color.fromRGBO(214, 174, 51, 0),
    ],
  );

  //btn  warp
  static const LinearGradient primaryBtnWarp = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xffBE7F2D),
      Color(0xffD99B4A),
      Color(0xffFFE4C3),
      Color(0xffD49440),
      Color(0xffCD8A33),
    ],
  );

  // 渐变Btn背景
  static const BoxDecoration btnBoxDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xffE8B36E),
        Color(0xffF9EAC4),
      ],
    ),
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  );

  static const Color onPrimaryGradient = Colors.white;

  static const secondary = Color.fromRGBO(63, 154, 252, 0.1);
  static Color onSecondary = primary;

  // 底部导航栏
  static const Color bottomNavigationBarBg = Color.fromRGBO(66, 159, 241, 1);
  static const Color onBottomNavigationBar = Colors.white;

  // 背景
  static const Color backgroundColor = Colors.white;
  static const Color onBackground = Colors.black;
  static const Color onBodyBg = Color(0xFFF3F4F5);

  // 中性色
  static const Color neutral = Color.fromRGBO(140, 140, 140, 1);
  static const Color neutral2 = Color.fromRGBO(140, 140, 140, 0.7);
  static const Color neutral3 = Color.fromRGBO(89, 89, 89, 1);
  static const Color neutral4 = Color(0xff666666);

  // 未激活
  static const Color inActive = Color.fromRGBO(10, 32, 60, 0.3);

  // 禁用
  static const Color disabled = Color.fromRGBO(181, 181, 181, 1);

  // cell分割线
  static const Color cellDivider = Color.fromRGBO(11, 33, 59, 0.1);

  // 阴影
  static const Color shadowColor = Color.fromRGBO(0, 0, 0, 0);

  // 阴影
  static const Color themeBackgroundColor = Color.fromRGBO(248, 241, 241, 0.5);

  // 禁用
  static const Color shareYellow = Color(0xFFFD732A);

  static const Color undeer_line_color = Color(0xFFEBEBEB);

  static const Color undeer_line_color1 = Color(0xFF8D8D8D);

  // 隐藏文字
  static const Color hintColor = Color(0xFFCCCCCC);

  // 隐藏文字
  static const Color arrowColor = Color(0xFFB1B1B1);

  // 隐藏文字
  static const Color blueColor = Color(0xFF007AFF);

  //个人中心
  static const Color normalBgColor = Color(0xffFBFAF9);
  static const Color greenTextColor = Color(0xff02C285);
  static const Color goldTextColor = Color(0xffF0BE5C);
  static const Color hiltGoldTextColor = Color(0xff8a0505);

  static const Color dateSelectorBorderColor = Color(0xffbbbbbb);
  static const Color dateSelectorInputColor = Color(0xff474747);
  static const Color normalTextColor = Color(0xff494949);
  static const Color blackColor = Color(0xff080808);
  static const Color blackTextColor = Color(0xff000000);
  static const Color success = Color.fromRGBO(2, 189, 136, 1);
  static const Color cardBg = Color.fromRGBO(242, 245, 248, 1);
  static const Color danger = Color.fromRGBO(255, 0, 0, 1);
  static const Color warning = Color.fromRGBO(255, 208, 92, 1);
  static const Color filterBorderColor = Color(0xffEBEBEB);
  static const Color filterTextColor = Color(0xffCCCCCC);
  static const Color filterBgColor = Color(0xffffffff);
  static const Color filterBoxBgColor = Color(0xffffffff);
  static const Color filterBoxBorderColor = Color(0xffEBEBEB);
  static const double filterBorderRadius = 5;

  //home页面

  static const Color homeItemBg = Color(0xFF151515);
  static const Color homeBg = Color(0xFF000000);

  static const Color homeDraw = Color(0xFFD6D6D6);
  static const Color underYellow1 = Color(0xFFEBE28D);
  static const Color underBackgroud = Color(0xFF1E1E1E);
  static const Color underNotice = Color(0xFF949494);
  static const Color underToolbar = Color(0xFF20211E);
  static const Color underText = Color(0xFFC2C2C2);

  //充值页面
  static const Color underLineColor = Color(0xffdddddd);
  static const Color rechargeCardColor = Color(0xFFF0BE5C);
  static const Color cardBackColor = Color(0xFFF3F2F1);
  static const Color cardUnSelectColor = Color(0xFFE0E2E7);
  static const Color tipsCardBg = Color(0xFFFDF8E4);
  static const Color textRedColor = Color(0xFFEC2121);
  static const Color underLineColor2 = Color(0xFF757575);
  static const Color buttonBg = Color(0xFFFBE248);
  static const Color buttonText = Color(0xFF000000);
  static const Color buttonText2 = Color(0xFFFFFFFF);
  static const Color borderColor = Color(0xFFEAEAEA);
  static const Color tabUnSelectedText = Color(0xFFC2C2C2);
  static const Color tabSelectedText = Color(0xFFD6AE33);
  static const Color progressBgColor = Color(0xFFD9D9D9);

  //game
  static const Color gameHighlightColor = Color(0xFFc89d42);
  static const Color gameTextColor = Colors.white;
  static const Color gameCardColor = Color(0xFF171717);
  static const Color gameBg = Color(0xFF131313);

  //activity
  static const Color activityItemBg = Color(0xFF131313);
  static const Color activityBorderColor = Color(0xFF2B2B2B);

  static const Color gameBar = Color(0xFF202020);
  static const Color gameEndBar = Color(0xFF494949);
  static const Color border = Color(0xFF444444);
  static const Color colorD6AE33 = Color(0xFFD6AE33);

  // 隐藏文字
  static const Color blackBtn = Color(0xFF3E3E3E);
  static TextStyle promocenterHeader = const TextStyle(
    fontSize: 12,
    color: Color(0xFFF0BE5C),
  );

  //推广返利
  static Color promotionHeaderBgColor =
      AppColorsConfig.appTheme.promotionHeaderBgColor!;

  static TextStyle header = TextStyle(
    fontSize: 16.sp,
    color: AppTheme.onPrimary,
    fontWeight: FontWeight.bold,
    letterSpacing: 1,
  );
  static TextStyle header14And66666 = TextStyle(
    fontSize: 14.sp,
    color: AppTheme.normalTextColor,
  );
  static TextStyle header2 = TextStyle(
    fontSize: 13.sp,
    color: const Color.fromRGBO(11, 33, 59, 1),
    fontWeight: FontWeight.bold,
  );

  static TextStyle header3 = TextStyle(
    fontSize: 11.sp,
    color: const Color.fromRGBO(11, 33, 59, 0.7),
    fontWeight: FontWeight.bold,
  );

  static TextStyle p3 = TextStyle(
    fontSize: 11.sp,
    color: const Color.fromRGBO(11, 33, 59, 0.7),
    fontWeight: FontWeight.bold,
  );

  static TextStyle header4 = TextStyle(
    fontSize: 12.sp,
    color: const Color.fromRGBO(11, 33, 59, 1),
    fontWeight: FontWeight.bold,
  );

  static TextStyle regularStyle = TextStyle(
    fontSize: 14.sp,
    color: const Color(0xff666666),
    fontWeight: FontWeight.bold,
  );
  static TextStyle regularStyleWithNotBold = TextStyle(
    fontSize: 14.sp,
    color: const Color(0xff666666),
  );

  static TextStyle hintTextStyle = TextStyle(
    fontSize: 12.sp,
    color: AppTheme.hintColor,
  );
}
