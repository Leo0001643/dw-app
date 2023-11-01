import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';

class DataAnalysisState {
  DataAnalysisState() {
    ///Initialize variables
  }


  var totalTitle = RxList.empty(growable: true);

  var formTitle = RxList.empty(growable: true);

  var tabs = [Intr().tema,Intr().diyiqiu,Intr().dierqiu,Intr().disanqiu,];


}
