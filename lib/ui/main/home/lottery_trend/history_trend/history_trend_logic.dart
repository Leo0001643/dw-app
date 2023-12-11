import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/ui/bean/history_hall_entity.dart';

import 'history_trend_state.dart';

class HistoryTrendLogic extends GetxController {
  final HistoryTrendState state = HistoryTrendState();

  @override
  void onReady() {
    loadData(Get.arguments);
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void loadData(HistoryHall item) {
    state.title.value = item.name.em();
    HttpService.getDewInfo(DataUtils.getGameTypeByLid(item.lid), "50","200").then((value) {
      ///倒序
      value.list = value.list?.reversed.toList();
      state.info = value;
      refreshChart(0,3,28);
    });
  }

  void refreshChart(int tab,int index,int length) async {
    if(isEmpty(state.leftData)){
      state.info.list?.forEach((element) {
        if(unEmpty(element)){
          state.leftData.add(element.first);
        }
      });
      state.leftData.refresh();
    }
    state.data.clear();
    state.lottoData.clear();
    for(var i=1; i <= state.info.list.em(); i++){
      ///这里的键要从1开始 中奖数据
      state.lottoData[i] = state.info.listNum(i-1, index);
      var row = List<String>.empty(growable: true);
      for(var j=0;j<length;j++){
        if(j == state.lottoData[i]){
          row.add("0");
        }else {
          row.add("${state.info.list.em()-i + 1}");
        }
      }
      // ///图表背景数据
      state.data.add(row);
    }
    changeCml(state.data);
    loggerArray(["整理出来的数据",state.data.length,state.data]);
    state.data.insert(0, state.nums.sublist(0,length));
    state.data.refresh();
    state.lottoData.refresh();

  }

  List<List<String>> changeCml(List<List<String>> row) {
    ///遍历每一行
    for(var i=0;i<row.length;i++){
      ///遍历每一行的每一列
      for(var j=0;j<row[i].length;j++){
        if(row[i][j] == "0"){
          zLoop:
          for(var z=i-1;z>=0;z--){
            if(row[z][j] != "0"){
              row[z][j] = "${i-z}";
            }else {
              break zLoop;
            }
          }
        }
      }
    }
    return row;
  }




}
