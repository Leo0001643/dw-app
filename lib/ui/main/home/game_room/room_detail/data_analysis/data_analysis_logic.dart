import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/ui/bean/dew_info_entity.dart';

import 'data_analysis_state.dart';

class DataAnalysisLogic extends GetxController {
  final DataAnalysisState state = DataAnalysisState();

  @override
  void onReady() {
    // loadData();
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  // void loadData() async {
  //   state.formTitle.value.addAll([Intr().qihao,Intr().zhi,Intr().bet_xiao,
  //     Intr().bet_da,Intr().bet_dan,Intr().bet_shuang,Intr().jixiao,Intr().jida,]);
  //   for(var i=0;i<50;i++){
  //     state.formTitle.value.add('$i');
  //   }
  //
  //   for(var i=0;i<50;i++){
  //     state.totalTitle.value.add('$i');
  //   }
  //
  //   state.formTitle.refresh();
  //   state.totalTitle.refresh();
  //
  // }

  ///构造一行的数据
  List<String> buildFormTitle(DewInfoEntity info){
    var data = List<String>.empty(growable: true);
    data.addAll([Intr().qihao,Intr().zhi,Intr().bet_xiao,
      Intr().bet_da,Intr().bet_dan,Intr().bet_shuang,Intr().jixiao,Intr().jida,]);
    var last = info.list!.first.last.split(",");
    for(var j=0;j<last.length;j++){
      data.add("$j");
    }
    // loggerArray(["底部标题栏",data.length]);
    return data;

  }


  ///构造一行的数据
  List<List<String>> buildFormData(DewInfoEntity info,List<List<String>> list,int tabIndex){
    var data = List<List<String>>.empty(growable: true);
    var index = tabIndex == 0 ? 3:(tabIndex - 1);
    list.forEach((element) {
      var item = List<String>.empty(growable: true);
      if(element.length >= 3){
        ///期号
        if(element[0].length > 8){
          item.add(element[0].substring(element[0].length-8));
        }else {
          item.add(element[0]);
        }
        ///值
        var result = int.parse(element[2].split(",")[index]);
        item.add(result.toString());

        ///小
        if(result < 14){
          item.add(Intr().bet_xiao);
        }else {
          item.add("");
        }
        ///大
        if(result > 13){
          item.add(Intr().bet_da);
        }else {
          item.add("");
        }
        ///单
        if(result%2 != 0){
          item.add(Intr().bet_dan);
        }else {
          item.add("");
        }
        ///双
        if(result%2 == 0){
          item.add(Intr().bet_shuang);
        }else {
          item.add("");
        }

        ///极小
        if(result < 5){
          item.add(Intr().jixiao);
        }else {
          item.add("");
        }

        ///极大
        if(result > 22){
          item.add(Intr().jida);
        }else {
          item.add("");
        }
        var last = element.last.split(",");

        for(var j=0;j<last.length;j++){
          if(j == result){
            item.add("$j");
          } else {
            item.add("");
          }
        }
        data.add(item);
      }
    });
    // loggerArray(["底部一行",data.first.length,data.first]);
    return data;

  }





}
