import 'package:get/get.dart';

import 'history_trend_state.dart';

class HistoryTrendLogic extends GetxController {
  final HistoryTrendState state = HistoryTrendState();

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

  void loadData() {
    for(var i=0;i<27;i++){
      state.data.add(i);
    }
    state.data.refresh();
  }




}
