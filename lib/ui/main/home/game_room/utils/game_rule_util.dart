import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/res/colorx.dart';
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
      //SysoManager.println("得到的开奖结果异常，不应该出现这种情况");
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

   static Future<List<OddsContent>> getOddsbean(Map<String,dynamic> totalMap) async {
    // WSGameOddsServer result =  WSGameOddsServer();
      var content = List<OddsContent>.empty(growable: true);
      totalMap.forEach((key, value) {
        value.forEach((type, entity) {
          var row = OddsContent.fromJson(entity);
          row.jsonKey =type;
          content.add(row);
        });
      });
      loggerArray(["整理投注数据111",totalMap.length,content.length]);

      ///处理双倍率
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
    return Future.value(content);
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

  /**
   * 根据betType返回投注类型的中文名称,当以cao开头时
   */
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
  static  List<OddsContent>  requestTema(List<OddsContent> odds,{int? type=0}) {
    List<OddsContent>  dataBettingList=<OddsContent>[];
    List<OddsContent>  middleBettingList=<OddsContent>[];
    List<OddsContent>  smallDataBettingList=<OddsContent>[];
    for(OddsContent con in odds) {
      if (GameRuleUtil.GameType_Big==con.type) {
        OddsContent item= OddsContent.fromJson(con.toJson());
        item.level=1;
        dataBettingList.add(item);
      }else if (GameRuleUtil.GameType_Odd==(con.type)){
        OddsContent item= OddsContent.fromJson(con.toJson());
        item.level=2;
        dataBettingList.add(item);
      } else if (GameRuleUtil.GameType_BigOdd==(con.type)) {
        OddsContent item= OddsContent.fromJson(con.toJson());
        item.level=3;
        dataBettingList.add(item);
      }else if (GameRuleUtil.GameType_SmallOdd==(con.type)) {
        OddsContent item= OddsContent.fromJson(con.toJson());
        item.level=4;
        dataBettingList.add(item);
      } else if (GameRuleUtil.GameType_Max==con.type){
        OddsContent item= OddsContent.fromJson(con.toJson());
        item.level=5;
        dataBettingList.add(item);
      } else if (GameRuleUtil.GameType_Small==(con.type)) {
        OddsContent item= OddsContent.fromJson(con.toJson());
        item.level=6;

        dataBettingList.add(item);
      }else if (GameRuleUtil.GameType_Even==(con.type)) {
        OddsContent item= OddsContent.fromJson(con.toJson());

        item.level=7;
        dataBettingList.add(item);
      }else if (GameRuleUtil.GameType_BigEven==(con.type)) {
        OddsContent item= OddsContent.fromJson(con.toJson());
        item.level=8;
        dataBettingList.add(item);
      }else if (GameRuleUtil.GameType_SmallEven==(con.type)) {
        OddsContent item= OddsContent.fromJson(con.toJson());
        item.level=9;
        dataBettingList.add(item);
      } else if (GameRuleUtil.GameType_Min==(con.type)) {
        OddsContent item= OddsContent.fromJson(con.toJson());
        item.level=10;
        dataBettingList.add(item);
      }else if (GameRuleUtil.GameType_Red==(con.type)) {
        OddsContent item= OddsContent.fromJson(con.toJson());
        item.level=11;
        item.color=0xFFFC243B;
        middleBettingList.add(item);

      }else if (GameRuleUtil.GameType_Blue==(con.type)) {
        OddsContent item= OddsContent.fromJson(con.toJson());
        item.level=12;
        item.color=0xFF5583E7;
        middleBettingList.add(item);
      }else if (GameRuleUtil.GameType_Green==(con.type)) {
        OddsContent item= OddsContent.fromJson(con.toJson());
        item.color=0xFF06A100;
        item.level=13;
        middleBettingList.add(item);
      }else if (GameRuleUtil.GameType_Straight==(con.type)) {
        OddsContent item= OddsContent.fromJson(con.toJson());
        item.level=14;

        middleBettingList.add(item);
      } else if (GameRuleUtil.GameType_Leopard==(con.type)) {
        OddsContent item= OddsContent.fromJson(con.toJson());
        item.level=15;
        middleBettingList.add(item);
      } else if (GameRuleUtil.GameType_Pair==(con.type)) {
//
        OddsContent item= OddsContent.fromJson(con.toJson());
        item.level=16;
        middleBettingList.add(item);
      } else {
        int sum = int.tryParse(con.type??"1")??-1;
        OddsContent item= OddsContent.fromJson(con.toJson());
        item.titleColor = GameRuleUtil.getBallColor(sum);
        switch (sum) {
          case GameRuleUtil.GameType_Cao_00:
            item.level=0;
            break;
          case GameRuleUtil.GameType_Cao_01:
            item.level=1;
            break;
          case GameRuleUtil.GameType_Cao_02:
            item.level=2;
            break;
          case GameRuleUtil.GameType_Cao_03:
            item.level=3;
            break;
          case GameRuleUtil.GameType_Cao_04:
            item.level=4;
            break;
          case GameRuleUtil.GameType_Cao_05:
            item.level=5;
            break;
          case GameRuleUtil.GameType_Cao_06:
            item.level=6;
            break;
          case GameRuleUtil.GameType_Cao_07:
            item.level=7;
            break;
          case GameRuleUtil.GameType_Cao_08:
            item.level=8;
            break;
          case GameRuleUtil.GameType_Cao_09:
            item.level=9;
            break;
          case GameRuleUtil.GameType_Cao_10:
            item.level=10;
            break;
          case GameRuleUtil.GameType_Cao_11:
            item.level=11;
            break;
          case GameRuleUtil.GameType_Cao_12:
            item.level=12;
            break;
          case GameRuleUtil.GameType_Cao_13:
            item.level=13;
            break;
          case GameRuleUtil.GameType_Cao_14:
            item.level=14;
            break;
          case GameRuleUtil.GameType_Cao_15:
            item.level=15;
            break;
          case GameRuleUtil.GameType_Cao_16:
            item.level=16;
            break;
          case GameRuleUtil.GameType_Cao_17:
            item.level=17;
            break;
          case GameRuleUtil.GameType_Cao_18:
            item.level=18;
            break;
          case GameRuleUtil.GameType_Cao_19:
            item.level=19;
            break;
          case GameRuleUtil.GameType_Cao_20:
            item.level=20;
            break;
          case GameRuleUtil.GameType_Cao_21:
            item.level=21;
            break;
          case GameRuleUtil.GameType_Cao_22:
            item.level=22;
            break;
          case GameRuleUtil.GameType_Cao_23:
            item.level=23;
            break;
          case GameRuleUtil.GameType_Cao_24:
            item.level=24;
            break;
          case GameRuleUtil.GameType_Cao_25:
            item.level=25;
            break;
          case GameRuleUtil.GameType_Cao_26:
            item.level=26;
            break;
          case GameRuleUtil.GameType_Cao_27:
            item.level=27;
            break;
          default:
            item.level = -1;
            // SysoManager.println("未知类型未知草");
            break;
        }
        if(item.level.em() >= 0){
          smallDataBettingList.add(item);
        }
      }
    }
    if(type==0) {
      dataBettingList.sort((a, b) => (a.level.em()).compareTo((b.level.em())));
      print("=======>长度 ${dataBettingList.length}");
      return dataBettingList;
    }else if(type==1) {
      middleBettingList.sort((a, b) => (a.level.em()).compareTo((b.level.em())));
      return middleBettingList;
    }else if(type==2) {
      smallDataBettingList.sort((a, b) => (a.level.em()).compareTo((b.level.em())));
      return smallDataBettingList;
    }
    return dataBettingList;
  }
  static  List<OddsContent>  dealData(List<OddsContent> odds,{String mBallName="first"}) {

    List<OddsContent> data = [];
    List<OddsContent> data1 = [];
    List<OddsContent> data2 = [];
    List<OddsContent> data3 = [];

    Map<int, OddsContent> arrayMap = {};

    if ("firstBall".contains(mBallName)) {
      for (int i = 0; i < odds.length; i++) {
        OddsContent content = OddsContent.fromJson(odds[i].toJson());
        if (content.type?.contains(GameRuleUtil.GameType_First)==true) {
          data1.add(content);
        } else if (content.type?.contains(GameRuleUtil.GameType_First_String)==true) {
          setSecondBallData(arrayMap, content);
        } else if (content.type?.contains(GameRuleUtil.GameType_dragon)==true) {
          data3.add(content);
        }
      }

    } else if ("secondBall".contains(mBallName)) {
      for (int i = 0; i < odds.length; i++) {
        OddsContent content = OddsContent.fromJson(odds[i].toJson());
        if (content.type?.contains(GameRuleUtil.GameType_Second_String)==true || content.type?.contains(GameRuleUtil.GameType_equal)==true) {
          if (content.type?.contains(GameRuleUtil.GameType_Second)==true) {
            data1.add(content);
          } else if (content.type?.contains(GameRuleUtil.GameType_Second_String)==true) {
            setSecondBallData(arrayMap, content);

          } else if (content.type?.contains(GameRuleUtil.GameType_equal)==true) {
            data3.add(content);
          }
        }

      }

    } else if ("threeBall".contains(mBallName)) {
      for (int i = 0; i < odds.length; i++) {
        OddsContent content = OddsContent.fromJson(odds[i].toJson());
        if (content.type?.contains(GameRuleUtil.GameType_Three_String)==true || content.type?.contains(GameRuleUtil.GameType_tiger)==true) {
          if (content.type?.contains(GameRuleUtil.GameType_Three)==true) {
            data1.add(content);
          } else if (content.type?.contains(GameRuleUtil.GameType_Three_String)==true) {
            setSecondBallData(arrayMap, content);
          } else if (content.type?.contains(GameRuleUtil.GameType_tiger)==true) {
            data3.add(content);
          }
        }
      }
    }
    data1.sort((left,right)=>left.type?.compareTo(right.type??"")??1);

    // Comparator<OddsContent> comparator =  Comparator<OddsContent>() {
    //   public int compare(OddsContent s1, OddsContent s2) {
    //     return s1.type.compareTo(s2.type);
    //   }
    // };
    // Collections.sort(data1, comparator);
    for (int i = 0; i < arrayMap.length; i++) {
      data2.add(arrayMap[i]??OddsContent());
    }
    data.addAll(data1);
    data.addAll(data2);
    data.addAll(data3);
    return data;
    // for (int i = 0; i < mViews.size() && i < data.size(); i++) {
    //   initDataTeMa(mViews.get(i), data.get(i));
    // }
  }


   static void setSecondBallData(Map<int, OddsContent> arrayMap, OddsContent content) {
    if (content.type?.contains(GameRuleUtil.GameType_Big)==true) {
      arrayMap[0]= content;
    }
    if (content.type?.contains(GameRuleUtil.GameType_Small)==true) {
      arrayMap[1]= content;
    }
    if (content.type?.contains(GameRuleUtil.GameType_Odd)==true) {
      arrayMap[2]= content;
    }
    if (content.type?.contains(GameRuleUtil.GameType_Even)==true) {
      arrayMap[3]= content;
    }
  }

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

    return ballName.isEmpty ? "未知" : ballName;
  }

  /// 只展示大小单双，根据type
  ///
  /// @param betType
  /// @return
  static String getBallNameMaxMin(String betType) {
    String ballName = "";
    if (betType.contains(GameType_Big)) {
      ballName += "大";
    } else if (betType.contains(GameType_Small)) {
      ballName += "小";
    } else if (betType.contains(GameType_Odd)) {
      ballName += "单";
    } else if (betType.contains(GameType_Even)) {
      ballName += "双";
    }

    return ballName;
  }







}
