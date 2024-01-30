import 'package:get/get.dart';

import 'ds_dew_state.dart';

class DsDewLogic extends GetxController {
  final DsDewState state = DsDewState();

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
    for(var i=0;i<50;i++){
      state.bigRoads.value.add('$i');
    }

    for(var i=0;i<50;i++){
      state.beadRoads.value.add('$i');
    }
    state.bigRoads.refresh();
    state.beadRoads.refresh();
  }



}
