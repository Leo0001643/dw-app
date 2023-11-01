import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';

class HistoryTrendState {
  HistoryTrendState() {
    ///Initialize variables
  }

  var title = "台湾槟果sd8".obs;

  ///数据源
  var data = RxList<int>.empty(growable: true);

  var tabs = [Intr().tema,Intr().diyiqiu,Intr().dierqiu,Intr().disanqiu,];

}
