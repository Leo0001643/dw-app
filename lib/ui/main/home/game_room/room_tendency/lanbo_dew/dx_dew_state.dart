import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';

class DxDewState {
  DxDewState() {
    ///Initialize variables
  }

  //大路
  var bigRoads = RxList.empty(growable: true);

  //珠盘路
  var beadRoads = RxList.empty(growable: true);

  var tabs = [Intr().tema,Intr().diyiqiu,Intr().dierqiu,Intr().disanqiu,];

  ///默认tab在特码
  int tabIndex = 0;

}
