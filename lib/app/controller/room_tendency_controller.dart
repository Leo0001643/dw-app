

import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/ui/bean/dew_info_entity.dart';
import 'package:leisure_games/ui/main/home/game_room/room_tendency/number_trend/number_trend_state.dart';

///房间走势数据控制器
class RoomTendencyController extends GetxController{

  static String room_tendency_id = "roomTendency";

  DewInfoEntity? data;


  void updateTabIndex(){
    // tabIndex = index;
    update([room_tendency_id]);
  }

  void updateTendency(DewInfoEntity info){
    data = info;
    update([room_tendency_id]);
  }

  String getTitle(int tabIndex){
    switch(tabIndex){
      case 0:
        return "room_tema".tr;
      case 1:
        return"room_diyiqiu".tr;
      case 2:
        return "room_dierqiu".tr;
      case 3:
        return "room_disanqiu".tr;
    }
    return "room_tema".tr;
  }

  List<List<int>>? getNumberCount(var tabIndex){
    switch(tabIndex){
      case 0:
        return data?.luckyNumCount;
      case 1:
        return data?.oneNumCount;
      case 2:
        return data?.twoNumCount;
      case 3:
        return data?.threeNumCount;
    }
    return null;
  }

  List<int>? getDxDsCount(var tabIndex){
    switch(tabIndex){
      case 0:
        return data?.count?[3];
      case 1:
        return data?.count?[0];
      case 2:
        return data?.count?[1];
      case 3:
        return data?.count?[2];
    }
    return null;
  }

  List<NumberData> getNumberTrend(int tabIndex){
    List<NumberData> list = List.empty(growable: true);

    var index = tabIndex == 0 ? 3:(tabIndex - 1);
    ///倒序
    var revertList = data?.list?.reversed.toList();

    revertList?.forEach((element) {
      ///值
      var result = int.parse(element[2].split(",")[index]);
      ///期号
      if(element[0].length > 8){
        list.add(NumberData(element[0].substring(element[0].length-8),result));
      }else {
        list.add(NumberData(element[0],result));
      }
    });
    return list;
  }


  //index 对应的是特码第一球 第二球 第三球3012
  List<List<String>> changeDxTab(int tabIndex){
    var index = tabIndex == 0 ? 3:(tabIndex - 1);

    List<String> list = List.empty(growable: true);
    data?.list?.forEach((element) {
      list.add(element[1]);
    });
    loggerArray(["获取的数据结合",list]);
    var tqdxArr = List<String>.empty(growable: true);
    // var tqdsArr = List<String>.empty(growable: true);
    // 对应的是大小露珠排列 特码3第一球0第二球1第三球2对应的是单双露珠排列 特码7第一球4第二球5第三球6
    list.forEach((element) {
      tqdxArr.add(element.split(",")[index]);
      // tqdsArr.add(element.split(",")[index + 1]);
    });

    return DataUtils.luzhuAlgorithm(tqdxArr, 6);
  }


  //index 对应的是特码第一球 第二球 第三球3012
  List<List<String>> changeDsTab(int tabIndex){
    var index = tabIndex == 0 ? 3:(tabIndex - 1);

    List<String> list = List.empty(growable: true);
    data?.list?.forEach((element) {
      list.add(element[1]);
    });
    loggerArray(["获取的数据结合",list]);
    // var tqdxArr = List<String>.empty(growable: true);
    var tqdsArr = List<String>.empty(growable: true);
    // 对应的是大小露珠排列 特码3第一球0第二球1第三球2对应的是单双露珠排列 特码7第一球4第二球5第三球6
    list.forEach((element) {
      // tqdxArr.add(element.split(",")[index]);
      tqdsArr.add(element.split(",")[index + 4]);
    });

    return DataUtils.luzhuAlgorithm(tqdsArr, 6);
  }

  //index 对应的是特码第一球 第二球 第三球3012
  List<List<String>> changeZpTab(int tabIndex){
    var index = tabIndex == 0 ? 3:(tabIndex - 1);

    List<String> list = List.empty(growable: true);
    data?.list?.forEach((element) {
      list.add(element[1]);
    });
    loggerArray(["获取的数据结合",list]);
    // var tqdxArr = List<String>.empty(growable: true);
    var tqdsArr = List<String>.empty(growable: true);
    // 对应的是大小露珠排列 特码3第一球0第二球1第三球2对应的是单双露珠排列 特码7第一球4第二球5第三球6
    list.forEach((element) {
      // tqdxArr.add(element.split(",")[index]);
      tqdsArr.add(element.split(",")[index + 4]);
    });

    return DataUtils.zpAlgorithm(tqdsArr);
  }





}




