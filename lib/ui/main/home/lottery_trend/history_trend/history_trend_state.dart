import 'package:get/get.dart';

class HistoryTrendState {
  HistoryTrendState() {
    ///Initialize variables
  }

  var title = "台湾槟果sd8".obs;

  ///数据源
  var data = RxList<int>.empty(growable: true);

  var tabs = ["特码","第一球","第二球","第三球"];


}
