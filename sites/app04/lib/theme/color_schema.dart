/*
 * @Author: your name
 * @Date: 2022-04-09 22:22:10
 * @LastEditTime: 2022-04-09 22:25:18
 * @LastEditors: your name
 * @Description: 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 * @FilePath: /flutter_app/sites/app01/lib/theme/color_schema.dart
 */
import 'package:app04/theme/color_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/site_config.dart';

abstract class AppTheme {
  //1、主题色
  //范例
  static Color testPrimary = AppColorsConfig.appTheme.primary!;

  //站点标识
  static String siteTag = AppRuntimeConfig.siteTag;
  //logo宽度
  static double get logoWidth {
    switch (siteTag) {
      case 'h18':
        return 115;
    }
    //h09
    return 144;
  }

  //logo高度
  static double get logoHeight {
    switch (siteTag) {
      case 'h18':
        return 40;
    }
    //h09
    return 25;
  }

  // 主色
  static Color get primary {
    switch (siteTag) {
      case 'h18':
        return Color(0xFFa98a68);
    }
    //h09
    // return AppColorsConfig.appTheme.primary;
    return Color(0xFF02C285);
  }

  static const Color onPrimary = Colors.white;

  // 渐变主色
  static LinearGradient get primaryGradient {
    switch (siteTag) {
      case 'h18':
        return LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xff693409),
            Color(0xffA98A67),
          ],
        );
    }
    //h09
    return LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0xff13805E),
        Color(0xff06C285),
      ],
    );
  }

  // 渐变主色
  static LinearGradient get taskButtomGradient {
    switch (siteTag) {
      case 'h18':
        return LinearGradient(
            colors: [Color(0xFFCECECE), Color(0xFF818181)],
            begin: Alignment.topRight,
            end: Alignment.bottomRight);
    }
    //h09
    return LinearGradient(
        colors: [Color(0xFFCECECE), Color(0xFF818181)],
        begin: Alignment.topRight,
        end: Alignment.bottomRight);
  }

  // 渐变主色
  static LinearGradient get h18HeaderGradient {
    //h18
    return const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0xFF137F5E),
        Color(0xFF0A523B),
      ],
    );
  }

  // 渐变主色
  static const LinearGradient greyGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      neutral3,
      neutral,
    ],
  );

  // 渐变按钮
  static LinearGradient get btnGradient {
    switch (siteTag) {
      case 'h18':
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xffFFE149),
            Color(0xffE5BF00),
          ],
        );
    }

    //h09
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xffF0BE5C),
        Color(0xffF0BE5C),
      ],
    );
  }

  static const Color onPrimaryGradient = Colors.white;

  static const secondary = Color.fromRGBO(63, 154, 252, 0.1);
  // static const onSecondary = primary;
  //顶部title颜色
  static Color get topTitle {
    switch (siteTag) {
      case 'h18':
        return Color(0xFFFFFFFF);
    }
    //h09
    return Color(0xFFFFFFFF);
  }

  //活动页tab颜色-选中
  static Color get activityTabSelect {
    switch (siteTag) {
      case 'h18':
        return Color(0xFFE3A53A);
    }
    //h09
    return Colors.white;
  }

  //活动页tab颜色-未选中
  static Color get activityTabNormal {
    switch (siteTag) {
      case 'h18':
        return Color(0xFFFFFFFF);
    }
    //h09
    return Color(0xFFCCCCCC);
  }

  //优惠中心背景颜色
  static Color get activityCenterBackground {
    switch (siteTag) {
      case 'h18':
        return Color(0xFF1F0E00);
    }
    //h09
    return Color(0xFF012b1a);
  }

  //优惠中心背景颜色
  static Color get activityCenterText {
    switch (siteTag) {
      case 'h18':
        return Color(0xFFCBAC93);
    }
    //h09
    return Color(0xFF0BE3A2);
  }

  //优惠中心一键领取按钮渐变色背景-激活
  static LinearGradient get activityCenterBtnGet {
    switch (siteTag) {
      case 'h18':
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xffD1B391),
            Color(0xff9C7951),
          ],
        );
    }
    //h09
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xffbfbfbf),
        Color(0xff444444),
      ],
    );
  }

  //优惠中心活动按钮渐变色背景-激活
  static LinearGradient get activityCenterBtnActive {
    switch (siteTag) {
      case 'h18':
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xffD1B391),
            Color(0xff9C7951),
          ],
        );
    }
    //h09
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xffD1B391),
        Color(0xff9C7951),
      ],
    );
  }

  //优惠中心活动按钮颜色背景-未激活
  static LinearGradient get activityCenterBtnUnActive {
    switch (siteTag) {
      case 'h18':
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF858585),
            Color(0xFF858585),
          ],
        );
    }
    //h09
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        color484848,
        color484848,
      ],
    );
  }

  //优惠中心信封样式弹出框标题颜色
  static Color get activityInvalidPopupTitle {
    switch (siteTag) {
      case 'h18':
        return Color(0xFF723F22);
    }
    //h09
    return Color(0xFFFFFFFF);
  }

  static double get activityInvalidPopupTitleHeight {
    switch (siteTag) {
      case 'h18':
        return -87.h;
    }
    //h09
    return -47.h;
  }

  //优惠中心信封样式弹出框内容颜色
  static Color get activityInvalidPopupContent {
    switch (siteTag) {
      case 'h18':
        return Color(0xFFFCF8E3);
    }
    //h09
    return primary;
  }

  //任务中心文字颜色
  static Color get taskCenterText {
    switch (siteTag) {
      case 'h18':
        return Color(0xFFFCF8E3);
    }
    //h09
    return primary;
  }

  //任务中心弹出框条件按钮背景颜色
  static Color get taskCenterPopupBtnBg {
    switch (siteTag) {
      case 'h18':
        return Color(0xFFFCF8E3);
    }
    //h09
    return primary;
  }

  //任务中心弹出框条件按钮背景颜色
  static Color get taskCenterPopupBtnText {
    switch (siteTag) {
      case 'h18':
        return Color(0xFF723F22);
    }
    //h09
    return Color(0xFFFFFFFF);
  }

  // 底部导航栏
  static const Color bottomNavigationBarBg = Color.fromRGBO(66, 159, 241, 1);
  static const Color onBottomNavigationBar = Colors.white;

  // 背景
  static const Color backgroundColor = Colors.white;
  static const Color onBackground = Colors.black;
  static const Color buttonBg = Color(0xFFA98A67);

  // 中性色
  static const Color neutral = Color.fromRGBO(140, 140, 140, 1);
  static const Color neutral2 = Color.fromRGBO(140, 140, 140, 0.7);
  static const Color neutral3 = Color.fromRGBO(89, 89, 89, 1);
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
  static const Color hintColor = Color(0xFFEC4646);

  static const Color color484848 = Color(0xFF484848);
  // 隐藏文字
  static const Color color987652 = Color(0xFF987652);

  // 隐藏文字
  static const Color arrowColor = Color(0xFFB1B1B1);
  // 隐藏文字
  static const Color blueColor = Color(0xFF007AFF);

  //个人中心
  static const Color normalBgColor = Color(0xffFBFAF9);
  static const Color greenTextColor = Color(0xff02C285);
  static const Color goldTextColor = Color(0xffF0BE5C);
  static const Color btnRefreshColor = Color.fromRGBO(255, 219, 38, 1); //提现刷新
  static const Color hiltGoldTextColor = Color(0xff8a0505);

  static const Color dateSelectorBorderColor = Color(0xffbbbbbb);
  static const Color dateSelectorInputColor = Color(0xff474747);
  static const Color normalTextColor = Color(0xff666666);
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

  //充值页面
  static const Color underLineColor = Color(0xffdddddd);
  static const Color rechargeCardColor = Color(0xFFFFE249);
  static const Color cardBackColor = Color(0xFFF3F2F1);
  static const Color cardUnSelectColor = Color(0xFFE0E2E7);
  static const Color textRedColor = Color(0xFFEC2121);
  static const Color underLineColor2 = Color(0xFF757575);

  //游戏启动页
  static const Color shareTuiGuang = Color(0xFF723F22);

  //游戏启动页
  static const Color progressBarColor = Color.fromRGBO(255, 241, 0, 1);

  // 隐藏文字
  static const Color blackBtn = Color(0xFF3E3E3E);
  static TextStyle promocenterHeader = const TextStyle(
    fontSize: 12,
    color: Color(0xFFF0BE5C),
  );

  static const LinearGradient brownCommonGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xff693409),
      Color(0xffA98A67),
    ],
  );

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

  static const Color recordTitleBg = Color(0xFFF4F4F4);

}
