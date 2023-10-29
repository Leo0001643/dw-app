import 'package:get/get.dart';

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
    state.formTitle.value.addAll(['期号','值','小','大','单','双','极小','极大']);
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
