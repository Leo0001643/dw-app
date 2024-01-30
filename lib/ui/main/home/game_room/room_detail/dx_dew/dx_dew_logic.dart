import 'package:get/get.dart';

import 'dx_dew_state.dart';

class DxDewLogic extends GetxController {
  final DxDewState state = DxDewState();

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
