import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';

class DsDewState {
  DsDewState() {
    ///Initialize variables
  }

  //大路
  var bigRoads = RxList.empty(growable: true);

  //珠盘路
  var beadRoads = RxList.empty(growable: true);

  var tabs = [Intr().tema,Intr().diyiqiu,Intr().dierqiu,Intr().disanqiu,];


}
