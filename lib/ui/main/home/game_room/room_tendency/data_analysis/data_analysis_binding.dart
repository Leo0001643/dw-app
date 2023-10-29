import 'package:get/get.dart';

import 'data_analysis_logic.dart';

class DataAnalysisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DataAnalysisLogic());
  }
}
