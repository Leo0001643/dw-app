

import 'dart:ui';

import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';

class DataUtils{

  /// get WeekDay.
  /// dateTime
  static String getWeekday(DateTime? dateTime) {
    if (dateTime == null) return "";
    String weekday = "";
    switch (dateTime.weekday) {
      case 1:
        weekday = Intr().day_yi;
        break;
      case 2:
        weekday = Intr().day_er;
        break;
      case 3:
        weekday = Intr().day_san;
        break;
      case 4:
        weekday = Intr().day_si;
        break;
      case 5:
        weekday = Intr().day_wu;
        break;
      case 6:
        weekday = Intr().day_liu;
        break;
      case 7:
        weekday = Intr().day_ri;
        break;
      default:
        break;
    }
    return weekday;
  }

  static Color getBallBgColor(int lid){
    switch(lid){
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
        return ColorX.color_fe2427;
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
        return ColorX.color_529aff;
      case 0:
      case 5:
      case 6:
      case 11:
      case 16:
      case 17:
      case 21:
      case 22:
      case 27:
      case 28:  //绿波
      case 32:  //绿波
      case 33:  //绿波
      case 38:  //绿波
      case 39:  //绿波
      case 43:  //绿波
      case 44:  //绿波
      case 49:  //绿波
        return ColorX.color_00ac47;
      case -1:
        return ColorX.color_fe2427;
      default:
        return ColorX.color_00ac47;
    }
  }

  static Color getBallColor2(int num){
    switch(num){
      case 01:
      case 02:
      case 07:
      case 08:
      case 12:
      case 13:
      case 18:
      case 19:
      case 23:
      case 24:///绿波
        return ColorX.color_00ac47;
      case 00:
      case 05:
      case 06:
      case 11:
      case 16:
      case 17:
      case 21:
      case 22:
      case 27:///红波
        return ColorX.color_fe2427;
      case 03:
      case 04:
      case 09:
      case 10:
      case 14:
      case 15:
      case 20:
      case 25:
      case 26:///蓝波
        return ColorX.color_529aff;
      default:
        return ColorX.color_fe2427;
    }
  }



  static String getDiceImg(String num){
    switch(num){
      case "2":
        return ImageX.dice_2;
      case "3":
        return ImageX.dice_3;
      case "4":
        return ImageX.dice_4;
      case "5":
        return ImageX.dice_5;
      default:
        return ImageX.dice_1;
    }
  }

  static String getFruitImg(String num){
    switch(num){
      case "2":
        return ImageX.fruit_2;
      case "3":
        return ImageX.fruit_3;
      case "4":
        return ImageX.fruit_4;
      case "5":
        return ImageX.fruit_5;
      case "6":
        return ImageX.fruit_6;
      case "7":
        return ImageX.fruit_7;
      case "8":
        return ImageX.fruit_8;
      case "9":
        return ImageX.fruit_9;
      case "10":
        return ImageX.fruit_10;
      case "11":
        return ImageX.fruit_11;
      case "12":
        return ImageX.fruit_12;
      case "13":
        return ImageX.fruit_13;
      case "14":
        return ImageX.fruit_14;
      case "15":
        return ImageX.fruit_15;
      case "16":
        return ImageX.fruit_16;
      case "17":
        return ImageX.fruit_17;
      case "18":
        return ImageX.fruit_18;
      case "19":
        return ImageX.fruit_19;
      case "20":
        return ImageX.fruit_20;
      default:
        return ImageX.fruit_1;
    }
  }


  ///lid转为支持的游戏类型
  static String getGameTypeByLid(int? lid) {
    if (lid == 10) {
      return "keno28";
    } else if (lid == 11) {
      return "xj28";
    } else if (lid == 32) {
      return "jndx28";
    } else if (lid == 31) {
      return "tw28";
    }
    return "";
  }

  ///寻找头像
  static String findAvatar(String avatar){
    if(isEmpty(avatar)){
      return ImageX.q1;
    }else {
      return "assets/images/$avatar.png";
    }
  }

  ///头像名
  static String getAvatarName(String path){
    return path.replaceAll("assets/images/", "").replaceAll(".png", "");
  }




}


