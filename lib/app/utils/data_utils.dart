

import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/services.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/res/jsonx.dart';

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


  static Color getResultDrawble(int sum) {
  // int[] redBall = new int[] { 1, 2, 7, 8, 12, 13, 18, 19, 23, 24 };
  // int[] blueBall = new int[] { 3, 4, 9, 10, 14, 15, 20, 25, 26 };
  // int[] greenBall = new int[] { 0, 5, 6, 11, 16, 17, 21, 22, 27 };
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
        return ColorX.color_fe2427;
      case 3:
      case 4:
      case 9:
      case 10:
      case 14:
      case 15:
      case 20:
      case 25:
      case 26:
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
        return ColorX.color_00ac47;
      default:
        return ColorX.color_fe2427;
    }
  }

  ///sum为-1时，显示问号
  static String getDx(int sum) {
    var ssb = "";
    if (sum == -1) {
      ssb = "?";
    } else {
      String da = Intr().bet_da;
      String xiao = Intr().bet_xiao;
      // String shuang = Intr().bet_shuang;
      // String dan = Intr().bet_dan;

      String qian = sum < 14 ? xiao : da;
      // String hou = sum % 2 == 0 ? shuang : dan;

      ssb = qian;
    }
    return ssb.toString();
  }

  ///sum为-1时，显示问号
  static String getDs(int sum) {
    var ssb = "";
    if (sum == -1) {
      ssb = "?";
    } else {
      // String da = Intr().bet_da;
      // String xiao = Intr().bet_xiao;
      String shuang = Intr().bet_shuang;
      String dan = Intr().bet_dan;

      // String qian = sum < 14 ? xiao : da;
      String hou = sum % 2 == 0 ? shuang : dan;

      ssb = hou;
    }
    return ssb;
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
  static String findAvatar(String? avatar){
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

  ///读取手机区号
  static Future<Map<String,List<String>>> readPhoneData() async {
    Map<String,List<String>> data = Map.identity();

    String jsonString = await rootBundle.loadString(JsonX.phoneData());
    Map<String,dynamic> jsonData = json.decode(jsonString);

    jsonData.forEach((key, value) {
      List<String> v1 = List.empty(growable: true);
      (value as List).forEach((element) { v1.add(element.toString()); });
      data[key] = v1;
    });
    return Future.value(data);
  }

  static String addSpacesToNumber(String input) {
    List<String> characters = input.split(''); // 将字符串拆分为单个字符的列表
    String result = characters.join(' '); // 使用空格连接字符
    return result;
  }

  ///珠盘路数据整理
  static List<List<String>> zpAlgorithm(List<String> arr){
    //珠盘路数据整理
    var rows = 6;
    var complement = 0;
    var width = 720;
    // if (window.innerWidth >= 720) {
    //   width = 720;
    // } else {
    //   width = window.innerWidth;
    // }
    var maxLine = (width ~/ 24) - 1;
    if ((arr.length / rows) <= maxLine) {
      complement = rows * maxLine - arr.length;
    } else {
      complement = rows * 2 + (rows - (arr.length % rows)); //需要补足的个数
    }

    for (var i = 0; i < complement; i++) {
      arr.add("-1");
    }
    var afterArr = List<List<String>>.empty(growable: true);
    var arr0 = List<String>.empty(growable: true);
    var arr1 = List<String>.empty(growable: true);
    var arr2 = List<String>.empty(growable: true);
    var arr3 = List<String>.empty(growable: true);
    var arr4 = List<String>.empty(growable: true);
    var arr5 = List<String>.empty(growable: true);
    for (var j = 0; j < arr.length; j++) {
      if (j % rows == 0) {
        arr0.add(arr[j]);
      } else if (j % rows == 1) {
        arr1.add(arr[j]);
      } else if (j % rows == 2) {
        arr2.add(arr[j]);
      } else if (j % rows == 3) {
        arr3.add(arr[j]);
      } else if (j % rows == 4) {
        arr4.add(arr[j]);
      } else if (j % rows == 5) {
        arr5.add(arr[j]);
      }
    }
    afterArr.add(arr0);
    afterArr.add(arr1);
    afterArr.add(arr2);
    afterArr.add(arr3);
    afterArr.add(arr4);
    afterArr.add(arr5);
    return afterArr;
  }

//露珠图
  static List<List<String>> luzhuAlgorithm(List<String> dxArr,int length){
    //露珠算法 length 为行数 大路
    var a = 0;
    var b = 0;
    var aa = "";
    var before = "";
    var dataArr = List<List<String>>.empty(growable: true);
    for (var i = 0; i < length; i++) {
      dataArr.add(List.empty(growable: true));
      for (var j = 0; j < 400; j++) {
        dataArr[i].add("");
      }
    }

    for (var k = 0; k < dxArr.length; k++) {
      var dx = dxArr[k];
      //aa = (dx == 1) ? 1:2;

      if (dx == "1") {
        aa = "1";
      } else if (dx == "2") {
        aa = "2";
      } else {
        continue;
      }
      if (k == 0) {
        dataArr[a][b] = aa;
        before = aa;
        continue;
      }
      if (before == aa) {
        if (a + 1 < 6) {
          if (dataArr[a + 1][b] == null || dataArr[a + 1][b] == "") {
            if (dataArr[0][b] == null || dataArr[0][b] == "") {
              dataArr[a][++b] = aa;
            } else {
              dataArr[++a][b] = aa;
            }
          } else {
            dataArr[a][++b] = aa;
          }
        } else {
          dataArr[a][++b] = aa;
        }
      } else {
        for (var q = 0; q < dataArr[0].length; q++) {
          if (dataArr[0][q] == null || dataArr[0][q] == "") {
            b = q;
            break;
          }
        }
        dataArr[0][b] = aa;
        a = 0;
      }
      before = aa;
    }

    var arr0 = dataArr[0];
    var arr1 = dataArr[1];
    var arr2 = dataArr[2];
    var arr3 = dataArr[3];
    var arr4 = dataArr[4];
    var arr5 = dataArr[5];
    var index = 0;
    //格式控制。多输出两列
    for (var k = arr0.indexOf(""); k < arr0.length; k++) {
      if (arr5[k] == "" && arr4[k] == "" && arr3[k] == "" && arr2[k] == "" && arr1[k] == "") {
        index = k + 1;
        break;
      }
    }

    var width = 360;
    // if (window.innerWidth >= 720) {
    //   width = 720;
    // } else {
    //   width = window.innerWidth;
    // }
    var minLine = (width ~/ 19) - 2;
    if (index < minLine) {
      index = minLine;
    }
    var yhdataArr = List<List<String>>.empty(growable: true);
    for (var i = 0; i < length; i++) {
      yhdataArr.add(List<String>.empty(growable: true));
      for (var j = 0; j <= index; j++) {
        yhdataArr[i].add(dataArr[i][j]);
      }
    }

    dataArr.clear();

    //console.log(yhdataArr);
    return yhdataArr;
  }


  static String randomUuid(){
    return const Uuid().v4();
  }



}


