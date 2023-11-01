import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';

import 'data_analysis_state.dart';

class DataAnalysisLogic extends GetxController {
  final DataAnalysisState state = DataAnalysisState();

  @override
  void onReady() {
    loadData();
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void loadData() async {
    state.formTitle.value.addAll([Intr().qihao,Intr().zhi,Intr().bet_xiao,
      Intr().bet_da,Intr().bet_dan,Intr().bet_shuang,Intr().jixiao,Intr().jida,]);
    for(var i=0;i<50;i++){
      state.formTitle.value.add('$i');
    }

    for(var i=0;i<50;i++){
      state.totalTitle.value.add('$i');
    }

    state.formTitle.refresh();
    state.totalTitle.refresh();

  }


}
