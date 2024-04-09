import 'dart:core';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/socket/ws_bet_entity.dart';
import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/odds_content.dart';



class GameRuleUtil {

  static final String Key_Min ="Key_Min";// 最小限额
  static final String Key_Max = "Key_Max";// 最大限额
   static final String Key_Type ="Key_Type";// 投注类型
   static final String Key_Name = "Key_Name";// 投注类型名称
   static final String Key_Num = "Key_Num";// 单点数字
   static final String Key_Odds = "Key_Odds";// 常规赔率
   static final String Key_Odds_1314 ="Key_Odds_1314";// 特殊赔率




  /**
   * "大"
   */
  static const String GameType_Big = "big";

  /**
   * "14大"
   */
  static const String GameType_Big_14 = "14_big";

  /**
   * "小"
   */
  static const String GameType_Small = "small";

  /**
   * "13小"
   */
  static const String GameType_Small_13 = "13_small";

  /**
   * "单"
   */
  static const String GameType_Odd = "odd";

  /**
   * "13单"
   */
  static const String GameType_Odd_13 = "13_odd";

  /**
   * "双"
   */
  static const String GameType_Even = "even";


  /**
   * "14双"
   */
  static const String GameType_Even_14 = "14_even";

  /**
   * "大单"
   */
  static const String GameType_BigOdd = "big_odd";

  /**
   * "小单"
   */
  static const String GameType_SmallOdd = "small_odd";

  /**
   * "13小单"
   */
  static const String GameType_SmallOdd_13 = "13_small_odd";

  /**
   * "大双"
   */
  static const String GameType_BigEven = "big_even";

  /**
   * "14大双"
   */
  static const String GameType_BigEven_14 = "14_big_even";

  /**
   * "小双"
   */
  static const String GameType_SmallEven = "small_even";

  /**
   * "极大"
   */
  static const String GameType_Max = "max";

  /**
   * "极小"
   */
  static const String GameType_Min = "min";

  /**
   * "红波"
   */
  static const String GameType_Red = "red";

  /**
   * "蓝波"
   */
  static const String GameType_Blue = "blue";

  /**
   * "绿波"
   */
  static const String GameType_Green = "green";

  /**
   * "对子"
   */
  static const String GameType_Pair = "pair";

  /**
   * "顺子"
   */
  static const String GameType_Straight = "straight";

  /**
   * "豹子"
   */
  static const String GameType_Leopard = "leopard";

  /**
   * "特码"
   */
  static const String GameType_Cao = "cao";

  /**
   * 第一球
   */
  static const String GameType_First = "first_cao";
  static const String GameType_First_String = "first";

  /**
   * 第二球
   */
  static const String GameType_Second = "second_cao";
  static const String GameType_Second_String = "second";

  /**
   * 第三球
   */
  static const String GameType_Three = "third_cao";
  static const String GameType_Three_String = "third";

  /**
   * 和
   */
  static const String GameType_equal = "equal";

  /**
   * 龙
   */
  static const String GameType_dragon = "dragon";

  /**
   * 虎
   */
  static const String GameType_tiger = "tiger";

  /**
   * 草：下注时的参数msg拼接使用
   */
  static const String GameType_Cao_Bet = "草";
  static const String GameType_Frist_Cao_Bet = "第一球草";
  static const String GameType_Second_Cao_Bet = "第二球草";
  static const String GameType_Thire_Cao_Bet = "第三球草";
  static const String GameType_Frist_Bet = "第一球";
  static const String GameType_Second_Bet = "第二球";
  static const String GameType_Thire_Bet = "第三球";

  static const int GameType_Cao_00 = 0;
  static const int GameType_Cao_01 = 1;
  static const int GameType_Cao_02 = 2;
  static const int GameType_Cao_03 = 3;
  static const int GameType_Cao_04 = 4;
  static const int GameType_Cao_05 = 5;
  static const int GameType_Cao_06 = 6;
  static const int GameType_Cao_07 = 7;
  static const int GameType_Cao_08 = 8;
  static const int GameType_Cao_09 = 9;
  static const int GameType_Cao_10 = 10;
  static const int GameType_Cao_11 = 11;
  static const int GameType_Cao_12 = 12;
  static const int GameType_Cao_13 = 13;
  static const int GameType_Cao_14 = 14;
  static const int GameType_Cao_15 = 15;
  static const int GameType_Cao_16 = 16;
  static const int GameType_Cao_17 = 17;
  static const int GameType_Cao_18 = 18;
  static const int GameType_Cao_19 = 19;
  static const int GameType_Cao_20 = 20;
  static const int GameType_Cao_21 = 21;
  static const int GameType_Cao_22 = 22;
  static const int GameType_Cao_23 = 23;
  static const int GameType_Cao_24 = 24;
  static const int GameType_Cao_25 = 25;
  static const int GameType_Cao_26 = 26;
  static const int GameType_Cao_27 = 27;

  static var ballColorRed = Color(0xffe6250a);
  static var ballColorBlue = Color(0xff2585fd);
  static var ballColorGreen = Color(0xff4ca953);

  static var colorMap={
    0:Color(0xFF06A100),
    1:Color(0xFFFC243B),
    2:Color(0xFFFC243B),
    3:Color(0xFF5583E7),
    4:Color(0xFF5583E7),
    5:Color(0xFF06A100),

  };
  /**
   * sum为-1时，表示问号，显示红色
   *
   * @param sum
   * @return
   */
  static int getBallColor(var sum) {
    // List<int> redBall = new List<int> { 1, 2, 7, 8, 12, 13, 18, 19, 23, 24 };
    // List<int> blueBall = new List<int> { 3, 4, 9, 10, 14, 15, 20, 25, 26 };
    // List<int> greenBall = new List<int> { 0, 5, 6, 11, 16, 17, 21, 22, 27 };
    switch (sum) {
      case 1:
      case 2:
      case 7:
      case 8:
      case 12:
      case 13:
      case 18:
      case 19:
      case 23:
      case 24: //红波
      case 29: //红波
      case 30: //红波
      case 34: //红波
      case 35: //红波
      case 40: //红波
      case 45: //红波
      case 46: //红波
        return 0xFFFE2527;

      case 3:
      case 4:
      case 9:
      case 10:
      case 14:
      case 15:
      case 20:
      case 25:
      case 26: //蓝波
      case 31: //蓝波
      case 36: //蓝波
      case 37: //蓝波
      case 41: //蓝波
      case 42: //蓝波
      case 47: //蓝波
      case 48: //蓝波
        return 0xFF4383F5;
      case 0:
      case 5:
      case 6:
      case 11:
      case 16:
      case 17:
      case 21:
      case 22:
      case 27:
      case 28: //绿波
      case 32: //绿波
      case 33: //绿波
      case 38: //绿波
      case 39: //绿波
      case 43: //绿波
      case 44: //绿波
      case 49: //绿波
        return 0xFF4DA953;
      default:
        return 0xFF4DA953;
    }
  }

  /**
   * sum为-1时，表示问号，显示红色
   *
   * @param sum
   * @return
   */
  static Color getBallNewColor(int sum) {
    // List<int> redBall = new List<int> { 1, 2, 7, 8, 12, 13, 18, 19, 23, 24 };
    // List<int> blueBall = new List<int> { 3, 4, 9, 10, 14, 15, 20, 25, 26 };
    // List<int> greenBall = new List<int> { 0, 5, 6, 11, 16, 17, 21, 22, 27 };
    switch (sum) {
      case 1:
      case 2:
      case 7:
      case 8:
      case 12:
      case 13:
      case 18:
      case 19:
      case 23:
      case 24: //红波
      case 29: //红波
      case 30: //红波
      case 34: //红波
      case 35: //红波
      case 40: //红波
      case 45: //红波
      case 46: //红波

        return Colors.red;

      case 3:
      case 4:
      case 9:
      case 10:
      case 14:
      case 15:
      case 20:
      case 25:
      case 26: //蓝波
      case 31: //蓝波
      case 36: //蓝波
      case 37: //蓝波
      case 41: //蓝波
      case 42: //蓝波
      case 47: //蓝波
      case 48: //蓝波

        return Color(0xFFC3866c5);
      case 0:
      case 5:
      case 6:
      case 11:
      case 16:
      case 17:
      case 21:
      case 22:
      case 27:
      case 28: //绿波
      case 32: //绿波
      case 33: //绿波
      case 38: //绿波
      case 39: //绿波
      case 43: //绿波
      case 44: //绿波
      case 49: //绿波
        return Colors.green;
      default:
        return Colors.green;
    }
  }

  static Widget getBallNewColorSamll(int sum) {
    // List<int> redBall = new List<int> { 1, 2, 7, 8, 12, 13, 18, 19, 23, 24 };
    // List<int> blueBall = new List<int> { 3, 4, 9, 10, 14, 15, 20, 25, 26 };
    // List<int> greenBall = new List<int> { 0, 5, 6, 11, 16, 17, 21, 22, 27 };
    switch (sum) {
      case 1:
      case 2:
      case 7:
      case 8:
      case 12:
      case 13:
      case 18:
      case 19:
      case 23:
      case 24: //红波
      case 29: //红波
      case 30: //红波
      case 34: //红波
      case 35: //红波
      case 40: //红波
      case 45: //红波
      case 46: //红波
        return Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: Colors.red, width: 2)),
        );
      case 3:
      case 4:
      case 9:
      case 10:
      case 14:
      case 15:
      case 20:
      case 25:
      case 26: //蓝波
      case 31: //蓝波
      case 36: //蓝波
      case 37: //蓝波
      case 41: //蓝波
      case 42: //蓝波
      case 47: //蓝波
      case 48: //蓝波
        return Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: Color(0xFFC3866c5), width: 2)),
        );
      case 0:
      case 5:
      case 6:
      case 11:
      case 16:
      case 17:
      case 21:
      case 22:
      case 27:
      case 28: //绿波
      case 32: //绿波
      case 33: //绿波
      case 38: //绿波
      case 39: //绿波
      case 43: //绿波
      case 44: //绿波
      case 49: //绿波
        return Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: Colors.green, width: 2)),
        );
      default:
        return Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: Colors.green, width: 2)),
        );
    }
  }

  static Color getResultColor(int sum) {
    // List<int> redBall = new List<int> { 1, 2, 7, 8, 12, 13, 18, 19, 23, 24 };
    // List<int> blueBall = new List<int> { 3, 4, 9, 10, 14, 15, 20, 25, 26 };
    // List<int> greenBall = new List<int> { 0, 5, 6, 11, 16, 17, 21, 22, 27 };
    switch (sum) {
      case 1:
      case 2:
      case 7:
      case 8:
      case 12:
      case 13:
      case 18:
      case 19:
      case 23:
      case 24:
        return ballColorRed;
      case 3:
      case 4:
      case 9:
      case 10:
      case 14:
      case 15:
      case 20:
      case 25:
      case 26:
        return ballColorBlue;
      case 0:
      case 5:
      case 6:
      case 11:
      case 16:
      case 17:
      case 21:
      case 22:
      case 27:
        return ballColorGreen;
      default:
        return ballColorGreen;
    }
  }

  static Widget getResultDrawble(int sum) {
    // List<int> redBall = new List<int> { 1, 2, 7, 8, 12, 13, 18, 19, 23, 24 };
    // List<int> blueBall = new List<int> { 3, 4, 9, 10, 14, 15, 20, 25, 26 };
    // List<int> greenBall = new List<int> { 0, 5, 6, 11, 16, 17, 21, 22, 27 };
    switch (sum) {
      case 1:
      case 2:
      case 7:
      case 8:
      case 12:
      case 13:
      case 18:
      case 19:
      case 23:
      case 24:
        return Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: Colors.red, width: 2)),
        );
      case 3:
      case 4:
      case 9:
      case 10:
      case 14:
      case 15:
      case 20:
      case 25:
      case 26:
        return Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: Color(0xFF2585FD), width: 2)),
        );
      case 0:
      case 5:
      case 6:
      case 11:
      case 16:
      case 17:
      case 21:
      case 22:
      case 27:
        return Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: Color(0xFF00ac47), width: 2)),
        );
      default:
        return Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: Color(0xFF00ac47), width: 2)),
        );
    }
  }

  static getNumberDrawble(int number) {
    // List<int> redBall = new List<int> { 1, 2, 7, 8, 12, 13, 18, 19, 23, 24 };
    // List<int> blueBall = new List<int> { 3, 4, 9, 10, 14, 15, 20, 25, 26 };
    // List<int> greenBall = new List<int> { 0, 5, 6, 11, 16, 17, 21, 22, 27 };
    switch (number) {
      case 1:
      case 2:
      case 7:
      case 8:
      case 12:
      case 13:
      case 18:
      case 19:
      case 23:
      case 24:
        return Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: Colors.red, width: 2)),
        );
      case 3:
      case 4:
      case 9:
      case 10:
      case 14:
      case 15:
      case 20:
      case 25:
      case 26:
        return Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: Color(0xFF2585FD), width: 2)),
        );
      case 0:
      case 5:
      case 6:
      case 11:
      case 16:
      case 17:
      case 21:
      case 22:
      case 27:
        return Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: Color(0xFF00ac47), width: 2)),
        );
      default:
        return Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: Color(0xFF00ac47), width: 2)),
        );
    }
  }

  /// sum为-1时，显示问号
  static Widget getDXDS(int sum) {
    if (sum == -1) {
      return Text("(? ?)",style: TextStyle(fontSize: 14.sp,color: ColorX.color_333333,fontWeight: FontWeight.w600),);
    } else {
      String da = Intr().bet_da;
      String xiao = Intr().bet_xiao;
      String shaung = Intr().bet_shuang;
      String dan = Intr().bet_dan;

      String qian = sum < 14 ? xiao : da;
      var qianColor = sum < 14 ? ColorX.color_5583e7:ColorX.color_fc243b;
      String hou = sum % 2 == 0 ? shaung : dan;
      var houColor = sum % 2 == 0 ? ColorX.color_5583e7:ColorX.color_fc243b;

      return Text.rich(TextSpan(
        children: [
          TextSpan(text: "(",style: TextStyle(fontSize: 14.sp,color: ColorX.text333(),fontWeight: FontWeight.w600),),
          TextSpan(text: qian,style: TextStyle(fontSize: 14.sp,color: qianColor,fontWeight: FontWeight.w600),),
          WidgetSpan(child: SizedBox(width: 5.w,)),
          TextSpan(text: hou,style: TextStyle(fontSize: 14.sp,color: houColor,fontWeight: FontWeight.w600),),
          TextSpan(text: ")",style: TextStyle(fontSize: 14.sp,color: ColorX.text333(),fontWeight: FontWeight.w600),),
        ]
      ));
      // ssb.setSpan(new ForegroundColorSpan((sum < 14) ? HiRes.INSTANCE.getColor(R.color.number_blue) : Color.RED), 1, qian.length() + 1,
      // Spannable.SPAN_EXCLUSIVE_INCLUSIVE);
      // ssb.setSpan(new ForegroundColorSpan((sum % 2 == 0) ? HiRes.INSTANCE.getColor(R.color.number_blue) : Color.RED), ("(" + qian + " ").length(), ("(" + qian + " " + hou).length(),
      // Spannable.SPAN_EXCLUSIVE_INCLUSIVE);
      // }
    }
  }

  /// sum为-1时，显示问号
  static Widget getDXDSByType(int sum,int roomtype) {
    if (sum == -1) {
      return Text("(? ?)",style: TextStyle(fontSize: 14.sp,color: ColorX.color_333333,fontWeight: FontWeight.w600),);
    } else {
      String da = Intr().bet_da;
      String xiao = Intr().bet_xiao;
      String shaung = Intr().bet_shuang;
      String dan = Intr().bet_dan;

      String qian = sum < 14 ? xiao : da;
      var qianColor = sum < 14 ? ColorX.color_5583e7:ColorX.color_fc243b;
      String hou = sum % 2 == 0 ? shaung : dan;
      var houColor = sum % 2 == 0 ? ColorX.color_5583e7:ColorX.color_fc243b;
      var color3 = roomtype == 1 ? ColorX.text5862() : ColorX.color_ffe0ac;

      return Text.rich(TextSpan(
          children: [
            TextSpan(text: "(",style: TextStyle(fontSize: 14.sp,color: color3,fontWeight: FontWeight.w600),),
            TextSpan(text: qian,style: TextStyle(fontSize: 14.sp,color: qianColor,fontWeight: FontWeight.w600),),
            WidgetSpan(child: SizedBox(width: 5.w,)),
            TextSpan(text: hou,style: TextStyle(fontSize: 14.sp,color: houColor,fontWeight: FontWeight.w600),),
            TextSpan(text: ")",style: TextStyle(fontSize: 14.sp,color: color3,fontWeight: FontWeight.w600),),
          ]
      ));
      // ssb.setSpan(new ForegroundColorSpan((sum < 14) ? HiRes.INSTANCE.getColor(R.color.number_blue) : Color.RED), 1, qian.length() + 1,
      // Spannable.SPAN_EXCLUSIVE_INCLUSIVE);
      // ssb.setSpan(new ForegroundColorSpan((sum % 2 == 0) ? HiRes.INSTANCE.getColor(R.color.number_blue) : Color.RED), ("(" + qian + " ").length(), ("(" + qian + " " + hou).length(),
      // Spannable.SPAN_EXCLUSIVE_INCLUSIVE);
      // }
    }
  }

  /**
   * sum为-1时，显示问号
   */
  static String getDXDSSimple(int sum) {
    var ssb = "";
    if (sum == -1) {
      ssb = "(? ?)";
    } else {
      String da = Intr().bet_da;
      String xiao = Intr().bet_xiao;
      String shaung = Intr().bet_shuang;
      String dan = Intr().bet_dan;

      String qian = sum < 14 ? xiao : da;
      String hou = sum % 2 == 0 ? shaung : dan;

      ssb = "(" + qian + " " + hou + ")";
      // ssb.setSpan(new ForegroundColorSpan((sum < 14) ? HiRes.INSTANCE.getColor(R.color.number_blue) : Color.RED), 1, qian.length() + 1,
      // Spannable.SPAN_EXCLUSIVE_INCLUSIVE);
      // ssb.setSpan(new ForegroundColorSpan((sum % 2 == 0) ? HiRes.INSTANCE.getColor(R.color.number_blue) : Color.RED), ("(" + qian + " ").length(), ("(" + qian + " " + hou).length(),
      // Spannable.SPAN_EXCLUSIVE_INCLUSIVE);
      // }
      return ssb;
    }
    return "";
  }

  /// 根据三个球拼接的字符串，计算出各自数字及总和
  static List<int> parseLottery(String threeNum) {
    List<int> arr = [0, 0, 0, 0];
    if (threeNum.isNotEmpty == true && threeNum.length == 3) {
      arr[0] = int.tryParse(threeNum[0]) ?? 0;
      arr[1] = int.tryParse(threeNum[1]) ?? 0;
      arr[2] = int.tryParse(threeNum[2]) ?? 0;
      arr[3] = arr[0] + arr[1] + arr[2];
    } else {
      arr[0] = -1;
      arr[1] = -1;
      arr[2] = -1;
      arr[3] = -1;
    }
    return arr;
  }

  /// 获取第几期样式
  static String getSSB(String qiShu,{String? year="2024"}) {
    // logger(["这是调了个啥呀",qiShu,year]);
    if(isEmpty(qiShu)) return qiShu;
    String ssb = qiShu;
    if (qiShu.isNotEmpty == true && qiShu.length > 8) {
      ssb = qiShu.substring(qiShu.length - 8, qiShu.length);
    }
    return Intr().dixqi(["${year.em()}$ssb"]);
  }

  static String getSimpleSSB(String qiShu,{String? year="2024"}) {
    if(isEmpty(qiShu)) return qiShu;
    String ssb = qiShu;
    if (qiShu.isNotEmpty == true && qiShu.length > 8) {
      qiShu = qiShu.substring(qiShu.length - 8, qiShu.length);
      ssb = "$year$qiShu";
    }
    return ssb;
  }



  static var teOneBoll = List<OddsContent>.empty(growable: true); //特码的第一二排
  static var teTwoBoll = List<OddsContent>.empty(growable: true); ////特码的第三排  红波 蓝波 绿波 顺子 豹子 对子
  static var teBollNum = List<OddsContent>.empty(growable: true); //特码数字
  static var oneBoll = List<OddsContent>.empty(growable: true); //第一球 数字 大小 单双 龙
  static var oneBollNum = List<OddsContent>.empty(growable: true);
  static var oneBollDx = List<OddsContent>.empty(growable: true);
  static var twoBoll = List<OddsContent>.empty(growable: true); //第二球 数字 大小 单双 和
  static var twoBollNum = List<OddsContent>.empty(growable: true);
  static var twoBollDx = List<OddsContent>.empty(growable: true);
  static var thirdBoll = List<OddsContent>.empty(growable: true); //第三球 数字 大小 单双 虎
  static var thirdBollNum = List<OddsContent>.empty(growable: true);
  static var thirdBollDx = List<OddsContent>.empty(growable: true);
  static var teshuOdds1 = <String,dynamic>{};
  static var teshuOdds2 = <String,dynamic>{};

   static void getOddsbean(Map<String,dynamic> totalMap) async {
    // WSGameOddsServer result =  WSGameOddsServer();
    //   var content = List<OddsContent>.empty(growable: true);
    //   totalMap.forEach((key, value) {
    //     value.forEach((type, entity) {
    //       content.add(OddsContent.fromJson(entity));
    //     });
    //   });
      if(unEmpty(totalMap["3"])){
        teBollNum.assignAll(teBollNumName(totalMap["3"]));
      }
      teBollNum.sort((a, b) => (a.id.em()).compareTo(b.id.em()));

      ///大小
      var large_sm = List<OddsContent>.empty(growable: true);
      if(unEmpty(totalMap["1"])){
        large_sm.assignAll(teBollName(totalMap["1"]));
      }
      ///极大 极小
      var te_ji = List<OddsContent>.empty(growable: true);
      if(unEmpty(totalMap["2"])){
        te_ji.assignAll(originalName(totalMap["2"]));
      }
      ///大单 大双 小单小双
      var te_oth = List<OddsContent>.empty(growable: true);
      if(unEmpty(totalMap["4"])){
        te_oth.assignAll(originalName(totalMap["4"]));
      }
      teOneBoll.assignAll(teBollData(large_sm,te_ji,te_oth));//特码第一二排

      //红波蓝波 绿波的数组
      var boBoll = List<OddsContent>.empty(growable: true);
      if(unEmpty(totalMap["8"])){
        boBoll.assignAll(originalName(totalMap["8"]));
      }
      //顺子 豹子 对子的数组
      var sbdBoll = List<OddsContent>.empty(growable: true);
      if(unEmpty(totalMap["7"])){
        sbdBoll.assignAll(originalName(totalMap["7"]));
      }
      //第三排
      teTwoBoll.assignAll(boBollData(boBoll,sbdBoll));

      //一球数字
      if(unEmpty(totalMap["12"])){
        oneBollNum.assignAll(oneBollNumName(totalMap["12"]));
      }
      oneBollNum.sort((a, b) => (a.id.em()).compareTo(b.id.em()));

      //一球大小 单双
      if(unEmpty(totalMap["9"])){
        oneBollDx.assignAll(oneBollName(totalMap["9"]));
      }
      oneBollDx.sort((a, b) => (a.id.em()).compareTo(b.id.em()));

      //二球数字
      if(unEmpty(totalMap["13"])){
        twoBollNum.assignAll(twoBollNumName(totalMap["13"]));
      }
      twoBollNum.sort((a, b) => (a.id.em()).compareTo(b.id.em()));

      //二球大小 单双
      if(unEmpty(totalMap["10"])){
        twoBollDx.assignAll(twoBollName(totalMap["10"]));
      }
      twoBollDx.sort((a, b) => (a.id.em()).compareTo(b.id.em()));

      //三球数字
      if(unEmpty(totalMap["14"])){
        thirdBollNum.assignAll(thirdBollNumName(totalMap["14"]));
      }
      thirdBollNum.sort((a, b) => (a.id.em()).compareTo(b.id.em()));

      //三球大小 单双
      if(unEmpty(totalMap["11"])){
        thirdBollDx.assignAll(thirdBollName(totalMap["11"]));
      }
      thirdBollDx.sort((a, b) => (a.id.em()).compareTo(b.id.em()));
      if(unEmpty(totalMap["15"])){
        totalMap["15"].forEach((type, entity) {
          var row = OddsContent.fromJson(entity);
          row.showName = row.name;
          row.sendType = row.type;
          if(type == "dragon"){
            oneBollDx.add(row);
          }else if(type == "equal"){
            twoBollDx.add(row);
          }else if(type == "tiger"){
            thirdBollDx.add(row);
          }
        });
      }
      ///大小单双的第二个赔率
      if(unEmpty(totalMap["5"])){
        teshuOdds1 = totalMap["5"];
      }
      ///小单 大双的第二个赔率
      if(unEmpty(totalMap["6"])){
        teshuOdds2 = totalMap["6"];
      }
      // oneBollDx.forEach((element) {
      //   logger("看看处理的对不对吧${element.showName}    ${element.sendType}");
      // });
      loggerArray(["整理投注数据111",totalMap.length]);

/*      ///处理双倍率
      content.removeWhere((e1) {
        switch(e1.type){
          case GameType_Big_14:
            content.forEach((element) {
              if(element.type == GameType_Big){
                element.play2 = e1.play;
              }
            });
            return true;
          case GameType_Small_13:
            content.forEach((element) {
              if(element.type == GameType_Small){
                element.play2 = e1.play;
              }
            });
            return true;
          case GameType_Odd_13:
            content.forEach((element) {
              if(element.type == GameType_Odd){
                element.play2 = e1.play;
              }
            });
            return true;
          case GameType_Even_14:
            content.forEach((element) {
              if(element.type == GameType_Even){
                element.play2 = e1.play;
              }
            });
            return true;
          case GameType_SmallOdd_13:
            content.forEach((element) {
              if(element.type == GameType_SmallOdd){
                element.play2 = e1.play;
              }
            });
            return true;
          case GameType_BigEven_14:
            content.forEach((element) {
              if(element.type == GameType_BigEven){
                element.play2 = e1.play;
              }
            });
            return true;
          default:
            // loggerArray(["整理投注数据121342",e1.type]);
            // if((int.tryParse(e1.type.em()) ?? 0) <= 27){
            //   return false;
            // }
            return false;
        }
      });
      loggerArray(["整理投注数据",totalMap.length,content.length]);
    return Future.value(content);*/
  }

  ///整理所有选择的投注
  static List<WsBetContent> allChoosedChip(List<OddsContent> selects){
    var list = List<WsBetContent>.empty(growable: true);
    selects.forEach((element) {
      var odds_1314 = "";
      if (element.type == "big") {
        odds_1314 = teshuOdds1["14_big"]['play'];
      }
      if (element.type == "small") {
        odds_1314 = teshuOdds1["13_small"]['play'];
      }
      if (element.type == "odd") {
        odds_1314 = teshuOdds1["13_odd"]['play'];
      }
      if (element.type == "even") {
        odds_1314 = teshuOdds1["14_even"]['play'];
      }
      if (element.type == "small_odd") {
        odds_1314 = teshuOdds2["13_small_odd"]['play'];
      }
      if (element.type == "big_even") {
        odds_1314 = teshuOdds2["14_big_even"]['play'];
      }
      var bc = WsBetContent();
      bc.c = "${element.money.em()}";
      bc.b = element.name?.replaceAll(RegExp(r'[^\d]'), "").em();
      bc.d = element.play.em();
      bc.e = odds_1314;
      bc.a = element.sendType.em();
      bc.showName = element.showName.em();
      list.add(bc);
    });
    return list;
  }

  ///  返回当前使用钱包的   钱币符号
  ///     1:CNY,2:USD,3:KRW,4:INR,5:USDT
  static String getMoneySymbol(String type) {
    String result = "¥";
    switch (type) {
      case "CNY":
        result = "¥";
        break;
      case "USD":
        result = "\$";
        break;
      case "KRW":
        result = "₩";
        break;
      case "INR":
        result = "₹";
        break;
      case "USDT":
        result = "₮";
        break;
      case "VND":
        result = "₫";
        break;
    }

    return result;
  }

  /// 根据betType返回投注类型的中文名称,当以cao开头时，betNum对应特码数字
  static String getBetTypeName(String betType) {
    if (GameType_Big == (betType)) {
      return "特码-大";
    } else if (GameType_Small == (betType)) {
      return "特码-小";
    } else if (GameType_Odd == (betType)) {
      return "特码-单";
    } else if (GameType_Even == (betType)) {
      return "特码-双";
    } else if (GameType_BigOdd == (betType)) {
      return "大单";
    } else if (GameType_SmallOdd == (betType)) {
      return "小单";
    } else if (GameType_BigEven == (betType)) {
      return "大双";
    } else if (GameType_SmallEven == (betType)) {
      return "小双";
    } else if (GameType_Max == (betType)) {
      return "极大";
    } else if (GameType_Min == (betType)) {
      return "极小";
    } else if (GameType_Red == (betType)) {
      return "红波";
    } else if (GameType_Blue == (betType)) {
      return "蓝波";
    } else if (GameType_Green == (betType)) {
      return "绿波";
    } else if (GameType_Pair == (betType)) {
      return "对子";
    } else if (GameType_Straight == (betType)) {
      return "顺子";
    } else if (GameType_Leopard == (betType)) {
      return "豹子";
    } else if (GameType_Cao == (betType)) {
      return "特码";
    } else if (GameType_First == (betType)) {
      return "第一球";
    } else if (GameType_Second == (betType)) {
      return "第二球";
    } else if (GameType_Three == (betType)) {
      return "第三球";
    } else if (GameType_equal == (betType)) {
      return "和";
    } else if (GameType_dragon == (betType)) {
      return "龙";
    } else if (GameType_tiger == (betType)) {
      return "虎";
    } else {
      return getWhereBallName(betType);
    }

  }

  /// 根据betType返回投注类型的中文名称,当以cao开头时
  //  String getBetTypeName
  //
  // (
  //
  // String betType) {
  // if (GameType_Big==(betType)) {
  // return HiRes.INSTANCE.getString(R.string.room_tema) + "-" +
  // "大";
  // } else if (GameType_Small==(betType)) {
  // return HiRes.INSTANCE.getString(R.string.room_tema) + "-" +
  // "小";
  // } else if (GameType_Odd==(betType)) {
  // return HiRes.INSTANCE.getString(R.string.room_tema) + "-" +
  // "单";
  // } else if (GameType_Even==(betType)) {
  // return HiRes.INSTANCE.getString(R.string.room_tema) + "-" +
  // "双";
  // } else if (GameType_BigOdd==(betType)) {
  // return HiRes.INSTANCE.getString(R.string.room_da_dan);
  // } else if (GameType_SmallOdd==(betType)) {
  // return HiRes.INSTANCE.getString(R.string.room_xiao_dan);
  // } else if (GameType_BigEven==(betType)) {
  // return HiRes.INSTANCE.getString(R.string.room_da_shaung);
  // } else if (GameType_SmallEven==(betType)) {
  // return HiRes.INSTANCE.getString(R.string.room_xiao_shaung);
  // } else if (GameType_Max==(betType)) {
  // return HiRes.INSTANCE.getString(R.string.room_jida);
  // } else if (GameType_Min==(betType)) {
  // return HiRes.INSTANCE.getString(R.string.room_jixiao);
  // } else if (GameType_Red==(betType)) {
  // return HiRes.INSTANCE.getString(R.string.room_hong_bo);
  // } else if (GameType_Blue==(betType)) {
  // return HiRes.INSTANCE.getString(R.string.room_lan_bo);
  // } else if (GameType_Green==(betType)) {
  // return HiRes.INSTANCE.getString(R.string.room_lu_bo);
  // } else if (GameType_Pair==(betType)) {
  // return HiRes.INSTANCE.getString(R.string.room_dui_zi);
  // } else if (GameType_Straight==(betType)) {
  // return HiRes.INSTANCE.getString(R.string.room_shuan_zi);
  // } else if (GameType_Leopard==(betType)) {
  // return HiRes.INSTANCE.getString(R.string.room_baozi);
  // } else if (GameType_Cao==(betType)) {
  // return HiRes.INSTANCE.getString(R.string.room_cao);
  // } else if (GameType_First==(betType)) {
  // return HiRes.INSTANCE.getString(R.string.room_diyiqiu);
  // } else if (GameType_Second==(betType)) {
  // return HiRes.INSTANCE.getString(R.string.room_dierqiu);
  // } else if (GameType_Three==(betType)) {
  // return HiRes.INSTANCE.getString(R.string.room_disanqiu);
  // } else if (GameType_equal==(betType)) {
  // return HiRes.INSTANCE.getString(R.string.room_he);
  // } else if (GameType_dragon==(betType)) {
  // return HiRes.INSTANCE.getString(R.string.room_long);
  // } else if (GameType_tiger==(betType)) {
  // return HiRes.INSTANCE.getString(R.string.room_hu);
  // } else if (betType != null) {
  // return getWhereBallName(betType);
  // } else {
  // return "未知";
  // }
  // }

  static String getBetObb(String odds, String odds_1314) {
    if (odds_1314.isNotEmpty == true &&
        odds_1314.isNotEmpty == true &&
        odds != (odds_1314)) {
      odds += "/$odds_1314";
    } else {}
    return odds;
  }

  /// 根据betType返回是不是1314
  static bool isType1314(String betType) {
    if (GameType_Big == (betType) ||
        GameType_Small == (betType) ||
        GameType_Odd == (betType) ||
        GameType_Even == (betType) ||
        GameType_BigEven == (betType) ||
        GameType_SmallOdd == (betType)) {
      return true;
    }
    return false;
  }

  /// type=0
  /// type=1
  /// type=2
//   static  List<OddsContent>  requestTema(List<OddsContent> odds,{int? type=0}) {
//     List<OddsContent>  dataBettingList=<OddsContent>[];
//     List<OddsContent>  middleBettingList=<OddsContent>[];
//     List<OddsContent>  smallDataBettingList=<OddsContent>[];
//     for(OddsContent con in odds) {
//       if (GameRuleUtil.GameType_Big==con.type) {
//         OddsContent item= OddsContent.fromJson(con.toJson());
//         item.level=1;
//         dataBettingList.add(item);
//       }else if (GameRuleUtil.GameType_Odd==(con.type)){
//         OddsContent item= OddsContent.fromJson(con.toJson());
//         item.level=2;
//         dataBettingList.add(item);
//       } else if (GameRuleUtil.GameType_BigOdd==(con.type)) {
//         OddsContent item= OddsContent.fromJson(con.toJson());
//         item.level=3;
//         dataBettingList.add(item);
//       }else if (GameRuleUtil.GameType_SmallOdd==(con.type)) {
//         OddsContent item= OddsContent.fromJson(con.toJson());
//         item.level=4;
//         dataBettingList.add(item);
//       } else if (GameRuleUtil.GameType_Max==con.type){
//         OddsContent item= OddsContent.fromJson(con.toJson());
//         item.level=5;
//         dataBettingList.add(item);
//       } else if (GameRuleUtil.GameType_Small==(con.type)) {
//         OddsContent item= OddsContent.fromJson(con.toJson());
//         item.level=6;
//
//         dataBettingList.add(item);
//       }else if (GameRuleUtil.GameType_Even==(con.type)) {
//         OddsContent item= OddsContent.fromJson(con.toJson());
//
//         item.level=7;
//         dataBettingList.add(item);
//       }else if (GameRuleUtil.GameType_BigEven==(con.type)) {
//         OddsContent item= OddsContent.fromJson(con.toJson());
//         item.level=8;
//         dataBettingList.add(item);
//       }else if (GameRuleUtil.GameType_SmallEven==(con.type)) {
//         OddsContent item= OddsContent.fromJson(con.toJson());
//         item.level=9;
//         dataBettingList.add(item);
//       } else if (GameRuleUtil.GameType_Min==(con.type)) {
//         OddsContent item= OddsContent.fromJson(con.toJson());
//         item.level=10;
//         dataBettingList.add(item);
//       }else if (GameRuleUtil.GameType_Red==(con.type)) {
//         OddsContent item= OddsContent.fromJson(con.toJson());
//         item.level=11;
//         item.color=0xFFFC243B;
//         middleBettingList.add(item);
//
//       }else if (GameRuleUtil.GameType_Blue==(con.type)) {
//         OddsContent item= OddsContent.fromJson(con.toJson());
//         item.level=12;
//         item.color=0xFF5583E7;
//         middleBettingList.add(item);
//       }else if (GameRuleUtil.GameType_Green==(con.type)) {
//         OddsContent item= OddsContent.fromJson(con.toJson());
//         item.color=0xFF06A100;
//         item.level=13;
//         middleBettingList.add(item);
//       }else if (GameRuleUtil.GameType_Straight==(con.type)) {
//         OddsContent item= OddsContent.fromJson(con.toJson());
//         item.level=14;
//
//         middleBettingList.add(item);
//       } else if (GameRuleUtil.GameType_Leopard==(con.type)) {
//         OddsContent item= OddsContent.fromJson(con.toJson());
//         item.level=15;
//         middleBettingList.add(item);
//       } else if (GameRuleUtil.GameType_Pair==(con.type)) {
// //
//         OddsContent item= OddsContent.fromJson(con.toJson());
//         item.level=16;
//         middleBettingList.add(item);
//       } else {
//         int sum = int.tryParse(con.type??"1")??-1;
//         OddsContent item= OddsContent.fromJson(con.toJson());
//         item.titleColor = GameRuleUtil.getBallColor(sum);
//         switch (sum) {
//           case GameRuleUtil.GameType_Cao_00:
//             item.level=0;
//             break;
//           case GameRuleUtil.GameType_Cao_01:
//             item.level=1;
//             break;
//           case GameRuleUtil.GameType_Cao_02:
//             item.level=2;
//             break;
//           case GameRuleUtil.GameType_Cao_03:
//             item.level=3;
//             break;
//           case GameRuleUtil.GameType_Cao_04:
//             item.level=4;
//             break;
//           case GameRuleUtil.GameType_Cao_05:
//             item.level=5;
//             break;
//           case GameRuleUtil.GameType_Cao_06:
//             item.level=6;
//             break;
//           case GameRuleUtil.GameType_Cao_07:
//             item.level=7;
//             break;
//           case GameRuleUtil.GameType_Cao_08:
//             item.level=8;
//             break;
//           case GameRuleUtil.GameType_Cao_09:
//             item.level=9;
//             break;
//           case GameRuleUtil.GameType_Cao_10:
//             item.level=10;
//             break;
//           case GameRuleUtil.GameType_Cao_11:
//             item.level=11;
//             break;
//           case GameRuleUtil.GameType_Cao_12:
//             item.level=12;
//             break;
//           case GameRuleUtil.GameType_Cao_13:
//             item.level=13;
//             break;
//           case GameRuleUtil.GameType_Cao_14:
//             item.level=14;
//             break;
//           case GameRuleUtil.GameType_Cao_15:
//             item.level=15;
//             break;
//           case GameRuleUtil.GameType_Cao_16:
//             item.level=16;
//             break;
//           case GameRuleUtil.GameType_Cao_17:
//             item.level=17;
//             break;
//           case GameRuleUtil.GameType_Cao_18:
//             item.level=18;
//             break;
//           case GameRuleUtil.GameType_Cao_19:
//             item.level=19;
//             break;
//           case GameRuleUtil.GameType_Cao_20:
//             item.level=20;
//             break;
//           case GameRuleUtil.GameType_Cao_21:
//             item.level=21;
//             break;
//           case GameRuleUtil.GameType_Cao_22:
//             item.level=22;
//             break;
//           case GameRuleUtil.GameType_Cao_23:
//             item.level=23;
//             break;
//           case GameRuleUtil.GameType_Cao_24:
//             item.level=24;
//             break;
//           case GameRuleUtil.GameType_Cao_25:
//             item.level=25;
//             break;
//           case GameRuleUtil.GameType_Cao_26:
//             item.level=26;
//             break;
//           case GameRuleUtil.GameType_Cao_27:
//             item.level=27;
//             break;
//           default:
//             item.level = -1;
//             // SysoManager.println("未知类型未知草");
//             break;
//         }
//         if(item.level.em() >= 0){
//           smallDataBettingList.add(item);
//         }
//       }
//     }
//     if(type==0) {
//       dataBettingList.sort((a, b) => (a.level.em()).compareTo((b.level.em())));
//       print("=======>长度 ${dataBettingList.length}");
//       return dataBettingList;
//     }else if(type==1) {
//       middleBettingList.sort((a, b) => (a.level.em()).compareTo((b.level.em())));
//       return middleBettingList;
//     }else if(type==2) {
//       smallDataBettingList.sort((a, b) => (a.level.em()).compareTo((b.level.em())));
//       return smallDataBettingList;
//     }
//     return dataBettingList;
//   }

  // static  List<OddsContent>  dealData(List<OddsContent> odds,{String mBallName="first"}) {
  //
  //   List<OddsContent> data = [];
  //   List<OddsContent> data1 = [];
  //   List<OddsContent> data2 = [];
  //   List<OddsContent> data3 = [];
  //
  //   Map<int, OddsContent> arrayMap = {};
  //
  //   if ("firstBall".contains(mBallName)) {
  //     for (int i = 0; i < odds.length; i++) {
  //       OddsContent content = OddsContent.fromJson(odds[i].toJson());
  //       if (content.type?.contains(GameRuleUtil.GameType_First)==true) {
  //         data1.add(content);
  //       } else if (content.type?.contains(GameRuleUtil.GameType_First_String)==true) {
  //         setSecondBallData(arrayMap, content);
  //       } else if (content.type?.contains(GameRuleUtil.GameType_dragon)==true) {
  //         data3.add(content);
  //       }
  //     }
  //
  //   } else if ("secondBall".contains(mBallName)) {
  //     for (int i = 0; i < odds.length; i++) {
  //       OddsContent content = OddsContent.fromJson(odds[i].toJson());
  //       if (content.type?.contains(GameRuleUtil.GameType_Second_String)==true || content.type?.contains(GameRuleUtil.GameType_equal)==true) {
  //         if (content.type?.contains(GameRuleUtil.GameType_Second)==true) {
  //           data1.add(content);
  //         } else if (content.type?.contains(GameRuleUtil.GameType_Second_String)==true) {
  //           setSecondBallData(arrayMap, content);
  //
  //         } else if (content.type?.contains(GameRuleUtil.GameType_equal)==true) {
  //           data3.add(content);
  //         }
  //       }
  //
  //     }
  //
  //   } else if ("threeBall".contains(mBallName)) {
  //     for (int i = 0; i < odds.length; i++) {
  //       OddsContent content = OddsContent.fromJson(odds[i].toJson());
  //       if (content.type?.contains(GameRuleUtil.GameType_Three_String)==true || content.type?.contains(GameRuleUtil.GameType_tiger)==true) {
  //         if (content.type?.contains(GameRuleUtil.GameType_Three)==true) {
  //           data1.add(content);
  //         } else if (content.type?.contains(GameRuleUtil.GameType_Three_String)==true) {
  //           setSecondBallData(arrayMap, content);
  //         } else if (content.type?.contains(GameRuleUtil.GameType_tiger)==true) {
  //           data3.add(content);
  //         }
  //       }
  //     }
  //   }
  //   data1.sort((left,right)=>left.type?.compareTo(right.type??"")??1);
  //
  //   // Comparator<OddsContent> comparator =  Comparator<OddsContent>() {
  //   //   public int compare(OddsContent s1, OddsContent s2) {
  //   //     return s1.type.compareTo(s2.type);
  //   //   }
  //   // };
  //   // Collections.sort(data1, comparator);
  //   for (int i = 0; i < arrayMap.length; i++) {
  //     data2.add(arrayMap[i]??OddsContent());
  //   }
  //   data.addAll(data1);
  //   data.addAll(data2);
  //   data.addAll(data3);
  //   return data;
  //   // for (int i = 0; i < mViews.size() && i < data.size(); i++) {
  //   //   initDataTeMa(mViews.get(i), data.get(i));
  //   // }
  // }


  //  static void setSecondBallData(Map<int, OddsContent> arrayMap, OddsContent content) {
  //   if (content.type?.contains(GameRuleUtil.GameType_Big)==true) {
  //     arrayMap[0]= content;
  //   }
  //   if (content.type?.contains(GameRuleUtil.GameType_Small)==true) {
  //     arrayMap[1]= content;
  //   }
  //   if (content.type?.contains(GameRuleUtil.GameType_Odd)==true) {
  //     arrayMap[2]= content;
  //   }
  //   if (content.type?.contains(GameRuleUtil.GameType_Even)==true) {
  //     arrayMap[3]= content;
  //   }
  // }

  static String getWhereBallName(String betType) {
    String ballName = "";

    if (betType.contains(GameType_First_String)) {
      ballName = "$ballName-第一球";
    } else if (betType.contains(GameType_Second_String)) {
      ballName = "$ballName-第二球";
    } else if (betType.contains(GameType_Three_String)) {
      ballName = "$ballName-第三球";
    }

    if (betType.contains(GameType_Big)) {
      ballName = "$ballName-大";
    } else if (betType.contains(GameType_Small)) {
      ballName = "$ballName-小";
    } else if (betType.contains(GameType_Odd)) {
      ballName = "$ballName-单";
    } else if (betType.contains(GameType_Even)) {
      ballName = "$ballName-双";
    }

    return ballName;
  }

/*  /// 只展示大小单双，根据type
  ///
  /// @param betType
  /// @return
  static String getBallNameMaxMin(String betType) {
    String ballName = "";
    if (betType == GameType_Big) {
      ballName += "大";
    } else if (betType == GameType_Small) {
      ballName += "小";
    } else if (betType == GameType_Odd) {
      ballName += "单";
    } else if (betType == GameType_Even) {
      ballName += "双";
    } else if (betType == GameType_BigOdd) {
      ballName += "大单";
    } else if (betType == GameType_BigEven) {
      ballName += "大双";
    } else if (betType == GameType_SmallOdd) {
      ballName += "小单";
    } else if (betType == GameType_SmallEven) {
      ballName += "小双";
    }

    return ballName;
  }*/



  static String getNumBallName(String betType) {
    switch(betType){
      case "first_big":
      case "second_big":
      case "third_big":
        return Intr().bet_da;
      case "first_small":
      case "second_small":
      case "third_small":
        return Intr().bet_xiao;
      case "first_odd":
      case "second_odd":
      case "third_odd":
        return Intr().bet_dan;
      case "first_even":
      case "second_even":
      case "third_even":
        return Intr().bet_shuang;
      case "tiger":
        return Intr().bet_hu;
      case "dragon":
        return Intr().bet_long;
      case "equal":
        return Intr().bet_he;
    }
    return "";
  }


  static List<OddsContent> originalName(totalMap) {
    var list = List<OddsContent>.empty(growable: true);
    totalMap.forEach((type, entity) {
      var row = OddsContent.fromJson(entity);
      row.showName = row.name;
      row.sendType = row.type;
      list.add(row);
    });
    return list;
  }

  static List<OddsContent> dr_eq_tig(totalMap) {
    var list = List<OddsContent>.empty(growable: true);
    totalMap.forEach((type, entity) {
      var row = OddsContent.fromJson(entity);
      row.showName = row.name;
      row.sendType = row.type;
      list.add(row);
    });
    return list;
  }

  static List<OddsContent> oneBollNumName(totalMap) {
    var list = List<OddsContent>.empty(growable: true);
    totalMap.forEach((type, entity) {
      var row = OddsContent.fromJson(entity);
      row.showName = "${Intr().diyiqiu}-${row.name?.replaceAll(RegExp(r'[^\d]'), "")}";
      row.sendType = "first_cao";
      list.add(row);
    });
    return list;
  }

  static List<OddsContent> twoBollNumName(totalMap) {
    var list = List<OddsContent>.empty(growable: true);
    totalMap.forEach((type, entity) {
      var row = OddsContent.fromJson(entity);
      row.showName = "${Intr().dierqiu}-${row.name?.replaceAll(RegExp(r'[^\d]'), "")}";
      row.sendType = "second_cao";
      list.add(row);
    });
    return list;
  }

  static List<OddsContent> thirdBollNumName(totalMap) {
    var list = List<OddsContent>.empty(growable: true);
    totalMap.forEach((type, entity) {
      var row = OddsContent.fromJson(entity);
      row.showName = "${Intr().disanqiu}-${row.name?.replaceAll(RegExp(r'[^\d]'), "")}";
      row.sendType = "third_cao";
      list.add(row);
    });
    return list;
  }


  static List<OddsContent> teBollNumName(totalMap) {
    var list = List<OddsContent>.empty(growable: true);
    totalMap.forEach((type, entity) {
      var row = OddsContent.fromJson(entity);
      row.showName = "${Intr().tema}-${row.name?.replaceAll(RegExp(r'[^\d]'), "")}";
      row.sendType = "cao";
      list.add(row);
    });
    return list;
  }


  static List<OddsContent> oneBollName(totalMap) {
    var list = List<OddsContent>.empty(growable: true);
    totalMap.forEach((type, entity) {
      var row = OddsContent.fromJson(entity);
      row.showName = "${Intr().diyiqiu}-${row.name?.substring(row.name!.length - 1)}";
      row.sendType = row.type;
      list.add(row);
    });
    return list;
  }

  static List<OddsContent> twoBollName(totalMap) {
    var list = List<OddsContent>.empty(growable: true);
    totalMap.forEach((type, entity) {
      var row = OddsContent.fromJson(entity);
      row.showName = "${Intr().dierqiu}-${row.name?.substring(row.name!.length - 1)}";
      row.sendType = row.type;
      list.add(row);
    });
    return list;
  }

  static List<OddsContent> thirdBollName(totalMap) {
    var list = List<OddsContent>.empty(growable: true);
    totalMap.forEach((type, entity) {
      var row = OddsContent.fromJson(entity);
      row.showName = "${Intr().disanqiu}-${row.name?.substring(row.name!.length - 1)}";
      row.sendType = row.type;
      list.add(row);
    });
    return list;
  }


  static List<OddsContent> teBollName(totalMap) {
    var list = List<OddsContent>.empty(growable: true);
    totalMap.forEach((type, entity) {
      var row = OddsContent.fromJson(entity);
      row.showName = "${Intr().tema}-${row.name.em()}";
      row.sendType = row.type;
      list.add(row);
    });
    return list;
  }


  static List<OddsContent> teBollData(List<OddsContent> large_sm, List<OddsContent> te_ji, List<OddsContent> te_oth) {
    var data = List<OddsContent>.empty(growable: true);
    var big = large_sm.where((element) => element.type == "big");
    var small = large_sm.where((element) => element.type == "small");
    var odd = large_sm.where((element) => element.type == "odd");
    var even = large_sm.where((element) => element.type == "even");

    var max = te_ji.where((element) => element.type == "max");
    var min = te_ji.where((element) => element.type == "min");

    var big_even = te_oth.where((element) => element.type == "big_even");
    var big_odd = te_oth.where((element) => element.type == "big_odd");
    var small_even = te_oth.where((element) => element.type == "small_even");
    var small_odd = te_oth.where((element) => element.type == "small_odd");

    data.addAll(big);
    data.addAll(odd);
    data.addAll(big_odd);
    data.addAll(small_odd);
    data.addAll( max,);
    data.addAll(small);
    data.addAll(even);
    data.addAll(big_even);
    data.addAll(small_even);
    data.addAll(min);
    return data;
  }

  static List<OddsContent> boBollData(List<OddsContent> boBoll, List<OddsContent> sbdBoll) {
    var data = List<OddsContent>.empty(growable: true);
    //投注的 红波 绿波 蓝波 顺子 豹子 对子的排序
    var red = boBoll.where((element) => element.type == "red");
    var blue = boBoll.where((element) => element.type == "blue");
    var green = boBoll.where((element) => element.type == "green");

    var straight = sbdBoll.where((element) => element.type == "straight");
    var leopard = sbdBoll.where((element) => element.type == "leopard");
    var pair = sbdBoll.where((element) => element.type == "pair");
    data.addAll(red);
    data.addAll(blue);
    data.addAll(green);
    data.addAll(straight);
    data.addAll(leopard);
    data.addAll(pair);
    return data;
  }










}
