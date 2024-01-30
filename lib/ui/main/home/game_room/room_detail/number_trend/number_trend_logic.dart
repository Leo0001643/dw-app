import 'dart:math';

import 'package:get/get.dart';

import 'number_trend_state.dart';

class NumberTrendLogic extends GetxController {
  final NumberTrendState state = NumberTrendState();

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
    var random = Random();
    for(var i=1;i<51;i++){
      state.data.add(SalesData("229021$i",random.nextInt(27)));
    }
    state.data.refresh();
  }
}
