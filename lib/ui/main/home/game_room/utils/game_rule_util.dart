import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/ws_game_odds_server.dart' ;
import 'package:leisure_games/ui/main/home/game_room/bean/ws_game_odds_server.dart' as WS;



class GameRuleUtil {
  /**
   * "大"
   */
  static String GameType_Big = "big";

  /**
   * "14大"
   */
  static String GameType_Big_14 = "14_big";

  /**
   * "小"
   */
  static String GameType_Small = "small";

  /**
   * "13小"
   */
  static String GameType_Small_13 = "13_small";

  /**
   * "单"
   */
  static String GameType_Odd = "odd";

  /**
   * "13单"
   */
  static String GameType_Odd_13 = "13_odd";

  /**
   * "双"
   */
  static String GameType_Even = "even";

  /**
   * "14双"
   */
  static String GameType_Even_14 = "14_even";

  /**
   * "大单"
   */
  static String GameType_BigOdd = "big_odd";

  /**
   * "小单"
   */
  static String GameType_SmallOdd = "small_odd";

  /**
   * "13小单"
   */
  static String GameType_SmallOdd_13 = "13_small_odd";

  /**
   * "大双"
   */
  static String GameType_BigEven = "big_even";

  /**
   * "14大双"
   */
  static String GameType_BigEven_14 = "14_big_even";

  /**
   * "小双"
   */
  static String GameType_SmallEven = "small_even";

  /**
   * "极大"
   */
  static String GameType_Max = "max";

  /**
   * "极小"
   */
  static String GameType_Min = "min";

  /**
   * "红波"
   */
  static String GameType_Red = "red";

  /**
   * "蓝波"
   */
  static String GameType_Blue = "blue";

  /**
   * "绿波"
   */
  static String GameType_Green = "green";

  /**
   * "对子"
   */
  static String GameType_Pair = "pair";

  /**
   * "顺子"
   */
  static String GameType_Straight = "straight";

  /**
   * "豹子"
   */
  static String GameType_Leopard = "leopard";

  /**
   * "特码"
   */
  static String GameType_Cao = "cao";

  /**
   * 第一球
   */
  static String GameType_First = "first_cao";
  static String GameType_First_String = "first";

  /**
   * 第二球
   */
  static String GameType_Second = "second_cao";
  static String GameType_Second_String = "second";

  /**
   * 第三球
   */
  static String GameType_Three = "third_cao";
  static String GameType_Three_String = "third";

  /**
   * 和
   */
  static String GameType_equal = "equal";

  /**
   * 龙
   */
  static String GameType_dragon = "dragon";

  /**
   * 虎
   */
  static String GameType_tiger = "tiger";

  /**
   * 草：下注时的参数msg拼接使用
   */
  static String GameType_Cao_Bet = "草";
  static String GameType_Frist_Cao_Bet = "第一球草";
  static String GameType_Second_Cao_Bet = "第二球草";
  static String GameType_Thire_Cao_Bet = "第三球草";
  static String GameType_Frist_Bet = "第一球";
  static String GameType_Second_Bet = "第二球";
  static String GameType_Thire_Bet = "第三球";

  var GameType_Cao_00 = 0;
  var GameType_Cao_01 = 1;
  var GameType_Cao_02 = 2;
  var GameType_Cao_03 = 3;
  var GameType_Cao_04 = 4;
  var GameType_Cao_05 = 5;
  var GameType_Cao_06 = 6;
  var GameType_Cao_07 = 7;
  var GameType_Cao_08 = 8;
  var GameType_Cao_09 = 9;
  var GameType_Cao_10 = 10;
  var GameType_Cao_11 = 11;
  var GameType_Cao_12 = 12;
  var GameType_Cao_13 = 13;
  var GameType_Cao_14 = 14;
  var GameType_Cao_15 = 15;
  var GameType_Cao_16 = 16;
  var GameType_Cao_17 = 17;
  var GameType_Cao_18 = 18;
  var GameType_Cao_19 = 19;
  var GameType_Cao_20 = 20;
  var GameType_Cao_21 = 21;
  var GameType_Cao_22 = 22;
  var GameType_Cao_23 = 23;
  var GameType_Cao_24 = 24;
  var GameType_Cao_25 = 25;
  var GameType_Cao_26 = 26;
  var GameType_Cao_27 = 27;

  static var ballColorRed = Color(0xffe6250a);
  static var ballColorBlue = Color(0xff2585fd);
  static var ballColorGreen = Color(0xff4ca953);

  /**
   * sum为-1时，表示问号，显示红色
   *
   * @param sum
   * @return
   */
  static String getBallColor(var sum) {
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
        return "assets/images/bg_ball_red.png";

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
        return "assets/images/bg_ball_blue.png";
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
        return "assets/images/bg_ball_green.png";
      default:
        return "assets/images/bg_ball_green.png";
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

  /**
   * sum为-1时，显示问号
   */
  static String getDXDS(int sum) {
    String ssb;
    if (sum == -1) {
      ssb = "(? ?)";
    } else {
      String da = "大";
      String xiao = "小";
      String shaung = "双";
      String dan = "单";

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

  /**
   * sum为-1时，显示问号
   */
  static String getDXDSSimple(int sum) {
    var ssb = "";
    if (sum == -1) {
      ssb = "(? ?)";
    } else {
      String da = "大";
      String xiao = "小";
      String shaung = "双";
      String dan = "单";

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

  /**
   * 根据三个球拼接的字符串，计算出各自数字及总和
   */
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

  /**
   * 获取第几期样式
   */
  static String getSSB(String qiShu,{String? year="2024"}) {
    String ssb = "";
    if (qiShu.isNotEmpty == true && qiShu.length > 8) {
      qiShu = qiShu.substring(qiShu.length - 8, qiShu.length);
      String di = "第";
      String qi = "期";
      ssb = " ${di}${year}$qiShu $qi";
      // ssb.setSpan(
      //     new ForegroundColorSpan(Color.parseColor("#fe2427")), di.length(),
      //     di.length() + qiShu.length(),
      //     Spannable.SPAN_EXCLUSIVE_INCLUSIVE);
    }
    return ssb;
  }
   static WSGameOddsServer getOddsbean( Map<String,dynamic> totalMap) {
    WSGameOddsServer result =  WSGameOddsServer();
      result.content = [];
      Iterable<String> keys = totalMap.keys;
      if (keys .isNotEmpty) {
        WS.Content row;
        keys.map((e){
          WS.Content row= WS.Content();
          try {
            Map<String,dynamic> childMap=totalMap[e];
            childMap.keys.map((childKey){
              Map<String,dynamic> subMap=childMap[childKey];
              row?.id ="${subMap["id"]}";
              row?.parentId ="${subMap["parentId"]}";
              row?.jsonKey =childKey;

              row?.enabled ="${subMap["enabled"]}";
              row?.createTime ="${subMap["createTime"]}";
              row?.updateTime ="${subMap["updateTime"]}";
              row?.name ="${subMap["name"]}";
              row?.play ="${subMap["play"]}";
              row?.type ="${subMap["type"]}";
              result.content?.add(row);
            }).toList();



            return row;
          } catch ( e) {
            print("解析失败 e  ${e.toString()}");
          }
          return row;

        }).toList();

      }
    return result;
  }


  /**
   *  返回当前使用钱包的   钱币符号
   *     1:CNY,2:USD,3:KRW,4:INR,5:USDT
   */
  static String getMoneySymbol(String type) {
    String result = "￥";
    switch (type) {
      case "CNY":
        result = "￥";
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

  /**
   * 根据betType返回投注类型的中文名称,当以cao开头时，betNum对应特码数字
   */
  static String getBetTypeName(String betType, String betNum) {
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
    } else if (betType != null) {
      return getWhereBallName(betType);
    } else {
      return "未知";
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

  /**
   * 根据betType返回是不是1314
   */
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
  static  List<WS.Content>  dealData(List<WS.Content> odds,{String mBallName="first"}) {

    List<WS.Content> data = [];
    List<WS.Content> data1 = [];
    List<WS.Content> data2 = [];
    List<WS.Content> data3 = [];

    Map<int, WS.Content> arrayMap = {};

    if ("firstBall".contains(mBallName)) {
      for (int i = 0; i < odds.length; i++) {
        WS.Content content = odds[i];
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
        WS.Content content = odds[i];
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
        WS.Content content = odds[i];
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
    data1.sort((left,right)=>left.type?.compareTo(right?.type??"")??1);

    // Comparator<WS.Content> comparator =  Comparator<WS.Content>() {
    //   public int compare(WS.Content s1, WS.Content s2) {
    //     return s1.type.compareTo(s2.type);
    //   }
    // };
    // Collections.sort(data1, comparator);
    for (int i = 0; i < arrayMap.length; i++) {
      data2.add(arrayMap[i]??Content());
    }
    data.addAll(data1);
    data.addAll(data2);
    data.addAll(data3);
    return data;
    // for (int i = 0; i < mViews.size() && i < data.size(); i++) {
    //   initDataTeMa(mViews.get(i), data.get(i));
    // }
  }
   static void setSecondBallData(Map<int, WS.Content> arrayMap, WS.Content content) {
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
      ballName = "${ballName} 第一球+";
    } else if (betType.contains(GameType_Second_String)) {
      ballName = "${ballName} 第二球+";
    } else if (betType.contains(GameType_Three_String)) {
      ballName = "${ballName} 第三球+";
    }

    if (betType.contains(GameType_Big)) {
      ballName = "${ballName} 大+";
    } else if (betType.contains(GameType_Small)) {
      ballName = "${ballName} 小+";
    } else if (betType.contains(GameType_Odd)) {
      ballName = "${ballName} 单+";
    } else if (betType.contains(GameType_Even)) {
      ballName = "${ballName} 双+";
    }

    return ballName.isEmpty ? "未知" : ballName;
  }

  /**
   * 只展示大小单双，根据type
   *
   * @param betType
   * @return
   */
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
